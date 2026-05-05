/********************************************************************************
  File Information:
    FileName:       usb_function_cdc.c
    Dependencies:   See INCLUDES section
    Processor:      PIC18 or PIC24 USB Microcontrollers
    Hardware:       The code is natively intended to be used on the following
                    hardware platforms: PICDEM(TM) FS USB Demo Board,
                    PIC18F87J50 FS USB Plug-In Module, or
                    Explorer 16 + PIC24 USB PIM.  The firmware may be
                    modified for use on other USB platforms by editing the
                    HardwareProfile.h file.
    Complier:   Microchip C18 (for PIC18) or C30 (for PIC24)
    Company:        Microchip Technology, Inc.

    Software License Agreement:

    The software supplied herewith by Microchip Technology Incorporated
    (the "Company") for its PIC(R) Microcontroller is intended and
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
    このファイルには、関数、マクロ、定義、変数、データ型などがすべて含まれています。
    それは、CDC機能ドライバを使用ために必要とされる。
    このファイルは、CDC機能のドライバを使用するプロジェクトに含まれるべきである。

********************************************************************************
*  このファイルは、18F14K50でXC8 C Compiler用に変更しています。                *
*  また、CDCクラスに必要ないと思われる一部の機能・オプションも削除しています。 *
********************************************************************************
*   VERSION  DATE        BY             CHANGE/COMMENT                         *
* ---------------------------------------------------------------------------- *
*   1.00     2013-09-07  きむ茶工房     Create                                 *
* ============================================================================ *
*  PIC 18F14K50(秋月電子のＵＳＢ対応超小型マイコンボード)                      *
*  MPLAB IDE(V8.84)                                                            *
*  MPLAB(R) XC8 C Compiler Version 1.00                                        *
*******************************************************************************/
#include "USB/usb.h"
#include "USB/usb_function_cdc.h"
#include "HardwareProfile - PIC18F14K50.h"

#ifdef USB_USE_CDC

/** V A R I A B L E S ********************************************************/
// cdc_data_rx[]とcdc_data_tx[]配列と関連する変数は、
// このファームウェアでのUSBパケットバッファとして使用されます。
// したがって、彼らは、マイクロコントローラRAMのUSBモジュール可能部分に配置する必要があります。

#if defined(__XC8)
        #define IN_DATA_BUFFER_ADDRESS 0x260
        #define OUT_DATA_BUFFER_ADDRESS (IN_DATA_BUFFER_ADDRESS + CDC_DATA_IN_EP_SIZE)
        #define LINE_CODING_ADDRESS (OUT_DATA_BUFFER_ADDRESS + CDC_DATA_OUT_EP_SIZE)
        #define NOTICE_ADDRESS (LINE_CODING_ADDRESS + LINE_CODING_LENGTH)

        #define IN_DATA_BUFFER_ADDRESS_TAG  @IN_DATA_BUFFER_ADDRESS
        #define OUT_DATA_BUFFER_ADDRESS_TAG @OUT_DATA_BUFFER_ADDRESS
        #define LINE_CODING_ADDRESS_TAG     @LINE_CODING_ADDRESS
        #define NOTICE_ADDRESS_TAG          @NOTICE_ADDRESS
#else
    #define IN_DATA_BUFFER_ADDRESS_TAG
    #define OUT_DATA_BUFFER_ADDRESS_TAG
    #define LINE_CODING_ADDRESS_TAG
    #define NOTICE_ADDRESS_TAG
#endif

volatile unsigned char cdc_data_tx[CDC_DATA_IN_EP_SIZE] IN_DATA_BUFFER_ADDRESS_TAG;
volatile unsigned char cdc_data_rx[CDC_DATA_OUT_EP_SIZE] OUT_DATA_BUFFER_ADDRESS_TAG;

LINE_CODING line_coding LINE_CODING_ADDRESS_TAG;    // ライン符号化情報を格納するバッファ
volatile CDC_NOTICE cdc_notice NOTICE_ADDRESS_TAG; // CDC通知

#if defined(USB_CDC_SUPPORT_DSR_REPORTING)          // DSR制御オプション現在無効
    SERIAL_STATE_NOTIFICATION SerialStatePacket;
#endif

BYTE cdc_rx_len;              // total rx length

BYTE cdc_trf_state;           // ＣＤＣ転送の状態
POINTER pCDCSrc;              // 送信するデータの保存先アドレス
POINTER pCDCDst;              // Dedicated destination pointer
BYTE cdc_tx_len;              // 送信するデータの長さ
BYTE cdc_mem_type;            // 送信するデータの保存先メモリのタイプ(_ROM, _RAM)

USB_HANDLE CDCDataOutHandle;  // EP2(データ転送用)OUT用のバッファリングディスクリプタのポインタ
USB_HANDLE CDCDataInHandle;   // EP2(データ転送用) IN用のバッファリングディスクリプタのポインタ


CONTROL_SIGNAL_BITMAP control_signal_bitmap;
DWORD BaudRateGen;			// BRG value calculated from baudrate

#if defined(USB_CDC_SUPPORT_DSR_REPORTING)
    BM_SERIAL_STATE SerialStateBitmap;
    BM_SERIAL_STATE OldSerialStateBitmap;
    USB_HANDLE CDCNotificationInHandle;
#endif

// SEND_ENCAPSULATED_COMMANDとGET_ENCAPSULATED_RESPONSEの要求は、CDC仕様に従って必要とされる。
// しかし、実際にはダミーバッファが有るだけなので、ここで使用されていない。
#define dummy_length    0x08
BYTE_VAL dummy_encapsulated_cmd_response[dummy_length];

#if defined(USB_CDC_SET_LINE_CODING_HANDLER)
CTRL_TRF_RETURN USB_CDC_SET_LINE_CODING_HANDLER(CTRL_TRF_PARAMS);
#endif

/** P R I V A T E  P R O T O T Y P E S ***************************************/
void USBCDCSetLineCoding(void);

/** C L A S S  S P E C I F I C  R E Q *****************************************/

/*******************************************************************************
*  void USBCheckCDCRequest(void)                                               *
*    CDCクラス固有のリクエストと通知の要求を処理する関数                       *
*    SETUPパケットがホストから到着した後にのみ、この機能を呼出す必要があります *
*******************************************************************************/
void USBCheckCDCRequest(void)
{
    // リクエストタイプの受信者が[インターフェイス]かチェックする
    if(SetupPkt.Recipient != USB_SETUP_RECIPIENT_INTERFACE_BITFIELD) return;

    // リクエストタイプは[クラスリクエスト]かチェックする
    if(SetupPkt.RequestType != USB_SETUP_TYPE_CLASS_BITFIELD) return;

    // インターフェースディスクリプタの識別番号をチェックする
    if((SetupPkt.bIntfID != CDC_COMM_INTF_ID)&&
       (SetupPkt.bIntfID != CDC_DATA_INTF_ID)) return;

    // インターフェイススディスクリプタに対する各要求の処理を行う
    switch(SetupPkt.bRequest)
    {
        case SEND_ENCAPSULATED_COMMAND:      // プロトコルのコマンドを発行
            // ダミーデータを送っているだけ
            inPipes[0].pSrc.bRam  = (BYTE*)&dummy_encapsulated_cmd_response;
            inPipes[0].wCount.Val = dummy_length;
            inPipes[0].info.bits.ctrl_trf_mem = USB_EP0_RAM;
            inPipes[0].info.bits.busy = 1;
            break;
        case GET_ENCAPSULATED_RESPONSE:      // プロトコルの応答を要求
            // ダミーデータを送っているだけ
            inPipes[0].pSrc.bRam      = (BYTE*)&dummy_encapsulated_cmd_response;
            inPipes[0].info.bits.busy = 1;
            break;

        #if defined(USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D1)
        case SET_LINE_CODING:                // 通信速度・ストップビット数・パリティ・文字のビット数を設定
            outPipes[0].wCount.Val     = SetupPkt.wLength;
            outPipes[0].pDst.bRam      = (BYTE*)LINE_CODING_TARGET;
            outPipes[0].pFunc          = LINE_CODING_PFUNC;
            outPipes[0].info.bits.busy = 1;
            break;
        case GET_LINE_CODING:                // 通信速度・ストップビット数・パリティ・文字のビット数の設定を取得
            USBEP0SendRAMPtr( (BYTE*)&line_coding, LINE_CODING_LENGTH, USB_EP0_INCLUDE_ZERO);
            break;
        case SET_CONTROL_LINE_STATE:         // RTS / CTSフロー制御の実施
            control_signal_bitmap._byte = (BYTE)SetupPkt.W_Value.v[0];
            //CONFIGURE_RTS(control_signal_bitmap.CARRIER_CONTROL);  
            #if defined(USB_CDC_SUPPORT_DTR_SIGNALING)
                if(control_signal_bitmap.DTE_PRESENT == 1) {
                    UART_DTR = USB_CDC_DTR_ACTIVE_LEVEL;
                } else {
                    UART_DTR = (USB_CDC_DTR_ACTIVE_LEVEL ^ 1);
                }        
            #endif
            inPipes[0].info.bits.busy = 1;
            break;
        #endif

        #if defined(USB_CDC_SUPPORT_ABSTRACT_CONTROL_MANAGEMENT_CAPABILITIES_D2)
        case SEND_BREAK:                     // ブレーク制御
            inPipes[0].info.bits.busy = 1;
            if (SetupPkt.wValue == 0xFFFF) {
                // 送信の停止
                UART_Tx     = 0;   // TXはLOW（ブレークシグナリング用）を駆動するための準備
                UART_TRISTx = 0;   // TXピンは出力
                UART_ENABLE = 0;   //（TXピンの制御を放棄する）USARTをオフにする
            } else if (SetupPkt.wValue == 0x0000) {
                // 再開
                UART_ENABLE = 1;   // USARTをオンにする
                UART_TRISTx = 1;   // TXピンを入力
            } else {
                // (SetupPkt.wValue)ms 秒間だけ停止
                UART_SEND_BREAK(); // この関数が見あたらない様だが？？
            }
            break;
        #endif
        default:
            break;
    }

}

/** U S E R  A P I ************************************************************/

/*******************************************************************************
*  void CDCInitEP(void)                                                        *
*    利用するエンドポイント(EP0以外)の初期化行う関数                           *
*    ＣＤＣクラス固有の初期化も行う                                            *
*    SET_CONFIGURATIONコマンドの後に呼び出さなければなりません。               *
*******************************************************************************/
void CDCInitEP(void)
{
    // Abstract Contro Mode の情報を設定
    line_coding.dwDTERate.Val = 19200;       // baud rate
    line_coding.bCharFormat   = 0x00;        // 1 stop bit
    line_coding.bParityType   = 0x00;        // None
    line_coding.bDataBits     = 0x08;        // 5,6,7,8, or 16

    cdc_rx_len = 0;

    // エンドポイント識別番号１の設定を行う(インタラプト転送)
    // [IN を有効][エンドポイントのハンドシェイクを有効][ストールなし]
    // [コントロール転送を無効、IN or OUT 転送のみ許可]
    USBEnableEndpoint(CDC_COMM_EP,USB_IN_ENABLED|USB_HANDSHAKE_ENABLED|USB_DISALLOW_SETUP);
    // エンドポイント識別番号２の設定を行う(バルク転送)
    // [IN と OUT を有効][エンドポイントのハンドシェイクを有効][ストールなし]
    // [コントロール転送を無効、IN or OUT 転送のみ許可]
    USBEnableEndpoint(CDC_DATA_EP,USB_IN_ENABLED|USB_OUT_ENABLED|USB_HANDSHAKE_ENABLED|USB_DISALLOW_SETUP);
    // OUTトランザクション(受信)の為にデュアルRAMバッファを準備(BDTに設定)します
    CDCDataOutHandle = USBRxOnePacket(CDC_DATA_EP,(BYTE*)&cdc_data_rx,sizeof(cdc_data_rx));
    CDCDataInHandle  = NULL;

    // 信号ラインのフロー制御を行うなら初期化を行なう
    #if defined(USB_CDC_SUPPORT_DSR_REPORTING)
        CDCNotificationInHandle = NULL;
        mInitDTSPin();  //Configure DTS as a digital input
      	SerialStateBitmap.byte = 0x00;
      	OldSerialStateBitmap.byte = !SerialStateBitmap.byte;    //To force firmware to send an initial serial state packet to the host.
        //Prepare a SerialState notification element packet (contains info like DSR state)
        SerialStatePacket.bmRequestType = 0xA1; //Always 0xA1 for this type of packet.
        SerialStatePacket.bNotification = SERIAL_STATE;
        SerialStatePacket.wValue = 0x0000;  //Always 0x0000 for this type of packet
        SerialStatePacket.wIndex = CDC_COMM_INTF_ID;  //Interface number  
        SerialStatePacket.SerialState.byte = 0x00;
        SerialStatePacket.Reserved = 0x00;
        SerialStatePacket.wLength = 0x02;   //Always 2 bytes for this type of packet    
        CDCNotificationHandler();
    #endif
    #if defined(USB_CDC_SUPPORT_DTR_SIGNALING)
        mInitDTRPin();
    #endif
    #if defined(USB_CDC_SUPPORT_HARDWARE_FLOW_CONTROL)
        mInitRTSPin();
        mInitCTSPin();
    #endif

    cdc_trf_state = CDC_TX_READY;       // 送信準備ＯＫ
}


/*******************************************************************************
*  void CDCNotificationHandler(void)                                           *
*    DSRの状態の変化をチェックし、USBホストに報告する関数                      *
*    "#define USB_CDC_SUPPORT_DSR_REPORTING"オプションが有効になっている場合、 *
*    周期的にDSRピンをサンプリングし、USBホストに情報を送るために呼び出します。*
*    (現在はオプションは無効となっている)                                      *
*******************************************************************************/
#if defined(USB_CDC_SUPPORT_DSR_REPORTING)
void CDCNotificationHandler(void)
{
    // DTS I/Oピンをチェックし、状態変化が検出された場合、
    // シリアル状態通知素子パケットを送信することにより、USBホストに通知する。

    // UART_DTSは、DTS機能を使用する為のハードウェアプロファイルのI/Oピンの様に定義します(現在未定義)。
    if(UART_DTS == USB_CDC_DSR_ACTIVE_LEVEL) {
        SerialStateBitmap.bits.DSR = 1;
    } else {
        SerialStateBitmap.bits.DSR = 0;
    }

    //状態が変更され、エンドポイントが利用可能である場合、USBホストに変化の通知パケットを送信する。
    if((SerialStateBitmap.byte != OldSerialStateBitmap.byte) && (!USBHandleBusy(CDCNotificationInHandle)))
    {
        // 送信するUSBパケットバッファに更新された値をコピーします。
        // その他のデータは初期値のままで変更はない
        SerialStatePacket.SerialState.byte = SerialStateBitmap.byte;
        // USB経由でホストにパケットを送信します。
        CDCNotificationInHandle = USBTransferOnePacket(CDC_COMM_EP, IN_TO_HOST, (BYTE*)&SerialStatePacket, sizeof(SERIAL_STATE_NOTIFICATION));
        // 古い値を保存しますので、後で変更を検出することができます。
        OldSerialStateBitmap.byte = SerialStateBitmap.byte;
    }
}
#else
    #define CDCNotificationHandler() {} // オプションは無効なら無処理
#endif


/*******************************************************************************
*  BYTE getsUSBUSART(char *buffer, BYTE len)                                   *
*    指定した場所にOUTエンドポインを介して受信したバイト文字列をコピーする関数 *
*    利用可能なデータが存在しない場合は、に'0 'を返す。                        *
*                                                                              *
*    *buffer : 受信されたバイトを格納する場所へのポインタ                      *
*    len     : エンドポイントの最大転送サイズ                                  *
*******************************************************************************/
BYTE getsUSBUSART(char *buffer, BYTE len)
{
    cdc_rx_len = 0;

    // EP2のOUT(データ転送)用BDTのステータスレジスターをチェックする(オーナーはSIEでない)
    if(!USBHandleBusy(CDCDataOutHandle)) {
        // 実際に受信したサイズがlenより少ないなら、lenを調整する
        if (len > USBHandleGetLength(CDCDataOutHandle)) len = USBHandleGetLength(CDCDataOutHandle);

        // ユーザーのバッファにデュアルRAMバッファからデータをコピー
        for (cdc_rx_len = 0; cdc_rx_len < len; cdc_rx_len++) {
            buffer[cdc_rx_len] = cdc_data_rx[cdc_rx_len];
        }

        // 次のOUTトランザクションの為にデュアルRAMバッファを準備(BDTに設定)します
        CDCDataOutHandle = USBRxOnePacket(CDC_DATA_EP,(BYTE*)&cdc_data_rx,sizeof(cdc_data_rx));
    }

    return cdc_rx_len;
}


/*******************************************************************************
*  void putUSBUSART(char *data, BYTE  length)                                  *
*    送信するデータの配列を指定バイト数だけセットする関数                      *
*    ホストにデータのブロックを送信し続ける為に、                              *
*    CDCTxService()を定期的に呼び出さなければなりません。                      *
*                                                                              *
*    *data  : 送信するデータRAMの配列への格納先アドレスを指定する              *
*    length : 送信するデータのバイト数を指定する、(255未満でなければなりません)*
*******************************************************************************/
void putUSBUSART(char *data, BYTE  length)
{
    USBMaskInterrupts();                          // ＵＳＢ割り込みの禁止
    if(cdc_trf_state == CDC_TX_READY)
    {
        mUSBUSARTTxRam((BYTE*)data, length);      // 送信するデータのセットを行う
    }
    USBUnmaskInterrupts();                        // ＵＳＢ割り込みの許可
}


/*******************************************************************************
*  void pustUSBUSART(char *data)                                               *
*    送信する文字列の配列を0x00までセットする関数                              *
*    ホストにデータのブロックを送信し続ける為に、                              *
*    CDCTxService()を定期的に呼び出さなければなりません。                      *
*                                                                              *
*    *data  : 送信する文字列RAMの配列への格納先アドレスを指定する              *
*             送信する文字列データの最大長は255未満でなければなりません        *
*******************************************************************************/
void putsUSBUSART(char *data)
{
    BYTE len;
    char *pData;

    USBMaskInterrupts();                // ＵＳＢ割り込みの禁止
    if(cdc_trf_state != CDC_TX_READY) {
        USBUnmaskInterrupts();          // ＵＳＢ割り込みの許可
        return;
    }

    // null character(0x00) までの文字長さを調べる
    len = 0;
    pData = data;
    do
    {
        len++;
        if(len == 255) break;           // 最大255までなので終了する
    }while(*pData++);

    mUSBUSARTTxRam((BYTE*)data, len);   // 送信するデータのセットを行う
    USBUnmaskInterrupts();              // ＵＳＢ割り込みの許可
}


/*******************************************************************************
*  void CDCTxService(void)                                                     *
*    デバイスからホストへのＣＤＣ通信トランザクションを処理する関数            *
*    通信データが設定された状態に到達した後、                                  *
*    この関数は、メインプログラムのループごとに一度呼び出さなければなりません。*
*******************************************************************************/
void CDCTxService(void)
{
    BYTE byte_to_send;
    BYTE i;

    USBMaskInterrupts();                          // ＵＳＢ割り込みの禁止

    // ＤＳＲ制御(現在このオプションは無効で定義してある)
    CDCNotificationHandler();
    // EP2のIN(データ転送)用BDTのステータスレジスターをチェックする
    if(USBHandleBusy(CDCDataInHandle)) {          // オーナーはSIEである、SIE処理中
        USBUnmaskInterrupts();                    // ＵＳＢ割り込みの許可
        return;
    }

    // ＣＤＣ通信状態が"完了"なら"レディ状態"とする
    if(cdc_trf_state == CDC_TX_COMPLETING) cdc_trf_state = CDC_TX_READY ;
    // ＣＤＣ通信状態が"レディ状態"なら何もしないで戻る
    if(cdc_trf_state == CDC_TX_READY) {
        USBUnmaskInterrupts();                    // ＵＳＢ割り込みの許可
        return;
    }

    if(cdc_trf_state == CDC_TX_BUSY_ZLP) {
        // データ長さ０のパケットを送信する場合
        CDCDataInHandle = USBTxOnePacket(CDC_DATA_EP,NULL,0);    // BDT(IN EP2:DATA)にセット
        //CDC_DATA_BD_IN.CNT = 0;
        cdc_trf_state = CDC_TX_COMPLETING;                       // 送信完了
    }
    else if(cdc_trf_state == CDC_TX_BUSY)
    {
        // ＣＤＣ通信状態が"送信中"の場合
        // 送信するデータは送信バッファより長いのかをチェックする
    	if(cdc_tx_len > sizeof(cdc_data_tx)) byte_to_send = sizeof(cdc_data_tx);
    	else                                 byte_to_send = cdc_tx_len;
        // 送信する残りのバイトを計算する
        cdc_tx_len = cdc_tx_len - byte_to_send;

        // 送信バッファにデータをコピーする
        pCDCDst.bRam = (BYTE*)&cdc_data_tx;       // 送信先バッファのアドレスを設定
        i = byte_to_send;                         // 今回送信するデータ長だけ繰り返す
        if(cdc_mem_type == USB_EP0_ROM) {         // 送信データの格納先メモリはＲＯＭに格納している
            while(i) {
                *pCDCDst.bRam = *pCDCSrc.bRom;
                pCDCDst.bRam++;
                pCDCSrc.bRom++;
                i--;
            }
        } else {                                  // ソースはＲＡＭに格納している
            while(i) {
                *pCDCDst.bRam = *pCDCSrc.bRam;
                pCDCDst.bRam++;
                pCDCSrc.bRam++;
                i--;
            }
        }

        // データの送信を行う
        if(cdc_tx_len == 0) {
            // 送信するデータはこれ以上ない場合
            // 送信するデータが、送信バッファサイズと同じなら次に長さ０のパケットを送信する、それ以外は終了
            if(byte_to_send == CDC_DATA_IN_EP_SIZE) cdc_trf_state = CDC_TX_BUSY_ZLP;
            else                                    cdc_trf_state = CDC_TX_COMPLETING;
        }
        CDCDataInHandle = USBTxOnePacket(CDC_DATA_EP,(BYTE*)&cdc_data_tx,byte_to_send);   // BDT(IN EP2:DATA)にセット
    }

    USBUnmaskInterrupts();                        // ＵＳＢ割り込みの許可
}

#endif //USB_USE_CDC
