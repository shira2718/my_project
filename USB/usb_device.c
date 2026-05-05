/********************************************************************
  File Information:
    FileName:     	usb_device.c
    Dependencies:	See INCLUDES section
    Processor:		PIC18,PIC24, PIC32 and dsPIC33E USB Microcontrollers
    Hardware:		This code is natively intended to be used on Mirochip USB
                    demo boards.  See www.microchip.com/usb (Software & Tools 
                    section) for list of available platforms.  The firmware may 
                    be modified for use on other USB platforms by editing the
    				HardwareProfile.h and HardwareProfile - [platform].h files.
    Complier:  	    Microchip C18 (for PIC18),C30 (for PIC24 and dsPIC33E)
                    and C32 (for PIC32)
    Company:		Microchip Technology, Inc.
    
    Software License Agreement:
    
    The software supplied herewith by Microchip Technology Incorporated
    (the "Company") for its PIC(r) Microcontroller is intended and
    supplied to you, the Company's customer, for use solely and
    exclusively on Microchip PIC Microcontroller products. The
    software is owned by the Company and/or its supplier, and is
    protected under applicable copyright laws. All rights are reserved.
    Any use in violation of the foregoing restrictions may subject the
    user to criminal sanctions under applicable laws, as well as to
    civil liability for the breach of the terms and conditions of this
    license.
    
    THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,
    WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
    TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
    PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
    IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
    CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.

----------------------------------------------------------------------------------

  説明:
    利用できる実装されたAPI関数/マクロの説明書は、MCHPFSUSBライブラリヘルプに記載
    USBのAPIドキュメントは以下から見つけることができます：
    Start menu --> (All Programs) --> Microchip --> MCHPFSUSB vX.x --> Documents --> MCHPFSUSB Library Help
    ヘルプファイルが開かれると、API関数/マクロは、次のセクションで説明されています：
    ライブラリインターフェース（API） - >デバイス/周辺機器 - >デバイススタック - >インタフェースルーチン
    追加のAPI機能も実現された特定のUSBデバイスクラスに応じて提供されている、

********************************************************************************
*  このファイルは、18F14K50でXC8 C Compiler用に変更しています。                *
*  また、無くても動作すると思われる一部の機能・オプションも削除しています。    *
********************************************************************************
*   VERSION  DATE        BY             CHANGE/COMMENT                         *
* ---------------------------------------------------------------------------- *
*   1.01     2013-09-07  きむ茶工房     Create                                 *
* ============================================================================ *
*  PIC 18F14K50(秋月電子のＵＳＢ対応超小型マイコンボード)                      *
*  MPLAB IDE(V8.84)                                                            *
*  MPLAB(R) XC8 C Compiler Version 1.00                                        *
*******************************************************************************/
#include "./USB/usb.h"
#include "HardwareProfile - PIC18F14K50.h"
#include "./USB/usb_device_local.h"


// USBバス(D+/D-)の端子を監視するのかを決めるフラグ
// 電源がUSBバス供給で無いなら"USE_USB_BUS_SENSE_IO"を生かします。
#if !defined(USE_USB_BUS_SENSE_IO)
    #undef USB_BUS_SENSE
    #define USB_BUS_SENSE 1                                 // 常に電源ＯＮ状態に設定して置く
#endif
// データトグル同期は有効(パケットのパリティとDTSの値を照合)
#define _DTS_CHECKING_ENABLED _DTSEN

// 内部変数の定義
USB_VOLATILE USB_DEVICE_STATE USBDeviceState;               // USBデバイスの動作移行(ステート)状態を格納する変数
USB_VOLATILE BYTE USBActiveConfiguration;                   // コンフィギュレーションディスクリプタへのインデックス番号
USB_VOLATILE BYTE USBAlternateInterface[USB_MAX_NUM_INT];   // オルタネートインターフェイス
volatile BDT_ENTRY *pBDTEntryEP0OutCurrent;                 // EPO OUTのBDT(Crrent)へのエントリーポインタ
volatile BDT_ENTRY *pBDTEntryEP0OutNext;                    // EPO OUTのBDT(Next)へのエントリーポインタ
volatile BDT_ENTRY *pBDTEntryOut[USB_MAX_EP_NUMBER+1];      // OUTのBDTへのエントリーポインタ
volatile BDT_ENTRY *pBDTEntryIn[USB_MAX_EP_NUMBER+1];       // INのBDTへのエントリーポインタ
USB_VOLATILE BYTE shortPacketStatus;                        // ショートパケット(送信長より短い最後のパケット)の送信状態
USB_VOLATILE BYTE controlTransferState;                     // コントロール転送の転送状態
USB_VOLATILE IN_PIPE inPipes[1];                            // 送信する為のデータ情報を格納
USB_VOLATILE OUT_PIPE outPipes[1];                          // 受信する為のデータ情報を格納
USB_VOLATILE BYTE *pDst;
USB_VOLATILE BOOL RemoteWakeup;                             // リモートウェイクアップの有無を示すフラグ
USB_VOLATILE BOOL USBBusIsSuspended ;                       // ホストのサスペンド状態を示すフラグ
USB_VOLATILE USTAT_FIELDS USTATcopy;                        // USTAT USBステータスレジスタを一旦保存する変数
USB_VOLATILE BYTE endpoint_number;                          // USTAT のエンドポイント番号を一旦保存する変数
USB_VOLATILE BOOL BothEP0OutUOWNsSet;
USB_VOLATILE EP_STATUS ep_data_in[USB_MAX_EP_NUMBER+1];     // ＩＮ側エンドポイントの状態を格納
USB_VOLATILE EP_STATUS ep_data_out[USB_MAX_EP_NUMBER+1];    // ＯＵＴ側エンドポイントの状態を格納
USB_VOLATILE BYTE USBStatusStageTimeoutCounter;             // ステータスステージの進行時間カウンタ
volatile BOOL USBDeferStatusStagePacket;
volatile BOOL USBStatusStageEnabledFlag1;                   // 
volatile BOOL USBStatusStageEnabledFlag2;                   // 
volatile BOOL USBDeferINDataStagePackets;                   // 
volatile BOOL USBDeferOUTDataStagePackets;                   // 

// バッファ ディスクリプタ テーブルの個数を計算する
// USB_PING_PONG__FULL_PING_PONG = 全てのエンドポイントで偶数/奇数ピンポンバッファを有効にする
// USB_MAX_EP_NUMBER = ２：使用するエンドポイントの個数(EP1/EP2)
#if (USB_PING_PONG_MODE == USB_PING_PONG__NO_PING_PONG)
    #define BDT_NUM_ENTRIES      ((USB_MAX_EP_NUMBER + 1) * 2)
#elif (USB_PING_PONG_MODE == USB_PING_PONG__EP0_OUT_ONLY)
    #define BDT_NUM_ENTRIES      (((USB_MAX_EP_NUMBER + 1) * 2)+1)
#elif (USB_PING_PONG_MODE == USB_PING_PONG__FULL_PING_PONG)
    #define BDT_NUM_ENTRIES      ((USB_MAX_EP_NUMBER + 1) * 4)   // ((2 + EP0) * 4) = 12
#elif (USB_PING_PONG_MODE == USB_PING_PONG__ALL_BUT_EP0)
    #define BDT_NUM_ENTRIES      (((USB_MAX_EP_NUMBER + 1) * 4)-2)
#else
    #error "No ping pong mode defined."
#endif


// バッファ ディスクリプタ テーブルの確保を行う(EP0/EP1/EP2)
volatile BDT_ENTRY BDT[BDT_NUM_ENTRIES] @USB_BDT_ADDRESS;            // 4レジスタ x 12個(48byte)

// ＥＰ０用の受信データバッファの確保を行う
volatile CTRL_TRF_SETUP SetupPkt @CTRL_TRF_SETUP_ADDR_TAG;             // 8byte
volatile BYTE CtrlTrfData[USB_EP0_BUFF_SIZE] @CTRL_TRF_DATA_ADDR_TAG;  // 8byte


// 外部宣言変数
////Depricated in v2.2 - will be removed in a future revision
#if !defined(USB_USER_DEVICE_DESCRIPTOR)
    // デバイスディスクリプタ
    extern ROM USB_DEVICE_DESCRIPTOR device_dsc;
#else
    USB_USER_DEVICE_DESCRIPTOR_INCLUDE;
#endif

#if !defined(USB_USER_CONFIG_DESCRIPTOR)
    // コンフィギュレーションディスクリプタ
    extern ROM BYTE *ROM USB_CD_Ptr[];
#else
    USB_USER_CONFIG_DESCRIPTOR_INCLUDE;
#endif

// ストリングディスクリプタ
extern ROM BYTE *ROM USB_SD_Ptr[];


//これは、必要なユーザーイベントハンドラの外部プロトタイプです
BOOL USER_USB_CALLBACK_EVENT_HANDLER(int event, void *pdata, WORD size);

// 関数プロトタイプの宣言
static void USBCtrlEPService(void);
static void USBCtrlTrfSetupHandler(void);
static void USBCtrlTrfInHandler(void);
static void USBCheckStdRequest(void);
static void USBStdGetDscHandler(void);
static void USBCtrlEPServiceComplete(void);
static void USBCtrlTrfTxService(void);
static void USBCtrlTrfRxService(void);
static void USBStdSetCfgHandler(void);
//static void USBStdGetStatusHandler(void);
static void USBStdFeatureReqHandler(void);
static void USBCtrlTrfOutHandler(void);
static void USBConfigureEndpoint(BYTE EPNum, BYTE direction);
static void USBWakeFromSuspend(void);
static void USBSuspend(void);
static void USBStallHandler(void);


/******************************************************************************/
/** 内部 マクロ ***************************************************************/
/******************************************************************************/

/*******************************************************************************
*  USBAdvancePingPongBuffer(BDT_ENTRY** buffer)                                *
*    バッファディスクリプタテーブルのポインタを次に進める処理                  *
*    この関数は、ピンポンオプションの設定に基づいて、                          *
*    渡されたBDT_ENTRYポインタへの次のバッファにポインタを進めます。           *
*    この機能は、EP1-EP15で使用します、EP0のために有効ではありません。         *
*                                                                              *
*    **buffer : 進めたいBDT_ENTRYポインタへのポインタ                          *
*******************************************************************************/
#define USBAdvancePingPongBuffer(buffer) ((BYTE_VAL*)buffer)->Val ^= USB_NEXT_PING_PONG;
#define USBHALPingPongSetToOdd(buffer)   {((BYTE_VAL*)buffer)->Val |= USB_NEXT_PING_PONG;}
#define USBHALPingPongSetToEven(buffer)  {((BYTE_VAL*)buffer)->Val &= ~USB_NEXT_PING_PONG;}


/******************************************************************************/
/** 外部 API 関数 *************************************************************/
/******************************************************************************/

/*******************************************************************************
*  void USBDeviceInit(void)                                                    *
*    ＵＳＢモジュールの初期化を行う処理                                        *
*******************************************************************************/
void USBDeviceInit(void)
{
    BYTE i;

    // レジスタのクリアと設定処理
    PIE2bits.USBIE = 0 ;                     // ＵＳＢの全体割り込みを禁止にする
    UEIR = 0 ;                               // ＵＳＢエラー割り込みフラグをクリアする
    UIR  = 0 ;                               // ＵＳＢイベント割り込みフラグをクリアする
    UEP0 = 0 ;                               // エンドポイント０制御レジスタをクリアする
    // 使用する分のエンドポイント制御レジスタをクリアする(今回 EP1 EP2)
    memset((void*)&UEP1,0x00,USB_MAX_EP_NUMBER) ;
    // 内蔵プルアップ有効、フルスピード、全てのエンドポイントでピンポンバッファを有効に設定
    UCFG = 0b00010100 | USB_PING_PONG_MODE ;
    UEIE = 0b10011111 ;                      // ＵＳＢエラー割り込みを全て許可する
    UIE  = 0b00111011 | USB_SOF_INTERRUPT ;  // ＵＳＢイベント割り込み全て許可する

    // バッファディスクリプタテーブルをクリアする
    for(i=0;i<(sizeof(BDT)/sizeof(BDT_ENTRY));i++) {
        BDT[i].Val = 0x00;
    }

    UCONbits.PPBRST = 1 ;                    // ピンポンバッファポインタをリセットする(偶数バッファに設定)
    UADDR = 0 ;                              // ＵＳＢアドレスレジスタをリセットする
    UCONbits.PKTDIS = 0 ;                    // パケットの送受信を有効にする
    UCONbits.PPBRST = 0 ;                    // ピンポンバッファポインタのリセットを停止させる

    // 受信中のトランザクションがあればフラッシュする
    while(UIRbits.TRNIF == 1) {
        UIRbits.TRNIF = 0 ;
        // USBスタックソフトウェアの状態変数を初期化する
        inPipes[0].info.Val    = 0;
        outPipes[0].info.Val   = 0;
        outPipes[0].wCount.Val = 0;
    }

    // コントロール転送のステータスステージ関数"USBCtrlEPAllowStatusStage()"の初期値を設定する
    USBStatusStageEnabledFlag1  = TRUE;
    USBStatusStageEnabledFlag2  = TRUE;
    // その他のフラグを初期化
    USBDeferINDataStagePackets  = FALSE;     // 
    USBDeferOUTDataStagePackets = FALSE;     // 
    USBBusIsSuspended           = FALSE;     // ホストがサスペンドモードでは無いと設定

    // バッファディスクリプタテーブルへのエントリーポインタをクリアする
    for(i = 0; i < (BYTE)(USB_MAX_EP_NUMBER+1u); i++) {
        pBDTEntryIn[i]     = 0u;
        pBDTEntryOut[i]    = 0u;
        ep_data_in[i].Val  = 0u;
        ep_data_out[i].Val = 0u;
    }

    // 最初は、ＥＰ０の入力で偶数側のＢＤＴへのエントリーポインタを初期値で設定
    pBDTEntryIn[0] = (volatile BDT_ENTRY*)&BDT[EP0_IN_EVEN];
    // エンドポイント０制御レジスタの設定
    // (送受信を有効・ハンドシェイクを有効・コントロール転送を有効・ストールしない)
    UEP0 = 0b00010110 ;
    // ＥＰ０の出力で偶数側のＢＤＴへ、最初のセットアップの準備
    BDT[EP0_OUT_EVEN].ADR = ConvertToPhysicalAddress(&SetupPkt); // ＥＰ０用の受信データバッファ先ポインタをセット
    BDT[EP0_OUT_EVEN].CNT = USB_EP0_BUFF_SIZE;                   // ＥＰ０の最大パケットサイズ(8byte)をセット
    BDT[EP0_OUT_EVEN].STAT.Val = _USIE|_DAT0|_BSTALL; // SIEオーナー・DATA0・バッファストール有効・データトグル同期無効

    // コンフィギュレーションディスクリプタのインデックス番号を０に設定
    USBActiveConfiguration = 0;     

    // USBデバイスの状態をバスに接続されていない状態(プルアップ接続は無し)とする
    USBDeviceState = DETACHED_STATE;
}


/*******************************************************************************
  Function:
        void USBDeviceTasks(void)

  要約:
    様々なUSBバス・イベントとホスト要求を検出および処理を担当する。
    USBスタックの主なディスパッチャルーチンです。
    この関数は、USB enumeration プロセスに関連付けられているコントロール転送の処理や、
    様々なUSBのイベントを検出し処理させる機能です。

    "USB_POLLING"モードで動作させる場合は、スタックを通じてパケットを送受信するために
    USBDeviceTasks() 関数を定期的に呼び出す必要があります。
    この時、この関数は、USB enumeration プロセス中に少なくとも 1.8ms 毎に呼び出す必要があります。

    "USB_INTERRUPT"モードで作動している時は、メインループからUSBDeviceTasks(）を呼び出す必要はありません。
    USBDeviceTasks(）はUSB割り込みが発生した時に実行する必要があり、
    そのためだけ割り込みコンテキストから呼び出される必要があります。

  備考:
    ＣＰＵコアがサスペンドモードから復帰する場合は、10msのレジューム回復間隔がUSB仕様みたい。
    ＣＰＵコアをスリープ状態にしない場合でも、USBDeviceTasks(）関数は、まだ定期的に呼び出す必要があります。

    USBケーブルが外れているか、VBUSラインに電力を供給されていない場合は、アプリケーションファームウェアは常に、
    頻繁に USBDeviceTasks() を呼び出す必要はありません。
    USBDeviceTasks(）が定期的に呼び出されない場合、電源を入れたときに速やかに検出する手段が必要
    自己またはデュアルセルフ/バスパワーのUSBアプリケーションでは、USBDeviceAttach() と USBDeviceDetach() の
    APIドキュメントの追加事項を参考にして下さい。

*******************************************************************************/
void USBDeviceTasks(void)
{
    BYTE i;

#if defined(USB_POLLING)
    // ＵＳＢバスが電源ＯＦＦならここの処理を実行し、バスから切り離した状態となる
    // ＯＮになった時に下の"ＵＳＢバスに接続する処理"を行う。
    if (USB_BUS_SENSE != 1) {
         // ＵＳＢモジュールを無効にしてバスから切り離す処理
         UCON = 0;            // USB 制御レジスタのリセット(ＵＳＢモジュール回路無効)
         UIE  = 0;            // ＵＳＢイベント割り込み全て禁止にする
         // USBデバイスの状態をバスに接続されていない状態(プルアップ接続は無し)とする
         USBDeviceState = DETACHED_STATE;
         // ＵＳＢ全体割り込みフラグをクリアする
         PIR2bits.USBIF = 0 ;
         return ;
    }

    // 【 USBデバイスの状態：バスに接続されていない状態 】
    //    ＵＳＢバスに接続する処理を行う
    if(USBDeviceState == DETACHED_STATE) {
         UCON = 0;            // USB 制御レジスタのリセット
         UIE  = 0;            // ＵＳＢイベント割り込み全てリセット
         // 内蔵プルアップ有効、フルスピード、全てのエンドポイントでピンポンバッファを有効に設定
         UCFG = 0b00010100 | USB_PING_PONG_MODE ;
         UEIE = 0b10011111 ;                      // ＵＳＢエラー割り込みを全て許可する
         UIE  = 0b00111011 | USB_SOF_INTERRUPT ;  // ＵＳＢイベント割り込み全て許可する

        // バスに接続する処理
        while (!UCONbits.USBEN){
             UCONbits.USBEN = 1 ;                 // ＵＳＢモジュール回路有効、プルアップ抵抗を接続
        }
        // USBデバイスの状態をバスに接続された状態とする
        USBDeviceState = ATTACHED_STATE;
    }
#endif

    // 【 USBデバイスの状態：バスに接続された状態 】
    //    ＵＳＢリセット信号を検出できる様にする処理
    if(USBDeviceState == ATTACHED_STATE) {
        // シングルエンド０の監視
        // シングルエンド０とは D+/D- 端子が両方とも LOW な状態を言う
        // シングルエンド０でないならリセット受け入れ可能にする処理
        if (!UCONbits.SE0) {
            UIR  = 0 ;                  // ＵＳＢイベント割り込みフラグをクリアする
            #if defined(USB_POLLING)
            UEIR = 0 ;                  // ＵＳＢエラー割り込みフラグをクリアする
            #endif
            UIEbits.URSTIE = 1;         // USB リセット割り込みを許可する
            UIEbits.IDLEIE = 1;         // アイドル検出割り込みを許可する
            // USBデバイスの状態を動作可能状態とする
            USBDeviceState = POWERED_STATE;
        }
    }

    // 【D+/D- ラインでアクティビティを検出した】
    if(UIRbits.ACTVIF && UIEbits.ACTVIE) {
         // ウェイクアップの処理を行う
         USBWakeFromSuspend();
    }

    // デバイスがサスペンドモードにある場合ここ以下の処理はしない
    if(UCONbits.SUSPND == 1) {
         // ＵＳＢ全体割り込みフラグをクリアする
         PIR2bits.USBIF = 0 ;
         return ;
    }

    // 【USB リセットが発生した】
    // シングルエンド０が 10ms 以上続いたらリセットとする
    if(UIRbits.URSTIF && UIEbits.URSTIE) {
        // ＵＳＢモジュールの初期化を行う
        USBDeviceInit();
        // ＵＳＢの全体割り込みを許可する
        PIE2bits.USBIE = 1 ;
        // USBデバイスの状態は、リセット信号検出後のデフォルト状態とする
        USBDeviceState = DEFAULT_STATE;

        UIRbits.URSTIF = 0 ;  // ＵＳＢリセット割り込みフラグをクリアする
    }

    // 【アイドル状態を検出した】
    if(UIRbits.IDLEIF && UIEbits.IDLEIE) {
        // 
        USBSuspend();

        UIRbits.IDLEIF = 0 ;   // アイドル状態の検出割り込みフラグをクリアする
    }

    // 【SOF(Start-of-Frame)トークンを受信した】
    if(UIRbits.SOFIF) {
        // ユーザーイベントコールバック関数に渡す(現在は何も処理していない)
        if(UIEbits.SOFIE) {
            USER_USB_CALLBACK_EVENT_HANDLER(EVENT_SOF,0,0);
        }
        UIRbits.SOFIF = 0 ;   // SOFトークン割り込みフラグをクリアする

        #if defined(USB_ENABLE_STATUS_STAGE_TIMEOUTS)
            // ステータスステージカウンタをデクリメント
            if(USBStatusStageTimeoutCounter != 0u) {
                USBStatusStageTimeoutCounter--;
            }
            // タイムアウト発生、ステータスステージを実行する
            if(USBStatusStageTimeoutCounter == 0) {
                USBCtrlEPAllowStatusStage();
            } 
        #endif
    }

     // 【STALL ハンドシェイクを送信した】
    if(UIRbits.STALLIF && UIEbits.STALLIE) {
        // EP0でストールを送信した場合に、BDT のオーナが SIE の時、所有権を CPU に戻す処理
        USBStallHandler();
    }

     // 【USB エラーが発生した】
    if(UIRbits.UERRIF && UIEbits.UERRIE) {
        // ユーザーイベントコールバック関数に渡す(現在は何も処理していない)
        USB_ERROR_HANDLER(EVENT_BUS_ERROR,0,0);
        // USB エラー割り込みフラグのクリアを行う
        // UEIRをクリアするとUIRbits.UERRIFは自動的にクリアされる(PIC18のみ)
        UEIR = 0 ;
    }

    // まだＵＳＢリセットを検出していない場合ここ以下の処理はしない
    if(USBDeviceState < DEFAULT_STATE) {
         // ＵＳＢ全体割り込みフラグをクリアする
         PIR2bits.USBIF = 0 ;
         return ;
    }

    /*
     *  USBトランザクション完了割り込み
     */
    if(UIEbits.TRNIE) {
         // USTATレジスタは４バッファ(FIFO)有るのでその分繰り返す
         for(i = 0; i < 4u; i++) {
              // トランザクション完了フラグがＯＮなら処理する
              // フラグをクリアする事により次の USTAT バッファに移行する
              if(UIRbits.TRNIF) {
                   USTATcopy.Val   = USTAT ;                     // USTATレジスタ情報を一旦保存する
                   endpoint_number = USTATcopy.endpoint_number ; // 最後にアクティビティのあったエンドポイント番号
                   UIRbits.TRNIF   = 0 ;                         // トランザクション完了割り込みフラグをクリアする

                   // EP0 以外のピンポンバッファが有効になっているなら処理する
                   #if (USB_PING_PONG_MODE == USB_PING_PONG__ALL_BUT_EP0) || (USB_PING_PONG_MODE == USB_PING_PONG__FULL_PING_PONG) 
                        if(USTATcopy.direction == OUT_FROM_HOST) {
                             // トランザクションが OUT または SETUP トークン
                             ep_data_out[endpoint_number].bits.ping_pong_state ^= 1 ;// 偶数/奇数を反転させる
                         } else {
                             // トランザクションが IN トークン
                             ep_data_in[endpoint_number].bits.ping_pong_state ^= 1 ; // 偶数/奇数を反転させる
                         }
                   #endif

                   // エンドポイントが EP0 の時だけ USBCtrlEPService() を処理する
                   if(endpoint_number == 0) {
                       USBCtrlEPService();
                   } else {
                       // ユーザーイベントコールバック関数に渡す(現在は何も処理していない)
                       USB_TRANSFER_COMPLETE_HANDLER(EVENT_TRANSFER, (BYTE*)&USTATcopy.Val, 0);
                   }
              } else break ;
         }
    }

    // ＵＳＢ全体割り込みフラグをクリアする
    PIR2bits.USBIF = 0 ;
}


/*******************************************************************************
*  void USBEnableEndpoint(ep, options)                                         *
*    指定されたエンドポイントの設定を行う関数                                  *
*    指定の ep に対するバッファディスクリプタテーブルへのポインタ値も保存する  *
*                                                                              *
*    ep      : 設定するエンドポイントの番号                                    *
*    options : エンドポイント制御レジスタの設定値                              *
*******************************************************************************/
void USBEnableEndpoint(BYTE ep, BYTE options)
{
    unsigned char* p;

    // 指定のエンドポイントはＯＵＴ方向有りかチェックする
    if(options & USB_OUT_ENABLED) {
        // 指定のエンドポイントに対するBDTへのポインタ保存と
        // BDTステータスレジスタにデータトグル同期ビット(DTS)を設定する
        USBConfigureEndpoint(ep, OUT_FROM_HOST);
    }
    // 指定のエンドポイントはＩＮ方向有りかチェックする
    if(options & USB_IN_ENABLED) {
        // 指定のエンドポイントに対するBDTへのポインタ保存と
        // BDTステータスレジスタにデータトグル同期ビット(DTS)を設定する
        USBConfigureEndpoint(ep, IN_TO_HOST);
    }

    // エンドポイント制御レジスタの設定を行う
     p = (unsigned char*)(&UEP0+ep);
    *p = options;
}


/*******************************************************************************
*  USB_HANDLE USBTransferOnePacket(BYTE ep,BYTE dir,BYTE* data,BYTE len)       *
*    各クラス固有の送受信の為にＢＤＴに設定(USBエンドポイントを準備)を行う関数 *
*    送信(INトランザクション)する為にデータ情報をＢＤＴに設定する              *
*    受信(OUTトランザクション)出来る様にＢＤＴを準備する                       *
*                                                                              *
*    ep    : 設定するエンドポイントの番号                                      *
*    dir   : 転送の方向、OUT_FROM_HOST(受信) 又は IN_TO_HOST(送信)             *
*    *data : データバッファのアドレスポインター                                *
*    len   : INトランザクションなら送信する必要があるデータの長さ              *
*            OUTトランザクションならエンドポイントで記述された大きさに設定     *
*******************************************************************************/
USB_HANDLE USBTransferOnePacket(BYTE ep,BYTE dir,BYTE* data,BYTE len)
{
    volatile BDT_ENTRY* handle;

    // バッファディスクリプタテーブルのポインターを得る
    if(dir != 0) {  // エンドポイントの方向はＩＮ
        handle = pBDTEntryIn[ep];
    } else {        // エンドポイントの方向はＯＵＴ
        handle = pBDTEntryOut[ep];
    }
    if (handle == 0) return 0 ;    // エラー

    //必要に応じて、DTSのビットを切り替え
    #if (USB_PING_PONG_MODE == USB_PING_PONG__NO_PING_PONG)
        handle->STAT.Val ^= _DTSMASK ;
    #elif (USB_PING_PONG_MODE == USB_PING_PONG__EP0_OUT_ONLY)
        if (ep != 0) handle->STAT.Val ^= _DTSMASK ;
    #endif

    // データポインタ、データ長を設定し、エンドポイントを有効にする
    handle->ADR = ConvertToPhysicalAddress(data);
    handle->CNT = len;
    handle->STAT.Val &= _DTSMASK;
    handle->STAT.Val |= _USIE | (_DTSEN & _DTS_CHECKING_ENABLED);

    // ピンポン目的のために次のバッファをポイントします。
    if(dir != OUT_FROM_HOST) {
        // INエンドポイントのために次のバッファ(奇数・偶数)を介して切り替えて置く
        USBAdvancePingPongBuffer(&pBDTEntryIn[ep]);      
    } else {
        // OUTエンドポイントのために次のバッファ(奇数・偶数)を介して切り替えて置く
        USBAdvancePingPongBuffer(&pBDTEntryOut[ep]);     
    }
    return (USB_HANDLE)handle;
}


/*******************************************************************************
*  void USBDeviceDetach(void)                                                  *
*    USB バスからデバイスを切り離す処理                                        *
*    USB_INTERRUPTが定義されている場合にのみ呼び出す必要があります。           *
*    また、この関数はmain（）のループコンテキストから呼び出す必要があります。  *
*    割り込みハンドラ内からこの関数を呼び出さないでください。                  *
*******************************************************************************/
#if defined(USB_INTERRUPT)
void USBDeviceDetach(void)
{
    // ＵＳＢモジュールを無効にしてバスから切り離す処理
    UCON = 0;            // USB 制御レジスタのリセット(ＵＳＢモジュール回路無効)
    UIE  = 0;            // ＵＳＢイベント割り込み全て禁止にする
    // USBデバイスの状態をバスに接続されていない状態(プルアップ接続は無し)とする
    USBDeviceState = DETACHED_STATE;
}
#endif


/*******************************************************************************
*  void USBDeviceAttach(void)                                                  *
*    USB バスにデバイスを接続する処理                                          *
*    USB_INTERRUPTが定義されている場合にのみ呼び出す必要があります。           *
*    また、この関数はmain（）のループコンテキストから呼び出す必要があります。  *
*    割り込みハンドラ内からこの関数を呼び出さないでください。                  *
*******************************************************************************/
#if defined(USB_INTERRUPT)
void USBDeviceAttach(void)
{
    // ＵＳＢバスに接続されていない状態なら処理する
    if(USBDeviceState == DETACHED_STATE) {
        // ＵＳＢバスの電源がＯＮなら処理を行う
        if(USB_BUS_SENSE == 1) {
             UCON = 0;            // USB 制御レジスタのリセット
             UIE  = 0;            // ＵＳＢイベント割り込み全てリセット
             // 内蔵プルアップ有効、フルスピード、全てのエンドポイントでピンポンバッファを有効に設定
             UCFG = 0b00010100 | USB_PING_PONG_MODE ;
             UEIE = 0b10011111 ;                      // ＵＳＢエラー割り込みを全て許可する
             UIE  = 0b00111011 | USB_SOF_INTERRUPT ;  // ＵＳＢイベント割り込み全て許可する

             RCONbits.IPEN   = 1 ;                    // 割り込みに対する優先度レベルの設定を有効にする
             IPR2bits.USBIP  = 1 ;                    // USB 割り込み優先度を"高優先度"とする
             PIE2bits.USBIE  = 1 ;                    // USB 全体割り込みを許可する
             INTCONbits.GIEH = 1 ;                    // 高優先度の割り込みを全て許可

             // バスに接続する処理
             while (!UCONbits.USBEN){
                  UCONbits.USBEN = 1 ;                // ＵＳＢモジュール回路有効、プルアップ抵抗を接続
             }
             // USBデバイスの状態をバスに接続された状態とする
             USBDeviceState = ATTACHED_STATE;
        }
    }
}
#endif


/*******************************************************************************
*  void USBCtrlEPAllowStatusStage(void)                                        *
*    ステータスステージパケットの送信処理                                      *
*    この関数は、コントロール転送のステータスステージパケットが                *
*    完了できるようにするための適切な、IN EP0またはEP0 OUTを準備します。       *
*******************************************************************************/
void USBCtrlEPAllowStatusStage(void)
{
    //Check and set two flags, prior to actually modifying any BDT entries.
    //This double checking is necessary to make certain that 
    //USBCtrlEPAllowStatusStage() can be called twice simultaneously (ex: once 
    //in main loop context, while simultaneously getting an interrupt which 
    //tries to call USBCtrlEPAllowStatusStage() again, at the same time).
    if(USBStatusStageEnabledFlag1 == FALSE) {
        USBStatusStageEnabledFlag1 = TRUE;  
        if(USBStatusStageEnabledFlag2 == FALSE) {
            USBStatusStageEnabledFlag2 = TRUE;
        
            // エンドポイントの種類(IN/OUT)をチェック
            if(controlTransferState == CTRL_TRF_RX) {
                pBDTEntryIn[0]->CNT = 0;
                pBDTEntryIn[0]->STAT.Val = _USIE|_DAT1|(_DTSEN & _DTS_CHECKING_ENABLED);        
            } else if(controlTransferState == CTRL_TRF_TX) {
                BothEP0OutUOWNsSet = FALSE;	//インジケータフラグはUSBCtrlTrfOutHandlerで使用（）
 
                //このバッファ（ピンポンバッファリングがEP0 OUT有効になっている場合）は、次のSETUPパケットを受信します。
                #if((USB_PING_PONG_MODE == USB_PING_PONG__EP0_OUT_ONLY) || (USB_PING_PONG_MODE == USB_PING_PONG__FULL_PING_PONG))
                    pBDTEntryEP0OutCurrent->CNT = USB_EP0_BUFF_SIZE;
                    pBDTEntryEP0OutCurrent->ADR = ConvertToPhysicalAddress(&SetupPkt);
                    pBDTEntryEP0OutCurrent->STAT.Val = _USIE|_BSTALL; //SETUPトランザクションを受け入れるように、エンドポイントを準備
                    BothEP0OutUOWNsSet = TRUE;	//インジケータフラグはUSBCtrlTrfOutHandlerで使用（）
                #endif

                //This EP0 OUT buffer receives the 0-byte OUT status stage packet.
                pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
                pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
                pBDTEntryEP0OutNext->STAT.Val = _USIE;           // Note: DTSEN is 0
            }
        }
    }
}   


/*******************************************************************************
*  void USBCtrlEPAllowDataStage(void)                                          *
*    コントロール転送におけるデータステージでの送受信を準備完了させる処理      *
*    <setup><out>ならパケットを受信出来る様にEP0 OUTを準備する。               *
*    <setup><in>なら送信するパケットデータをBDTにセットする。                  *
*******************************************************************************/
void USBCtrlEPAllowDataStage(void)
{
    USBDeferINDataStagePackets = FALSE;
    USBDeferOUTDataStagePackets = FALSE;

    if(controlTransferState == CTRL_TRF_RX) {
        // データの受信中 : <setup><out><out>...<out><in>
        // データステージのシーケンスの最初のOUTデータパケットを受信するようにEP0 OUTを準備する。
        pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
        pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&CtrlTrfData);
        pBDTEntryEP0OutNext->STAT.Val = _USIE|_DAT1|(_DTSEN & _DTS_CHECKING_ENABLED);
    } else {
        // データの送信中 : <setup><in><in>...<in><out>
        // 送信するデータ長がホストの要求より長いなら、ホストの要求する長さにする
        if(SetupPkt.wLength < inPipes[0].wCount.Val) {
            inPipes[0].wCount.Val = SetupPkt.wLength;
        }
        // データを１トランザクション分送信する準備をする(最初のトランザクション)
        // 実際には、INトークンを受信した時点でSIEが自動的に送信する
        USBCtrlTrfTxService();
        pBDTEntryIn[0]->ADR = ConvertToPhysicalAddress(&CtrlTrfData);
        pBDTEntryIn[0]->STAT.Val = _USIE|_DAT1|(_DTSEN & _DTS_CHECKING_ENABLED);
    }
}


/******************************************************************************/
/** 内部関数 ******************************************************************/
/******************************************************************************/


/*******************************************************************************
*  void USBConfigureEndpoint(EPNum, direction)                                 *
*    指定されたエンドポイントのバッファディスクリプタテーブル(BDT)ポインタ保存 *
*    と、BDTのステータスレジスタにデータトグル同期ビットの設定を行う関数       *
*                                                                              *
*    EPNum     : 設定するエンドポイントの番号                                  *
*    direction : 設定するエンドポインは OUT or IN                              *
*******************************************************************************/
static void USBConfigureEndpoint(BYTE EPNum, BYTE direction)
{
    volatile BDT_ENTRY* handle;

    // まず、handle はバッファディスクリプタテーブルの先頭に位置づけ
    handle = (volatile BDT_ENTRY*)&BDT[EP0_OUT_EVEN];
    // 次に、指定のエンドポイントに対するバッファディスクリプタテーブルに位置づける
    handle += EP(EPNum,direction,0u);

    // ＢＤＴのステータスレジスタ設定　バッファのオーナーはＣＰＵ側
    handle->STAT.UOWN = 0;

    // 指定のエンドポイントに対するＢＤＴへのポインターを保存する
    if(direction == OUT_FROM_HOST) {
        pBDTEntryOut[EPNum] = handle;
    } else {
        pBDTEntryIn[EPNum] = handle;
    }

    // データトグル同期ビットの設定はピンポンバッファの有無によって異なる
    #if (USB_PING_PONG_MODE == USB_PING_PONG__FULL_PING_PONG)
        handle->STAT.DTS = 0;           // 偶数BDTは DATA0 パケット
        (handle+1)->STAT.DTS = 1;       // 奇数BDTは DATA1 パケット
    #elif (USB_PING_PONG_MODE == USB_PING_PONG__NO_PING_PONG)
        handle->STAT.DTS = 1;
    #elif (USB_PING_PONG_MODE == USB_PING_PONG__EP0_OUT_ONLY)
        if(EPNum != 0) {                // EP0 でない
            handle->STAT.DTS = 1;
        }
    #elif (USB_PING_PONG_MODE == USB_PING_PONG__ALL_BUT_EP0)    
        if(EPNum != 0) {
            handle->STAT.DTS = 0;
            (handle+1)->STAT.DTS = 1;
        }
    #endif
}


/*******************************************************************************
*  void SBCtrlEPServiceComplete(void)                                          *
*    このルーチンは、セットアップ要求にサービスを提供する                      *
*    セットアップトランザクション毎の要求別に処理を完了させる処理              *
*******************************************************************************/
static void USBCtrlEPServiceComplete(void)
{
    // セットアップトランザクションを受信したときにPKTDISビットが自動的にセットされている。
    // パケット処理を再開するためにクリアし、SIEトークンおよびパケットの処理を有効にする
    UCONbits.PKTDIS = 0;

    // Check the busy bits とSetupPtkを確認し、コントロール転送のタイプを知る必要があります。
    // パイプの状態をチェックする
    if(inPipes[0].info.bits.busy == 0) {
        if(outPipes[0].info.bits.busy == 1) {
            // <SETUP[0]><OUT[1]><OUT[0]>... | <SETUP[0]?>

            controlTransferState = CTRL_TRF_RX;   // コントロール転送状態 ＝【データ受信中】

            // データステージの開始
            if(USBDeferOUTDataStagePackets == FALSE) {
                // EP0 OUT データステージのデータが読み出せる様に準備する
                USBCtrlEPAllowDataStage();
            }

            //2.  IN EP0ステータスステージは下によって実装されます
            //    OUTデータのすべての後にUSBCtrlEPAllowStatusStage（）が受信され、消費されたか、
            //    タイムアウトが発生した場合にされています。
            USBStatusStageEnabledFlag2 = FALSE;
            USBStatusStageEnabledFlag1 = FALSE;
        } else {
            // 次のSETUPトランザクションを受信するEP0を準備する必要があります。
            pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
            pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
            pBDTEntryEP0OutNext->STAT.Val = _USIE|_DAT0|(_DTSEN & _DTS_CHECKING_ENABLED)|_BSTALL;
            // この要求は処理できないのでストールを返す
            pBDTEntryIn[0]->STAT.Val = _USIE|_BSTALL; 
        }
    } else {
        if(SetupPkt.DataDir == USB_SETUP_DEVICE_TO_HOST_BITFIELD) {
            // SETUPリクエストのデータ転送方向は、デバイス→ホストである
            // <SETUP[0]><IN[1]><IN[0]>... | <SETUP[0]?>

            controlTransferState = CTRL_TRF_TX;   // コントロール転送状態 ＝【データ送信中】

            // データステージの開始
            if(USBDeferINDataStagePackets == FALSE) {
                USBCtrlEPAllowDataStage();
            }

            // ホストが早期終了を実行する場合や、
            // タイムアウトが発生した場合(トランザクションで最後に成功したEP0 INから50ms）から
            // 早期終了の準備のために、今、ステータスステージを許す。
            USBStatusStageEnabledFlag2 = FALSE;
            USBStatusStageEnabledFlag1 = FALSE;
            if(USBDeferStatusStagePacket == FALSE) {
                USBCtrlEPAllowStatusStage();
            }
        } else {
            // SETUPリクエストのデータ転送方向は、ホスト→デバイスである
            // SET_ADDRESS / SET_CONFIGURATION
            //この状況は、ホストがSET_ADDRESS制御転送を送信するときに発生するものと
            //コントロール転送、特殊なタイプのために発生します。
            //<SETUP[0]><IN[1]> | <SETUP[0]>

            controlTransferState = CTRL_TRF_RX;     //これはHOST_TO_DEVICEのコントロール転送である

            //1. 次のSETUPパケットを受信するためにEP0 OUT準備。
            pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
            pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
            pBDTEntryEP0OutNext->STAT.Val = _USIE|_BSTALL;

            //2. コントロール転送のステータスステージINのための準備
            USBStatusStageEnabledFlag2 = FALSE;
            USBStatusStageEnabledFlag1 = FALSE;
            if(USBDeferStatusStagePacket == FALSE) {
                USBCtrlEPAllowStatusStage();
            } 
        }
    }
}


/*******************************************************************************
*  void USBCtrlTrfTxService(void)                                              *
*    ホストにコントロール転送(INトランザクション)する為の処理                  *
*    １トランザクション分の送信するデータをＢＤＴ(EP0 IN)にセットします。      *
*    実際には、INトークンを受信した時点でSIEが自動的に送信する。               *
*******************************************************************************/
static void USBCtrlTrfTxService(void)
{
    BYTE byteToSend;

    byteToSend = USB_EP0_BUFF_SIZE;     // 送信データのデフォルトは８バイト

    // 送信データは８バイトより小さいか？
    if(inPipes[0].wCount.Val < (BYTE)USB_EP0_BUFF_SIZE) {
        byteToSend = inPipes[0].wCount.Val;
        // ショートパケットの送信状況を管理する
        if(shortPacketStatus == SHORT_PKT_NOT_USED) {
            // １回目の送信は保留中とする(送信する総データ長により半端は出る為)
            shortPacketStatus = SHORT_PKT_PENDING;
        } else if(shortPacketStatus == SHORT_PKT_PENDING) {
            // ショートパケットは送信済み
            shortPacketStatus = SHORT_PKT_SENT;
        }
    }

    // 残りの送信バイト数を計算して置く
    inPipes[0].wCount.Val = inPipes[0].wCount.Val - byteToSend;
    // 今回送信するバイト数を設定する、
    // 最大パケットサイズは６４バイトまでなので BC8 and BC9 ビットは常にクリアで良いでしょう
    pBDTEntryIn[0]->CNT = byteToSend;

    // ソースの場所からデータをCtrlTrfData[]バッファへコピーし、ホストに送信する準備を行う
    pDst = (USB_VOLATILE BYTE*)CtrlTrfData;                 // コピー先のポインタを設定
    if(inPipes[0].info.bits.ctrl_trf_mem == USB_EP0_ROM) {  // ソースはROMに有る
        while(byteToSend) {
            *pDst++ = *inPipes[0].pSrc.bRom++;
            byteToSend--;
        }
    } else {                                                // ソースはRAMに有る
        while(byteToSend) {
            *pDst++ = *inPipes[0].pSrc.bRam++;
            byteToSend--;
        }
    }
}


/*******************************************************************************
*  void USBCtrlTrfRxService(void)                                              *
*    デバイス制御転送(OUTトランザクション使用する)のホストの為に使用される関数 *
*                                                                              *
*  PreCondition:   pDst and wCount are setup properly.
*                  pSrc is always &CtrlTrfData usb_stat.ctrl_trf_mem is always USB_EP0_RAM.
*                  wCount should be set to 0 at the start of each control transfer.
*                  
*    この関数は、EP0 OUTに到着したデータを受信し、適切なoutPipes[0].pDst.bRamバッファにコピーする。
*    ホストからすべてのデータを受信した後、適切なoutPipes[0].PFUNC()ハンドラを呼び出します。
*******************************************************************************/
static void USBCtrlTrfRxService(void)
{
    BYTE byteToRead;
    BYTE i;

    // OUTトランザクションでBDTの受信するデータサイズを得る
    byteToRead = pBDTEntryEP0OutCurrent->CNT;

    // ホストが送信したデータサイズが予想より小さいならそのサイズを受信するサイズとする
    // 最後のOUTトランザクション時等に発生するでしょう
    if(byteToRead > outPipes[0].wCount.Val) {
        byteToRead = outPipes[0].wCount.Val;
    }
    // 残りのバイト数を計算する
    outPipes[0].wCount.Val = outPipes[0].wCount.Val - byteToRead;   

    // ユーザアプリケーションバッファ空間に、ホストから受信したOUT DATAxパケットバイトをコピーします。
    for(i=0;i<byteToRead;i++) {
        *outPipes[0].pDst.bRam++ = CtrlTrfData[i];
    }

    if(outPipes[0].wCount.Val > 0) {
        // まだ受信するデータが残っている場合
        // それがシーケンスの次のパケットを受信することができるように、EP0 OUTを用意。
        pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
        pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&CtrlTrfData);
        if(pBDTEntryEP0OutCurrent->STAT.DTS == 0) {
            pBDTEntryEP0OutNext->STAT.Val = _USIE|_DAT1|(_DTSEN & _DTS_CHECKING_ENABLED);
        } else {
            pBDTEntryEP0OutNext->STAT.Val = _USIE|_DAT0|(_DTSEN & _DTS_CHECKING_ENABLED);
        }
    } else {
        // 最後の受信データの場合
        // 次のSETUPトランザクションを受信する為にEP0 OUTを準備します。
        pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
        pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
        // ホストが送信しようとしていた主張よりも多くのデータを送信しようとする場合にストールを設定。
        pBDTEntryEP0OutNext->STAT.Val = _USIE|_BSTALL;

        // 指定したコールバック関数を呼び出す
        if(outPipes[0].pFunc != NULL) {
            #if defined(__XC8)
                //Special pragmas to suppress an expected/harmless warning
                //message when building with the XC8 compiler
                #pragma warning push
                #pragma warning disable 1088
                outPipes[0].pFunc();    //Call the user's callback function
                #pragma warning pop
            #else
                outPipes[0].pFunc();    //Call the user's callback function
            #endif
        }
        outPipes[0].info.bits.busy = 0;

        // ステータスステージの準備を行う
        // コントロール転送の種類に応じて、この関数を 500ms/50ms/5s とタイムリーに呼び出す必要が有る
        // 詳細は、USB2.0仕様のセクション9.2.6を参照してください。
        if(USBDeferStatusStagePacket == FALSE) {
            USBCtrlEPAllowStatusStage();
        }
    }
}


/*******************************************************************************
*  void USBStdSetCfgHandler(void)                                              *
*    SET_CONFIGURATIONのパケットが来た時に処理される関数                       *
*    利用するエンドポイントの初期化と各クラス固有の初期化                      *
*******************************************************************************/
static void USBStdSetCfgHandler(void)
{
    BYTE i;

    // ビジー状態にする、これは、長さゼロのパケットを生成します(ステータスステージ返信の為)
    inPipes[0].info.bits.busy = 1;
    // エンドポイント制御レジスタ(EP1/EP2)をクリアする
    memset((void*)&UEP1,0x00,USB_MAX_EP_NUMBER) ;
    // バッファ ディスクリプタ テーブル(EP0/EP1/EP2)をクリアする
    memset((void*)&BDT[0], 0x00, sizeof(BDT));
    // ピンポンバッファポインタの全てにリセットを要求する
    USBPingPongBufferReset = 1;
    // データのバッファへのポインターもクリアする
    for(i = 0; i < (BYTE)(USB_MAX_EP_NUMBER+1u); i++) {
        ep_data_in[i].Val  = 0u;
        ep_data_out[i].Val = 0u;
    }
    // オルタネートインターフェイス設定をクリアする
    memset((void*)&USBAlternateInterface,0x00,USB_MAX_NUM_INT);
    //ピンポンバッファポインタをリセットする様に設定
    USBPingPongBufferReset = 0;

    // 最初は、ＥＰ０の入力で偶数側のＢＤＴへのエントリーポインタを初期値で設定
    pBDTEntryIn[0] = (volatile BDT_ENTRY*)&BDT[EP0_IN_EVEN];
    // 最初は、ＥＰ０の出力で偶数側のＢＤＴへのエントリーポインタを初期値で設定
    pBDTEntryEP0OutCurrent = (volatile BDT_ENTRY*)&BDT[EP0_OUT_EVEN];
    pBDTEntryEP0OutNext = pBDTEntryEP0OutCurrent;

    // 受信したコンフィギュレーションディスクリプタのインデックス番号を設定する
    USBActiveConfiguration = SetupPkt.bConfigurationValue;
    if(USBActiveConfiguration == 0) {
        // USBデバイスの状態をアドレスの設定終了した状態に戻す
        USBDeviceState = ADDRESS_STATE;
    } else {
        // ユーザーイベントコールバック関数に渡す
        // 利用するエンドポイント(EP0以外)の初期化と各クラス固有の初期化をここで行っている
        USER_USB_CALLBACK_EVENT_HANDLER(EVENT_CONFIGURED,(void*)&USBActiveConfiguration,1);

        // USBデバイスの状態をコンフィギュレーションの設定終了した状態にする
        USBDeviceState = CONFIGURED_STATE;
    }
}


/*******************************************************************************
*  void USBStdGetDscHandler(void)                                              *
*    標準GET_DESCRIPTOR要求を処理します                                        *
*    指定されたディスクリプタを返す(EP0 IN のパイプにデータをセットする)       *
*******************************************************************************/
static void USBStdGetDscHandler(void)
{
    // リクエストタイプは[デバイス→ホスト転送][標準リクエスト][デバイスが受信する]
    if(SetupPkt.bmRequestType == 0x80) {
        // パイプの情報を設定、[データはRAMから転送][ビジー状態とする][長さゼロのパケットを含む]
        inPipes[0].info.Val = USB_EP0_ROM | USB_EP0_BUSY | USB_EP0_INCLUDE_ZERO;

        switch(SetupPkt.bDescriptorType)
        {
            case USB_DESCRIPTOR_DEVICE:           // デバイスディスクリプタを返す
                #if !defined(USB_USER_DEVICE_DESCRIPTOR)
                    inPipes[0].pSrc.bRom = (ROM BYTE*)&device_dsc;
                #else
                    inPipes[0].pSrc.bRom = (ROM BYTE*)USB_USER_DEVICE_DESCRIPTOR;
                #endif
                inPipes[0].wCount.Val = sizeof(device_dsc);
                break;
            case USB_DESCRIPTOR_CONFIGURATION:    // コンフィギュレーションディスクリプタを返す
                #if !defined(USB_USER_CONFIG_DESCRIPTOR)
                    inPipes[0].pSrc.bRom = *(USB_CD_Ptr+SetupPkt.bDscIndex);
                #else
                    inPipes[0].pSrc.bRom = *(USB_USER_CONFIG_DESCRIPTOR+SetupPkt.bDscIndex);
                #endif
                inPipes[0].wCount.byte.LB = *(inPipes[0].pSrc.bRom+2);
                inPipes[0].wCount.byte.HB = *(inPipes[0].pSrc.bRom+3);
                break;
            case USB_DESCRIPTOR_STRING:           // ストリングディスクリプタを返す
                // 要求のストリングス番号は、ストリングディスクリプタの個数以内かチェックする
                if(SetupPkt.bDscIndex < USB_NUM_STRING_DESCRIPTORS) {
                    inPipes[0].pSrc.bRom = *(USB_SD_Ptr+SetupPkt.bDscIndex);
                    inPipes[0].wCount.Val = *inPipes[0].pSrc.bRom;
                } else {
                    // 要求のストリングス番号は持っていないよ！
                    inPipes[0].info.Val = 0;
                }
                break;
            default:
                inPipes[0].info.Val = 0;
                break;
        }
    }
}


/*******************************************************************************
*  void USBStallHandler(void)                                                  *
*    STALLのイベントが発生した時に処理                                         *
*    デバイス側が動作不能な状態の時には、STALLを返信します                     *
*******************************************************************************/
static void USBStallHandler(void)
{
    // EP0でストールを発行した場合に、BD のオーナが SIE の時、所有権を CPU に戻す処理
    if(UEP0bits.EPSTALL == 1) {    // EP0 でストールを発行した
        // (EP0 OUT の BD は owned by SIE) で (EP0 IN の BD は owned by SIE) で有る
        if((pBDTEntryEP0OutCurrent->STAT.Val == _USIE) && (pBDTEntryIn[0]->STAT.Val == (_USIE|_BSTALL))) {
            // DATA0パケット、データトグル同期を有効、バッファストールを有効 を強制的に設定する
            pBDTEntryEP0OutCurrent->STAT.Val = _USIE|_DAT0|(_DTSEN & _DTS_CHECKING_ENABLED)|_BSTALL ;
        }
        UEP0bits.EPSTALL = 0;      // EP0ストールフラグをクリアする
    }

    UIRbits.STALLIF = 0 ;          // STALL ハンドシェイク割り込みフラグをクリアする
}


/*******************************************************************************
*  void USBSuspend(void)                                                       *
*    ホストがアイドル状態に移行した場合に呼出される処理                        *
*    注意）ここで UIRbits.ACTVIF をクリアしないでください                      *
*******************************************************************************/
static void USBSuspend(void)
{
    UIEbits.ACTVIE  = 1 ;          // アクティビティ検出割り込みを許可する
    UIRbits.IDLEIF  = 0 ;          // アイドル状態の検出割り込みフラグをクリアする
    // USBモジュールと周辺回路を省電力モードにしてSIE のクロックを停止する
    UCONbits.SUSPND = 1;

    // ホストはサスペンド状態に有るとフラグを立てる
    USBBusIsSuspended = TRUE ;

    // ユーザーイベントコールバック関数に渡す(現在は何も処理していない)
    // ユーザーの回路/デバイスを省電力に移行する場合は、USBCBSuspend()関数内で行う
    USB_SUSPEND_HANDLER(EVENT_SUSPEND,0,0);
}


/*******************************************************************************
*  void USBWakeFromSuspend(void)                                               *
*    USBサスペンドからのウェイクアップが検出された場合に呼出される処理         *
*******************************************************************************/
static void USBWakeFromSuspend(void)
{
    USBBusIsSuspended = FALSE;     // ホストがサスペンドモードでは無いと設定

    // ユーザーイベントコールバック関数に渡す(現在は何も処理していない)
    USB_WAKEUP_FROM_SUSPEND_HANDLER(EVENT_RESUME,0,0);
    // USBモジュールと周辺回路を通常動作にし、SIE のクロックを設定済みのレートにする
    UCONbits.SUSPND = 0;
    // バス アクティビティ検出割り込みを禁止にする
    UIEbits.ACTVIE = 0;
    // アクティビティ検出フラグをクリアする
    while(UIRbits.ACTVIF) {
        UIRbits.ACTVIF = 0 ;
    }
}


/*******************************************************************************
*  void USBCtrlEPService(void)                                                 *
*    EP0に対してトランザクション終了イベント(TRNIF)が発生した時に処理する関数  *
*  概要: 以下の３タイプトランザクション用の関数            　                  *
*        1. EP0 SETUP パケット                                                 *
*        2. EP0 OUT   パケット                                                 *
*        3. EP0 IN    パケット                                                 *
*        これ以外他のすべてのタイプは無視 (i.e. EP1, EP2, etc.)                *
*******************************************************************************/
static void USBCtrlEPService(void)
{
    unsigned char setup_cnt;

    //If we get to here, that means a successful transaction has just occurred 
    //on EP0.  This means "progress" has occurred in the currently pending 
    //control transfer, so we should re-initialize our timeout counter.
    #if defined(USB_ENABLE_STATUS_STAGE_TIMEOUTS)
        // タイムアウトカウンタを再初期化する
        USBStatusStageTimeoutCounter = USB_STATUS_STAGE_TIMEOUT;      // (BYTE)45
    #endif

    // 終了のトランザクションは EP0のOUTバッファか USTAT レジスタのチェックを行う
    if((USTATcopy.Val & USTAT_EP0_PP_MASK) == USTAT_EP0_OUT_EVEN) {
        // EP0 OUTのBDT テーブルへのポイントを行う
        pBDTEntryEP0OutCurrent = (volatile BDT_ENTRY*)&BDT[(USTATcopy.Val & USTAT_EP_MASK)>>1];

        // 現在のポイントを次のポイントに設定する
        pBDTEntryEP0OutNext = pBDTEntryEP0OutCurrent;
        // データトグル同期ビット(DATA0/1 パケット)を反転させる
        ((BYTE_VAL*)&pBDTEntryEP0OutNext)->Val ^= USB_NEXT_EP0_OUT_PING_PONG;

        // 現在のEP0 OUTのBDTステータスレジスタのパケットID ビットを調べる
        if(pBDTEntryEP0OutCurrent->STAT.PID == PID_SETUP) { //【SETUPパケット】
            // SetupPktバッファにSETUPデータをコピーする
            for(setup_cnt = 0; setup_cnt < 8u; setup_cnt++) {
                // SETUPデータパケットは、常に正確に8バイトが含まれています。
                *(BYTE*)((BYTE*)&SetupPkt + setup_cnt) = *(BYTE*)ConvertToVirtualAddress(pBDTEntryEP0OutCurrent->ADR);
                pBDTEntryEP0OutCurrent->ADR++;
            }
            pBDTEntryEP0OutCurrent->ADR = ConvertToPhysicalAddress(&SetupPkt);
            // コントロール転送（セットアップコマンドを解析し処理）を扱う
            USBCtrlTrfSetupHandler();
        } else {                //【OUTパケット:データ受信】or【INパケット:ステータスステージ】
            // データ転送を扱う
            USBCtrlTrfOutHandler();
        }
    } else {
        // ホストへのデータ送信が完了した場合に処理される
        // 最後のトランザクションは EP0のINバッファかチェックを行う
        if((USTATcopy.Val & USTAT_EP0_PP_MASK) == USTAT_EP0_IN) {
            USBCtrlTrfInHandler();
        }
    }
}


/*******************************************************************************
*  void USBCtrlTrfSetupHandler(void)                                           *
*    到着したＳＥＴＵＰパケットの処理を行う関数                                *
*  Note: コントロール転送ステートマシンの3つの異なる状態を有している。         *
*        1. WAIT_SETUP                                                         *
*        2. CTRL_TRF_TX (INトランザクションを介してホストにデータを送信)       *
*        3. CTRL_TRF_RX (OUTトランザクションを介してホストからデータを受信)    *
*                                                                              *
*        コントロール転送は、多くのUSBトランザクションから構成されている。     *
*        複数のトランザクションを介してデータを転送する場合、                  *
*        データソース、データ宛先、およびデータ数を把握することが重要である。  *
*        これら3つのパラメータはpSrcとpDstに、そしてwCountに格納されている。   *
*        フラグは、データソースがROMやRAMからの物である場合に注意する為に使用する。
*******************************************************************************/
static void USBCtrlTrfSetupHandler(void)
{
    // 転送を制御するために、関連する状態のトラッキング変数を再初期化します。
    shortPacketStatus           = SHORT_PKT_NOT_USED;
    USBDeferStatusStagePacket   = FALSE;
    USBDeferINDataStagePackets  = FALSE;
    USBDeferOUTDataStagePackets = FALSE;
    BothEP0OutUOWNsSet          = FALSE;
    controlTransferState        = WAIT_SETUP;                         // コントロール転送の転送状態をアイドルに設定
    // IN 側 BDTテーブル
    pBDTEntryIn[0]->STAT.Val &= ~(_USIE);                             // UOWNビットをクリア(CPU側)
    ((BYTE_VAL*)&pBDTEntryIn[0])->Val ^= USB_NEXT_EP0_IN_PING_PONG;   // データトグル同期ビット(DATA1 パケット)
    pBDTEntryIn[0]->STAT.Val &= ~(_USIE);                             // ??(上の行と同じ処理と思えるが)
    ((BYTE_VAL*)&pBDTEntryIn[0])->Val ^= USB_NEXT_EP0_IN_PING_PONG;   // ??(ピンポンバッファの切替えかぁ？)
    // OUT 側 BDTテーブル
    pBDTEntryEP0OutNext->STAT.Val &= ~(_USIE);

    inPipes[0].info.Val = 0;
    inPipes[0].wCount.Val = 0;
    outPipes[0].info.Val = 0;
    outPipes[0].wCount.Val = 0;

    // SETUPパケットの標準リクエスト(USB "Chapter 9" requests)に応じた各処理を行う
    USBCheckStdRequest();

    // ユーザーイベントコールバック関数に渡す
    // 各クラス固有のリクエストと通知の要求はここで処理する
    USER_USB_CALLBACK_EVENT_HANDLER(EVENT_EP0_REQUEST,0,0);

    // リクエストに対して次の動作(データの送信など)があればここで処理する
    USBCtrlEPServiceComplete();
}


/*******************************************************************************
*  void USBCtrlTrfOutHandler(void)                                             *
*    コントロール転送状態に応じたOUTトランザクションを処理する関数             *
*******************************************************************************/
static void USBCtrlTrfOutHandler(void)
{
    if(controlTransferState == CTRL_TRF_RX) {
        // OUTトランザクションはデータステージの受信中で有る場合
        // 適切なバッファに新たに受信したデータをコピーし、次のトランザクションのためにEP0 OUTを設定します。
        // <SETUP><OUT><OUT>...<OUT>
        USBCtrlTrfRxService();	
    } else {
        // OUTトランザクションはステータスステージ応答で有る場合
        // <SETUP><IN><IN>...<OUT>←ちょうどステータスステージとして発生したこの最後のOUT

        // コントロール転送の転送状態をアイドルに設定
        controlTransferState = WAIT_SETUP;

        if(BothEP0OutUOWNsSet == FALSE) {
            // 次のSETUPトランザクションのEP0 OUTを用意する
            pBDTEntryEP0OutNext->CNT = USB_EP0_BUFF_SIZE;
            pBDTEntryEP0OutNext->ADR = ConvertToPhysicalAddress(&SetupPkt);
            pBDTEntryEP0OutNext->STAT.Val = _USIE|_DAT0|(_DTSEN & _DTS_CHECKING_ENABLED)|_BSTALL;			
        } else {
            BothEP0OutUOWNsSet = FALSE;
        }
    }
}


/*******************************************************************************
*  void USBCtrlTrfInHandler(void)                                              *
*    ホストへのデータ送信が完了した場合に処理される                            *
*    ステータスステージの完了時は、内部処理を終了状態にする                    *
*    EP0 INで１データ送信完了時は、次のデータが送信できるようにセットする      *
*  Note:アドレス設定要求がコントロール転送が完了するまで、                     *
*       デバイスのこれは、実際のアドレスを変更しないでください。               *
*       アドレス設定要求に対するコントロール転送の終了は、INトランザクションです。
*       したがって、条件が正しい時に、このユニークな状況を処理する為に必要である。
*       マクロmUSBCheckAdrPendingStateはusb9.hで定義され、                     *
*       その機能は、特に、このイベントを処理するためにです。                   *
*******************************************************************************/
static void USBCtrlTrfInHandler(void)
{
    BYTE lastDTS;

    // 前回送信のデータトグル同期ビット(DATA0/1)をコピーして置く
    lastDTS = pBDTEntryIn[0]->STAT.DTS;

    // 次のピンポンバッファに切り替える(DTSの切替えか？)
    ((BYTE_VAL*)&pBDTEntryIn[0])->Val ^= USB_NEXT_EP0_IN_PING_PONG;

    // 【 USBデバイスの状態：アドレス設定保留状態 】
    if(USBDeviceState == ADR_PENDING_STATE) {
        UADDR = SetupPkt.bDevADR.Val;             // USBデバイスアドレスレジスタにアドレスを設定
        if(UADDR != 0u) {
            USBDeviceState=ADDRESS_STATE;         // USBデバイスの状態をアドレス設定完了とする
        } else {
            USBDeviceState=DEFAULT_STATE;         // USBデバイスの状態をデフォルト状態とする
        }
    }

    if(controlTransferState == CTRL_TRF_TX) {     // 【コントロール転送状態：データ送信中】
        // 次のデータを１トランザクション分送信する為にデータを BDT EP0 IN にセットする
        // セットしたデータは、次にINトークンを受信した時点でSIEが自動的に送信する。
        pBDTEntryIn[0]->ADR = ConvertToPhysicalAddress(CtrlTrfData);
        USBCtrlTrfTxService();

        if(shortPacketStatus == SHORT_PKT_SENT) {
            // 既にショートパケットは送信済みだよ！、ホストにSTALLを送る
            pBDTEntryIn[0]->STAT.Val = _USIE|_BSTALL;
        } else {
            // 前回と異なるデータトグル同期ビットで送信
            if(lastDTS == 0) {
                pBDTEntryIn[0]->STAT.Val = _USIE|_DAT1|(_DTSEN & _DTS_CHECKING_ENABLED);
            } else {
                pBDTEntryIn[0]->STAT.Val = _USIE|_DAT0|(_DTSEN & _DTS_CHECKING_ENABLED);
            }
        }
    } else {                                      // 【コントロール転送状態：データ受信中】
        // (<setup><out><out>...<IN>  <-- INこの最後のは単なるステータスステージとして発生した時
        // データ受信ステージは途中でも終了となる注意
        // ステータスステージ送信完了
        if(outPipes[0].info.bits.busy == 1)
        {
            if(outPipes[0].pFunc != NULL)
            {
                outPipes[0].pFunc();
            }
            outPipes[0].info.bits.busy = 0;
        }
    	
        controlTransferState = WAIT_SETUP;
    }
}


/*******************************************************************************
*  void USBCheckStdRequest(void)                                               *
*    SETUPパケットのリクエストに応じた各処理に分岐させる関数                   *
*******************************************************************************/
static void USBCheckStdRequest(void)
{
    // SETUPパケットのリクエストが標準リクエストでないなら処理しない
    if(SetupPkt.RequestType != USB_SETUP_TYPE_STANDARD_BITFIELD) return;

    switch(SetupPkt.bRequest)
    {
        case USB_REQUEST_SET_ADDRESS:             // デバイスのアドレスを設定
            // ビジー状態にする、これは、長さゼロのパケットを生成します(ステータスステージ返信の為)
            inPipes[0].info.bits.busy = 1;
            // USBデバイスの状態をアドレス設定を保留中にする
            // SET_ADDRESSコマンドを受信したが、まだSTATUSステージを終了していない事を示す為に使用する
            USBDeviceState = ADR_PENDING_STATE;
            /* アドレスはこの後 USBCtrlTrfInHandler() 関数でセットされる */
            break;
        case USB_REQUEST_GET_DESCRIPTOR:          // 指定のデスクリプタを返す
            // 標準GET_DESCRIPTOR要求を処理します
            USBStdGetDscHandler();
            break;
        case USB_REQUEST_SET_CONFIGURATION:       // コンフィギュレーション設定
            // 利用するエンドポイントの初期化と各クラス固有の初期化を処理します
            USBStdSetCfgHandler();
            break;

        case USB_REQUEST_CLEAR_FEATURE:           // 特定の機能をクリア。ストール解除など
        case USB_REQUEST_SET_FEATURE:             // リモートウェィクアップなどの機能を設定
            USBStdFeatureReqHandler();
            break;
        case USB_REQUEST_SET_DESCRIPTOR:          // ディスクリプタを変更
            // ユーザーイベントコールバック関数に渡す(現在は何も処理していない)
            USER_USB_CALLBACK_EVENT_HANDLER(EVENT_SET_DESCRIPTOR,0,0);
            break;
        case USB_REQUEST_GET_STATUS:              // エンドポイント等のステータスを返す
        case USB_REQUEST_GET_CONFIGURATION:       // デバイスの現在のコンフィグレーション値を返す
        case USB_REQUEST_GET_INTERFACE:           // 現在の代替えインタフェース番号を返す
        case USB_REQUEST_SET_INTERFACE:           // 代替えインタフェースを設定
        case USB_REQUEST_SYNCH_FRAME:             // パターン同期のアイソクロナス転送で使用、パターン開始番号取得要求
        default:
            break;
    }
}


/*******************************************************************************
*  void USBStdFeatureReqHandler(void)                                          *
*    SET_FEATURE/CLEAR_FEATURE要求の標準セット＆クリアを処理する関数           *
*    BDTエントリの変更、また、USBスタック維持変数を変更することができます。    *
*    これはUSBスタックによって内部で使用する為に意図されたプライベート関数です *
*    デバイスへのSET/CLEAR機能時で"TEST_MODE"は対応していない。                *
*    インターフェイスへのSET/CLEAR機能は、現在のUSB2.0仕様において利用は無し。 *
*******************************************************************************/
static void USBStdFeatureReqHandler(void)
{
    BDT_ENTRY *p;
    EP_STATUS current_ep_data;
    unsigned char* pUEP;

    //ホストがデバイスへのSET/CLEAR機能（リモートウェイクアップ）要求を送信したかどうかを確認します。
    if((SetupPkt.bFeature == USB_FEATURE_DEVICE_REMOTE_WAKEUP)&&
       (SetupPkt.Recipient == USB_SETUP_RECIPIENT_DEVICE_BITFIELD))
    {
        // ビジー状態にする、これは、長さゼロのパケットを生成します(ステータスステージ返信の為)
        inPipes[0].info.bits.busy = 1;
        // "SET_FEATURE"ならリモートウェイクアップフラグを有効とする
        if (SetupPkt.bRequest == USB_REQUEST_SET_FEATURE) {
             RemoteWakeup = TRUE;
        } else {
             RemoteWakeup = FALSE;
        }
    }


    //ホストがエンドポイントへのSET/CLEAR機能（エンドポイントの停止）要求を送信したかどうかを確認します。
    if((SetupPkt.bFeature == USB_FEATURE_ENDPOINT_HALT)&&
       (SetupPkt.Recipient == USB_SETUP_RECIPIENT_ENDPOINT_BITFIELD)&&
       (SetupPkt.EPNum != 0) && (SetupPkt.EPNum <= USB_MAX_EP_NUMBER)&&
       (USBDeviceState == CONFIGURED_STATE))
    {
        // ビジー状態にする、これは、長さゼロのパケットを生成します(ステータスステージ返信の為)
        inPipes[0].info.bits.busy = 1;

        //ホストがSET/CLEARを行いたいBDT(IN/OUT)へのポインタを取得します。
        if(SetupPkt.EPDir == OUT_FROM_HOST) {
            p = (BDT_ENTRY*)pBDTEntryOut[SetupPkt.EPNum];
            current_ep_data.Val = ep_data_out[SetupPkt.EPNum].Val;
        } else {
            p = (BDT_ENTRY*)pBDTEntryIn[SetupPkt.EPNum];
            current_ep_data.Val = ep_data_in[SetupPkt.EPNum].Val;
        }
        // ピンポンバッファリングが指定のエンドポイントで有効になっている場合は、BDTを次に進める処理を行う
        #if (USB_PING_PONG_MODE == USB_PING_PONG__ALL_BUT_EP0) || (USB_PING_PONG_MODE == USB_PING_PONG__FULL_PING_PONG)
            if(current_ep_data.bits.ping_pong_state == 0) {
                USBHALPingPongSetToEven(&p);
            } else {
                USBHALPingPongSetToOdd(&p);
            }
        #endif

        // 新しい、次のエントリでBDTポインタを更新します
        if(SetupPkt.EPDir == OUT_FROM_HOST) {
            pBDTEntryOut[SetupPkt.EPNum] = (volatile BDT_ENTRY *)p;
        } else {
            pBDTEntryIn[SetupPkt.EPNum]  = (volatile BDT_ENTRY *)p;
        }

        if(SetupPkt.bRequest == USB_REQUEST_SET_FEATURE) {
            // "SET_FEATURE" エンドポイント停止要求
            if(p->STAT.UOWN == 1) {
                // BDTのオーナがSIEだったら転送を終了させる
                if(SetupPkt.EPDir == OUT_FROM_HOST) {
                    ep_data_out[SetupPkt.EPNum].bits.transfer_terminated = 1;
                } else {
                    ep_data_in[SetupPkt.EPNum].bits.transfer_terminated = 1;
                }
            }
            // ストールの通知を設定する
            p->STAT.Val |= _USIE|_BSTALL;
        } else {
            // "CLEAR_FEATURE" エンドポイント解除要求(STALL条件を解除)
            #if (USB_PING_PONG_MODE == USB_PING_PONG__ALL_BUT_EP0) || (USB_PING_PONG_MODE == USB_PING_PONG__FULL_PING_PONG)
                // ピンポンバッファリングが指定のエンドポイントで有効になっている場合
                USBAdvancePingPongBuffer(&p);
                // USBTransferOnePacket()を使ってDATA1にDTSを設定する
                if(p->STAT.UOWN == 1) {
                    p->STAT.Val &= (~_USIE);    //Clear UOWN bit
                    p->STAT.Val |= _DAT1;       //Set DTS to DATA1
                    // ユーザーイベントコールバック関数に渡す(現在は何も処理していない)
                    USER_USB_CALLBACK_EVENT_HANDLER(EVENT_TRANSFER_TERMINATED,p,sizeof(p));
                } else {
                    p->STAT.Val |= _DAT1;
                }

                //toggle back to the active BDT (the one the SIE is currently looking at
                //and will use for the next successful transaction to take place on the EP
                USBAdvancePingPongBuffer(&p);    
                
                //Check if we are currently terminating, or have previously terminated
                //a transaction on the given endpoint.  If so, need to clear UOWN,
                //set DTS to the proper state, and call the application callback
                //function.
                if((current_ep_data.bits.transfer_terminated != 0) || (p->STAT.UOWN == 1)) {
                    if(SetupPkt.EPDir == OUT_FROM_HOST) {
                        ep_data_out[SetupPkt.EPNum].bits.transfer_terminated = 0;
                    } else {
                        ep_data_in[SetupPkt.EPNum].bits.transfer_terminated = 0;
                    }
                    //clear UOWN, clear DTS to DATA0, and STALL条件を削除
                    p->STAT.Val &= ~(_USIE | _DAT1 | _BSTALL);  
                    // ユーザーイベントコールバック関数に渡す(現在は何も処理していない)
                    USB_TRANSFER_TERMINATED_HANDLER(EVENT_TRANSFER_TERMINATED,p,sizeof(p));
                } else {
                    //clear UOWN, clear DTS to DATA0, and STALL条件を削除
                    p->STAT.Val &= ~(_USIE | _DAT1 | _BSTALL); 
                }
            #else
                // ピンポンバッファリングが指定のエンドポイントで無効になっている場合
                //else we must not be using ping-pong buffering on the requested endpoint
                //Check if we need to call the user transfer terminated event callback function.
                //We should call the callback, if the endpoint was previously terminated,
                //or the endpoint is currently armed, and the host is performing clear
                //endpoint halt, even though the endpoint wasn't stalled.
                if((current_ep_data.bits.transfer_terminated != 0) || (p->STAT.UOWN == 1)) {
                    //We are going to call the user transfer terminated callback.
                    //Clear the flag so we know we took care of it and don't need
                    //to call it again later.
                    if(SetupPkt.EPDir == OUT_FROM_HOST) {
                        ep_data_out[SetupPkt.EPNum].bits.transfer_terminated = 0;
                    } else {
                        ep_data_in[SetupPkt.EPNum].bits.transfer_terminated = 0;
                    }
 
                    // UOWNをクリアし、STALL状態を削除します。
                    // USBTransferOnePacket()を呼び出し次回DATA0に切り替わりますように、
                    // DTSビットを設定する必要が有る。
                    p->STAT.Val &= ~(_USIE | _BSTALL);  
                    p->STAT.Val |= _DAT1;
                    //Let the application firmware know a transaction just
                    //got terminated by the host, and that it is now free to
                    //re-arm the endpoint or do other tasks if desired.                                        
                    USB_TRANSFER_TERMINATED_HANDLER(EVENT_TRANSFER_TERMINATED,p,sizeof(p));
                } else {
                    // UOWNをクリアし、STALL状態を削除します。
                    // USBTransferOnePacket()を呼び出し次回DATA0に切り替わりますように、
                    // DTSビットを設定する必要が有る。
                    p->STAT.Val &= ~(_USIE | _BSTALL);  
                    p->STAT.Val |= _DAT1;
                } 
            #endif

            //Get a pointer to the appropriate UEPn register
            pUEP = (unsigned char*)(&U1EP0+SetupPkt.EPNum);
            //Clear the STALL bit in the UEP register
            *pUEP &= ~UEP_STALL;            
        }
    }
}
