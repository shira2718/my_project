/********************************************************************
 FileName:     	usb_descriptors.c
 Dependencies:	See INCLUDES section
 Processor:		PIC18 or PIC24 USB Microcontrollers
 Hardware:		The code is natively intended to be used on the following
 				hardware platforms: PICDEM・FS USB Demo Board, 
 				PIC18F87J50 FS USB Plug-In Module, or
 				Explorer 16 + PIC24 USB PIM.  The firmware may be
 				modified for use on other USB platforms by editing the
 				HardwareProfile.h file.
 Complier:  	Microchip C18 (for PIC18) or C30 (for PIC24)
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

********************************************************************************
*  MPLAB(R) XC8 C Compiler Version 1.00                                        *
*  XC8 Compiler用に変更                             BY きむ茶工房(2013-09-07)  *
*******************************************************************************/

#ifndef __USB_DESCRIPTORS_C
#define __USB_DESCRIPTORS_C

#include "./USB/usb.h"
#include "./USB/usb_function_cdc.h"

/**************************/
/* デバイスディスクリプタ */
/**************************/
ROM USB_DEVICE_DESCRIPTOR device_dsc=
{
    0x12,                   // このデバイスディスクリプタのサイズ(18byte)
    USB_DESCRIPTOR_DEVICE,  // ディスクリプタ種類は？(0x01="デバイスディスクリプタ")
    0x0200,                 // ＵＳＢのバージョン(BCD表記：USB2.0)
    CDC_DEVICE,             // クラスコード(0x02:Communications Device Class = CDCクラス)
    0x00,                   // サブクラスコード(無し)
    0x00,                   // プロトコールコード(無し)
    USB_EP0_BUFF_SIZE,      // エンドポイント０の最大パケットサイズ(8byte)
    0x0777,//4D8,                 // ベンダ ＩＤ(USB IF から割当てて貰う登録された番号)
    0x000A,                 // プロダクトＩＤ : CDC RS-232 Emulation Demo
    0x0100,                 // デバイスのバージョン(BCD表記：Ver1.00)
    0x01,                   // 製造者のストリングへのインデックス番号
    0x02,                   // 製品のストリングへのインデックス番号
    0x00,                   // 製造番号のストリングへのインデックス番号(無し)
    0x01                    // コンフィギュレーションディスクリプの構成数
};

/****************************************/
/* コンフィギュレーションディスクリプタ */
/****************************************/
ROM BYTE configDescriptor1[]={
    /* コンフィギュレーションディスクリプタ */
    0x09,                          // このコンフィギュレーションディスクリプタのサイズ(9byte)
    USB_DESCRIPTOR_CONFIGURATION,  // ディスクリプタ種類は？(0x02="コンフィギュレーションディスクリプタ")
    67,0,                          // Configuration,Interface,Endpoint Descriptor を含む全体長(67byte)
    2,                             // この構成が持つインターフェースディスクリプの数
    1,                             // このコンフィギュレーションディスクリプタのインデックス番号
    0,                             // この構成の、ストリングへのインデックス番号(無し)
    _DEFAULT | _SELF,              // 電源の構成(USBバスから供給 OR セルフ電源)
//    _DEFAULT | _SELF | _RWU,       // リモートウエイクアップ機能を有効にする場合の記述
    50,                            // USBバスから供給する場合の最大消費電流 (2x mA：50x2=100mA)
							
    /* インターフェースディスクリプタ */
    0x09,                          // このインターフェースディスクリプタのサイズ(9byte)
    USB_DESCRIPTOR_INTERFACE,      // ディスクリプタ種類は？(0x04="インターフェースディスクリプタ")
    0,                             // インターフェースディスクリプタの識別番号
    0,                             // このインターフェースで複数の設定を持つ場合に識別する為の番号(無し)
    1,                             // このインターフェースが持つエンドポイントの個数
    COMM_INTF,                     // クラスコード(0x02:CDCクラス)
    ABSTRACT_CONTROL_MODEL,        // サブクラスコード(0x02:Abstract Control Model)
    V25TER,                        // プロトコールコード(0x01:ITU-T V.250 ATコマンド: V.250等)
    0,                             // この構成の、ストリングへのインデックス番号(無し)

    /* CDCクラス固有の機能ディスクリプタ */
    // ヘッダー機能の記述
    sizeof(USB_CDC_HEADER_FN_DSC), // この構成のサイズ(5byte)
    CS_INTERFACE,                  // この構成の種類は？(0x24="インターフェース")
    DSC_FN_HEADER,                 // 機能は?(0x00="ヘッダー機能")
    0x10,0x01,                     // CDCのバージョン

    // 制御管理機能の概念を記述
    sizeof(USB_CDC_ACM_FN_DSC),    // この構成のサイズ(4byte)
    CS_INTERFACE,                  // この構成の種類は？(0x24="インターフェース")
    DSC_FN_ACM,                    // 機能は?(0x02="制御管理機能の概念")
    USB_CDC_ACM_FN_DSC_VAL,        // 通信ラインの制御オプションだと思う？

    // 共有機能の記述
    sizeof(USB_CDC_UNION_FN_DSC),  // この構成のサイズ(5byte)
    CS_INTERFACE,                  // この構成の種類は？(0x24="インターフェース")
    DSC_FN_UNION,                  // 機能は?(0x06="共有機能")
    CDC_COMM_INTF_ID,              // "Communications Class interface"のインターフェース番号(0x00)
    CDC_DATA_INTF_ID,              // "Data Class interface"のインターフェース番号(0x01)

    // 管理機能の記述を呼び出す
    sizeof(USB_CDC_CALL_MGT_FN_DSC),    // この構成のサイズ(5byte)
    CS_INTERFACE,                       // この構成の種類は？(0x24="インターフェース")
    DSC_FN_CALL_MGT,                    // 機能は?(0x01="管理機能の記述を呼び出す")
    0x00,                               // 
    CDC_DATA_INTF_ID,                   // "Data Class interface"のインターフェース番号(0x01)

    /* エンドポイントディスクリプタ */
    0x07,                          // このエンドポイントディスクリプタのサイズ(7byte)
    USB_DESCRIPTOR_ENDPOINT,       // ディスクリプタ種類は？(0x05="エンドポイントディスクリプタ")
    _EP01_IN,                      // エンドポイントは入力でエンドポイント識別番号は１
    _INTERRUPT,                    // 転送モードは、インタラプト転送
    0x08,0x00,                     // このエンドポイントの最大パケットサイズ(8byte)
    0x02,                          // ホストがポーリングを行う周期(2 msec)

    /* インターフェースディスクリプタ */
    0x09,                          // このインターフェースディスクリプタのサイズ(9byte)
    USB_DESCRIPTOR_INTERFACE,      // ディスクリプタ種類は？(0x04="インターフェースディスクリプタ")
    1,                             // インターフェースディスクリプタの識別番号
    0,                             // 複数の設定を持つ場合に識別する為の番号(無し)
    2,                             // このインターフェースが持つエンドポイントの個数
    DATA_INTF,                     // クラスコード(0x0a:データインターフェイス)
    0,                             // サブクラスコード(無し)
    NO_PROTOCOL,                   // プロトコールコード(0x00:プロトコールは無し)
    0,                             // この構成の、ストリングへのインデックス番号(無し)
    
    /* エンドポイントディスクリプタ */
    0x07,                          // このエンドポイントディスクリプタのサイズ(7byte)
    USB_DESCRIPTOR_ENDPOINT,       // ディスクリプタ種類は？(0x05="エンドポイントディスクリプタ")
    _EP02_OUT,                     // エンドポイントは出力でエンドポイント識別番号は２
    _BULK,                         // 転送モードは、バルク転送
    0x40,0x00,                     // このエンドポイントの最大パケットサイズ(64byte)
    0x00,                          // ホストがポーリングを行う周期は無し

    /* エンドポイントディスクリプタ */
    0x07,                          // このエンドポイントディスクリプタのサイズ(7byte)
    USB_DESCRIPTOR_ENDPOINT,       // ディスクリプタ種類は？(0x05="エンドポイントディスクリプタ")
    _EP02_IN,                      // エンドポイントは入力でエンドポイント識別番号は２
    _BULK,                         // 転送モードは、バルク転送
    0x40,0x00,                     // このエンドポイントの最大パケットサイズ(64byte)
    0x00,                          // ホストがポーリングを行う周期は無し
};

/****************************/
/* ストリングディスクリプタ */
/****************************/

// 言語コードの文字列ディスクリプタ(#00)
ROM struct{
         BYTE bLength;
         BYTE bDscType;
         WORD string[1];
    } sd000 = {
         sizeof(sd000),            // このディスクリプタのサイズ
         USB_DESCRIPTOR_STRING,    // ディスクリプタ種類は？(0x03)
         {0x0409}                  // ストリングの記述言語は、アメリカ英語を表す
    };
// 製造者のストリング(#01)
ROM struct{
         BYTE bLength;
         BYTE bDscType;
         WORD string[25];
    } sd001 = { 
         sizeof(sd001),            // このディスクリプタのサイズ
         USB_DESCRIPTOR_STRING,    // ディスクリプタ種類は？(0x03)
         {'M','i','c','r','o','c','h','i','p',' ','T','e','c','h','n','o','l','o','g','y',' ','I','n','c','.'}
    };
// 製品のストリング(#02)
ROM struct{
         BYTE bLength;
         BYTE bDscType;
         WORD string[25];
    } sd002 = {
         sizeof(sd002),            // このディスクリプタのサイズ
         USB_DESCRIPTOR_STRING,    // ディスクリプタ種類は？(0x03)
         {'C','D','C',' ','R','S','-','2','3','2',' ','E','m','u','l','a','t','i','o','n',' ','D','e','m','o'}
    };

//Array of configuration descriptors
ROM BYTE *ROM USB_CD_Ptr[]=
{
    (ROM BYTE *ROM)&configDescriptor1
};
//Array of string descriptors
ROM BYTE *ROM USB_SD_Ptr[USB_NUM_STRING_DESCRIPTORS]=
{
    (ROM BYTE *ROM)&sd000,
    (ROM BYTE *ROM)&sd001,
    (ROM BYTE *ROM)&sd002
};

#endif
