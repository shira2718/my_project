#include <xc.h>
#include "./USB/usb.h"
#include "./USB/usb_function_cdc.h"
#include "HardwareProfile - PIC18F14K50.h"
#include "GenericTypeDefs.h"
#include "Compiler.h"
#include "usb_config.h"
#include "USB/usb_device.h"


// コンフィギュレーションの設定
// ここで記述がない設定はデフォルト値で動作します。
#pragma config CPUDIV = NOCLKDIV// システムクロックの分周はしない
#pragma config USBDIV = OFF		// 分周なしでUSBクロックを直接供給(ロースピード時)
#pragma config FOSC   = HS		// システムクロックは外部で高い振動子を使用する
#pragma config PLLEN  = ON		// 動作クロックを４倍で動作させる
#pragma config PCLKEN = ON		// プライマリシステムクロックを有効にする
#pragma config FCMEN  = OFF		// 外部オシレータに障害が発生した場合に内部オシレータに切替えない
#pragma config IESO   = OFF		// 外部・内部ｸﾛｯｸの切替えでの起動はしない
#pragma config PWRTEN = OFF		// 電源ONから後65.6msにﾌﾟﾛｸﾞﾗﾑを開始させない
#pragma config BOREN  = OFF		// 電源電圧降下常時監視機能はＯＦＦ
#pragma config BORV   = 30		// 監視電圧は(3.0V)に設定
#pragma config WDTEN  = OFF		// ウォッチドッグタイマは使用しない
#pragma config WDTPS  = 32768	// ウォッチドッグタイマ有効時のタイマ値の設定
#pragma config MCLRE  = OFF		// MCLRピンは無効に設定(RA3入力ピンを有効にする)
#pragma config HFOFST = OFF		// オシレータが安定してからシステムクロックを供給する
#pragma config STVREN = ON		// スタックのアンダー・フルのオーバが発生した時にリセットを行う
#pragma config LVP    = OFF		// 低電圧ICSPプログラミングを使用しない(RC3のピンが利用可能になる)
#pragma config XINST  = OFF		// 拡張命令は使用しない

////
unsigned char tm_disp[6];
#include <./i2c.h> 
////
#include "usb_set.h"
////
#define T0NUM_SET	0x6D84

void code(unsigned char);
void RGBdata(unsigned char,unsigned char,unsigned char);
void GRB_tblRD(unsigned char *, int);
void RGBdata_send();

///////////
void wait(int );
unsigned char g_TimeCnt=0;
unsigned int  cnt100ms=0, cnt1s=0, cnt1min=0, cnt1hr=0;
unsigned int  cnt6s=0;
///////////
int ct_bit;
unsigned char bitdata[90];//[120];//[240];

enum status{
	busy,
	active,
	initial
	};
enum LED_status{
	still,
	already
	};

unsigned char GRB_tbl0[30]={

	0x00,0x10,0x00,
	0x00,0x00,0x10,
	0x00,0x00,0x10,
	0x00,0x00,0x10,
			
	0x00,0x10,0x10,
	0x00,0x10,0x10,
	0x00,0x10,0x10,
	0x00,0x10,0x10,
	0x00,0x10,0x10,

	0x10,0x00,0x10
	};

unsigned char GRB_tbl1[30]={
	0x00,0x10,0x00,
	0x00,0x10,0x00,
	0x00,0x10,0x00,

	0x00,0x10,0x00,
	0x10,0x00,0x00,
	0x10,0x00,0x00,
	0x10,0x00,0x00,
	0x10,0x00,0x00,

//	0x20,0x00,0x00,
	0x00,0x20,0x20,
	0x00,0x10,0x00
	};

unsigned char GRB_tbl2[30]={
	0x00,0x20,0x00,
	0x00,0x20,0x00,
	0x00,0x20,0x00,
	0x00,0x20,0x00,

	0x20,0x00,0x00,
	0x20,0x00,0x00,
	0x20,0x00,0x00,
	0x20,0x00,0x00,
	0x20,0x00,0x00,

	0x00,0x20,0x00
	};

enum status stat	=	initial;
enum LED_status LED_stat	=	still;


/*******************************************************************************
*  メインの処理                                                                *
*******************************************************************************/
void main(void)
{
     OSCCON = 0b00000000 ;     // 外部クロックとする(12MHz x 4倍 = 48MHz)
     ANSEL  = 0b00000000 ;     // ANS3-7 アナログは使用しない、デジタルI/Oに割当
     ANSELH = 0b00000000 ;     // ANS8-11アナログは使用しない、デジタルI/Oに割当
     TRISA  = 0b00000000 ;     // 1で入力 0で出力 RA4-RA5全て出力に設定(RA3は入力専用)
     TRISB  = 0b00000000 ;     // RB4-RB7全て出力に設定 
 //    TRISC  = 0b00000011 ;     // RC0-RC7全て出力に設定 
     PORTA  = 0b00000000 ;     // 出力ピンの初期化(全てLOWにする)
     PORTB  = 0b00000000 ;     // 出力ピンの初期化(全てLOWにする)
     PORTC  = 0b00000000 ;     // 出力ピンの初期化(全てLOWにする)

     USBDeviceInit() ;         // ＵＳＢの初期化を行う(フルスピードで内部プルアップ有り)


 int i,rotate=0;
int LED_num=0;
unsigned short tmp_stat,tmp_stat_cnt;



//    OSCCON = 0b01110010;         // 内部クロック16Mhz
    OSCCON = 0b01110000;         // 内部クロック16Mhz

    LATC = 0;                    // PortCのすべてのビットを「０」
    TRISC = 0b00100000;          // ポートを出力に設定


////////////
//    T0CON  = 0b10000111;
//      T0CON  = 0b10100111;	//256 prescale: 
      T0CON  = 0b10100100;	//32 prescale: 12MHz/32=375kHz,T0CS=1
//    T0CON  = 0b10000010;	//8 prescale: 4MHz/8=500kHz
//    T0CON  = 0b10000000;	//2 prescale: 4MHz/2=2000kHz

    INTCON2bits.TMR0IP = 1;                // Timer 0 からの割込みを高優先に設定
    INTCONbits.TMR0IF = 0;                // Timer 0 からの割込みフラッグをクリア
	INTCONbits.TMR0IE = 1;                // Timer 0 からの割込みを許可
  
////////////
    T1CON  = 0b10110001;                // Timer 1 設定(1:8 prescle)
    IPR1bits.TMR1IP = 0;//1;                // Timer 1 からの割込みを高優先に設定
    PIR1bits.TMR1IF = 0;                // Timer 1 からの割込みフラッグをクリア
    
    //割り込み　全体許可
    RCONbits.IPEN = 1;          /*多重割り込み許可*/
    INTCONbits.GIEH=1;      // 高優先割込みを許可
    INTCONbits.GIEL=1;      // 低優先割込みを許可
////////////
///////////
      PICinit();      //PICを初期化
      LCD_Init();
      writeCommand(0x01); //画面をクリア
      __delay_ms(20);
      writeCommand(0x02); //ホームへカーソル移動
      __delay_ms(2); // LCD側の処理待ち
///////////

 	stat	=	active;
    while(1){                    // 繰り返しループ
		
		if(cnt100ms >= 10){
			cnt100ms=0;
			cnt1s++;
//				LED_stat	=	still;
//////////////USB/////////////
/*
          // 割込みで処理する場合
          #if defined(USB_INTERRUPT)
               // USBバス(D+/D-)の端子を監視する処理
               if(USB_BUS_SENSE && (USBGetDeviceState() == DETACHED_STATE)) {
                    USBDeviceAttach() ;
               }
          #endif
          // USBホストからSETUPパケットを受けてポーリングで処理する場合
          #if defined(USB_POLLING)
               USBDeviceTasks() ;
          #endif
          // ＵＳＢのメイン処理
          ProcessUSB() ;
*/
///////////////////////////
			cnt6s++;
			if(cnt6s == 6){
				cnt6s = 0;
//				LED_stat	=	still;
			LED_stat	=	already;//non led
			}



			if(cnt1s == 60){
				cnt1s = 0;
				cnt1min++;
			}


			if(cnt1min == 60){
				cnt1min = 0;
				cnt1hr++;
			}
	
	          writeCommand(0x02);   //ホームへカーソル移動
	          LCD_str(moji11);
	          writeCommand(0x40+0x80); //2列目へ移動
	          LCD_time(cnt1hr, cnt1min, cnt1s);

		}


		if(stat	== active  &&  LED_stat	==	still){
		 	stat	=	busy;
			ct_bit=0;	//	RGBdata_start();
		
//				GRB_tblRD(GRB_tbl0,rotate);

		switch(LED_num){
			case 0:
//				GRB_tblRD(GRB_tbl0,rotate);
				GRB_tblRD(GRB_tbl1,rotate);
			break;
			case 1:
				GRB_tblRD(GRB_tbl1,rotate);
			break;
			default:;
		}
////
//	tmp_stat = T0CON;
//	tmp_stat_cnt 		=	*(unsigned short *)(& TMR0L);
//	tmp_stat_cnt 		=	*(unsigned short *)(& TMR0L);
//	T0CONbits.TMR0ON = 0;
////  
//		LC4 = 0b1;

			while(tmp_stat_cnt  >= T0NUM_SET+ 37500/10*2){ 
				tmp_stat_cnt 		=	*(unsigned short *)(& TMR0L);
				tmp_stat_cnt 		=	*(unsigned short *)(& TMR0L);
			 }


//     	 LC4 = 0b0; 
//			RGBdata_send();
////
//	T0CON = tmp_stat;
//	TMR0H = (tmp_stat_cnt>>8)	 &	0xFF;
//	TMR0L = tmp_stat_cnt		 & 	0xFF;
////
		/*
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
		
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
		
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
					code(0);
					code(1);
		*/
		
			wait(1);//	RGBdata_end();

//		for(i=0;i<5;i++){wait(100);}


/*
			wait(200);	//wait(100);
			wait(200);	//wait(100);
			wait(200);	//wait(100);
			wait(200);	//wait(100);
			wait(200);	//wait(100);
*/
/*
			wait(500);	//wait(100);
			wait(500);	//wait(100);
*/


//			LED_stat	=	still;


////////////
//	      LC4 = 0b1 & ~LC4;
////////////


//			if(rotate>=30){
			if(rotate>=30-3){
				rotate=0;
				LED_num = 0b1 & ~LED_num;
			}else{
				rotate+=3;
			}

			LED_stat	=	already;
		 	stat	=	active;
		    } 

		wait(1);
////////////
	} //while
    
    
    
}

void code(unsigned char x){
	if(x & 0b1){

            LC0 = 0b00000001;   
            LC0 = 0b00000001;   
            LC0 = 0b00000001;   

            LC0 = 0b00000001;   
            LC0 = 0b00000001;   
            LC0 = 0b00000001;   


            LC0 = 0b00000000;    
            LC0 = 0b00000000; 

            LC0 = 0b00000000;    
            LC0 = 0b00000000; 

	}else{
            LC0 = 0b00000001;   
            LC0 = 0b00000001;   

            LC0 = 0b00000001;   
            LC0 = 0b00000001;   


            LC0 = 0b00000000;   
            LC0 = 0b00000000;   
            LC0 = 0b00000000; 

            LC0 = 0b00000000;   
            LC0 = 0b00000000;   
            LC0 = 0b00000000; 
	}
}
void GRB_tblRD(unsigned char *X,int rotate){
	int i,j;
	for(j=0;j<30;j++){
		for(i=0;i<8;i++){
			if( ((*(X+(j+rotate)%30) >>(7-i)) & 0b1) == 1  ){
//		            bitdata[ct_bit]=1;
				code(1);

			}else{
//		            bitdata[ct_bit]=0;
				code(0);
			}
			ct_bit++;
		}
	}
}


void RGBdata_send(){
	int i;


	for(i=0;i<240;i++){
		if(bitdata[i] ){
	            code(1);
		}else{
	            code(0);
		}
	}
}

void interrupt high_priority YourHighPriorityISRCode(void){	//100msカウント

     #if defined(USB_INTERRUPT)
          USBDeviceTasks();
     #endif

//////////////
	int i;
//////////////
//	GIE=0;
    if(INTCONbits.TMR0IF){            //Timer0からの割込みを確認
//		TMR0H = 0x3C;
//		TMR0L = 0xB0;

		TMR0H = T0NUM_SET>>8;
		TMR0L = 0xFF & T0NUM_SET;

        	INTCONbits.TMR0IF = 0;        // 割込みフラッグをクリア
		cnt100ms++;
        LC4 = 0b1 & ~LC4;   
//////////////USB/////////////
/*
          // 割込みで処理する場合
          #if defined(USB_INTERRUPT)
               // USBバス(D+/D-)の端子を監視する処理
               if(USB_BUS_SENSE && (USBGetDeviceState() == DETACHED_STATE)) {
                    USBDeviceAttach() ;
               }
          #endif
          // USBホストからSETUPパケットを受けてポーリングで処理する場合
          #if defined(USB_POLLING)
               USBDeviceTasks() ;
          #endif
          // ＵＳＢのメイン処理
          ProcessUSB() ;
*/
///////////////////////////
//////////////
//	for(i=0;i<1000;i++){}
//////////////
//	GIE=1;

    }
/*
///////////
    if(PIR1bits.TMR1IF){            //Timer1からの割込みを確認
//////////////
	for(i=0;i<100000;i++){}
//////////////
		TMR1H = 0xFE;
		TMR1L = 0x0C;

        PIR1bits.TMR1IF = 0;        // 割込みフラッグをクリア

        g_TimeCnt++;//functionの時間計測で使用
    }
///////////
*/

}


void interrupt low_priority YourLowPriorityISRCode(void){
//////////////
	int i;
//////////////
//	GIE=0;
    if(PIR1bits.TMR1IF){            //Timer1からの割込みを確認

////////
				//500-10times
		TMR1H = 0xFE;
		TMR1L = 0x18;

		TMR1H = 0xFE;
		TMR1L = 0x18;

		TMR1H = 0xFE;
		TMR1L = 0x18;

		TMR1H = 0xFE;
		TMR1L = 0x18;


//		TMR1H = 0xFE;
//		TMR1L = 0x0C;
//////////
        PIR1bits.TMR1IF = 0;        // 割込みフラッグをクリア

        g_TimeCnt++;//functionの時間計測で使用
//////////////
//	for(i=0;i<100;i++){}
//////////////
//	GIE=1;
    }
}


//時間を待たせるだけのプログラム
void wait(int time){
	int g_TimeCnt_tmp=0;

	    g_TimeCnt=0;
////////
				//500-6times
		TMR1H = 0xFE;
		TMR1L = 0x12;

		TMR1H = 0xFE;
		TMR1L = 0x12;

		TMR1H = 0xFE;
		TMR1L = 0x12;

		TMR1H = 0xFE;
		TMR1L = 0x12;

//		TMR1H = 0xFE;
//		TMR1L = 0x0C;
//////////
	    PIR1bits.TMR1IF = 0;        // 割込みフラッグをクリア
	    PIE1bits.TMR1IE = 1;                // Timer 1 からの割込みを許可
  

	    while( g_TimeCnt_tmp+g_TimeCnt < time  ){
		    if(g_TimeCnt == 200 ){
				g_TimeCnt_tmp +=200;
				g_TimeCnt=0;
	 		}
 		}

/*
	    while( (g_TimeCnt_tmp+g_TimeCnt <= time) || (g_TimeCnt_tmp+g_TimeCnt >= time+2) ){
		    if(g_TimeCnt == 200 ){
				g_TimeCnt_tmp +=200;
				g_TimeCnt=0;
	 		}
 		}
*/
//	    while(g_TimeCnt_tmp > time+23){ }
//		while(g_TimeCnt < time ){}

//	    while(g_TimeCnt<time || g_TimeCnt&0xFF == 0xFF){
//		}

//	    while( g_TimeCnt != time ){

//			if(g_TimeCnt&0xFF == 0xFF){ 
//				while(1){}
//			}
//		 }


	    PIE1bits.TMR1IE = 0;                // Timer 1 からの割込みを禁止
}

