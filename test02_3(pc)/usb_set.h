
// 変数の定義
char USB_In_Buffer[32];//[64] ;       // USBの送信用バッファ
char USB_Out_Buffer[8];//[32];//[64] ;      // USBの受信用バッファ

// 関数プロトタイプ�E宣言
void ProcessUSB(void);
void USBDeviceTasks(void);
//void YourHighPriorityISRCode();
//void YourLowPriorityISRCode();
void USBCBSendResume(void);
void BlinkUSBStatus(void);

// USBブ�Eトローダと割り込みベクタのアドレスが被る場合�Eリマップする�E琁E
// もしブ�Eトローダーを使用しなぁE��合、E
// usb_config.hファイルを編雁E��、以下�E定義をコメントアウトします、E
// #define PROGRAMMABLE_WITH_USB_HID_BOOTLOADER
// #define PROGRAMMABLE_WITH_USB_LEGACY_CUSTOM_CLASS_BOOTLOADER

#if defined(PROGRAMMABLE_WITH_USB_HID_BOOTLOADER)
	#define REMAPPED_RESET_VECTOR_ADDRESS			0x1000
	#define REMAPPED_HIGH_INTERRUPT_VECTOR_ADDRESS	0x1008
	#define REMAPPED_LOW_INTERRUPT_VECTOR_ADDRESS	0x1018
#elif defined(PROGRAMMABLE_WITH_USB_MCHPUSB_BOOTLOADER)	
	#define REMAPPED_RESET_VECTOR_ADDRESS			0x800
	#define REMAPPED_HIGH_INTERRUPT_VECTOR_ADDRESS	0x808
	#define REMAPPED_LOW_INTERRUPT_VECTOR_ADDRESS	0x818
#else	
	#define REMAPPED_RESET_VECTOR_ADDRESS			0x00
	#define REMAPPED_HIGH_INTERRUPT_VECTOR_ADDRESS	0x08
	#define REMAPPED_LOW_INTERRUPT_VECTOR_ADDRESS	0x18
#endif

#if defined(PROGRAMMABLE_WITH_USB_HID_BOOTLOADER) || defined(PROGRAMMABLE_WITH_USB_MCHPUSB_BOOTLOADER)
	extern void _startup (void) ;
	void _reset (void) @REMAPPED_RESET_VECTOR_ADDRESS
	{
         #asm
         goto _startup ;
         #endasm
	}
#endif

void Remapped_High_ISR (void) @REMAPPED_HIGH_INTERRUPT_VECTOR_ADDRESS
{
     #asm 
     goto YourHighPriorityISRCode ;
     #endasm
}

void Remapped_Low_ISR (void) @REMAPPED_LOW_INTERRUPT_VECTOR_ADDRESS
{
     #asm 
     goto YourLowPriorityISRCode ;
     #endasm
}

#if defined(PROGRAMMABLE_WITH_USB_HID_BOOTLOADER) || defined(PROGRAMMABLE_WITH_USB_MCHPUSB_BOOTLOADER)
	void High_ISR (void) @0x08
	{
          #asm 
          goto REMAPPED_HIGH_INTERRUPT_VECTOR_ADDRESS ;
          #endasm
	}

	void Low_ISR (void) @0x18
	{
          #asm 
          goto REMAPPED_LOW_INTERRUPT_VECTOR_ADDRESS ;
          #endasm
	}
#endif

/*******************************************************************************
*  ProcessUSB()                                                                *
*    �E��E��E�で送受信(�E��E��E�クラス)するメインの処琁E                             *
*******************************************************************************/

void ProcessUSB(void)
{
     BYTE numBytesRead ;
     BYTE i ;

     if(PORTCbits.RC0 == 0) {          // SW1(RC0)がＯ�E�なら要求すめE
          USBCBSendResume() ; // DEBUG
     }

     // �E��E��E�が通信可能になるまで征E��
     if ( (USBDeviceState < CONFIGURED_STATE) || (USBSuspendControl == 1) ) return ;

     // チE�Eタを受信しためE受信チE�Eタ�E�！Eで送り返す処琁E
     if (USBUSARTIsTxTrfReady()) {      // ホストにチE�Eタを送信する準備ができてぁE��かどぁE��をチェチE��する
          numBytesRead = getsUSBUSART(USB_Out_Buffer,8);//64) ;  // 受信チE�Eタが有れ�E取り出ぁE
//          if(numBytesRead != 0) {

//////////////////

                  USB_In_Buffer[0] = 'T';
                  USB_In_Buffer[1] = 'E';
                  USB_In_Buffer[2] = 'S';
                  USB_In_Buffer[3] = 'T';
                  USB_In_Buffer[4] = ' ';

                  USB_In_Buffer[5] = tm_disp[0];
                  USB_In_Buffer[6] = tm_disp[1];
                  USB_In_Buffer[7] = ':';
                  USB_In_Buffer[8] = tm_disp[2];
                  USB_In_Buffer[9] = tm_disp[3];
                  USB_In_Buffer[10] = ':';
                  USB_In_Buffer[11] = tm_disp[4];
                  USB_In_Buffer[12] = tm_disp[5];

                  USB_In_Buffer[13] = ' ';

                  USB_In_Buffer[14] = tmp_disp[0];
                  USB_In_Buffer[15] = tmp_disp[1];
                  USB_In_Buffer[16] = '.';
                  USB_In_Buffer[17] = tmp_disp[2];

                  USB_In_Buffer[18] = 0x0A;

/*
               for (i=0 ; i<numBytesRead ; i++) {           // 受信した個数刁E��り返す
                    switch(USB_Out_Buffer[i]) {
                         case 0x0A:
                         case 0x0D:
                              USB_In_Buffer[i+18] = USB_Out_Buffer[i] ;       // 改行コード�Eそ�Eまま移ぁE
                              break ;
                         default:
                              USB_In_Buffer[i+19] = USB_Out_Buffer[i] + 2 ;   // 他�Eコード�E�E�Eして移ぁE
                              break ;
                    }
               }
*/
//                  USB_In_Buffer[20+numBytesRead] = 0x0A;
//////////////////

               // �E��E��E�ホストへのチE�EタをセチE��する
               putUSBUSART(USB_In_Buffer,19) ;
//               putUSBUSART(USB_In_Buffer,numBytesRead+20) ;
//          }
     }

    CDCTxService() ;

///////////////////////////////
     if (USBUSARTIsTxTrfReady()) {      // ホストにチE�Eタを送信する準備ができてぁE��かどぁE��をチェチE��する

                  USB_In_Buffer[0] = 'T';
                  USB_In_Buffer[1] = 'E';
                  USB_In_Buffer[2] = 'S';
                  USB_In_Buffer[3] = 'T';
                  USB_In_Buffer[4] = ' ';

                  USB_In_Buffer[5] = tm_disp[0];
                  USB_In_Buffer[6] = tm_disp[1];
                  USB_In_Buffer[7] = ':';
                  USB_In_Buffer[8] = tm_disp[2];
                  USB_In_Buffer[9] = tm_disp[3];
                  USB_In_Buffer[10] = ':';
                  USB_In_Buffer[11] = tm_disp[4];
                  USB_In_Buffer[12] = tm_disp[5];

                  USB_In_Buffer[13] = ' ';

                  USB_In_Buffer[14] = tmp_disp[0];
                  USB_In_Buffer[15] = tmp_disp[1];
                  USB_In_Buffer[16] = '.';
                  USB_In_Buffer[17] = tmp_disp[2];

                  USB_In_Buffer[18] = 0x0A;

          putUSBUSART(USB_In_Buffer,19) ;
     }
    CDCTxService() ;
///////////////////////////////
}

/*******************************************************************************
*                                                                              *
*  �E��E��E� コールバック関数                                                     *
*    USB関連のイベントに応じて、コールバック関数の USBCBxxx(�E�を呼び出します、E*
*                                                                              *
*******************************************************************************/

////////////////////////////////////////////////////////////////////////////////
//  USBCBSuspend() - USBサスペンドが検�Eされたときに呼び出されるコールバック
//    ホスチECがパワーダウンされてぁE��場合、各USBチE��イスにフレームの開姁ESOF)パケチE��
//    送信が停止されます、これに応答してUSB電源を利用してぁE��チE��イスは自刁E�E消費電力を
//    0.5mA/2.5mA以下低減する事と"usb_20.pdf"スペックは公式仕様でぁE��ってぁE��す、E
//
void USBCBSuspend(void)
{


}
////////////////////////////////////////////////////////////////////////////////
//  USBCBWakeFromSuspend() - 
//    USBサスペンドから�EウェイクアチE�Eが検�Eされた場合に呼出されるコールバック
//    USBCBSuspend()関数冁E��行った省電力対策等をここで戻す�E琁E��記述すれば良ぁE��しょぁE��E
//
void USBCBWakeFromSuspend(void)
{


}
////////////////////////////////////////////////////////////////////////////////
//  USBCB_SOF_Handler() - 
//    USBホスト�E、EmsごとにSOFパケチE��を送信します、この時に呼び出されるコールバック
//    尚、ここではUIRbits.SOFIFフラグをクリアする忁E���Eありません、E
//
void USBCB_SOF_Handler(void)
{


}
////////////////////////////////////////////////////////////////////////////////
//  USBCBErrorHandler() - USBエラーが発生した場合に呼び出されるコールバック
//    通常、ユーザーのファームウェアはUSBエラーが発生した場合、特別な何かをする忁E���E有りません、E
//    こ�Eコールバック関数は、デバッグ目皁E�Eためとして、設けられてぁE��、E
//    尚、ここではUEIRレジスタをクリアする忁E���Eありません、E
//
void USBCBErrorHandler(void)
{


}
////////////////////////////////////////////////////////////////////////////////
//  USBCBCheckOtherReq() - SETUPパケチE��が�Eストから到着すると呼び出されるコールバック
//     SETUPパケチE��が要求するCDCクラス固有�E処琁E��ここで行う、E
//
void USBCBCheckOtherReq(void)
{
    // リクエストがCDC特定�E要求であった場合、この関数は、要求を処琁E��、E
    // 適刁E��対応�E世話をします、E
    // こ�E関数はusb_function_cdc.cに有る、E今回こ�E機�Eはコメントにして置ぁE
    // USBCheckCDCRequest() ;
}
////////////////////////////////////////////////////////////////////////////////
//  USBCBStdSetDscHandler() - 
//    SET_DESCRIPTOR(チE��スクリプタを変更)要求が有った時呼び出されるコールバック
//    こ�Eリクエストをサポ�Eトする場合�E、セチE��ョンの所有権を主張する忁E��が有ます、E
//
void USBCBStdSetDscHandler(void)
{


}
////////////////////////////////////////////////////////////////////////////////
//  USBCBInitEP() - 
//    チE��イスが�E期化になった時にこ�E関数が呼び出され、E
//    ホストがSET_CONFIGURATION要求を送信した後に発生ます、E
//    こ�E関数は、現在の構�Eに応じて、デバイスの使用のためにCDCエンド�Eイントを初期化すめE
//    忁E��があります、E
//
void USBCBInitEP(void)
{

    // CDCのファンクションドライバを初期化すめE
    // こ�E関数はusb_function_cdc.cに有る、E
    CDCInitEP();
}
////////////////////////////////////////////////////////////////////////////////
//  USBCBSendResume() - ホスチECがサスペンド状態�E時に目を覚まさせる為のコールバック関数
//    こ�Eコールバックは、E - 15msの周期を持って再開信号を送信する忁E��があります、E
//    最初にホストがリモートウェイクアチE�Eを実行する為にUSBチE��イスが対応してぁE��かを確認します、E
//    それは、リモートウェイクアチE�Eを可能にする為にSET_FEATURE要求を送信する事によって行う、E
//    佁E��、PCがUSBチE��イスからの通知で目を覚ます準備が�E来てぁE��ぁE��にSET_FEATUREは送信されなぁE��E
//    �E�例：Windowsのベ�Eスのホスト上で、USBチE��イス、E��源管琁E��ブ�EチE��イスマネージャの
//      プロパティペ�Eジで、Eこ�EチE��イスで、コンピュータのスタンバイ状態を允E��戻す事が
//      出来るよぁE��する"チェチE��ボックスがチェチE��されるべきである�E�E
//
void USBCBSendResume(void)
{
    static WORD delay_count;

    // リモートウェイクアチE�Eはホストで有効になってぁE��か調べめE
    if(USBGetRemoteWakeupStatus() == TRUE) {
        // ホストがサスペンドモードにあるか調べめE
        if(USBBusIsSuspended == TRUE) {
            // リモートウェイクアチE�Eシグナルを送信する処琁E
            USBMaskInterrupts() ;
            USBCBWakeFromSuspend() ;
            USBSuspendControl = 0 ; 
            USBBusIsSuspended = FALSE ; // ホストがサスペンドモードでは無ぁE��設宁E
            delay_count = 3600U ;
            do {
                delay_count-- ;         // 5ms位征E��なぁE��ダメらしぁE
            } while(delay_count) ;
            USBResumeControl = 1 ;      // シグナルの発衁E
            delay_count = 1800U ;
            do {
                delay_count-- ;         // 1-13 msの間シグナルをキープすめE
            }while(delay_count) ;
            USBResumeControl = 0 ;
            USBUnmaskInterrupts();
        }
    }
}
////////////////////////////////////////////////////////////////////////////////
//  USBCBEP0DataReceived() - EP0チE�EタパケチE��を受信するた�Eに呼び出されるコールバック
//    これは、様、E��クラスの例�E為、コントロールエンド�Eイントを介して受信されたデータめE
//    取得する方法を与えます、E
//    こ�E関数は、USBCBCheckOtherReq() 機�Eと絁E��合わせて使用する忁E��がある、E
//    ENABLE_EP0_DATA_RECEIVED_CALLBACKは"usb_config.h"に記述されてぁE��
//
#if defined(ENABLE_EP0_DATA_RECEIVED_CALLBACK)
void USBCBEP0DataReceived(void)
{
}
#endif
////////////////////////////////////////////////////////////////////////////////
//  USER_USB_CALLBACK_EVENT_HANDLER(event,*pdata,size) - 
//    USBイベントが発生したことをユーザアプリケーションに通知する為にUSBスタチE��から
//    呼び出される、E
//    USB_INTERRUPTオプションを選択した場合、このコールは、割り込みコンチE��スト�Eにある、E
//    event �E�Eイベント�E種顁E
//    *pdata�E�Eイベント�EチE�Eタへの格納�Eアドレス
//    size　�E�Eイベントデータのサイズ
//
BOOL USER_USB_CALLBACK_EVENT_HANDLER(int event, void *pdata, WORD size)
{
    switch( event )
    {
        case EVENT_TRANSFER:
            // 忁E��に応じてここにアプリケーション固有�Eコールバック関数を追加します、E
            break;
        case EVENT_SOF:
            USBCB_SOF_Handler();
            break;
        case EVENT_SUSPEND:
            USBCBSuspend();
            break;
        case EVENT_RESUME:
            USBCBWakeFromSuspend();
            break;
        case EVENT_CONFIGURED: 
            USBCBInitEP();
            break;
        case EVENT_SET_DESCRIPTOR:
            USBCBStdSetDscHandler();
            break;
        case EVENT_EP0_REQUEST:
            USBCBCheckOtherReq();
            break;
        case EVENT_BUS_ERROR:
            USBCBErrorHandler();
            break;
        case EVENT_TRANSFER_TERMINATED:
            // 忁E��に応じてここにアプリケーション固有�Eコールバック関数を追加します、E
            // ホストが以前に実裁E��れたアプリケーションのエンド�Eイント上で
            // CLEAR FEATURE�E�エンド�Eイント�E停止�E�要求を実行する時にこ�Eイベント�E発生します、E
            break;
        default:
            break;
    }
    return TRUE; 
}
