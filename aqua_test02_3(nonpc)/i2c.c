// PIC16F1938 Configuration Bit Settings

    // 'C' source line config statements
/*
    // CONFIG1
    #pragma config FOSC = INTOSC    // Oscillator Selection (INTOSC oscillator: I/O function on CLKIN pin)
    #pragma config WDTE = OFF       // Watchdog Timer Enable (WDT disabled)
    #pragma config PWRTE = OFF      // Power-up Timer Enable (PWRT disabled)
    #pragma config MCLRE = OFF      // MCLR Pin Function Select (MCLR/VPP pin function is digital input)
    #pragma config CP = OFF         // Flash Program Memory Code Protection (Program memory code protection is disabled)
    #pragma config CPD = OFF        // Data Memory Code Protection (Data memory code protection is disabled)
    #pragma config BOREN = OFF      // Brown-out Reset Enable (Brown-out Reset disabled)
    #pragma config CLKOUTEN = OFF   // Clock Out Enable (CLKOUT function is disabled. I/O or oscillator function on the CLKOUT pin)
    #pragma config IESO = OFF       // Internal/External Switchover (Internal/External Switchover mode is disabled)
    #pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable (Fail-Safe Clock Monitor is disabled)

    // CONFIG2
    #pragma config WRT = OFF        // Flash Memory Self-Write Protection (Write protection off)
    #pragma config VCAPEN = OFF     // Voltage Regulator Capacitor Enable (All VCAP pin functionality is disabled)
    #pragma config PLLEN = ON// PLL Enable (4x PLL disabled)
    #pragma config STVREN = ON      // Stack Overflow/Underflow Reset Enable (Stack Overflow or Underflow will cause a Reset)
    #pragma config BORV = LO        // Brown-out Reset Voltage Selection (Brown-out Reset Voltage (Vbor), low trip point selected.)
    #pragma config LVP = ON         // Low-Voltage Programming Enable (Low-voltage programming enabled)
*/
#include <xc.h>                  // PIC のハードウエア定義


//#pragma config FOSC   = IRC, PLLEN  = ON,  FCMEN  = OFF
#pragma config PLLEN  = ON,  FCMEN  = OFF

#pragma config IESO   = OFF, USBDIV = OFF, CPUDIV = NOCLKDIV
#pragma config PWRTEN = OFF, BOREN  = OFF, WDTEN  = OFF
#pragma config HFOFST = OFF, MCLRE  = OFF
#pragma config STVREN = ON,  BBSIZ  = OFF, LVP    = OFF
#pragma config XINST  = OFF
#pragma config CP0    = OFF, CP1    = OFF, CPB    = OFF
#pragma config WRT0   = OFF, WRT1   = OFF, WRTB   = OFF, WRTC   = OFF
#pragma config EBTR0  = OFF, EBTR1  = OFF, EBTRB  = OFF

#pragma config PLLEN = ON// PLL Enable (4x PLL disabled)

//#define T0NUM_SET	0x6D84

    // #pragma config statements should precede project file includes.
    // Use project enums instead of #define for ON and OFF.

    #include <xc.h>
//    #include <pic16f1938.h>
    #define _XTAL_FREQ 16000000
    #define LCD_ADD 0x7C

    char moji[] = "Hello, PIC World!";
    char moji11[] = "Hello1, PIC World!";
    char moji12[] = "Hello2, PIC World!";
    char moji2[] = "Wak-tech";
    void I2C_Master_Init(const unsigned long c)
    {
      SSPCON1 = 0b00101000;
      SSPCON2 = 0;
      SSPADD =(_XTAL_FREQ/(4*c))-1;
      SSPSTAT = 0b00000000 ;    // 標準速度モードに設定する(100kHz)
    }

    void I2C_Master_Wait()
    {
      while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
    }

    void I2C_Master_Start()
    {
      I2C_Master_Wait();
      SEN = 1;
    }

    void I2C_Master_RepeatedStart()
    {
      I2C_Master_Wait();
      RSEN = 1;
    }

    void I2C_Master_Stop()
    {
      I2C_Master_Wait();
      PEN = 1;
    }

    void I2C_Master_Write(unsigned d)
    {
      I2C_Master_Wait();
      SSPBUF = d;
    }
    void writeData(char t_data){
        I2C_Master_Start();
        I2C_Master_Write(LCD_ADD);
        I2C_Master_Write(0x40);
        I2C_Master_Write(t_data);
        I2C_Master_Stop();
        __delay_ms(1);//(10);
    }
    void writeCommand(char t_command){
        I2C_Master_Start();
        I2C_Master_Write(LCD_ADD);
        I2C_Master_Write(0x00);
        I2C_Master_Write(t_command);
        I2C_Master_Stop();
        __delay_ms(1);//(10);
    }
    void PICinit(){
      OSCCON = 0b01110000;
      ANSEL = 0b00000000;
//      TRISA  = 0b00000000;
      TRISB  = 0b01010000;
//      TRISC  = 0b00011000;
//      PORTA  = 0b00000000;    //2進数で書いた場合
//      PORTB  = 0x00;          //16進数で書いた場合
    }
    void LCD_Init(){            //LCDの初期化
      I2C_Master_Init(100000);
      __delay_ms(400);
      writeCommand(0x38);
      __delay_ms(20);
      writeCommand(0x39);
      __delay_ms(20);
      writeCommand(0x14);
      __delay_ms(20);
      writeCommand(0x73);
      __delay_ms(20);
      writeCommand(0x52);
      __delay_ms(20);
      writeCommand(0x6C);
      __delay_ms(250);
      writeCommand(0x38);
      __delay_ms(20);
      writeCommand(0x01);
      __delay_ms(20);
      writeCommand(0x0C);
      __delay_ms(20);
    }

    void LCD_str(char *c) {     //LCDに配列の文字を表示
      unsigned char i,wk;
      for (i=0 ; ; i++) {
        wk = c[i];
        if  (wk == 0x00) {break;}
        writeData(wk);
      }
    }

    int main(void){
      PICinit();      //PICを初期化
      LCD_Init();
      writeCommand(0x01); //画面をクリア
      __delay_ms(20);
      writeCommand(0x02); //ホームへカーソル移動
      __delay_ms(2); // LCD側の処理待ち

      while(1){
          writeCommand(0x02);   //ホームへカーソル移動
          LCD_str(moji11);
          writeCommand(0x40+0x80); //2列目へ移動
          __delay_ms(1);//(200);
          LCD_str(moji2);
          __delay_ms(500);//(500);
  //        writeCommand(0x01); //画面をクリア
  //        __delay_ms(1);//(100);


          writeCommand(0x02);   //ホームへカーソル移動
          LCD_str(moji12);
          writeCommand(0x40+0x80); //2列目へ移動
          __delay_ms(1);//(200);
          LCD_str(moji2);
          __delay_ms(500);//(500);
  //        writeCommand(0x01); //画面をクリア
  //        __delay_ms(1);//(100);



      }
      return 0;
    }
  