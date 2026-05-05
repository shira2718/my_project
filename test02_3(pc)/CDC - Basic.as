opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (Free mode) build 201711160504"

opt pagewidth 120

	opt lm

	processor	18F14K50
opt include "C:\Program Files (x86)\Microchip\xc8\v1.45\include\18f14k50.cgen.inc"
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 52 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP0 equ 0F53h ;# 
# 160 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP1 equ 0F54h ;# 
# 268 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP2 equ 0F55h ;# 
# 376 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP3 equ 0F56h ;# 
# 484 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP4 equ 0F57h ;# 
# 592 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP5 equ 0F58h ;# 
# 700 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP6 equ 0F59h ;# 
# 808 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP7 equ 0F5Ah ;# 
# 916 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEIE equ 0F5Bh ;# 
# 967 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UADDR equ 0F5Ch ;# 
# 1031 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UFRML equ 0F5Dh ;# 
# 1101 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UFRMH equ 0F5Eh ;# 
# 1141 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEIR equ 0F5Fh ;# 
# 1192 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UIE equ 0F60h ;# 
# 1248 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UCFG equ 0F61h ;# 
# 1308 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UIR equ 0F62h ;# 
# 1364 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
USTAT equ 0F63h ;# 
# 1415 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UCON equ 0F64h ;# 
# 1466 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SRCON0 equ 0F68h ;# 
# 1537 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SRCON1 equ 0F69h ;# 
# 1599 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM2CON0 equ 0F6Bh ;# 
# 1669 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM2CON1 equ 0F6Ch ;# 
# 1731 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM1CON0 equ 0F6Dh ;# 
# 1801 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPMSK equ 0F6Fh ;# 
# 1806 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPMASK equ 0F6Fh ;# 
# 1939 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SLRCON equ 0F76h ;# 
# 1971 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WPUA equ 0F77h ;# 
# 2004 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WPUB equ 0F78h ;# 
# 2043 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IOCA equ 0F79h ;# 
# 2088 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IOCB equ 0F7Ah ;# 
# 2127 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ANSEL equ 0F7Eh ;# 
# 2172 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ANSELH equ 0F7Fh ;# 
# 2210 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTA equ 0F80h ;# 
# 2309 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTB equ 0F81h ;# 
# 2417 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTC equ 0F82h ;# 
# 2711 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATA equ 0F89h ;# 
# 2753 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATB equ 0F8Ah ;# 
# 2819 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATC equ 0F8Bh ;# 
# 2931 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISA equ 0F92h ;# 
# 2936 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRA equ 0F92h ;# 
# 3013 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISB equ 0F93h ;# 
# 3018 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRB equ 0F93h ;# 
# 3143 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISC equ 0F94h ;# 
# 3148 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRC equ 0F94h ;# 
# 3365 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCTUNE equ 0F9Bh ;# 
# 3435 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIE1 equ 0F9Dh ;# 
# 3506 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIR1 equ 0F9Eh ;# 
# 3577 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IPR1 equ 0F9Fh ;# 
# 3648 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIE2 equ 0FA0h ;# 
# 3714 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIR2 equ 0FA1h ;# 
# 3780 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IPR2 equ 0FA2h ;# 
# 3846 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EECON1 equ 0FA6h ;# 
# 3912 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EECON2 equ 0FA7h ;# 
# 3919 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EEDATA equ 0FA8h ;# 
# 3926 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EEADR equ 0FA9h ;# 
# 3988 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCSTA equ 0FABh ;# 
# 3993 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCSTA1 equ 0FABh ;# 
# 4198 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXSTA equ 0FACh ;# 
# 4203 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXSTA1 equ 0FACh ;# 
# 4454 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXREG equ 0FADh ;# 
# 4459 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXREG1 equ 0FADh ;# 
# 4466 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCREG equ 0FAEh ;# 
# 4471 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCREG1 equ 0FAEh ;# 
# 4478 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRG equ 0FAFh ;# 
# 4483 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRG1 equ 0FAFh ;# 
# 4490 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRGH equ 0FB0h ;# 
# 4497 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T3CON equ 0FB1h ;# 
# 4604 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3 equ 0FB2h ;# 
# 4611 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3L equ 0FB2h ;# 
# 4618 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3H equ 0FB3h ;# 
# 4625 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ECCP1AS equ 0FB6h ;# 
# 4707 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PWM1CON equ 0FB7h ;# 
# 4777 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BAUDCON equ 0FB8h ;# 
# 4782 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BAUDCTL equ 0FB8h ;# 
# 4943 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PSTRCON equ 0FB9h ;# 
# 4987 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON0 equ 0FBAh ;# 
# 4992 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON0 equ 0FBAh ;# 
# 5065 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON1 equ 0FBBh ;# 
# 5070 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON1 equ 0FBBh ;# 
# 5201 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON2 equ 0FBCh ;# 
# 5206 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON2 equ 0FBCh ;# 
# 5287 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCP1CON equ 0FBDh ;# 
# 5369 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1 equ 0FBEh ;# 
# 5376 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1L equ 0FBEh ;# 
# 5383 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1H equ 0FBFh ;# 
# 5390 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON2 equ 0FC0h ;# 
# 5461 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON1 equ 0FC1h ;# 
# 5508 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON0 equ 0FC2h ;# 
# 5627 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRES equ 0FC3h ;# 
# 5634 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRESL equ 0FC3h ;# 
# 5641 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRESH equ 0FC4h ;# 
# 5648 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPCON2 equ 0FC5h ;# 
# 5710 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPCON1 equ 0FC6h ;# 
# 5780 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPSTAT equ 0FC7h ;# 
# 6001 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPADD equ 0FC8h ;# 
# 6008 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPBUF equ 0FC9h ;# 
# 6015 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T2CON equ 0FCAh ;# 
# 6086 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PR2 equ 0FCBh ;# 
# 6091 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
MEMCON equ 0FCBh ;# 
# 6196 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR2 equ 0FCCh ;# 
# 6203 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T1CON equ 0FCDh ;# 
# 6306 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1 equ 0FCEh ;# 
# 6313 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1L equ 0FCEh ;# 
# 6320 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1H equ 0FCFh ;# 
# 6327 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCON equ 0FD0h ;# 
# 6460 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WDTCON equ 0FD1h ;# 
# 6488 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCCON2 equ 0FD2h ;# 
# 6520 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCCON equ 0FD3h ;# 
# 6599 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T0CON equ 0FD5h ;# 
# 6669 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0 equ 0FD6h ;# 
# 6676 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0L equ 0FD6h ;# 
# 6683 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0H equ 0FD7h ;# 
# 6690 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
STATUS equ 0FD8h ;# 
# 6761 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2 equ 0FD9h ;# 
# 6768 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2L equ 0FD9h ;# 
# 6775 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2H equ 0FDAh ;# 
# 6782 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW2 equ 0FDBh ;# 
# 6789 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC2 equ 0FDCh ;# 
# 6796 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC2 equ 0FDDh ;# 
# 6803 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC2 equ 0FDEh ;# 
# 6810 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF2 equ 0FDFh ;# 
# 6817 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BSR equ 0FE0h ;# 
# 6824 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1 equ 0FE1h ;# 
# 6831 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1L equ 0FE1h ;# 
# 6838 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1H equ 0FE2h ;# 
# 6845 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW1 equ 0FE3h ;# 
# 6852 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC1 equ 0FE4h ;# 
# 6859 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC1 equ 0FE5h ;# 
# 6866 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC1 equ 0FE6h ;# 
# 6873 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF1 equ 0FE7h ;# 
# 6880 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WREG equ 0FE8h ;# 
# 6892 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0 equ 0FE9h ;# 
# 6899 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0L equ 0FE9h ;# 
# 6906 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0H equ 0FEAh ;# 
# 6913 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW0 equ 0FEBh ;# 
# 6920 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC0 equ 0FECh ;# 
# 6927 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC0 equ 0FEDh ;# 
# 6934 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC0 equ 0FEEh ;# 
# 6941 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF0 equ 0FEFh ;# 
# 6948 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON3 equ 0FF0h ;# 
# 7040 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON2 equ 0FF1h ;# 
# 7110 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON equ 0FF2h ;# 
# 7227 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PROD equ 0FF3h ;# 
# 7234 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PRODL equ 0FF3h ;# 
# 7241 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PRODH equ 0FF4h ;# 
# 7248 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TABLAT equ 0FF5h ;# 
# 7257 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTR equ 0FF6h ;# 
# 7264 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRL equ 0FF6h ;# 
# 7271 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRH equ 0FF7h ;# 
# 7278 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRU equ 0FF8h ;# 
# 7287 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLAT equ 0FF9h ;# 
# 7294 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PC equ 0FF9h ;# 
# 7301 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCL equ 0FF9h ;# 
# 7308 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLATH equ 0FFAh ;# 
# 7315 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLATU equ 0FFBh ;# 
# 7322 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
STKPTR equ 0FFCh ;# 
# 7396 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOS equ 0FFDh ;# 
# 7403 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSL equ 0FFDh ;# 
# 7410 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSH equ 0FFEh ;# 
# 7417 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSU equ 0FFFh ;# 
# 52 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP0 equ 0F53h ;# 
# 160 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP1 equ 0F54h ;# 
# 268 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP2 equ 0F55h ;# 
# 376 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP3 equ 0F56h ;# 
# 484 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP4 equ 0F57h ;# 
# 592 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP5 equ 0F58h ;# 
# 700 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP6 equ 0F59h ;# 
# 808 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP7 equ 0F5Ah ;# 
# 916 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEIE equ 0F5Bh ;# 
# 967 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UADDR equ 0F5Ch ;# 
# 1031 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UFRML equ 0F5Dh ;# 
# 1101 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UFRMH equ 0F5Eh ;# 
# 1141 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEIR equ 0F5Fh ;# 
# 1192 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UIE equ 0F60h ;# 
# 1248 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UCFG equ 0F61h ;# 
# 1308 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UIR equ 0F62h ;# 
# 1364 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
USTAT equ 0F63h ;# 
# 1415 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UCON equ 0F64h ;# 
# 1466 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SRCON0 equ 0F68h ;# 
# 1537 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SRCON1 equ 0F69h ;# 
# 1599 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM2CON0 equ 0F6Bh ;# 
# 1669 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM2CON1 equ 0F6Ch ;# 
# 1731 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM1CON0 equ 0F6Dh ;# 
# 1801 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPMSK equ 0F6Fh ;# 
# 1806 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPMASK equ 0F6Fh ;# 
# 1939 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SLRCON equ 0F76h ;# 
# 1971 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WPUA equ 0F77h ;# 
# 2004 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WPUB equ 0F78h ;# 
# 2043 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IOCA equ 0F79h ;# 
# 2088 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IOCB equ 0F7Ah ;# 
# 2127 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ANSEL equ 0F7Eh ;# 
# 2172 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ANSELH equ 0F7Fh ;# 
# 2210 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTA equ 0F80h ;# 
# 2309 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTB equ 0F81h ;# 
# 2417 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTC equ 0F82h ;# 
# 2711 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATA equ 0F89h ;# 
# 2753 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATB equ 0F8Ah ;# 
# 2819 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATC equ 0F8Bh ;# 
# 2931 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISA equ 0F92h ;# 
# 2936 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRA equ 0F92h ;# 
# 3013 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISB equ 0F93h ;# 
# 3018 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRB equ 0F93h ;# 
# 3143 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISC equ 0F94h ;# 
# 3148 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRC equ 0F94h ;# 
# 3365 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCTUNE equ 0F9Bh ;# 
# 3435 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIE1 equ 0F9Dh ;# 
# 3506 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIR1 equ 0F9Eh ;# 
# 3577 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IPR1 equ 0F9Fh ;# 
# 3648 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIE2 equ 0FA0h ;# 
# 3714 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIR2 equ 0FA1h ;# 
# 3780 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IPR2 equ 0FA2h ;# 
# 3846 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EECON1 equ 0FA6h ;# 
# 3912 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EECON2 equ 0FA7h ;# 
# 3919 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EEDATA equ 0FA8h ;# 
# 3926 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EEADR equ 0FA9h ;# 
# 3988 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCSTA equ 0FABh ;# 
# 3993 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCSTA1 equ 0FABh ;# 
# 4198 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXSTA equ 0FACh ;# 
# 4203 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXSTA1 equ 0FACh ;# 
# 4454 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXREG equ 0FADh ;# 
# 4459 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXREG1 equ 0FADh ;# 
# 4466 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCREG equ 0FAEh ;# 
# 4471 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCREG1 equ 0FAEh ;# 
# 4478 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRG equ 0FAFh ;# 
# 4483 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRG1 equ 0FAFh ;# 
# 4490 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRGH equ 0FB0h ;# 
# 4497 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T3CON equ 0FB1h ;# 
# 4604 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3 equ 0FB2h ;# 
# 4611 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3L equ 0FB2h ;# 
# 4618 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3H equ 0FB3h ;# 
# 4625 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ECCP1AS equ 0FB6h ;# 
# 4707 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PWM1CON equ 0FB7h ;# 
# 4777 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BAUDCON equ 0FB8h ;# 
# 4782 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BAUDCTL equ 0FB8h ;# 
# 4943 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PSTRCON equ 0FB9h ;# 
# 4987 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON0 equ 0FBAh ;# 
# 4992 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON0 equ 0FBAh ;# 
# 5065 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON1 equ 0FBBh ;# 
# 5070 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON1 equ 0FBBh ;# 
# 5201 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON2 equ 0FBCh ;# 
# 5206 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON2 equ 0FBCh ;# 
# 5287 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCP1CON equ 0FBDh ;# 
# 5369 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1 equ 0FBEh ;# 
# 5376 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1L equ 0FBEh ;# 
# 5383 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1H equ 0FBFh ;# 
# 5390 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON2 equ 0FC0h ;# 
# 5461 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON1 equ 0FC1h ;# 
# 5508 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON0 equ 0FC2h ;# 
# 5627 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRES equ 0FC3h ;# 
# 5634 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRESL equ 0FC3h ;# 
# 5641 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRESH equ 0FC4h ;# 
# 5648 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPCON2 equ 0FC5h ;# 
# 5710 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPCON1 equ 0FC6h ;# 
# 5780 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPSTAT equ 0FC7h ;# 
# 6001 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPADD equ 0FC8h ;# 
# 6008 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPBUF equ 0FC9h ;# 
# 6015 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T2CON equ 0FCAh ;# 
# 6086 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PR2 equ 0FCBh ;# 
# 6091 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
MEMCON equ 0FCBh ;# 
# 6196 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR2 equ 0FCCh ;# 
# 6203 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T1CON equ 0FCDh ;# 
# 6306 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1 equ 0FCEh ;# 
# 6313 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1L equ 0FCEh ;# 
# 6320 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1H equ 0FCFh ;# 
# 6327 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCON equ 0FD0h ;# 
# 6460 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WDTCON equ 0FD1h ;# 
# 6488 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCCON2 equ 0FD2h ;# 
# 6520 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCCON equ 0FD3h ;# 
# 6599 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T0CON equ 0FD5h ;# 
# 6669 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0 equ 0FD6h ;# 
# 6676 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0L equ 0FD6h ;# 
# 6683 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0H equ 0FD7h ;# 
# 6690 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
STATUS equ 0FD8h ;# 
# 6761 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2 equ 0FD9h ;# 
# 6768 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2L equ 0FD9h ;# 
# 6775 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2H equ 0FDAh ;# 
# 6782 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW2 equ 0FDBh ;# 
# 6789 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC2 equ 0FDCh ;# 
# 6796 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC2 equ 0FDDh ;# 
# 6803 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC2 equ 0FDEh ;# 
# 6810 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF2 equ 0FDFh ;# 
# 6817 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BSR equ 0FE0h ;# 
# 6824 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1 equ 0FE1h ;# 
# 6831 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1L equ 0FE1h ;# 
# 6838 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1H equ 0FE2h ;# 
# 6845 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW1 equ 0FE3h ;# 
# 6852 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC1 equ 0FE4h ;# 
# 6859 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC1 equ 0FE5h ;# 
# 6866 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC1 equ 0FE6h ;# 
# 6873 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF1 equ 0FE7h ;# 
# 6880 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WREG equ 0FE8h ;# 
# 6892 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0 equ 0FE9h ;# 
# 6899 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0L equ 0FE9h ;# 
# 6906 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0H equ 0FEAh ;# 
# 6913 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW0 equ 0FEBh ;# 
# 6920 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC0 equ 0FECh ;# 
# 6927 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC0 equ 0FEDh ;# 
# 6934 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC0 equ 0FEEh ;# 
# 6941 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF0 equ 0FEFh ;# 
# 6948 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON3 equ 0FF0h ;# 
# 7040 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON2 equ 0FF1h ;# 
# 7110 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON equ 0FF2h ;# 
# 7227 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PROD equ 0FF3h ;# 
# 7234 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PRODL equ 0FF3h ;# 
# 7241 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PRODH equ 0FF4h ;# 
# 7248 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TABLAT equ 0FF5h ;# 
# 7257 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTR equ 0FF6h ;# 
# 7264 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRL equ 0FF6h ;# 
# 7271 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRH equ 0FF7h ;# 
# 7278 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRU equ 0FF8h ;# 
# 7287 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLAT equ 0FF9h ;# 
# 7294 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PC equ 0FF9h ;# 
# 7301 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCL equ 0FF9h ;# 
# 7308 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLATH equ 0FFAh ;# 
# 7315 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLATU equ 0FFBh ;# 
# 7322 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
STKPTR equ 0FFCh ;# 
# 7396 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOS equ 0FFDh ;# 
# 7403 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSL equ 0FFDh ;# 
# 7410 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSH equ 0FFEh ;# 
# 7417 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSU equ 0FFFh ;# 
# 52 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP0 equ 0F53h ;# 
# 160 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP1 equ 0F54h ;# 
# 268 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP2 equ 0F55h ;# 
# 376 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP3 equ 0F56h ;# 
# 484 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP4 equ 0F57h ;# 
# 592 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP5 equ 0F58h ;# 
# 700 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP6 equ 0F59h ;# 
# 808 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP7 equ 0F5Ah ;# 
# 916 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEIE equ 0F5Bh ;# 
# 967 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UADDR equ 0F5Ch ;# 
# 1031 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UFRML equ 0F5Dh ;# 
# 1101 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UFRMH equ 0F5Eh ;# 
# 1141 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEIR equ 0F5Fh ;# 
# 1192 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UIE equ 0F60h ;# 
# 1248 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UCFG equ 0F61h ;# 
# 1308 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UIR equ 0F62h ;# 
# 1364 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
USTAT equ 0F63h ;# 
# 1415 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UCON equ 0F64h ;# 
# 1466 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SRCON0 equ 0F68h ;# 
# 1537 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SRCON1 equ 0F69h ;# 
# 1599 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM2CON0 equ 0F6Bh ;# 
# 1669 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM2CON1 equ 0F6Ch ;# 
# 1731 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM1CON0 equ 0F6Dh ;# 
# 1801 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPMSK equ 0F6Fh ;# 
# 1806 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPMASK equ 0F6Fh ;# 
# 1939 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SLRCON equ 0F76h ;# 
# 1971 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WPUA equ 0F77h ;# 
# 2004 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WPUB equ 0F78h ;# 
# 2043 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IOCA equ 0F79h ;# 
# 2088 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IOCB equ 0F7Ah ;# 
# 2127 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ANSEL equ 0F7Eh ;# 
# 2172 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ANSELH equ 0F7Fh ;# 
# 2210 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTA equ 0F80h ;# 
# 2309 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTB equ 0F81h ;# 
# 2417 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTC equ 0F82h ;# 
# 2711 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATA equ 0F89h ;# 
# 2753 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATB equ 0F8Ah ;# 
# 2819 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATC equ 0F8Bh ;# 
# 2931 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISA equ 0F92h ;# 
# 2936 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRA equ 0F92h ;# 
# 3013 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISB equ 0F93h ;# 
# 3018 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRB equ 0F93h ;# 
# 3143 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISC equ 0F94h ;# 
# 3148 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRC equ 0F94h ;# 
# 3365 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCTUNE equ 0F9Bh ;# 
# 3435 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIE1 equ 0F9Dh ;# 
# 3506 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIR1 equ 0F9Eh ;# 
# 3577 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IPR1 equ 0F9Fh ;# 
# 3648 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIE2 equ 0FA0h ;# 
# 3714 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIR2 equ 0FA1h ;# 
# 3780 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IPR2 equ 0FA2h ;# 
# 3846 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EECON1 equ 0FA6h ;# 
# 3912 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EECON2 equ 0FA7h ;# 
# 3919 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EEDATA equ 0FA8h ;# 
# 3926 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EEADR equ 0FA9h ;# 
# 3988 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCSTA equ 0FABh ;# 
# 3993 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCSTA1 equ 0FABh ;# 
# 4198 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXSTA equ 0FACh ;# 
# 4203 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXSTA1 equ 0FACh ;# 
# 4454 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXREG equ 0FADh ;# 
# 4459 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXREG1 equ 0FADh ;# 
# 4466 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCREG equ 0FAEh ;# 
# 4471 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCREG1 equ 0FAEh ;# 
# 4478 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRG equ 0FAFh ;# 
# 4483 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRG1 equ 0FAFh ;# 
# 4490 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRGH equ 0FB0h ;# 
# 4497 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T3CON equ 0FB1h ;# 
# 4604 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3 equ 0FB2h ;# 
# 4611 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3L equ 0FB2h ;# 
# 4618 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3H equ 0FB3h ;# 
# 4625 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ECCP1AS equ 0FB6h ;# 
# 4707 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PWM1CON equ 0FB7h ;# 
# 4777 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BAUDCON equ 0FB8h ;# 
# 4782 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BAUDCTL equ 0FB8h ;# 
# 4943 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PSTRCON equ 0FB9h ;# 
# 4987 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON0 equ 0FBAh ;# 
# 4992 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON0 equ 0FBAh ;# 
# 5065 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON1 equ 0FBBh ;# 
# 5070 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON1 equ 0FBBh ;# 
# 5201 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON2 equ 0FBCh ;# 
# 5206 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON2 equ 0FBCh ;# 
# 5287 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCP1CON equ 0FBDh ;# 
# 5369 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1 equ 0FBEh ;# 
# 5376 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1L equ 0FBEh ;# 
# 5383 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1H equ 0FBFh ;# 
# 5390 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON2 equ 0FC0h ;# 
# 5461 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON1 equ 0FC1h ;# 
# 5508 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON0 equ 0FC2h ;# 
# 5627 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRES equ 0FC3h ;# 
# 5634 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRESL equ 0FC3h ;# 
# 5641 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRESH equ 0FC4h ;# 
# 5648 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPCON2 equ 0FC5h ;# 
# 5710 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPCON1 equ 0FC6h ;# 
# 5780 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPSTAT equ 0FC7h ;# 
# 6001 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPADD equ 0FC8h ;# 
# 6008 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPBUF equ 0FC9h ;# 
# 6015 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T2CON equ 0FCAh ;# 
# 6086 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PR2 equ 0FCBh ;# 
# 6091 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
MEMCON equ 0FCBh ;# 
# 6196 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR2 equ 0FCCh ;# 
# 6203 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T1CON equ 0FCDh ;# 
# 6306 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1 equ 0FCEh ;# 
# 6313 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1L equ 0FCEh ;# 
# 6320 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1H equ 0FCFh ;# 
# 6327 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCON equ 0FD0h ;# 
# 6460 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WDTCON equ 0FD1h ;# 
# 6488 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCCON2 equ 0FD2h ;# 
# 6520 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCCON equ 0FD3h ;# 
# 6599 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T0CON equ 0FD5h ;# 
# 6669 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0 equ 0FD6h ;# 
# 6676 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0L equ 0FD6h ;# 
# 6683 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0H equ 0FD7h ;# 
# 6690 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
STATUS equ 0FD8h ;# 
# 6761 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2 equ 0FD9h ;# 
# 6768 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2L equ 0FD9h ;# 
# 6775 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2H equ 0FDAh ;# 
# 6782 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW2 equ 0FDBh ;# 
# 6789 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC2 equ 0FDCh ;# 
# 6796 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC2 equ 0FDDh ;# 
# 6803 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC2 equ 0FDEh ;# 
# 6810 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF2 equ 0FDFh ;# 
# 6817 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BSR equ 0FE0h ;# 
# 6824 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1 equ 0FE1h ;# 
# 6831 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1L equ 0FE1h ;# 
# 6838 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1H equ 0FE2h ;# 
# 6845 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW1 equ 0FE3h ;# 
# 6852 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC1 equ 0FE4h ;# 
# 6859 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC1 equ 0FE5h ;# 
# 6866 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC1 equ 0FE6h ;# 
# 6873 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF1 equ 0FE7h ;# 
# 6880 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WREG equ 0FE8h ;# 
# 6892 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0 equ 0FE9h ;# 
# 6899 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0L equ 0FE9h ;# 
# 6906 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0H equ 0FEAh ;# 
# 6913 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW0 equ 0FEBh ;# 
# 6920 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC0 equ 0FECh ;# 
# 6927 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC0 equ 0FEDh ;# 
# 6934 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC0 equ 0FEEh ;# 
# 6941 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF0 equ 0FEFh ;# 
# 6948 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON3 equ 0FF0h ;# 
# 7040 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON2 equ 0FF1h ;# 
# 7110 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON equ 0FF2h ;# 
# 7227 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PROD equ 0FF3h ;# 
# 7234 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PRODL equ 0FF3h ;# 
# 7241 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PRODH equ 0FF4h ;# 
# 7248 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TABLAT equ 0FF5h ;# 
# 7257 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTR equ 0FF6h ;# 
# 7264 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRL equ 0FF6h ;# 
# 7271 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRH equ 0FF7h ;# 
# 7278 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRU equ 0FF8h ;# 
# 7287 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLAT equ 0FF9h ;# 
# 7294 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PC equ 0FF9h ;# 
# 7301 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCL equ 0FF9h ;# 
# 7308 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLATH equ 0FFAh ;# 
# 7315 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLATU equ 0FFBh ;# 
# 7322 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
STKPTR equ 0FFCh ;# 
# 7396 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOS equ 0FFDh ;# 
# 7403 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSL equ 0FFDh ;# 
# 7410 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSH equ 0FFEh ;# 
# 7417 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSU equ 0FFFh ;# 
# 52 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP0 equ 0F53h ;# 
# 160 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP1 equ 0F54h ;# 
# 268 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP2 equ 0F55h ;# 
# 376 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP3 equ 0F56h ;# 
# 484 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP4 equ 0F57h ;# 
# 592 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP5 equ 0F58h ;# 
# 700 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP6 equ 0F59h ;# 
# 808 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEP7 equ 0F5Ah ;# 
# 916 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEIE equ 0F5Bh ;# 
# 967 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UADDR equ 0F5Ch ;# 
# 1031 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UFRML equ 0F5Dh ;# 
# 1101 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UFRMH equ 0F5Eh ;# 
# 1141 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UEIR equ 0F5Fh ;# 
# 1192 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UIE equ 0F60h ;# 
# 1248 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UCFG equ 0F61h ;# 
# 1308 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UIR equ 0F62h ;# 
# 1364 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
USTAT equ 0F63h ;# 
# 1415 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
UCON equ 0F64h ;# 
# 1466 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SRCON0 equ 0F68h ;# 
# 1537 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SRCON1 equ 0F69h ;# 
# 1599 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM2CON0 equ 0F6Bh ;# 
# 1669 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM2CON1 equ 0F6Ch ;# 
# 1731 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CM1CON0 equ 0F6Dh ;# 
# 1801 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPMSK equ 0F6Fh ;# 
# 1806 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPMASK equ 0F6Fh ;# 
# 1939 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SLRCON equ 0F76h ;# 
# 1971 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WPUA equ 0F77h ;# 
# 2004 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WPUB equ 0F78h ;# 
# 2043 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IOCA equ 0F79h ;# 
# 2088 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IOCB equ 0F7Ah ;# 
# 2127 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ANSEL equ 0F7Eh ;# 
# 2172 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ANSELH equ 0F7Fh ;# 
# 2210 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTA equ 0F80h ;# 
# 2309 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTB equ 0F81h ;# 
# 2417 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PORTC equ 0F82h ;# 
# 2711 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATA equ 0F89h ;# 
# 2753 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATB equ 0F8Ah ;# 
# 2819 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
LATC equ 0F8Bh ;# 
# 2931 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISA equ 0F92h ;# 
# 2936 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRA equ 0F92h ;# 
# 3013 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISB equ 0F93h ;# 
# 3018 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRB equ 0F93h ;# 
# 3143 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TRISC equ 0F94h ;# 
# 3148 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
DDRC equ 0F94h ;# 
# 3365 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCTUNE equ 0F9Bh ;# 
# 3435 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIE1 equ 0F9Dh ;# 
# 3506 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIR1 equ 0F9Eh ;# 
# 3577 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IPR1 equ 0F9Fh ;# 
# 3648 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIE2 equ 0FA0h ;# 
# 3714 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PIR2 equ 0FA1h ;# 
# 3780 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
IPR2 equ 0FA2h ;# 
# 3846 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EECON1 equ 0FA6h ;# 
# 3912 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EECON2 equ 0FA7h ;# 
# 3919 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EEDATA equ 0FA8h ;# 
# 3926 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
EEADR equ 0FA9h ;# 
# 3988 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCSTA equ 0FABh ;# 
# 3993 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCSTA1 equ 0FABh ;# 
# 4198 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXSTA equ 0FACh ;# 
# 4203 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXSTA1 equ 0FACh ;# 
# 4454 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXREG equ 0FADh ;# 
# 4459 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TXREG1 equ 0FADh ;# 
# 4466 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCREG equ 0FAEh ;# 
# 4471 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCREG1 equ 0FAEh ;# 
# 4478 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRG equ 0FAFh ;# 
# 4483 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRG1 equ 0FAFh ;# 
# 4490 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SPBRGH equ 0FB0h ;# 
# 4497 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T3CON equ 0FB1h ;# 
# 4604 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3 equ 0FB2h ;# 
# 4611 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3L equ 0FB2h ;# 
# 4618 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR3H equ 0FB3h ;# 
# 4625 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ECCP1AS equ 0FB6h ;# 
# 4707 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PWM1CON equ 0FB7h ;# 
# 4777 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BAUDCON equ 0FB8h ;# 
# 4782 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BAUDCTL equ 0FB8h ;# 
# 4943 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PSTRCON equ 0FB9h ;# 
# 4987 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON0 equ 0FBAh ;# 
# 4992 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON0 equ 0FBAh ;# 
# 5065 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON1 equ 0FBBh ;# 
# 5070 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON1 equ 0FBBh ;# 
# 5201 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
REFCON2 equ 0FBCh ;# 
# 5206 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
VREFCON2 equ 0FBCh ;# 
# 5287 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCP1CON equ 0FBDh ;# 
# 5369 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1 equ 0FBEh ;# 
# 5376 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1L equ 0FBEh ;# 
# 5383 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
CCPR1H equ 0FBFh ;# 
# 5390 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON2 equ 0FC0h ;# 
# 5461 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON1 equ 0FC1h ;# 
# 5508 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADCON0 equ 0FC2h ;# 
# 5627 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRES equ 0FC3h ;# 
# 5634 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRESL equ 0FC3h ;# 
# 5641 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
ADRESH equ 0FC4h ;# 
# 5648 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPCON2 equ 0FC5h ;# 
# 5710 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPCON1 equ 0FC6h ;# 
# 5780 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPSTAT equ 0FC7h ;# 
# 6001 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPADD equ 0FC8h ;# 
# 6008 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
SSPBUF equ 0FC9h ;# 
# 6015 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T2CON equ 0FCAh ;# 
# 6086 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PR2 equ 0FCBh ;# 
# 6091 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
MEMCON equ 0FCBh ;# 
# 6196 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR2 equ 0FCCh ;# 
# 6203 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T1CON equ 0FCDh ;# 
# 6306 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1 equ 0FCEh ;# 
# 6313 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1L equ 0FCEh ;# 
# 6320 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR1H equ 0FCFh ;# 
# 6327 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
RCON equ 0FD0h ;# 
# 6460 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WDTCON equ 0FD1h ;# 
# 6488 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCCON2 equ 0FD2h ;# 
# 6520 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
OSCCON equ 0FD3h ;# 
# 6599 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
T0CON equ 0FD5h ;# 
# 6669 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0 equ 0FD6h ;# 
# 6676 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0L equ 0FD6h ;# 
# 6683 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TMR0H equ 0FD7h ;# 
# 6690 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
STATUS equ 0FD8h ;# 
# 6761 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2 equ 0FD9h ;# 
# 6768 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2L equ 0FD9h ;# 
# 6775 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR2H equ 0FDAh ;# 
# 6782 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW2 equ 0FDBh ;# 
# 6789 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC2 equ 0FDCh ;# 
# 6796 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC2 equ 0FDDh ;# 
# 6803 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC2 equ 0FDEh ;# 
# 6810 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF2 equ 0FDFh ;# 
# 6817 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
BSR equ 0FE0h ;# 
# 6824 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1 equ 0FE1h ;# 
# 6831 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1L equ 0FE1h ;# 
# 6838 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR1H equ 0FE2h ;# 
# 6845 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW1 equ 0FE3h ;# 
# 6852 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC1 equ 0FE4h ;# 
# 6859 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC1 equ 0FE5h ;# 
# 6866 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC1 equ 0FE6h ;# 
# 6873 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF1 equ 0FE7h ;# 
# 6880 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
WREG equ 0FE8h ;# 
# 6892 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0 equ 0FE9h ;# 
# 6899 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0L equ 0FE9h ;# 
# 6906 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
FSR0H equ 0FEAh ;# 
# 6913 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PLUSW0 equ 0FEBh ;# 
# 6920 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PREINC0 equ 0FECh ;# 
# 6927 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTDEC0 equ 0FEDh ;# 
# 6934 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
POSTINC0 equ 0FEEh ;# 
# 6941 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INDF0 equ 0FEFh ;# 
# 6948 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON3 equ 0FF0h ;# 
# 7040 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON2 equ 0FF1h ;# 
# 7110 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
INTCON equ 0FF2h ;# 
# 7227 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PROD equ 0FF3h ;# 
# 7234 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PRODL equ 0FF3h ;# 
# 7241 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PRODH equ 0FF4h ;# 
# 7248 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TABLAT equ 0FF5h ;# 
# 7257 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTR equ 0FF6h ;# 
# 7264 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRL equ 0FF6h ;# 
# 7271 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRH equ 0FF7h ;# 
# 7278 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TBLPTRU equ 0FF8h ;# 
# 7287 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLAT equ 0FF9h ;# 
# 7294 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PC equ 0FF9h ;# 
# 7301 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCL equ 0FF9h ;# 
# 7308 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLATH equ 0FFAh ;# 
# 7315 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
PCLATU equ 0FFBh ;# 
# 7322 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
STKPTR equ 0FFCh ;# 
# 7396 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOS equ 0FFDh ;# 
# 7403 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSL equ 0FFDh ;# 
# 7410 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSH equ 0FFEh ;# 
# 7417 "C:\Program Files (x86)\Microchip\xc8\v1.45\include\pic18f14k50.h"
TOSU equ 0FFFh ;# 
	FNCALL	_main,_GRB_tblRD
	FNCALL	_main,_I2C_Tsensor_CFG
	FNCALL	_main,_LCD_Init
	FNCALL	_main,_LCD_str
	FNCALL	_main,_LCD_time
	FNCALL	_main,_PICinit
	FNCALL	_main,_ProcessUSB
	FNCALL	_main,_RGBdata_send
	FNCALL	_main,_USBDeviceAttach
	FNCALL	_main,_USBDeviceInit
	FNCALL	_main,_wait
	FNCALL	_main,_writeCommand
	FNCALL	_USBDeviceInit,_memset
	FNCALL	_RGBdata_send,_code
	FNCALL	_ProcessUSB,_CDCTxService
	FNCALL	_ProcessUSB,_USBCBSendResume
	FNCALL	_ProcessUSB,_getsUSBUSART
	FNCALL	_ProcessUSB,_putUSBUSART
	FNCALL	_getsUSBUSART,_USBTransferOnePacket
	FNCALL	_USBCBSendResume,_USBCBWakeFromSuspend
	FNCALL	_CDCTxService,_USBTransferOnePacket
	FNCALL	_LCD_time,_I2C_Tsensor
	FNCALL	_LCD_time,___lwdiv
	FNCALL	_LCD_time,___lwmod
	FNCALL	_LCD_time,___wmul
	FNCALL	_LCD_time,_writeData
	FNCALL	_I2C_Tsensor,_I2C_Master_Start
	FNCALL	_I2C_Tsensor,_I2C_Master_Stop
	FNCALL	_I2C_Tsensor,_I2C_Master_Write
	FNCALL	_I2C_Tsensor,_I2C_nacksnd
	FNCALL	_LCD_str,_writeData
	FNCALL	_writeData,_I2C_Master_Start
	FNCALL	_writeData,_I2C_Master_Stop
	FNCALL	_writeData,_I2C_Master_Write
	FNCALL	_LCD_Init,_I2C_Master_Init
	FNCALL	_LCD_Init,_writeCommand
	FNCALL	_writeCommand,_I2C_Master_Start
	FNCALL	_writeCommand,_I2C_Master_Stop
	FNCALL	_writeCommand,_I2C_Master_Write
	FNCALL	_I2C_Master_Init,___lldiv
	FNCALL	_I2C_Tsensor_CFG,_I2C_Master_Start
	FNCALL	_I2C_Tsensor_CFG,_I2C_Master_Stop
	FNCALL	_I2C_Tsensor_CFG,_I2C_Master_Write
	FNCALL	_I2C_Tsensor_CFG,_I2C_nacksnd
	FNCALL	_I2C_Master_Write,_I2C_Master_Wait
	FNCALL	_I2C_Master_Stop,_I2C_Master_Wait
	FNCALL	_I2C_Master_Start,_I2C_Master_Wait
	FNCALL	_GRB_tblRD,___awmod
	FNROOT	_main
	FNCALL	intlevel1,_YourLowPriorityISRCode
	global	intlevel1
	FNROOT	intlevel1
	FNCALL	_YourHighPriorityISRCode,_USBDeviceTasks
	FNCALL	_USBDeviceTasks,_USBCtrlEPAllowStatusStage
	FNCALL	_USBDeviceTasks,_USBCtrlEPService
	FNCALL	_USBDeviceTasks,_USBStallHandler
	FNCALL	_USBDeviceTasks,_USBSuspend
	FNCALL	_USBDeviceTasks,_USBWakeFromSuspend
	FNCALL	_USBDeviceTasks,_USER_USB_CALLBACK_EVENT_HANDLER
	FNCALL	_USBDeviceTasks,i2_USBDeviceInit
	FNCALL	i2_USBDeviceInit,i2_memset
	FNCALL	_USBWakeFromSuspend,_USER_USB_CALLBACK_EVENT_HANDLER
	FNCALL	_USBSuspend,_USER_USB_CALLBACK_EVENT_HANDLER
	FNCALL	_USBCtrlEPService,_USBCtrlTrfInHandler
	FNCALL	_USBCtrlEPService,_USBCtrlTrfOutHandler
	FNCALL	_USBCtrlEPService,_USBCtrlTrfSetupHandler
	FNCALL	_USBCtrlTrfSetupHandler,_USBCheckStdRequest
	FNCALL	_USBCtrlTrfSetupHandler,_USBCtrlEPServiceComplete
	FNCALL	_USBCtrlTrfSetupHandler,_USER_USB_CALLBACK_EVENT_HANDLER
	FNCALL	_USBCtrlEPServiceComplete,_USBCtrlEPAllowDataStage
	FNCALL	_USBCtrlEPServiceComplete,_USBCtrlEPAllowStatusStage
	FNCALL	_USBCtrlEPAllowDataStage,_USBCtrlTrfTxService
	FNCALL	_USBCheckStdRequest,_USBStdFeatureReqHandler
	FNCALL	_USBCheckStdRequest,_USBStdGetDscHandler
	FNCALL	_USBCheckStdRequest,_USBStdSetCfgHandler
	FNCALL	_USBCheckStdRequest,_USER_USB_CALLBACK_EVENT_HANDLER
	FNCALL	_USBStdSetCfgHandler,_USER_USB_CALLBACK_EVENT_HANDLER
	FNCALL	_USBStdSetCfgHandler,i2_memset
	FNCALL	_USBStdFeatureReqHandler,_USER_USB_CALLBACK_EVENT_HANDLER
	FNCALL	_USER_USB_CALLBACK_EVENT_HANDLER,_USBCBCheckOtherReq
	FNCALL	_USER_USB_CALLBACK_EVENT_HANDLER,_USBCBErrorHandler
	FNCALL	_USER_USB_CALLBACK_EVENT_HANDLER,_USBCBInitEP
	FNCALL	_USER_USB_CALLBACK_EVENT_HANDLER,_USBCBStdSetDscHandler
	FNCALL	_USER_USB_CALLBACK_EVENT_HANDLER,_USBCBSuspend
	FNCALL	_USER_USB_CALLBACK_EVENT_HANDLER,_USBCB_SOF_Handler
	FNCALL	_USER_USB_CALLBACK_EVENT_HANDLER,i2_USBCBWakeFromSuspend
	FNCALL	_USBCBInitEP,_CDCInitEP
	FNCALL	_CDCInitEP,_USBEnableEndpoint
	FNCALL	_CDCInitEP,i2_USBTransferOnePacket
	FNCALL	_USBEnableEndpoint,_USBConfigureEndpoint
	FNCALL	_USBCtrlTrfOutHandler,_USBCtrlTrfRxService
	FNCALL	_USBCtrlTrfRxService,_USBCtrlEPAllowStatusStage
	FNCALL	_USBCtrlTrfInHandler,_USBCtrlTrfTxService
	FNCALL	intlevel2,_YourHighPriorityISRCode
	global	intlevel2
	FNROOT	intlevel2
	global	_stat
	global	_moji11
psect	idataBANK0,class=CODE,space=0,delta=1,noexec
global __pidataBANK0
__pidataBANK0:
	file	"C:\pic\PIC18F\test02\main.c"
	line	112

;initializer for _stat
	db	low(02h)
psect	idataBANK1,class=CODE,space=0,delta=1,noexec
global __pidataBANK1
__pidataBANK1:
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	53

;initializer for _moji12
	db	low(048h)
	db	low(065h)
	db	low(06Ch)
	db	low(06Ch)
	db	low(06Fh)
	db	low(032h)
	db	low(02Ch)
	db	low(020h)
	db	low(050h)
	db	low(049h)
	db	low(043h)
	db	low(020h)
	db	low(057h)
	db	low(06Fh)
	db	low(072h)
	db	low(06Ch)
	db	low(064h)
	db	low(021h)
	db	low(0)
	line	51

;initializer for _moji
	db	low(048h)
	db	low(065h)
	db	low(06Ch)
	db	low(06Ch)
	db	low(06Fh)
	db	low(02Ch)
	db	low(020h)
	db	low(050h)
	db	low(049h)
	db	low(043h)
	db	low(020h)
	db	low(057h)
	db	low(06Fh)
	db	low(072h)
	db	low(06Ch)
	db	low(064h)
	db	low(021h)
	db	low(0)
	line	54

;initializer for _moji2
	db	low(057h)
	db	low(061h)
	db	low(06Bh)
	db	low(02Dh)
	db	low(074h)
	db	low(065h)
	db	low(063h)
	db	low(068h)
	db	low(0)
	line	52

;initializer for _moji11
	db	low(048h)
	db	low(065h)
	db	low(06Ch)
	db	low(06Ch)
	db	low(06Fh)
	db	low(031h)
	db	low(02Ch)
	db	low(020h)
	db	low(050h)
	db	low(049h)
	db	low(043h)
	db	low(020h)
	db	low(057h)
	db	low(06Fh)
	db	low(072h)
	db	low(06Ch)
	db	low(064h)
	db	low(021h)
	db	low(0)
psect	mediumconst,class=MEDIUMCONST,space=0,reloc=2,noexec
global __pmediumconst
__pmediumconst:
	db	0
	file	"C:\pic\PIC18F\test02\main.c"
	line	97
_GRB_tbl2:
	db	low(0)
	db	low(020h)
	db	low(0)
	db	low(0)
	db	low(020h)
	db	low(0)
	db	low(0)
	db	low(020h)
	db	low(0)
	db	low(0)
	db	low(020h)
	db	low(0)
	db	low(020h)
	db	low(0)
	db	low(0)
	db	low(020h)
	db	low(0)
	db	low(0)
	db	low(020h)
	db	low(0)
	db	low(0)
	db	low(020h)
	db	low(0)
	db	low(0)
	db	low(020h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(020h)
	db	low(0)
	global __end_of_GRB_tbl2
__end_of_GRB_tbl2:
psect	mediumconst
	file	"C:\pic\PIC18F\test02\main.c"
	line	65
_GRB_tbl0:
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(010h)
	db	low(010h)
	db	low(010h)
	db	low(0)
	db	low(010h)
	global __end_of_GRB_tbl0
__end_of_GRB_tbl0:
	global	_USB_SD_Ptr
psect	mediumconst
	file	"C:\pic\PIC18F\test02\usb_descriptors.c"
	line	196
_USB_SD_Ptr:
		db	low(_sd000)
	db	high(_sd000)

		db	low(_sd001)
	db	high(_sd001)

		db	low(_sd002)
	db	high(_sd002)

	global __end_of_USB_SD_Ptr
__end_of_USB_SD_Ptr:
	global	_USB_CD_Ptr
psect	mediumconst
	file	"C:\pic\PIC18F\test02\usb_descriptors.c"
	line	191
_USB_CD_Ptr:
		db	low(_configDescriptor1)
	db	high(_configDescriptor1)

	global __end_of_USB_CD_Ptr
__end_of_USB_CD_Ptr:
	global	_configDescriptor1
psect	mediumconst
	file	"C:\pic\PIC18F\test02\usb_descriptors.c"
	line	69
_configDescriptor1:
	db	low(09h)
	db	low(02h)
	db	low(043h)
	db	low(0)
	db	low(02h)
	db	low(01h)
	db	low(0)
	db	low(0C0h)
	db	low(032h)
	db	low(09h)
	db	low(04h)
	db	low(0)
	db	low(0)
	db	low(01h)
	db	low(02h)
	db	low(02h)
	db	low(01h)
	db	low(0)
	db	low(05h)
	db	low(024h)
	db	low(0)
	db	low(010h)
	db	low(01h)
	db	low(04h)
	db	low(024h)
	db	low(02h)
	db	low(02h)
	db	low(05h)
	db	low(024h)
	db	low(06h)
	db	low(0)
	db	low(01h)
	db	low(05h)
	db	low(024h)
	db	low(01h)
	db	low(0)
	db	low(01h)
	db	low(07h)
	db	low(05h)
	db	low(081h)
	db	low(03h)
	db	low(08h)
	db	low(0)
	db	low(02h)
	db	low(09h)
	db	low(04h)
	db	low(01h)
	db	low(0)
	db	low(02h)
	db	low(0Ah)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(07h)
	db	low(05h)
	db	low(02h)
	db	low(02h)
	db	low(040h)
	db	low(0)
	db	low(0)
	db	low(07h)
	db	low(05h)
	db	low(082h)
	db	low(02h)
	db	low(040h)
	db	low(0)
	db	low(0)
	global __end_of_configDescriptor1
__end_of_configDescriptor1:
	global	_sd002
psect	mediumconst
	file	"C:\pic\PIC18F\test02\usb_descriptors.c"
	line	184
_sd002:
	db	low(034h)
	db	low(03h)
	dw	(043h)&0ffffh
	dw	(044h)&0ffffh
	dw	(043h)&0ffffh
	dw	(020h)&0ffffh
	dw	(052h)&0ffffh
	dw	(053h)&0ffffh
	dw	(02Dh)&0ffffh
	dw	(032h)&0ffffh
	dw	(033h)&0ffffh
	dw	(032h)&0ffffh
	dw	(020h)&0ffffh
	dw	(045h)&0ffffh
	dw	(06Dh)&0ffffh
	dw	(075h)&0ffffh
	dw	(06Ch)&0ffffh
	dw	(061h)&0ffffh
	dw	(074h)&0ffffh
	dw	(069h)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(06Eh)&0ffffh
	dw	(020h)&0ffffh
	dw	(044h)&0ffffh
	dw	(065h)&0ffffh
	dw	(06Dh)&0ffffh
	dw	(06Fh)&0ffffh
	global __end_of_sd002
__end_of_sd002:
	global	_sd001
psect	mediumconst
	file	"C:\pic\PIC18F\test02\usb_descriptors.c"
	line	174
_sd001:
	db	low(034h)
	db	low(03h)
	dw	(04Dh)&0ffffh
	dw	(069h)&0ffffh
	dw	(063h)&0ffffh
	dw	(072h)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(063h)&0ffffh
	dw	(068h)&0ffffh
	dw	(069h)&0ffffh
	dw	(070h)&0ffffh
	dw	(020h)&0ffffh
	dw	(054h)&0ffffh
	dw	(065h)&0ffffh
	dw	(063h)&0ffffh
	dw	(068h)&0ffffh
	dw	(06Eh)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(06Ch)&0ffffh
	dw	(06Fh)&0ffffh
	dw	(067h)&0ffffh
	dw	(079h)&0ffffh
	dw	(020h)&0ffffh
	dw	(049h)&0ffffh
	dw	(06Eh)&0ffffh
	dw	(063h)&0ffffh
	dw	(02Eh)&0ffffh
	global __end_of_sd001
__end_of_sd001:
	global	_GRB_tbl1
psect	mediumconst
	file	"C:\pic\PIC18F\test02\main.c"
	line	81
_GRB_tbl1:
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(010h)
	db	low(0)
	db	low(0)
	db	low(0)
	db	low(020h)
	db	low(020h)
	db	low(0)
	db	low(010h)
	db	low(0)
	global __end_of_GRB_tbl1
__end_of_GRB_tbl1:
	global	_device_dsc
psect	mediumconst
	file	"C:\pic\PIC18F\test02\usb_descriptors.c"
	line	48
_device_dsc:
	db	low(012h)
	db	low(01h)
	dw	(0200h)&0ffffh
	db	low(02h)
	db	low(0)
	db	low(0)
	db	low(08h)
	dw	(04D8h)&0ffffh
	dw	(0Ah)&0ffffh
	dw	(0100h)&0ffffh
	db	low(01h)
	db	low(02h)
	db	low(0)
	db	low(01h)
	global __end_of_device_dsc
__end_of_device_dsc:
	global	_sd000
psect	mediumconst
	file	"C:\pic\PIC18F\test02\usb_descriptors.c"
	line	164
_sd000:
	db	low(04h)
	db	low(03h)
	dw	(0409h)&0ffffh
	global __end_of_sd000
__end_of_sd000:
	global	_USB_SD_Ptr
	global	_USB_CD_Ptr
	global	_configDescriptor1
	global	_sd002
	global	_sd001
	global	_GRB_tbl1
	global	_device_dsc
	global	_sd000
	global	_pDst
	global	_pBDTEntryEP0OutNext
	global	_pBDTEntryEP0OutCurrent
	global	USBCBSendResume@delay_count
	global	_USBDeferOUTDataStagePackets
	global	_USBDeferINDataStagePackets
	global	_USBStatusStageEnabledFlag2
	global	_USBStatusStageEnabledFlag1
	global	_USBDeferStatusStagePacket
	global	_USBStatusStageTimeoutCounter
	global	_BothEP0OutUOWNsSet
	global	_endpoint_number
	global	_controlTransferState
	global	_shortPacketStatus
	global	_USBBusIsSuspended
	global	_RemoteWakeup
	global	_control_signal_bitmap
	global	_USB_Out_Buffer
	global	_dummy_encapsulated_cmd_response
	global	_USBAlternateInterface
	global	_USTATcopy
	global	_USBActiveConfiguration
	global	_outPipes
	global	_pBDTEntryIn
	global	_pBDTEntryOut
	global	_tm_disp
	global	_inPipes
	global	_ep_data_out
	global	_ep_data_in
	global	_tmp_disp
	global	_pCDCDst
	global	_pCDCSrc
	global	_ct_bit
	global	_cnt6s
	global	_cnt1hr
	global	_cnt1min
	global	_cnt1s
	global	_cnt100ms
	global	_CDCDataInHandle
	global	_CDCDataOutHandle
	global	_LED_stat
	global	_g_TimeCnt
	global	_USBDeviceState
	global	_cdc_mem_type
	global	_cdc_tx_len
	global	_cdc_trf_state
	global	_cdc_rx_len
	global	_USB_In_Buffer
	global	_bitdata
	global	_BDT

	DABS	1,512,48,_BDT
	global	_SetupPkt

	DABS	1,560,8,_SetupPkt
	global	_UEP0bits
_UEP0bits	set	0xF53
	global	_UADDR
_UADDR	set	0xF5C
	global	_UEIE
_UEIE	set	0xF5B
	global	_UEIR
_UEIR	set	0xF5F
	global	_UEP1
_UEP1	set	0xF54
	global	_UEP0
_UEP0	set	0xF53
	global	_IPR2bits
_IPR2bits	set	0xFA2
	global	_UCON
_UCON	set	0xF64
	global	_USTAT
_USTAT	set	0xF63
	global	_PIR2bits
_PIR2bits	set	0xFA1
	global	_UIEbits
_UIEbits	set	0xF60
	global	_UIRbits
_UIRbits	set	0xF62
	global	_UIE
_UIE	set	0xF60
	global	_UCFG
_UCFG	set	0xF61
	global	_UIR
_UIR	set	0xF62
	global	_PIE1bits
_PIE1bits	set	0xF9D
	global	_TMR1L
_TMR1L	set	0xFCE
	global	_TMR1H
_TMR1H	set	0xFCF
	global	_TMR0H
_TMR0H	set	0xFD7
	global	_TMR0L
_TMR0L	set	0xFD6
	global	_RCONbits
_RCONbits	set	0xFD0
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_IPR1bits
_IPR1bits	set	0xF9F
	global	_T1CON
_T1CON	set	0xFCD
	global	_INTCONbits
_INTCONbits	set	0xFF2
	global	_INTCON2bits
_INTCON2bits	set	0xFF1
	global	_T0CON
_T0CON	set	0xFD5
	global	_TRISC
_TRISC	set	0xF94
	global	_LATC
_LATC	set	0xF8B
	global	_PORTC
_PORTC	set	0xF82
	global	_PORTB
_PORTB	set	0xF81
	global	_PORTA
_PORTA	set	0xF80
	global	_TRISA
_TRISA	set	0xF92
	global	_ANSELH
_ANSELH	set	0xF7F
	global	_UCONbits
_UCONbits	set	0xF64
	global	_PORTCbits
_PORTCbits	set	0xF82
	global	_TRISB
_TRISB	set	0xF93
	global	_ANSEL
_ANSEL	set	0xF7E
	global	_OSCCON
_OSCCON	set	0xFD3
	global	_SSPBUF
_SSPBUF	set	0xFC9
	global	_SSPSTAT
_SSPSTAT	set	0xFC7
	global	_SSPADD
_SSPADD	set	0xFC8
	global	_SSPCON2
_SSPCON2	set	0xFC5
	global	_SSPCON1
_SSPCON1	set	0xFC6
	global	_PIE2bits
_PIE2bits	set	0xFA0
	global	_LC0
_LC0	set	0x7C58
	global	_GIE
_GIE	set	0x7F97
	global	_ACKEN
_ACKEN	set	0x7E2C
	global	_ACKDT
_ACKDT	set	0x7E2D
	global	_RCEN
_RCEN	set	0x7E2B
	global	_SSPIF
_SSPIF	set	0x7CF3
	global	_PEN
_PEN	set	0x7E2A
	global	_RSEN
_RSEN	set	0x7E29
	global	_SEN
_SEN	set	0x7E28
	global	_LC4
_LC4	set	0x7C5C
	global	_cdc_data_tx

	DABS	1,608,32,_cdc_data_tx
	global	_CtrlTrfData

	DABS	1,568,8,_CtrlTrfData
	global	_cdc_notice

	DABS	1,655,10,_cdc_notice
	global	_cdc_data_rx

	DABS	1,640,8,_cdc_data_rx
	global	_line_coding

	DABS	1,648,7,_line_coding
; #config settings
global __CFG_CPUDIV$NOCLKDIV
__CFG_CPUDIV$NOCLKDIV equ 0x0
global __CFG_USBDIV$OFF
__CFG_USBDIV$OFF equ 0x0
global __CFG_FOSC$HS
__CFG_FOSC$HS equ 0x0
global __CFG_PLLEN$ON
__CFG_PLLEN$ON equ 0x0
global __CFG_PCLKEN$ON
__CFG_PCLKEN$ON equ 0x0
global __CFG_FCMEN$OFF
__CFG_FCMEN$OFF equ 0x0
global __CFG_IESO$OFF
__CFG_IESO$OFF equ 0x0
global __CFG_PWRTEN$OFF
__CFG_PWRTEN$OFF equ 0x0
global __CFG_BOREN$OFF
__CFG_BOREN$OFF equ 0x0
global __CFG_BORV$30
__CFG_BORV$30 equ 0x0
global __CFG_WDTEN$OFF
__CFG_WDTEN$OFF equ 0x0
global __CFG_WDTPS$32768
__CFG_WDTPS$32768 equ 0x0
global __CFG_HFOFST$OFF
__CFG_HFOFST$OFF equ 0x0
global __CFG_MCLRE$OFF
__CFG_MCLRE$OFF equ 0x0
global __CFG_STVREN$ON
__CFG_STVREN$ON equ 0x0
global __CFG_LVP$OFF
__CFG_LVP$OFF equ 0x0
global __CFG_XINST$OFF
__CFG_XINST$OFF equ 0x0
	file	"CDC - Basic.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMRAM,class=COMRAM,space=1,noexec
global __pbssCOMRAM
__pbssCOMRAM:
	global	_BaudRateGen
	global	_BaudRateGen
_BaudRateGen:
       ds      4
	global	_pDst
_pDst:
       ds      2
	global	_pBDTEntryEP0OutNext
_pBDTEntryEP0OutNext:
       ds      2
	global	_pBDTEntryEP0OutCurrent
_pBDTEntryEP0OutCurrent:
       ds      2
USBCBSendResume@delay_count:
       ds      2
	global	_USBDeferOUTDataStagePackets
_USBDeferOUTDataStagePackets:
       ds      1
	global	_USBDeferINDataStagePackets
_USBDeferINDataStagePackets:
       ds      1
	global	_USBStatusStageEnabledFlag2
_USBStatusStageEnabledFlag2:
       ds      1
	global	_USBStatusStageEnabledFlag1
_USBStatusStageEnabledFlag1:
       ds      1
	global	_USBDeferStatusStagePacket
_USBDeferStatusStagePacket:
       ds      1
	global	_USBStatusStageTimeoutCounter
_USBStatusStageTimeoutCounter:
       ds      1
	global	_BothEP0OutUOWNsSet
_BothEP0OutUOWNsSet:
       ds      1
	global	_endpoint_number
_endpoint_number:
       ds      1
	global	_controlTransferState
_controlTransferState:
       ds      1
	global	_shortPacketStatus
_shortPacketStatus:
       ds      1
	global	_USBBusIsSuspended
_USBBusIsSuspended:
       ds      1
	global	_RemoteWakeup
_RemoteWakeup:
       ds      1
	global	_control_signal_bitmap
_control_signal_bitmap:
       ds      1
	global	_USB_Out_Buffer
_USB_Out_Buffer:
       ds      8
	global	_dummy_encapsulated_cmd_response
_dummy_encapsulated_cmd_response:
       ds      8
	global	_USBAlternateInterface
_USBAlternateInterface:
       ds      2
	global	_USTATcopy
_USTATcopy:
       ds      1
	global	_USBActiveConfiguration
_USBActiveConfiguration:
       ds      1
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
	global	_outPipes
_outPipes:
       ds      8
	global	_pBDTEntryIn
_pBDTEntryIn:
       ds      6
	global	_pBDTEntryOut
_pBDTEntryOut:
       ds      6
	global	_tm_disp
_tm_disp:
       ds      6
	global	_inPipes
_inPipes:
       ds      6
	global	_ep_data_out
_ep_data_out:
       ds      3
	global	_ep_data_in
_ep_data_in:
       ds      3
	global	_tmp_disp
_tmp_disp:
       ds      3
	global	_pCDCDst
_pCDCDst:
       ds      3
	global	_pCDCSrc
_pCDCSrc:
       ds      3
	global	_ct_bit
_ct_bit:
       ds      2
	global	_cnt6s
_cnt6s:
       ds      2
	global	_cnt1hr
_cnt1hr:
       ds      2
	global	_cnt1min
_cnt1min:
       ds      2
	global	_cnt1s
_cnt1s:
       ds      2
	global	_cnt100ms
_cnt100ms:
       ds      2
	global	_CDCDataInHandle
_CDCDataInHandle:
       ds      2
	global	_CDCDataOutHandle
_CDCDataOutHandle:
       ds      2
	global	_LED_stat
_LED_stat:
       ds      1
	global	_g_TimeCnt
_g_TimeCnt:
       ds      1
	global	_USBDeviceState
_USBDeviceState:
       ds      1
	global	_cdc_mem_type
_cdc_mem_type:
       ds      1
	global	_cdc_tx_len
_cdc_tx_len:
       ds      1
	global	_cdc_trf_state
_cdc_trf_state:
       ds      1
	global	_cdc_rx_len
_cdc_rx_len:
       ds      1
	global	_USB_In_Buffer
_USB_In_Buffer:
       ds      32
psect	dataBANK0,class=BANK0,space=1,noexec,lowdata
global __pdataBANK0
__pdataBANK0:
	file	"C:\pic\PIC18F\test02\main.c"
	line	112
	global	_stat
_stat:
       ds      1
psect	bssBANK1,class=BANK1,space=1,noexec,lowdata
global __pbssBANK1
__pbssBANK1:
	global	_bitdata
_bitdata:
       ds      60
psect	dataBANK1,class=BANK1,space=1,noexec,lowdata
global __pdataBANK1
__pdataBANK1:
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	53
	global	_moji12
	global	_moji12
_moji12:
       ds      19
psect	dataBANK1
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	51
	global	_moji
	global	_moji
_moji:
       ds      18
psect	dataBANK1
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	54
	global	_moji2
	global	_moji2
_moji2:
       ds      9
psect	dataBANK1
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	52
	global	_moji11
_moji11:
       ds      19
	file	"CDC - Basic.as"
	line	#
psect	cinit
; Initialize objects allocated to BANK1 (65 bytes)
	global __pidataBANK1
	; load TBLPTR registers with __pidataBANK1
	movlw	low (__pidataBANK1)
	movwf	tblptrl
	movlw	high(__pidataBANK1)
	movwf	tblptrh
	movlw	low highword(__pidataBANK1)
	movwf	tblptru
	lfsr	0,__pdataBANK1
	lfsr	1,65
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
; Initialize objects allocated to BANK0 (1 bytes)
	global __pidataBANK0
	; load TBLPTR registers with __pidataBANK0
	movlw	low (__pidataBANK0)
	movwf	tblptrl
	movlw	high(__pidataBANK0)
	movwf	tblptrh
	movlw	low highword(__pidataBANK0)
	movwf	tblptru
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataBANK0+0		
	line	#
; Clear objects allocated to BANK1 (60 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	60
clear_0:
clrf	postinc0,c
decf	wreg
bnz	clear_0
; Clear objects allocated to BANK0 (102 bytes)
	global __pbssBANK0
lfsr	0,__pbssBANK0
movlw	102
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to COMRAM (45 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	45
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	bcf int$flags,0,c ;clear compiler interrupt flag (level 1)
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
movlb 0
goto _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1,noexec
global __pcstackBANK1
__pcstackBANK1:
?_I2C_Master_Init:	; 1 bytes @ 0x0
?_LCD_time:	; 1 bytes @ 0x0
	global	LCD_time@hr
LCD_time@hr:	; 2 bytes @ 0x0
	global	GRB_tblRD@i
GRB_tblRD@i:	; 2 bytes @ 0x0
	global	I2C_Master_Init@c
I2C_Master_Init@c:	; 4 bytes @ 0x0
	ds   2
	global	LCD_time@min
LCD_time@min:	; 2 bytes @ 0x2
	global	GRB_tblRD@j
GRB_tblRD@j:	; 2 bytes @ 0x2
	ds   2
??_I2C_Master_Init:	; 1 bytes @ 0x4
	global	LCD_time@sec
LCD_time@sec:	; 2 bytes @ 0x4
	ds   2
	global	LCD_time@wk
LCD_time@wk:	; 1 bytes @ 0x6
	ds   1
	global	LCD_time@tpr
LCD_time@tpr:	; 2 bytes @ 0x7
	ds   2
	global	LCD_time@tmp
LCD_time@tmp:	; 2 bytes @ 0x9
	ds   2
??_main:	; 1 bytes @ 0xB
	ds   2
	global	main@tmp_stat_cnt
main@tmp_stat_cnt:	; 2 bytes @ 0xD
	ds   2
	global	main@LED_num
main@LED_num:	; 2 bytes @ 0xF
	ds   2
	global	main@rotate
main@rotate:	; 2 bytes @ 0x11
	ds   2
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
??_YourLowPriorityISRCode:	; 1 bytes @ 0x0
	ds   21
??_USBCBSendResume:	; 1 bytes @ 0x15
??_USBDeviceAttach:	; 1 bytes @ 0x15
?_wait:	; 1 bytes @ 0x15
?_putUSBUSART:	; 1 bytes @ 0x15
??_I2C_Master_Wait:	; 1 bytes @ 0x15
??_PICinit:	; 1 bytes @ 0x15
??_I2C_nacksnd:	; 1 bytes @ 0x15
??_USBCBWakeFromSuspend:	; 1 bytes @ 0x15
??_code:	; 1 bytes @ 0x15
	global	?_USBTransferOnePacket
?_USBTransferOnePacket:	; 2 bytes @ 0x15
?_memset:	; 2 bytes @ 0x15
	global	?___wmul
?___wmul:	; 2 bytes @ 0x15
	global	?___awmod
?___awmod:	; 2 bytes @ 0x15
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x15
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x15
	global	code@x
code@x:	; 1 bytes @ 0x15
	global	USBTransferOnePacket@dir
USBTransferOnePacket@dir:	; 1 bytes @ 0x15
	global	putUSBUSART@data
putUSBUSART@data:	; 2 bytes @ 0x15
	global	wait@time
wait@time:	; 2 bytes @ 0x15
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x15
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x15
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x15
	global	memset@p1
memset@p1:	; 2 bytes @ 0x15
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x15
	ds   1
??_RGBdata_send:	; 1 bytes @ 0x16
??_I2C_Master_Start:	; 1 bytes @ 0x16
??_I2C_Master_Stop:	; 1 bytes @ 0x16
?_I2C_Master_Write:	; 1 bytes @ 0x16
	global	I2C_Master_Write@d
I2C_Master_Write@d:	; 2 bytes @ 0x16
	global	USBTransferOnePacket@data
USBTransferOnePacket@data:	; 2 bytes @ 0x16
	ds   1
??_wait:	; 1 bytes @ 0x17
	global	putUSBUSART@length
putUSBUSART@length:	; 1 bytes @ 0x17
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x17
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x17
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x17
	global	memset@c
memset@c:	; 2 bytes @ 0x17
	ds   1
??_putUSBUSART:	; 1 bytes @ 0x18
??_I2C_Master_Write:	; 1 bytes @ 0x18
??_writeData:	; 1 bytes @ 0x18
??_writeCommand:	; 1 bytes @ 0x18
??_I2C_Tsensor_CFG:	; 1 bytes @ 0x18
	global	?_I2C_Tsensor
?_I2C_Tsensor:	; 2 bytes @ 0x18
	global	USBTransferOnePacket@len
USBTransferOnePacket@len:	; 1 bytes @ 0x18
	global	RGBdata_send@i
RGBdata_send@i:	; 2 bytes @ 0x18
	ds   1
??_USBTransferOnePacket:	; 1 bytes @ 0x19
??___wmul:	; 1 bytes @ 0x19
??___awmod:	; 1 bytes @ 0x19
??___lwdiv:	; 1 bytes @ 0x19
	global	writeData@t_data
writeData@t_data:	; 1 bytes @ 0x19
	global	writeCommand@t_command
writeCommand@t_command:	; 1 bytes @ 0x19
	global	USBTransferOnePacket@ep
USBTransferOnePacket@ep:	; 1 bytes @ 0x19
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x19
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x19
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x19
	global	memset@n
memset@n:	; 2 bytes @ 0x19
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x19
	ds   1
?_LCD_str:	; 1 bytes @ 0x1A
??_I2C_Tsensor:	; 1 bytes @ 0x1A
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x1A
	global	LCD_str@c
LCD_str@c:	; 2 bytes @ 0x1A
	global	wait@g_TimeCnt_tmp
wait@g_TimeCnt_tmp:	; 2 bytes @ 0x1A
	global	USBTransferOnePacket@handle
USBTransferOnePacket@handle:	; 2 bytes @ 0x1A
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x1A
	ds   1
?_GRB_tblRD:	; 1 bytes @ 0x1B
??_memset:	; 1 bytes @ 0x1B
	global	GRB_tblRD@X
GRB_tblRD@X:	; 2 bytes @ 0x1B
	global	memset@p
memset@p:	; 2 bytes @ 0x1B
	ds   1
?_getsUSBUSART:	; 1 bytes @ 0x1C
??_CDCTxService:	; 1 bytes @ 0x1C
??_LCD_str:	; 1 bytes @ 0x1C
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x1C
	global	LCD_str@i
LCD_str@i:	; 1 bytes @ 0x1C
	global	getsUSBUSART@buffer
getsUSBUSART@buffer:	; 2 bytes @ 0x1C
	global	I2C_Tsensor@tpr
I2C_Tsensor@tpr:	; 2 bytes @ 0x1C
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x1C
	ds   1
??_USBDeviceInit:	; 1 bytes @ 0x1D
??___lldiv:	; 1 bytes @ 0x1D
	global	LCD_str@wk
LCD_str@wk:	; 1 bytes @ 0x1D
	global	USBDeviceInit@i
USBDeviceInit@i:	; 1 bytes @ 0x1D
	global	_CDCTxService$1511
_CDCTxService$1511:	; 2 bytes @ 0x1D
	global	GRB_tblRD@rotate
GRB_tblRD@rotate:	; 2 bytes @ 0x1D
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x1D
	ds   1
	global	getsUSBUSART@len
getsUSBUSART@len:	; 1 bytes @ 0x1E
	global	I2C_Tsensor@c
I2C_Tsensor@c:	; 1 bytes @ 0x1E
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x1E
	ds   1
??_GRB_tblRD:	; 1 bytes @ 0x1F
??_getsUSBUSART:	; 1 bytes @ 0x1F
	global	CDCTxService@i
CDCTxService@i:	; 1 bytes @ 0x1F
	ds   1
??___lwmod:	; 1 bytes @ 0x20
	global	CDCTxService@byte_to_send
CDCTxService@byte_to_send:	; 1 bytes @ 0x20
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x20
	global	_getsUSBUSART$1459
_getsUSBUSART$1459:	; 2 bytes @ 0x20
	ds   1
??_LCD_time:	; 1 bytes @ 0x21
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0x21
	ds   1
??_LCD_Init:	; 1 bytes @ 0x22
??_ProcessUSB:	; 1 bytes @ 0x22
	global	ProcessUSB@numBytesRead
ProcessUSB@numBytesRead:	; 1 bytes @ 0x22
	ds   2
psect	cstackCOMRAM,class=COMRAM,space=1,noexec
global __pcstackCOMRAM
__pcstackCOMRAM:
?_USBCBSendResume:	; 1 bytes @ 0x0
?_USBDeviceInit:	; 1 bytes @ 0x0
?_USBDeviceAttach:	; 1 bytes @ 0x0
?_RGBdata_send:	; 1 bytes @ 0x0
?_USBDeviceTasks:	; 1 bytes @ 0x0
?_USBWakeFromSuspend:	; 1 bytes @ 0x0
?_USBSuspend:	; 1 bytes @ 0x0
?_USBCtrlEPAllowStatusStage:	; 1 bytes @ 0x0
??_USBCtrlEPAllowStatusStage:	; 1 bytes @ 0x0
?_USBStallHandler:	; 1 bytes @ 0x0
??_USBStallHandler:	; 1 bytes @ 0x0
?_USBCtrlEPService:	; 1 bytes @ 0x0
?_USBConfigureEndpoint:	; 1 bytes @ 0x0
?_USBCtrlTrfTxService:	; 1 bytes @ 0x0
??_USBCtrlTrfTxService:	; 1 bytes @ 0x0
?_USBCtrlTrfSetupHandler:	; 1 bytes @ 0x0
?_USBCtrlTrfOutHandler:	; 1 bytes @ 0x0
?_USBCtrlTrfInHandler:	; 1 bytes @ 0x0
?_USBCheckStdRequest:	; 1 bytes @ 0x0
?_USBStdFeatureReqHandler:	; 1 bytes @ 0x0
?_CDCInitEP:	; 1 bytes @ 0x0
?_CDCTxService:	; 1 bytes @ 0x0
?_I2C_Master_Wait:	; 1 bytes @ 0x0
?_I2C_Master_Start:	; 1 bytes @ 0x0
?_I2C_Master_Stop:	; 1 bytes @ 0x0
?_writeData:	; 1 bytes @ 0x0
?_writeCommand:	; 1 bytes @ 0x0
?_PICinit:	; 1 bytes @ 0x0
?_LCD_Init:	; 1 bytes @ 0x0
?_I2C_nacksnd:	; 1 bytes @ 0x0
?_I2C_Tsensor_CFG:	; 1 bytes @ 0x0
?_ProcessUSB:	; 1 bytes @ 0x0
?_USBCBSuspend:	; 1 bytes @ 0x0
??_USBCBSuspend:	; 1 bytes @ 0x0
?_USBCBWakeFromSuspend:	; 1 bytes @ 0x0
?_USBCB_SOF_Handler:	; 1 bytes @ 0x0
??_USBCB_SOF_Handler:	; 1 bytes @ 0x0
?_USBCBErrorHandler:	; 1 bytes @ 0x0
??_USBCBErrorHandler:	; 1 bytes @ 0x0
?_USBCBCheckOtherReq:	; 1 bytes @ 0x0
??_USBCBCheckOtherReq:	; 1 bytes @ 0x0
?_USBCBStdSetDscHandler:	; 1 bytes @ 0x0
??_USBCBStdSetDscHandler:	; 1 bytes @ 0x0
?_USBCBInitEP:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_code:	; 1 bytes @ 0x0
?_YourHighPriorityISRCode:	; 1 bytes @ 0x0
?_YourLowPriorityISRCode:	; 1 bytes @ 0x0
?_USBCtrlEPAllowDataStage:	; 1 bytes @ 0x0
?_USBCtrlEPServiceComplete:	; 1 bytes @ 0x0
?_USBCtrlTrfRxService:	; 1 bytes @ 0x0
??_USBCtrlTrfRxService:	; 1 bytes @ 0x0
?_USBStdSetCfgHandler:	; 1 bytes @ 0x0
?_USBStdGetDscHandler:	; 1 bytes @ 0x0
??_USBStdGetDscHandler:	; 1 bytes @ 0x0
?i2_USBCBWakeFromSuspend:	; 1 bytes @ 0x0
??i2_USBCBWakeFromSuspend:	; 1 bytes @ 0x0
?i2_USBDeviceInit:	; 1 bytes @ 0x0
	global	?i2_USBTransferOnePacket
?i2_USBTransferOnePacket:	; 2 bytes @ 0x0
?i2_memset:	; 2 bytes @ 0x0
	global	USBConfigureEndpoint@direction
USBConfigureEndpoint@direction:	; 1 bytes @ 0x0
	global	i2USBTransferOnePacket@dir
i2USBTransferOnePacket@dir:	; 1 bytes @ 0x0
	global	i2memset@p1
i2memset@p1:	; 2 bytes @ 0x0
	ds   1
??_USBConfigureEndpoint:	; 1 bytes @ 0x1
	global	i2USBTransferOnePacket@data
i2USBTransferOnePacket@data:	; 2 bytes @ 0x1
	ds   1
	global	USBCtrlTrfTxService@byteToSend
USBCtrlTrfTxService@byteToSend:	; 1 bytes @ 0x2
	global	USBCtrlTrfRxService@i
USBCtrlTrfRxService@i:	; 1 bytes @ 0x2
	global	i2memset@c
i2memset@c:	; 2 bytes @ 0x2
	ds   1
??_USBCtrlTrfInHandler:	; 1 bytes @ 0x3
??_USBCtrlEPAllowDataStage:	; 1 bytes @ 0x3
??_USBCtrlEPServiceComplete:	; 1 bytes @ 0x3
	global	USBCtrlTrfRxService@byteToRead
USBCtrlTrfRxService@byteToRead:	; 1 bytes @ 0x3
	global	USBCtrlTrfInHandler@lastDTS
USBCtrlTrfInHandler@lastDTS:	; 1 bytes @ 0x3
	global	i2USBTransferOnePacket@len
i2USBTransferOnePacket@len:	; 1 bytes @ 0x3
	ds   1
??_USBCtrlTrfOutHandler:	; 1 bytes @ 0x4
??i2_USBTransferOnePacket:	; 1 bytes @ 0x4
	global	i2USBTransferOnePacket@ep
i2USBTransferOnePacket@ep:	; 1 bytes @ 0x4
	global	i2memset@n
i2memset@n:	; 2 bytes @ 0x4
	ds   1
	global	USBConfigureEndpoint@EPNum
USBConfigureEndpoint@EPNum:	; 1 bytes @ 0x5
	global	i2USBTransferOnePacket@handle
i2USBTransferOnePacket@handle:	; 2 bytes @ 0x5
	ds   1
??i2_memset:	; 1 bytes @ 0x6
	global	USBConfigureEndpoint@handle
USBConfigureEndpoint@handle:	; 2 bytes @ 0x6
	global	i2memset@p
i2memset@p:	; 2 bytes @ 0x6
	ds   2
?_USBEnableEndpoint:	; 1 bytes @ 0x8
??i2_USBDeviceInit:	; 1 bytes @ 0x8
	global	USBEnableEndpoint@options
USBEnableEndpoint@options:	; 1 bytes @ 0x8
	global	i2USBDeviceInit@i
i2USBDeviceInit@i:	; 1 bytes @ 0x8
	ds   1
??_USBEnableEndpoint:	; 1 bytes @ 0x9
	global	USBEnableEndpoint@p
USBEnableEndpoint@p:	; 2 bytes @ 0x9
	ds   2
	global	USBEnableEndpoint@ep
USBEnableEndpoint@ep:	; 1 bytes @ 0xB
	ds   1
??_CDCInitEP:	; 1 bytes @ 0xC
??_USBCBInitEP:	; 1 bytes @ 0xC
?_USER_USB_CALLBACK_EVENT_HANDLER:	; 1 bytes @ 0xC
	global	USER_USB_CALLBACK_EVENT_HANDLER@event
USER_USB_CALLBACK_EVENT_HANDLER@event:	; 2 bytes @ 0xC
	ds   2
	global	USER_USB_CALLBACK_EVENT_HANDLER@pdata
USER_USB_CALLBACK_EVENT_HANDLER@pdata:	; 2 bytes @ 0xE
	ds   2
	global	USER_USB_CALLBACK_EVENT_HANDLER@size
USER_USB_CALLBACK_EVENT_HANDLER@size:	; 2 bytes @ 0x10
	ds   2
??_USER_USB_CALLBACK_EVENT_HANDLER:	; 1 bytes @ 0x12
	ds   2
??_USBWakeFromSuspend:	; 1 bytes @ 0x14
??_USBSuspend:	; 1 bytes @ 0x14
??_USBStdFeatureReqHandler:	; 1 bytes @ 0x14
??_USBStdSetCfgHandler:	; 1 bytes @ 0x14
	global	USBStdSetCfgHandler@i
USBStdSetCfgHandler@i:	; 1 bytes @ 0x14
	ds   1
	global	USBStdFeatureReqHandler@pUEP
USBStdFeatureReqHandler@pUEP:	; 2 bytes @ 0x15
	ds   2
	global	USBStdFeatureReqHandler@current_ep_data
USBStdFeatureReqHandler@current_ep_data:	; 1 bytes @ 0x17
	ds   1
	global	USBStdFeatureReqHandler@p
USBStdFeatureReqHandler@p:	; 2 bytes @ 0x18
	ds   2
??_USBCtrlEPService:	; 1 bytes @ 0x1A
??_USBCtrlTrfSetupHandler:	; 1 bytes @ 0x1A
??_USBCheckStdRequest:	; 1 bytes @ 0x1A
	ds   2
	global	USBCtrlEPService@setup_cnt
USBCtrlEPService@setup_cnt:	; 1 bytes @ 0x1C
	ds   1
??_USBDeviceTasks:	; 1 bytes @ 0x1D
	global	USBDeviceTasks@i
USBDeviceTasks@i:	; 1 bytes @ 0x1D
	ds   1
??_YourHighPriorityISRCode:	; 1 bytes @ 0x1E
	ds   18
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    291
;!    Data        66
;!    BSS         207
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           94     48      93
;!    BANK0           160     36     139
;!    BANK1           256     19     144
;!    BANK2hl          32      0       0
;!    BANK2hh         103      0       0

;!
;!Pointer List with Targets:
;!
;!    USER_USB_CALLBACK_EVENT_HANDLER@pdata	PTR void  size(2) Largest target is 48
;!		 -> USTATcopy(COMRAM[1]), USBActiveConfiguration(COMRAM[1]), BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    memset@p1	PTR void  size(2) Largest target is 48
;!		 -> USBAlternateInterface(COMRAM[2]), BDT(BIGRAMl[48]), UEP1(SFR[1]), 
;!
;!    memset@p	PTR unsigned char  size(2) Largest target is 48
;!		 -> USBAlternateInterface(COMRAM[2]), BDT(BIGRAMl[48]), UEP1(SFR[1]), 
;!
;!    USBStdFeatureReqHandler@pUEP	PTR unsigned char  size(2) Largest target is 1
;!		 -> UEP0(SFR[1]), 
;!
;!    USBStdFeatureReqHandler@p	PTR struct __BDT size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    pDst	PTR volatile unsigned char  size(2) Largest target is 8
;!		 -> CtrlTrfData(BIGRAMhl[8]), NULL(NULL[0]), 
;!
;!    USBConfigureEndpoint@handle	PTR volatile struct __BDT size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), 
;!
;!    pBDTEntryEP0OutNext	PTR volatile struct __BDT size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    pBDTEntryEP0OutCurrent	PTR volatile struct __BDT size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    USBTransferOnePacket@data	PTR unsigned char  size(2) Largest target is 32
;!		 -> cdc_data_tx(BIGRAMhl[32]), NULL(NULL[0]), cdc_data_rx(BIGRAMhh[8]), 
;!
;!    USBTransferOnePacket@handle	PTR volatile struct __BDT size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    USBEnableEndpoint@p	PTR unsigned char  size(2) Largest target is 1
;!		 -> UEP0(SFR[1]), 
;!
;!    pBDTEntryOut	PTR volatile struct __BDT[3] size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    pBDTEntryIn	PTR volatile struct __BDT[3] size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    sp__memset	PTR void  size(2) Largest target is 48
;!		 -> USBAlternateInterface(COMRAM[2]), BDT(BIGRAMl[48]), UEP1(SFR[1]), 
;!
;!    GRB_tblRD@X	PTR unsigned char  size(2) Largest target is 30
;!		 -> GRB_tbl1(CODE[30]), 
;!
;!    LCD_str@c	PTR unsigned char  size(2) Largest target is 19
;!		 -> moji11(BANK1[19]), 
;!
;!    putUSBUSART@data	PTR unsigned char  size(2) Largest target is 32
;!		 -> USB_In_Buffer(BANK0[32]), 
;!
;!    getsUSBUSART@buffer	PTR unsigned char  size(2) Largest target is 8
;!		 -> USB_Out_Buffer(COMRAM[8]), 
;!
;!    CDCDataInHandle	PTR void  size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    sp__USBTransferOnePacket	PTR void  size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    CDCDataOutHandle	PTR void  size(2) Largest target is 48
;!		 -> BDT(BIGRAMl[48]), NULL(NULL[0]), 
;!
;!    S513$pFunc	PTR FTN()void  size(2) Largest target is 1
;!		 -> Absolute function(), 
;!
;!    outPipes.pFunc	PTR FTN()void  size(2) Largest target is 1
;!		 -> Absolute function(), 
;!
;!    S503$wRam	PTR unsigned short  size(2) Largest target is 0
;!
;!    outPipes.pDst.wRam	PTR unsigned short  size(2) Largest target is 0
;!
;!    S503$bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    outPipes.pDst.bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    S485$wRom	PTR const unsigned short  size(2) Largest target is 0
;!
;!    inPipes.pSrc.wRom	PTR const unsigned short  size(2) Largest target is 0
;!
;!    S485$wRam	PTR unsigned short  size(2) Largest target is 0
;!
;!    inPipes.pSrc.wRam	PTR unsigned short  size(2) Largest target is 0
;!
;!    S485$bRom	PTR const unsigned char  size(2) Largest target is 0
;!
;!    inPipes.pSrc.bRom	PTR const unsigned char  size(2) Largest target is 0
;!
;!    S485$bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    inPipes.pSrc.bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    pCDCDst.wRom	PTR const unsigned short  size(2) Largest target is 0
;!
;!    pCDCDst.bRom	PTR const unsigned char  size(2) Largest target is 0
;!
;!    pCDCDst.wRam	PTR unsigned short  size(2) Largest target is 0
;!
;!    pCDCDst.bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    S200_POINTER$wRom	PTR const unsigned short  size(2) Largest target is 0
;!
;!    pCDCSrc.wRom	PTR const unsigned short  size(2) Largest target is 0
;!
;!    S200_POINTER$bRom	PTR const unsigned char  size(2) Largest target is 0
;!
;!    pCDCSrc.bRom	PTR const unsigned char  size(2) Largest target is 0
;!
;!    S200_POINTER$wRam	PTR unsigned short  size(2) Largest target is 0
;!
;!    pCDCSrc.wRam	PTR unsigned short  size(2) Largest target is 0
;!
;!    S200_POINTER$bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    pCDCSrc.bRam	PTR unsigned char  size(2) Largest target is 0
;!
;!    USB_SD_Ptr	const PTR const unsigned char [3] size(2) Largest target is 52
;!		 -> sd002(CODE[52]), sd001(CODE[52]), sd000(CODE[4]), 
;!
;!    USB_CD_Ptr	const PTR const unsigned char [1] size(2) Largest target is 67
;!		 -> configDescriptor1(CODE[67]), 
;!


;!
;!Critical Paths under _main in COMRAM
;!
;!    None.
;!
;!Critical Paths under _YourLowPriorityISRCode in COMRAM
;!
;!    None.
;!
;!Critical Paths under _YourHighPriorityISRCode in COMRAM
;!
;!    _YourHighPriorityISRCode->_USBDeviceTasks
;!    _USBDeviceTasks->_USBCtrlEPService
;!    i2_USBDeviceInit->i2_memset
;!    _USBWakeFromSuspend->_USER_USB_CALLBACK_EVENT_HANDLER
;!    _USBSuspend->_USER_USB_CALLBACK_EVENT_HANDLER
;!    _USBCtrlEPAllowDataStage->_USBCtrlTrfTxService
;!    _USBCheckStdRequest->_USBStdFeatureReqHandler
;!    _USBStdSetCfgHandler->_USER_USB_CALLBACK_EVENT_HANDLER
;!    _USBStdFeatureReqHandler->_USER_USB_CALLBACK_EVENT_HANDLER
;!    _CDCInitEP->_USBEnableEndpoint
;!    _USBEnableEndpoint->_USBConfigureEndpoint
;!    _USBCtrlTrfOutHandler->_USBCtrlTrfRxService
;!    _USBCtrlTrfInHandler->_USBCtrlTrfTxService
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->_LCD_Init
;!    _main->_LCD_time
;!    _USBDeviceInit->_memset
;!    _RGBdata_send->_code
;!    _ProcessUSB->_getsUSBUSART
;!    _getsUSBUSART->_USBTransferOnePacket
;!    _CDCTxService->_USBTransferOnePacket
;!    _LCD_time->___lwmod
;!    ___lwmod->___lwdiv
;!    _I2C_Tsensor->_I2C_Master_Write
;!    _LCD_str->_writeData
;!    _writeData->_I2C_Master_Write
;!    _writeCommand->_I2C_Master_Write
;!    _I2C_Master_Init->___lldiv
;!    _I2C_Tsensor_CFG->_I2C_Master_Write
;!    _I2C_Master_Write->_I2C_Master_Wait
;!    _I2C_Master_Stop->_I2C_Master_Wait
;!    _I2C_Master_Start->_I2C_Master_Wait
;!    _GRB_tblRD->___awmod
;!
;!Critical Paths under _YourLowPriorityISRCode in BANK0
;!
;!    None.
;!
;!Critical Paths under _YourHighPriorityISRCode in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    _main->_LCD_time
;!    _LCD_Init->_I2C_Master_Init
;!
;!Critical Paths under _YourLowPriorityISRCode in BANK1
;!
;!    None.
;!
;!Critical Paths under _YourHighPriorityISRCode in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2hl
;!
;!    None.
;!
;!Critical Paths under _YourLowPriorityISRCode in BANK2hl
;!
;!    None.
;!
;!Critical Paths under _YourHighPriorityISRCode in BANK2hl
;!
;!    None.
;!
;!Critical Paths under _main in BANK2hh
;!
;!    None.
;!
;!Critical Paths under _YourLowPriorityISRCode in BANK2hh
;!
;!    None.
;!
;!Critical Paths under _YourHighPriorityISRCode in BANK2hh
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                12    12      0   28172
;!                                             11 BANK1      8     8      0
;!                          _GRB_tblRD
;!                    _I2C_Tsensor_CFG
;!                           _LCD_Init
;!                            _LCD_str
;!                           _LCD_time
;!                            _PICinit
;!                         _ProcessUSB
;!                       _RGBdata_send
;!                    _USBDeviceAttach
;!                      _USBDeviceInit
;!                               _wait
;!                       _writeCommand
;! ---------------------------------------------------------------------------------
;! (1) _wait                                                 7     5      2     306
;!                                             21 BANK0      7     5      2
;! ---------------------------------------------------------------------------------
;! (1) _USBDeviceInit                                        1     1      0    1541
;!                                             29 BANK0      1     1      0
;!                             _memset
;! ---------------------------------------------------------------------------------
;! (2) _memset                                               8     2      6    1250
;!                                             21 BANK0      8     2      6
;! ---------------------------------------------------------------------------------
;! (1) _USBDeviceAttach                                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _RGBdata_send                                         4     4      0     161
;!                                             22 BANK0      4     4      0
;!                               _code
;! ---------------------------------------------------------------------------------
;! (2) _code                                                 1     1      0      31
;!                                             21 BANK0      1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _ProcessUSB                                           2     2      0    4438
;!                                             34 BANK0      1     1      0
;!                       _CDCTxService
;!                    _USBCBSendResume
;!                       _getsUSBUSART
;!                        _putUSBUSART
;! ---------------------------------------------------------------------------------
;! (2) _putUSBUSART                                          3     0      3     300
;!                                             21 BANK0      3     0      3
;! ---------------------------------------------------------------------------------
;! (2) _getsUSBUSART                                         6     3      3    2134
;!                                             28 BANK0      6     3      3
;!               _USBTransferOnePacket
;! ---------------------------------------------------------------------------------
;! (2) _USBCBSendResume                                      0     0      0       0
;!               _USBCBWakeFromSuspend
;! ---------------------------------------------------------------------------------
;! (3) _USBCBWakeFromSuspend                                 0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _CDCTxService                                         5     5      0    2001
;!                                             28 BANK0      5     5      0
;!               _USBTransferOnePacket
;! ---------------------------------------------------------------------------------
;! (3) _USBTransferOnePacket                                 7     3      4    1763
;!                                             21 BANK0      7     3      4
;! ---------------------------------------------------------------------------------
;! (1) _PICinit                                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _LCD_time                                            16    10      6   13302
;!                                             33 BANK0      3     3      0
;!                                              0 BANK1     11     5      6
;!                        _I2C_Tsensor
;!                            ___lwdiv
;!                            ___lwmod
;!                             ___wmul
;!                          _writeData
;! ---------------------------------------------------------------------------------
;! (2) ___wmul                                               6     2      4    6014
;!                                             21 BANK0      6     2      4
;! ---------------------------------------------------------------------------------
;! (2) ___lwmod                                              5     1      4    2136
;!                                             28 BANK0      5     1      4
;!                            ___lwdiv (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___lwdiv                                              7     3      4    1193
;!                                             21 BANK0      7     3      4
;! ---------------------------------------------------------------------------------
;! (2) _I2C_Tsensor                                          7     5      2    1564
;!                                             24 BANK0      7     5      2
;!                   _I2C_Master_Start
;!                    _I2C_Master_Stop
;!                   _I2C_Master_Write
;!                        _I2C_nacksnd
;! ---------------------------------------------------------------------------------
;! (1) _LCD_str                                              4     2      2    1742
;!                                             26 BANK0      4     2      2
;!                          _writeData
;! ---------------------------------------------------------------------------------
;! (2) _writeData                                            2     2      0    1490
;!                                             24 BANK0      2     2      0
;!                   _I2C_Master_Start
;!                    _I2C_Master_Stop
;!                   _I2C_Master_Write
;! ---------------------------------------------------------------------------------
;! (1) _LCD_Init                                             2     2      0    2119
;!                                             34 BANK0      2     2      0
;!                    _I2C_Master_Init
;!                       _writeCommand
;! ---------------------------------------------------------------------------------
;! (1) _writeCommand                                         2     2      0    1490
;!                                             24 BANK0      2     2      0
;!                   _I2C_Master_Start
;!                    _I2C_Master_Stop
;!                   _I2C_Master_Write
;! ---------------------------------------------------------------------------------
;! (2) _I2C_Master_Init                                      8     4      4     629
;!                                              0 BANK1      8     4      4
;!                            ___lldiv
;! ---------------------------------------------------------------------------------
;! (3) ___lldiv                                             13     5      8     479
;!                                             21 BANK0     13     5      8
;! ---------------------------------------------------------------------------------
;! (1) _I2C_Tsensor_CFG                                      1     1      0    1459
;!                                             24 BANK0      1     1      0
;!                   _I2C_Master_Start
;!                    _I2C_Master_Stop
;!                   _I2C_Master_Write
;!                        _I2C_nacksnd
;! ---------------------------------------------------------------------------------
;! (3) _I2C_nacksnd                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _I2C_Master_Write                                     2     0      2    1459
;!                                             22 BANK0      2     0      2
;!                    _I2C_Master_Wait
;! ---------------------------------------------------------------------------------
;! (2) _I2C_Master_Stop                                      0     0      0       0
;!                    _I2C_Master_Wait
;! ---------------------------------------------------------------------------------
;! (2) _I2C_Master_Start                                     0     0      0       0
;!                    _I2C_Master_Wait
;! ---------------------------------------------------------------------------------
;! (3) _I2C_Master_Wait                                      1     1      0       0
;!                                             21 BANK0      1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _GRB_tblRD                                           12     8      4    1407
;!                                             27 BANK0      8     4      4
;!                                              0 BANK1      4     4      0
;!                            ___awmod
;! ---------------------------------------------------------------------------------
;! (2) ___awmod                                              6     2      4     671
;!                                             21 BANK0      6     2      4
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _YourLowPriorityISRCode                              23    23      0       0
;!                                              0 BANK0     21    21      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 5
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (6) _YourHighPriorityISRCode                             20    20      0   31927
;!                                             30 COMRAM    18    18      0
;!                     _USBDeviceTasks
;! ---------------------------------------------------------------------------------
;! (7) _USBDeviceTasks                                       1     1      0   31927
;!                                             29 COMRAM     1     1      0
;!          _USBCtrlEPAllowStatusStage
;!                   _USBCtrlEPService
;!                    _USBStallHandler
;!                         _USBSuspend
;!                 _USBWakeFromSuspend
;!    _USER_USB_CALLBACK_EVENT_HANDLER
;!                    i2_USBDeviceInit
;! ---------------------------------------------------------------------------------
;! (8) i2_USBDeviceInit                                      1     1      0     610
;!                                              8 COMRAM     1     1      0
;!                           i2_memset
;! ---------------------------------------------------------------------------------
;! (8) _USBWakeFromSuspend                                   0     0      0    4289
;!    _USER_USB_CALLBACK_EVENT_HANDLER
;! ---------------------------------------------------------------------------------
;! (8) _USBSuspend                                           0     0      0    4289
;!    _USER_USB_CALLBACK_EVENT_HANDLER
;! ---------------------------------------------------------------------------------
;! (8) _USBStallHandler                                      1     1      0       0
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (8) _USBCtrlEPService                                     3     3      0   18404
;!                                             26 COMRAM     3     3      0
;!                _USBCtrlTrfInHandler
;!               _USBCtrlTrfOutHandler
;!             _USBCtrlTrfSetupHandler
;! ---------------------------------------------------------------------------------
;! (9) _USBCtrlTrfSetupHandler                               0     0      0   18107
;!                 _USBCheckStdRequest
;!           _USBCtrlEPServiceComplete
;!    _USER_USB_CALLBACK_EVENT_HANDLER
;! ---------------------------------------------------------------------------------
;! (10) _USBCtrlEPServiceComplete                            0     0      0      92
;!            _USBCtrlEPAllowDataStage
;!          _USBCtrlEPAllowStatusStage
;! ---------------------------------------------------------------------------------
;! (11) _USBCtrlEPAllowDataStage                             0     0      0      92
;!                _USBCtrlTrfTxService
;! ---------------------------------------------------------------------------------
;! (10) _USBCheckStdRequest                                  0     0      0   13726
;!            _USBStdFeatureReqHandler
;!                _USBStdGetDscHandler
;!                _USBStdSetCfgHandler
;!    _USER_USB_CALLBACK_EVENT_HANDLER
;! ---------------------------------------------------------------------------------
;! (11) _USBStdSetCfgHandler                                 1     1      0    4787
;!                                             20 COMRAM     1     1      0
;!    _USER_USB_CALLBACK_EVENT_HANDLER
;!                           i2_memset
;! ---------------------------------------------------------------------------------
;! (9) i2_memset                                             8     2      6     408
;!                                              0 COMRAM     8     2      6
;! ---------------------------------------------------------------------------------
;! (11) _USBStdGetDscHandler                                 2     2      0       0
;!                                              0 COMRAM     2     2      0
;! ---------------------------------------------------------------------------------
;! (11) _USBStdFeatureReqHandler                             6     6      0    4650
;!                                             20 COMRAM     6     6      0
;!    _USER_USB_CALLBACK_EVENT_HANDLER
;! ---------------------------------------------------------------------------------
;! (8) _USER_USB_CALLBACK_EVENT_HANDLER                      8     2      6    4289
;!                                             12 COMRAM     8     2      6
;!                 _USBCBCheckOtherReq
;!                  _USBCBErrorHandler
;!                        _USBCBInitEP
;!              _USBCBStdSetDscHandler
;!                       _USBCBSuspend
;!                  _USBCB_SOF_Handler
;!             i2_USBCBWakeFromSuspend
;! ---------------------------------------------------------------------------------
;! (9) i2_USBCBWakeFromSuspend                               0     0      0       0
;! ---------------------------------------------------------------------------------
;! (9) _USBCB_SOF_Handler                                    0     0      0       0
;! ---------------------------------------------------------------------------------
;! (9) _USBCBSuspend                                         0     0      0       0
;! ---------------------------------------------------------------------------------
;! (9) _USBCBStdSetDscHandler                                0     0      0       0
;! ---------------------------------------------------------------------------------
;! (9) _USBCBInitEP                                          0     0      0    1177
;!                          _CDCInitEP
;! ---------------------------------------------------------------------------------
;! (10) _CDCInitEP                                           0     0      0    1177
;!                  _USBEnableEndpoint
;!             i2_USBTransferOnePacket
;! ---------------------------------------------------------------------------------
;! (11) i2_USBTransferOnePacket                              7     3      4     388
;!                                              0 COMRAM     7     3      4
;! ---------------------------------------------------------------------------------
;! (11) _USBEnableEndpoint                                   4     3      1     789
;!                                              8 COMRAM     4     3      1
;!               _USBConfigureEndpoint
;! ---------------------------------------------------------------------------------
;! (12) _USBConfigureEndpoint                                8     7      1     428
;!                                              0 COMRAM     8     7      1
;! ---------------------------------------------------------------------------------
;! (9) _USBCBErrorHandler                                    0     0      0       0
;! ---------------------------------------------------------------------------------
;! (9) _USBCBCheckOtherReq                                   0     0      0       0
;! ---------------------------------------------------------------------------------
;! (9) _USBCtrlTrfOutHandler                                 0     0      0     114
;!                _USBCtrlTrfRxService
;! ---------------------------------------------------------------------------------
;! (10) _USBCtrlTrfRxService                                 4     4      0     114
;!                                              0 COMRAM     4     4      0
;!          _USBCtrlEPAllowStatusStage
;! ---------------------------------------------------------------------------------
;! (11) _USBCtrlEPAllowStatusStage                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (9) _USBCtrlTrfInHandler                                  1     1      0     115
;!                                              3 COMRAM     1     1      0
;!                _USBCtrlTrfTxService
;! ---------------------------------------------------------------------------------
;! (12) _USBCtrlTrfTxService                                 3     3      0      92
;!                                              0 COMRAM     3     3      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 12
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _GRB_tblRD
;!     ___awmod
;!   _I2C_Tsensor_CFG
;!     _I2C_Master_Start
;!       _I2C_Master_Wait
;!     _I2C_Master_Stop
;!       _I2C_Master_Wait
;!     _I2C_Master_Write
;!       _I2C_Master_Wait
;!     _I2C_nacksnd
;!   _LCD_Init
;!     _I2C_Master_Init
;!       ___lldiv
;!     _writeCommand
;!       _I2C_Master_Start
;!         _I2C_Master_Wait
;!       _I2C_Master_Stop
;!         _I2C_Master_Wait
;!       _I2C_Master_Write
;!         _I2C_Master_Wait
;!   _LCD_str
;!     _writeData
;!       _I2C_Master_Start
;!         _I2C_Master_Wait
;!       _I2C_Master_Stop
;!         _I2C_Master_Wait
;!       _I2C_Master_Write
;!         _I2C_Master_Wait
;!   _LCD_time
;!     _I2C_Tsensor
;!       _I2C_Master_Start
;!         _I2C_Master_Wait
;!       _I2C_Master_Stop
;!         _I2C_Master_Wait
;!       _I2C_Master_Write
;!         _I2C_Master_Wait
;!       _I2C_nacksnd
;!     ___lwdiv
;!     ___lwmod
;!       ___lwdiv (ARG)
;!     ___wmul
;!     _writeData
;!       _I2C_Master_Start
;!         _I2C_Master_Wait
;!       _I2C_Master_Stop
;!         _I2C_Master_Wait
;!       _I2C_Master_Write
;!         _I2C_Master_Wait
;!   _PICinit
;!   _ProcessUSB
;!     _CDCTxService
;!       _USBTransferOnePacket
;!     _USBCBSendResume
;!       _USBCBWakeFromSuspend
;!     _getsUSBUSART
;!       _USBTransferOnePacket
;!     _putUSBUSART
;!   _RGBdata_send
;!     _code
;!   _USBDeviceAttach
;!   _USBDeviceInit
;!     _memset
;!   _wait
;!   _writeCommand
;!     _I2C_Master_Start
;!       _I2C_Master_Wait
;!     _I2C_Master_Stop
;!       _I2C_Master_Wait
;!     _I2C_Master_Write
;!       _I2C_Master_Wait
;!
;! _YourLowPriorityISRCode (ROOT)
;!
;! _YourHighPriorityISRCode (ROOT)
;!   _USBDeviceTasks
;!     _USBCtrlEPAllowStatusStage
;!     _USBCtrlEPService
;!       _USBCtrlTrfInHandler
;!         _USBCtrlTrfTxService
;!       _USBCtrlTrfOutHandler
;!         _USBCtrlTrfRxService
;!           _USBCtrlEPAllowStatusStage
;!       _USBCtrlTrfSetupHandler
;!         _USBCheckStdRequest
;!           _USBStdFeatureReqHandler
;!             _USER_USB_CALLBACK_EVENT_HANDLER
;!               _USBCBCheckOtherReq
;!               _USBCBErrorHandler
;!               _USBCBInitEP
;!                 _CDCInitEP
;!                   _USBEnableEndpoint
;!                     _USBConfigureEndpoint
;!                   i2_USBTransferOnePacket
;!               _USBCBStdSetDscHandler
;!               _USBCBSuspend
;!               _USBCB_SOF_Handler
;!               i2_USBCBWakeFromSuspend
;!           _USBStdGetDscHandler
;!           _USBStdSetCfgHandler
;!             _USER_USB_CALLBACK_EVENT_HANDLER
;!               _USBCBCheckOtherReq
;!               _USBCBErrorHandler
;!               _USBCBInitEP
;!                 _CDCInitEP
;!                   _USBEnableEndpoint
;!                     _USBConfigureEndpoint
;!                   i2_USBTransferOnePacket
;!               _USBCBStdSetDscHandler
;!               _USBCBSuspend
;!               _USBCB_SOF_Handler
;!               i2_USBCBWakeFromSuspend
;!             i2_memset
;!           _USER_USB_CALLBACK_EVENT_HANDLER
;!             _USBCBCheckOtherReq
;!             _USBCBErrorHandler
;!             _USBCBInitEP
;!               _CDCInitEP
;!                 _USBEnableEndpoint
;!                   _USBConfigureEndpoint
;!                 i2_USBTransferOnePacket
;!             _USBCBStdSetDscHandler
;!             _USBCBSuspend
;!             _USBCB_SOF_Handler
;!             i2_USBCBWakeFromSuspend
;!         _USBCtrlEPServiceComplete
;!           _USBCtrlEPAllowDataStage
;!             _USBCtrlTrfTxService
;!           _USBCtrlEPAllowStatusStage
;!         _USER_USB_CALLBACK_EVENT_HANDLER
;!           _USBCBCheckOtherReq
;!           _USBCBErrorHandler
;!           _USBCBInitEP
;!             _CDCInitEP
;!               _USBEnableEndpoint
;!                 _USBConfigureEndpoint
;!               i2_USBTransferOnePacket
;!           _USBCBStdSetDscHandler
;!           _USBCBSuspend
;!           _USBCB_SOF_Handler
;!           i2_USBCBWakeFromSuspend
;!     _USBStallHandler
;!     _USBSuspend
;!       _USER_USB_CALLBACK_EVENT_HANDLER
;!         _USBCBCheckOtherReq
;!         _USBCBErrorHandler
;!         _USBCBInitEP
;!           _CDCInitEP
;!             _USBEnableEndpoint
;!               _USBConfigureEndpoint
;!             i2_USBTransferOnePacket
;!         _USBCBStdSetDscHandler
;!         _USBCBSuspend
;!         _USBCB_SOF_Handler
;!         i2_USBCBWakeFromSuspend
;!     _USBWakeFromSuspend
;!       _USER_USB_CALLBACK_EVENT_HANDLER
;!         _USBCBCheckOtherReq
;!         _USBCBErrorHandler
;!         _USBCBInitEP
;!           _CDCInitEP
;!             _USBEnableEndpoint
;!               _USBConfigureEndpoint
;!             i2_USBTransferOnePacket
;!         _USBCBStdSetDscHandler
;!         _USBCBSuspend
;!         _USBCB_SOF_Handler
;!         i2_USBCBWakeFromSuspend
;!     _USER_USB_CALLBACK_EVENT_HANDLER
;!       _USBCBCheckOtherReq
;!       _USBCBErrorHandler
;!       _USBCBInitEP
;!         _CDCInitEP
;!           _USBEnableEndpoint
;!             _USBConfigureEndpoint
;!           i2_USBTransferOnePacket
;!       _USBCBStdSetDscHandler
;!       _USBCBSuspend
;!       _USBCB_SOF_Handler
;!       i2_USBCBWakeFromSuspend
;!     i2_USBDeviceInit
;!       i2_memset
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAMl            1FF      0       0      14        0.0%
;!EEDATA             100      0       0       0        0.0%
;!BITBANK1           100      0       0       5        0.0%
;!BANK1              100     13      90       6       56.3%
;!BITBANK0            A0      0       0       3        0.0%
;!BANK0               A0     24      8B       4       86.9%
;!BIGRAMhh            67      0       0      12        0.0%
;!BITBANK2hh          67      0       0       9        0.0%
;!BANK2hh             67      0       0      10        0.0%
;!BITCOMRAM           5E      0       0       0        0.0%
;!COMRAM              5E     30      5D       1       98.9%
;!BIGRAMhl            20      0       0      13        0.0%
;!BITBANK2hl          20      0       0      11        0.0%
;!BANK2hl             20      0       0       7        0.0%
;!BITSFR_1             0      0       0     200        0.0%
;!SFR_1                0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0     178       8        0.0%
;!DATA                 0      0     178      15        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 119 in file "C:\pic\PIC18F\test02\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  rotate          2   17[BANK1 ] int 
;;  LED_num         2   15[BANK1 ] int 
;;  tmp_stat_cnt    2   13[BANK1 ] unsigned short 
;;  tmp_stat        2    0        unsigned short 
;;  i               2    0        int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       6       0       0
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels required when called:   16
;; This function calls:
;;		_GRB_tblRD
;;		_I2C_Tsensor_CFG
;;		_LCD_Init
;;		_LCD_str
;;		_LCD_time
;;		_PICinit
;;		_ProcessUSB
;;		_RGBdata_send
;;		_USBDeviceAttach
;;		_USBDeviceInit
;;		_wait
;;		_writeCommand
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\main.c"
	line	119
global __ptext0
__ptext0:
psect	text0
	file	"C:\pic\PIC18F\test02\main.c"
	line	119
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	opt	stack 15
	line	121
	
l5453:
;main.c: 121: OSCCON = 0b00000000 ;
	movlw	low(0)
	movwf	((c:4051)),c	;volatile
	line	122
;main.c: 122: ANSEL = 0b00000000 ;
	movlw	low(0)
	movwf	((c:3966)),c	;volatile
	line	123
;main.c: 123: ANSELH = 0b00000000 ;
	movlw	low(0)
	movwf	((c:3967)),c	;volatile
	line	124
;main.c: 124: TRISA = 0b00000000 ;
	movlw	low(0)
	movwf	((c:3986)),c	;volatile
	line	125
;main.c: 125: TRISB = 0b00000000 ;
	movlw	low(0)
	movwf	((c:3987)),c	;volatile
	line	127
;main.c: 127: PORTA = 0b00000000 ;
	movlw	low(0)
	movwf	((c:3968)),c	;volatile
	line	128
;main.c: 128: PORTB = 0b00000000 ;
	movlw	low(0)
	movwf	((c:3969)),c	;volatile
	line	129
;main.c: 129: PORTC = 0b00000000 ;
	movlw	low(0)
	movwf	((c:3970)),c	;volatile
	line	131
	
l5455:
;main.c: 131: USBDeviceInit() ;
	call	_USBDeviceInit	;wreg free
	line	134
	
l5457:
;main.c: 134: int i,rotate=0;
	movlw	high(0)
	movlb	1	; () banked
	movwf	((main@rotate+1))&0ffh
	movlw	low(0)
	movwf	((main@rotate))&0ffh
	line	135
	
l5459:; BSR set to: 1

;main.c: 135: int LED_num=0;
	movlw	high(0)
	movwf	((main@LED_num+1))&0ffh
	movlw	low(0)
	movwf	((main@LED_num))&0ffh
	line	141
	
l5461:; BSR set to: 1

;main.c: 136: unsigned short tmp_stat,tmp_stat_cnt;
;main.c: 141: OSCCON = 0b01110000;
	movlw	low(070h)
	movwf	((c:4051)),c	;volatile
	line	143
	
l5463:; BSR set to: 1

;main.c: 143: LATC = 0;
	movlw	low(0)
	movwf	((c:3979)),c	;volatile
	line	144
	
l5465:; BSR set to: 1

;main.c: 144: TRISC = 0b00100000;
	movlw	low(020h)
	movwf	((c:3988)),c	;volatile
	line	150
	
l5467:; BSR set to: 1

;main.c: 150: T0CON = 0b10100100;
	movlw	low(0A4h)
	movwf	((c:4053)),c	;volatile
	line	154
	
l5469:; BSR set to: 1

;main.c: 154: INTCON2bits.TMR0IP = 1;
	bsf	((c:4081)),c,2	;volatile
	line	155
	
l5471:; BSR set to: 1

;main.c: 155: INTCONbits.TMR0IF = 0;
	bcf	((c:4082)),c,2	;volatile
	line	156
	
l5473:; BSR set to: 1

;main.c: 156: INTCONbits.TMR0IE = 1;
	bsf	((c:4082)),c,5	;volatile
	line	159
	
l5475:; BSR set to: 1

;main.c: 159: T1CON = 0b10110001;
	movlw	low(0B1h)
	movwf	((c:4045)),c	;volatile
	line	160
	
l5477:; BSR set to: 1

;main.c: 160: IPR1bits.TMR1IP = 0;
	bcf	((c:3999)),c,0	;volatile
	line	161
	
l5479:; BSR set to: 1

;main.c: 161: PIR1bits.TMR1IF = 0;
	bcf	((c:3998)),c,0	;volatile
	line	164
	
l5481:; BSR set to: 1

;main.c: 164: RCONbits.IPEN = 1;
	bsf	((c:4048)),c,7	;volatile
	line	165
	
l5483:; BSR set to: 1

;main.c: 165: INTCONbits.GIEH=1;
	bsf	((c:4082)),c,7	;volatile
	line	166
	
l5485:; BSR set to: 1

;main.c: 166: INTCONbits.GIEL=1;
	bsf	((c:4082)),c,6	;volatile
	line	169
	
l5487:; BSR set to: 1

;main.c: 169: PICinit();
	call	_PICinit	;wreg free
	line	170
	
l5489:
;main.c: 170: LCD_Init();
	call	_LCD_Init	;wreg free
	line	171
	
l5491:
;main.c: 171: writeCommand(0x01);
	movlw	(01h)&0ffh
	
	call	_writeCommand
	line	172
	
l5493:
;main.c: 172: _delay((unsigned long)((20)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	104
	movlb	1	; () banked
movwf	(??_main+0+0)&0ffh,f
	movlw	228
u4947:
decfsz	wreg,f
	bra	u4947
	decfsz	(??_main+0+0)&0ffh,f
	bra	u4947
	nop
opt asmopt_pop

	line	173
	
l5495:
;main.c: 173: writeCommand(0x02);
	movlw	(02h)&0ffh
	
	call	_writeCommand
	line	174
	
l5497:
;main.c: 174: _delay((unsigned long)((2)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	11
	movlb	1	; () banked
movwf	(??_main+0+0)&0ffh,f
	movlw	98
u4957:
decfsz	wreg,f
	bra	u4957
	decfsz	(??_main+0+0)&0ffh,f
	bra	u4957
	nop
opt asmopt_pop

	line	176
	
l5499:
;main.c: 176: I2C_Tsensor_CFG();
	call	_I2C_Tsensor_CFG	;wreg free
	line	179
	
l5501:
;main.c: 179: stat = active;
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_stat))&0ffh
	goto	l5503
	line	180
;main.c: 180: while(1){
	
l417:; BSR set to: 0

	line	182
	
l5503:
;main.c: 182: if(cnt100ms >= 10){
	movlb	0	; () banked
		movf	((_cnt100ms+1))&0ffh,w
	bnz	u4840
	movlw	10
	subwf	 ((_cnt100ms))&0ffh,w
	btfss	status,0
	goto	u4841
	goto	u4840

u4841:
	goto	l5543
u4840:
	line	183
	
l5505:; BSR set to: 0

;main.c: 183: cnt100ms=0;
	movlw	high(0)
	movwf	((_cnt100ms+1))&0ffh
	movlw	low(0)
	movwf	((_cnt100ms))&0ffh
	line	184
	
l5507:; BSR set to: 0

;main.c: 184: cnt1s++;
	infsnz	((_cnt1s))&0ffh
	incf	((_cnt1s+1))&0ffh
	line	205
	
l5509:; BSR set to: 0

;main.c: 205: cnt6s++;
	infsnz	((_cnt6s))&0ffh
	incf	((_cnt6s+1))&0ffh
	line	206
	
l5511:; BSR set to: 0

;main.c: 206: if(cnt6s == 6){
		movlw	6
	xorwf	((_cnt6s))&0ffh,w
iorwf	((_cnt6s+1))&0ffh,w
	btfss	status,2
	goto	u4851
	goto	u4850

u4851:
	goto	l5515
u4850:
	line	207
	
l5513:; BSR set to: 0

;main.c: 207: cnt6s = 0;
	movlw	high(0)
	movwf	((_cnt6s+1))&0ffh
	movlw	low(0)
	movwf	((_cnt6s))&0ffh
	line	208
;main.c: 208: LED_stat = still;
	movlw	low(0)
	movwf	((_LED_stat))&0ffh
	goto	l5515
	line	210
	
l419:; BSR set to: 0

	line	214
	
l5515:; BSR set to: 0

;main.c: 210: }
;main.c: 214: if(cnt1s == 60){
		movlw	60
	xorwf	((_cnt1s))&0ffh,w
iorwf	((_cnt1s+1))&0ffh,w
	btfss	status,2
	goto	u4861
	goto	u4860

u4861:
	goto	l5521
u4860:
	line	215
	
l5517:; BSR set to: 0

;main.c: 215: cnt1s = 0;
	movlw	high(0)
	movwf	((_cnt1s+1))&0ffh
	movlw	low(0)
	movwf	((_cnt1s))&0ffh
	line	216
	
l5519:; BSR set to: 0

;main.c: 216: cnt1min++;
	infsnz	((_cnt1min))&0ffh
	incf	((_cnt1min+1))&0ffh
	goto	l5521
	line	217
	
l420:; BSR set to: 0

	line	220
	
l5521:; BSR set to: 0

;main.c: 217: }
;main.c: 220: if(cnt1min == 60){
		movlw	60
	xorwf	((_cnt1min))&0ffh,w
iorwf	((_cnt1min+1))&0ffh,w
	btfss	status,2
	goto	u4871
	goto	u4870

u4871:
	goto	l5527
u4870:
	line	221
	
l5523:; BSR set to: 0

;main.c: 221: cnt1min = 0;
	movlw	high(0)
	movwf	((_cnt1min+1))&0ffh
	movlw	low(0)
	movwf	((_cnt1min))&0ffh
	line	222
	
l5525:; BSR set to: 0

;main.c: 222: cnt1hr++;
	infsnz	((_cnt1hr))&0ffh
	incf	((_cnt1hr+1))&0ffh
	goto	l5527
	line	223
	
l421:; BSR set to: 0

	line	225
	
l5527:; BSR set to: 0

;main.c: 223: }
;main.c: 225: writeCommand(0x02);
	movlw	(02h)&0ffh
	
	call	_writeCommand
	line	226
	
l5529:
;main.c: 226: LCD_str(moji11);
		movlw	low(_moji11)
	movlb	0	; () banked
	movwf	((LCD_str@c))&0ffh
	movlw	high(_moji11)
	movwf	((LCD_str@c+1))&0ffh

	call	_LCD_str	;wreg free
	line	227
	
l5531:
;main.c: 227: writeCommand(0x40+0x80);
	movlw	(0C0h)&0ffh
	
	call	_writeCommand
	line	228
	
l5533:
;main.c: 228: LCD_time(cnt1hr, cnt1min, cnt1s);
	movff	(_cnt1hr),(LCD_time@hr)
	movff	(_cnt1hr+1),(LCD_time@hr+1)
	movff	(_cnt1min),(LCD_time@min)
	movff	(_cnt1min+1),(LCD_time@min+1)
	movff	(_cnt1s),(LCD_time@sec)
	movff	(_cnt1s+1),(LCD_time@sec+1)
	call	_LCD_time	;wreg free
	line	232
	
l5535:
;main.c: 236: if(1 && (USBDeviceState == DETACHED_STATE)) {
	movlb	0	; () banked
	movf	((_cnt100ms))&0ffh,w
iorwf	((_cnt100ms+1))&0ffh,w
	btfss	status,2
	goto	u4881
	goto	u4880

u4881:
	goto	l5543
u4880:
	line	236
	
l5537:; BSR set to: 0

	movf	((_USBDeviceState))&0ffh,w	;volatile
	btfss	status,2
	goto	u4891
	goto	u4890
u4891:
	goto	l5541
u4890:
	line	237
	
l5539:; BSR set to: 0

;main.c: 237: USBDeviceAttach() ;
	call	_USBDeviceAttach	;wreg free
	goto	l5541
	line	238
	
l423:
	line	245
	
l5541:
;main.c: 238: }
;main.c: 245: ProcessUSB() ;
	call	_ProcessUSB	;wreg free
	goto	l5543
	line	246
	
l422:
	goto	l5543
	line	250
	
l418:
	line	253
	
l5543:
;main.c: 246: }
;main.c: 250: }
;main.c: 253: if(stat == active && LED_stat == still){
	movlb	0	; () banked
		decf	((_stat))&0ffh,w
	btfss	status,2
	goto	u4901
	goto	u4900

u4901:
	goto	l5575
u4900:
	
l5545:; BSR set to: 0

	movf	((_LED_stat))&0ffh,w
	btfss	status,2
	goto	u4911
	goto	u4910
u4911:
	goto	l5575
u4910:
	line	254
	
l5547:; BSR set to: 0

;main.c: 254: stat = busy;
	movlw	low(0)
	movwf	((_stat))&0ffh
	line	255
;main.c: 255: ct_bit=0;
	movlw	high(0)
	movwf	((_ct_bit+1))&0ffh
	movlw	low(0)
	movwf	((_ct_bit))&0ffh
	line	259
;main.c: 259: switch(LED_num){
	goto	l5553
	line	260
;main.c: 260: case 0:
	
l426:; BSR set to: 0

	line	262
	
l5549:
;main.c: 262: GRB_tblRD(GRB_tbl1,rotate);
		movlw	low(_GRB_tbl1)
	movlb	0	; () banked
	movwf	((GRB_tblRD@X))&0ffh
	movlw	high(_GRB_tbl1)
	movwf	((GRB_tblRD@X+1))&0ffh

	movff	(main@rotate),(GRB_tblRD@rotate)
	movff	(main@rotate+1),(GRB_tblRD@rotate+1)
	call	_GRB_tblRD	;wreg free
	line	263
;main.c: 263: break;
	goto	l5555
	line	264
;main.c: 264: case 1:
	
l428:
	line	265
	
l5551:
;main.c: 265: GRB_tblRD(GRB_tbl1,rotate);
		movlw	low(_GRB_tbl1)
	movlb	0	; () banked
	movwf	((GRB_tblRD@X))&0ffh
	movlw	high(_GRB_tbl1)
	movwf	((GRB_tblRD@X+1))&0ffh

	movff	(main@rotate),(GRB_tblRD@rotate)
	movff	(main@rotate+1),(GRB_tblRD@rotate+1)
	call	_GRB_tblRD	;wreg free
	line	266
;main.c: 266: break;
	goto	l5555
	line	267
;main.c: 267: default:;
	
l429:
	line	268
;main.c: 268: }
	goto	l5555
	line	259
	
l425:
	
l5553:
	movff	(main@LED_num),??_main+0+0
	movff	(main@LED_num+1),??_main+0+0+1
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
;	Chosen strategy is simple_byte

	movlb	1	; () banked
	movf ??_main+0+1&0ffh,w
	xorlw	0^0	; case 0
	skipnz
	goto	l5653
	goto	l5555
	
l5653:; BSR set to: 1

; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 1
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
;	Chosen strategy is simple_byte

	movf ??_main+0+0&0ffh,w
	xorlw	0^0	; case 0
	skipnz
	goto	l5549
	xorlw	1^0	; case 1
	skipnz
	goto	l5551
	goto	l5555

	line	268
	
l427:; BSR set to: 1

	line	277
;main.c: 277: while(tmp_stat_cnt >= 0x6D84+ 37500/10*2){
	goto	l5555
	
l431:; BSR set to: 1

	line	278
;main.c: 278: tmp_stat_cnt = *(unsigned short *)(& TMR0L);
	movff	0+((c:4054)),(main@tmp_stat_cnt)	;volatile
	movff	1+((c:4054)),(main@tmp_stat_cnt+1)	;volatile
	line	279
;main.c: 279: tmp_stat_cnt = *(unsigned short *)(& TMR0L);
	movff	0+((c:4054)),(main@tmp_stat_cnt)	;volatile
	movff	1+((c:4054)),(main@tmp_stat_cnt+1)	;volatile
	goto	l5555
	line	280
	
l430:; BSR set to: 1

	line	277
	
l5555:
		movlw	208
	movlb	1	; () banked
	subwf	 ((main@tmp_stat_cnt))&0ffh,w
	movlw	138
	subwfb	((main@tmp_stat_cnt+1))&0ffh,w
	btfsc	status,0
	goto	u4921
	goto	u4920

u4921:
	goto	l431
u4920:
	
l432:; BSR set to: 1

	line	284
;main.c: 280: }
;main.c: 284: GIE=0;
	bcf	c:(32663/8),(32663)&7	;volatile
	line	285
	
l5557:; BSR set to: 1

;main.c: 285: RGBdata_send();
	call	_RGBdata_send	;wreg free
	line	286
	
l5559:
;main.c: 286: GIE=1;
	bsf	c:(32663/8),(32663)&7	;volatile
	line	321
	
l5561:
;main.c: 321: wait(1);
	movlw	high(01h)
	movlb	0	; () banked
	movwf	((wait@time+1))&0ffh
	movlw	low(01h)
	movwf	((wait@time))&0ffh
	call	_wait	;wreg free
	line	348
	
l5563:
;main.c: 348: if(rotate>=30-3){
	movlb	1	; () banked
	btfsc	((main@rotate+1))&0ffh,7
	goto	u4931
	movf	((main@rotate+1))&0ffh,w
	bnz	u4930
	movlw	27
	subwf	 ((main@rotate))&0ffh,w
	btfss	status,0
	goto	u4931
	goto	u4930

u4931:
	goto	l5569
u4930:
	line	349
	
l5565:; BSR set to: 1

;main.c: 349: rotate=0;
	movlw	high(0)
	movwf	((main@rotate+1))&0ffh
	movlw	low(0)
	movwf	((main@rotate))&0ffh
	line	350
	
l5567:; BSR set to: 1

;main.c: 350: LED_num = 0b1 & ~LED_num;
	comf	((main@LED_num))&0ffh,w

	movwf	(??_main+0+0)&0ffh
	comf	((main@LED_num+1))&0ffh,w
	movwf	1+(??_main+0+0)&0ffh
	
	movlw	01h
	andwf	(??_main+0+0)&0ffh,w
	movwf	((main@LED_num))&0ffh
	clrf	1+((main@LED_num))&0ffh
	line	351
;main.c: 351: }else{
	goto	l5571
	
l433:; BSR set to: 1

	line	352
	
l5569:; BSR set to: 1

;main.c: 352: rotate+=3;
	movlw	03h
	addwf	((main@rotate))&0ffh
	movlw	0
	addwfc	((main@rotate+1))&0ffh
	goto	l5571
	line	353
	
l434:; BSR set to: 1

	line	355
	
l5571:; BSR set to: 1

;main.c: 353: }
;main.c: 355: LED_stat = already;
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_LED_stat))&0ffh
	line	356
	
l5573:; BSR set to: 0

;main.c: 356: stat = active;
	movlw	low(01h)
	movwf	((_stat))&0ffh
	goto	l5575
	line	357
	
l424:; BSR set to: 0

	line	359
	
l5575:; BSR set to: 0

;main.c: 357: }
;main.c: 359: wait(1);
	movlw	high(01h)
	movwf	((wait@time+1))&0ffh
	movlw	low(01h)
	movwf	((wait@time))&0ffh
	call	_wait	;wreg free
	goto	l5503
	line	361
	
l435:
	line	180
	goto	l5503
	
l436:
	line	365
	
l437:
	global	start
	goto	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_wait

;; *************** function _wait *****************
;; Defined at:
;;		line 566 in file "C:\pic\PIC18F\test02\main.c"
;; Parameters:    Size  Location     Type
;;  time            2   21[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  g_TimeCnt_tm    2   26[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	566
global __ptext1
__ptext1:
psect	text1
	file	"C:\pic\PIC18F\test02\main.c"
	line	566
	global	__size_of_wait
	__size_of_wait	equ	__end_of_wait-_wait
	
_wait:
;incstack = 0
	opt	stack 18
	line	567
	
l5435:
;main.c: 567: int g_TimeCnt_tmp=0;
	movlw	high(0)
	movlb	0	; () banked
	movwf	((wait@g_TimeCnt_tmp+1))&0ffh
	movlw	low(0)
	movwf	((wait@g_TimeCnt_tmp))&0ffh
	line	569
;main.c: 569: g_TimeCnt=0;
	movlw	low(0)
	movwf	((_g_TimeCnt))&0ffh	;volatile
	line	572
;main.c: 572: TMR1H = 0xFE;
	movlw	low(0FEh)
	movwf	((c:4047)),c	;volatile
	line	573
;main.c: 573: TMR1L = 0x12;
	movlw	low(012h)
	movwf	((c:4046)),c	;volatile
	line	575
;main.c: 575: TMR1H = 0xFE;
	movlw	low(0FEh)
	movwf	((c:4047)),c	;volatile
	line	576
;main.c: 576: TMR1L = 0x12;
	movlw	low(012h)
	movwf	((c:4046)),c	;volatile
	line	578
;main.c: 578: TMR1H = 0xFE;
	movlw	low(0FEh)
	movwf	((c:4047)),c	;volatile
	line	579
;main.c: 579: TMR1L = 0x12;
	movlw	low(012h)
	movwf	((c:4046)),c	;volatile
	line	581
;main.c: 581: TMR1H = 0xFE;
	movlw	low(0FEh)
	movwf	((c:4047)),c	;volatile
	line	582
;main.c: 582: TMR1L = 0x12;
	movlw	low(012h)
	movwf	((c:4046)),c	;volatile
	line	587
	
l5437:; BSR set to: 0

;main.c: 587: PIR1bits.TMR1IF = 0;
	bcf	((c:3998)),c,0	;volatile
	line	588
	
l5439:; BSR set to: 0

;main.c: 588: PIE1bits.TMR1IE = 1;
	bsf	((c:3997)),c,0	;volatile
	line	591
;main.c: 591: while( g_TimeCnt_tmp+g_TimeCnt < time ){
	goto	l5447
	
l476:; BSR set to: 0

	line	592
	
l5441:; BSR set to: 0

;main.c: 592: if(g_TimeCnt == 200 ){
		movlw	200
	xorwf	((_g_TimeCnt))&0ffh,w	;volatile
	btfss	status,2
	goto	u4821
	goto	u4820

u4821:
	goto	l5447
u4820:
	line	593
	
l5443:; BSR set to: 0

;main.c: 593: g_TimeCnt_tmp +=200;
	movlw	0C8h
	addwf	((wait@g_TimeCnt_tmp))&0ffh
	movlw	0
	addwfc	((wait@g_TimeCnt_tmp+1))&0ffh
	line	594
	
l5445:; BSR set to: 0

;main.c: 594: g_TimeCnt=0;
	movlw	low(0)
	movwf	((_g_TimeCnt))&0ffh	;volatile
	goto	l5447
	line	595
	
l477:; BSR set to: 0

	goto	l5447
	line	596
	
l475:; BSR set to: 0

	line	591
	
l5447:; BSR set to: 0

	movf	((_g_TimeCnt))&0ffh,w	;volatile
	addwf	((wait@g_TimeCnt_tmp))&0ffh,w
	movwf	(??_wait+0+0)&0ffh
	movlw	0
	addwfc	((wait@g_TimeCnt_tmp+1))&0ffh,w
	movwf	(??_wait+0+0+1)&0ffh
		movf	((wait@time))&0ffh,w
	subwf	(??_wait+0+0)&0ffh,w
	movf	(??_wait+0+1)&0ffh,w
	xorlw	80h
	movwf	(??_wait+2+0)&0ffh
	movf	((wait@time+1))&0ffh,w
	xorlw	80h
	subwfb	(??_wait+2+0)&0ffh,w
	btfss	status,0
	goto	u4831
	goto	u4830

u4831:
	goto	l5441
u4830:
	
l478:; BSR set to: 0

	line	620
;main.c: 595: }
;main.c: 596: }
;main.c: 620: PIE1bits.TMR1IE = 0;
	bcf	((c:3997)),c,0	;volatile
	line	621
	
l479:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_wait
	__end_of_wait:
	signat	_wait,4217
	global	_USBDeviceInit

;; *************** function _USBDeviceInit *****************
;; Defined at:
;;		line 190 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   29[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		_memset
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	190
global __ptext2
__ptext2:
psect	text2
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	190
	global	__size_of_USBDeviceInit
	__size_of_USBDeviceInit	equ	__end_of_USBDeviceInit-_USBDeviceInit
	
_USBDeviceInit:; BSR set to: 0

;incstack = 0
	opt	stack 17
	line	195
	
l5309:
;usb_device.c: 192: BYTE i;
;usb_device.c: 195: PIE2bits.USBIE = 0 ;
	bcf	((c:4000)),c,2	;volatile
	line	196
	
l5311:
;usb_device.c: 196: UEIR = 0 ;
	movlw	low(0)
	movlb	15	; () banked
	movwf	((3935))&0ffh	;volatile
	line	197
;usb_device.c: 197: UIR = 0 ;
	movlw	low(0)
	movwf	((c:3938)),c	;volatile
	line	198
;usb_device.c: 198: UEP0 = 0 ;
	movlw	low(0)
	movwf	((3923))&0ffh	;volatile
	line	200
	
l5313:; BSR set to: 15

;usb_device.c: 200: memset((void*)&UEP1,0x00,2) ;
		movlw	low(3924)
	movlb	0	; () banked
	movwf	((memset@p1))&0ffh
	movlw	high(3924)
	movwf	((memset@p1+1))&0ffh

	movlw	high(0)
	movwf	((memset@c+1))&0ffh
	movlw	low(0)
	movwf	((memset@c))&0ffh
	movlw	high(02h)
	movwf	((memset@n+1))&0ffh
	movlw	low(02h)
	movwf	((memset@n))&0ffh
	call	_memset	;wreg free
	line	202
	
l5315:
;usb_device.c: 202: UCFG = 0b00010100 | 0x02 ;
	movlw	low(016h)
	movwf	((c:3937)),c	;volatile
	line	203
	
l5317:
;usb_device.c: 203: UEIE = 0b10011111 ;
	movlw	low(09Fh)
	movlb	15	; () banked
	movwf	((3931))&0ffh	;volatile
	line	204
	
l5319:; BSR set to: 15

;usb_device.c: 204: UIE = 0b00111011 | 0x40 ;
	movlw	low(07Bh)
	movwf	((c:3936)),c	;volatile
	line	207
	
l5321:; BSR set to: 15

;usb_device.c: 207: for(i=0;i<(sizeof(BDT)/sizeof(BDT_ENTRY));i++) {
	movlw	low(0)
	movlb	0	; () banked
	movwf	((USBDeviceInit@i))&0ffh
	
l5323:; BSR set to: 0

		movlw	0Ch-1
	cpfsgt	((USBDeviceInit@i))&0ffh
	goto	u4651
	goto	u4650

u4651:
	goto	l5327
u4650:
	goto	l611
	
l5325:; BSR set to: 0

	goto	l611
	
l610:; BSR set to: 0

	line	208
	
l5327:; BSR set to: 0

;usb_device.c: 208: BDT[i].Val = 0x00;
	movf	((USBDeviceInit@i))&0ffh,w
	mullw	04h
	movlw	low(512)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(512)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	clrf	postinc2,c
	clrf	postinc2,c
	clrf	postinc2,c
	clrf	postdec2,c

	line	207
	
l5329:; BSR set to: 0

	incf	((USBDeviceInit@i))&0ffh
	
l5331:; BSR set to: 0

		movlw	0Ch-1
	cpfsgt	((USBDeviceInit@i))&0ffh
	goto	u4661
	goto	u4660

u4661:
	goto	l5327
u4660:
	
l611:; BSR set to: 0

	line	211
;usb_device.c: 209: }
;usb_device.c: 211: UCONbits.PPBRST = 1 ;
	bsf	((c:3940)),c,6	;volatile
	line	212
	
l5333:; BSR set to: 0

;usb_device.c: 212: UADDR = 0 ;
	movlw	low(0)
	movlb	15	; () banked
	movwf	((3932))&0ffh	;volatile
	line	213
	
l5335:; BSR set to: 15

;usb_device.c: 213: UCONbits.PKTDIS = 0 ;
	bcf	((c:3940)),c,4	;volatile
	line	214
	
l5337:; BSR set to: 15

;usb_device.c: 214: UCONbits.PPBRST = 0 ;
	bcf	((c:3940)),c,6	;volatile
	line	217
;usb_device.c: 217: while(UIRbits.TRNIF == 1) {
	goto	l5341
	
l613:
	line	218
;usb_device.c: 218: UIRbits.TRNIF = 0 ;
	bcf	((c:3938)),c,3	;volatile
	line	220
	
l5339:
;usb_device.c: 220: inPipes[0].info.Val = 0;
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_inPipes+03h))&0ffh	;volatile
	line	221
;usb_device.c: 221: outPipes[0].info.Val = 0;
	movlw	low(0)
	movwf	(0+(_outPipes+03h))&0ffh	;volatile
	line	222
;usb_device.c: 222: outPipes[0].wCount.Val = 0;
	movlw	high(0)
	movwf	(1+(_outPipes+04h))&0ffh	;volatile
	movlw	low(0)
	movwf	(0+(_outPipes+04h))&0ffh	;volatile
	goto	l5341
	line	223
	
l612:; BSR set to: 0

	line	217
	
l5341:
	btfsc	((c:3938)),c,3	;volatile
	goto	u4671
	goto	u4670
u4671:
	goto	l613
u4670:
	goto	l5343
	
l614:
	line	226
	
l5343:
;usb_device.c: 223: }
;usb_device.c: 226: USBStatusStageEnabledFlag1 = TRUE;
	movlw	low(01h)
	movwf	((c:_USBStatusStageEnabledFlag1)),c	;volatile
	line	227
;usb_device.c: 227: USBStatusStageEnabledFlag2 = TRUE;
	movlw	low(01h)
	movwf	((c:_USBStatusStageEnabledFlag2)),c	;volatile
	line	229
;usb_device.c: 229: USBDeferINDataStagePackets = FALSE;
	movlw	low(0)
	movwf	((c:_USBDeferINDataStagePackets)),c	;volatile
	line	230
;usb_device.c: 230: USBDeferOUTDataStagePackets = FALSE;
	movlw	low(0)
	movwf	((c:_USBDeferOUTDataStagePackets)),c	;volatile
	line	231
;usb_device.c: 231: USBBusIsSuspended = FALSE;
	movlw	low(0)
	movwf	((c:_USBBusIsSuspended)),c	;volatile
	line	234
;usb_device.c: 234: for(i = 0; i < (BYTE)(2+1u); i++) {
	movlw	low(0)
	movlb	0	; () banked
	movwf	((USBDeviceInit@i))&0ffh
	
l5345:; BSR set to: 0

		movlw	03h-1
	cpfsgt	((USBDeviceInit@i))&0ffh
	goto	u4681
	goto	u4680

u4681:
	goto	l5349
u4680:
	goto	l5355
	
l5347:; BSR set to: 0

	goto	l5355
	
l615:; BSR set to: 0

	line	235
	
l5349:; BSR set to: 0

;usb_device.c: 235: pBDTEntryIn[i] = 0u;
	movf	((USBDeviceInit@i))&0ffh,w
	mullw	02h
	movlw	low(_pBDTEntryIn)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryIn)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	postinc2,c
	movlw	high(0)
	movwf	postdec2,c
	line	236
;usb_device.c: 236: pBDTEntryOut[i] = 0u;
	movf	((USBDeviceInit@i))&0ffh,w
	mullw	02h
	movlw	low(_pBDTEntryOut)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryOut)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	postinc2,c
	movlw	high(0)
	movwf	postdec2,c
	line	237
;usb_device.c: 237: ep_data_in[i].Val = 0u;
	movf	((USBDeviceInit@i))&0ffh,w
	mullw	01h
	movlw	low(_ep_data_in)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_in)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	line	238
;usb_device.c: 238: ep_data_out[i].Val = 0u;
	movf	((USBDeviceInit@i))&0ffh,w
	mullw	01h
	movlw	low(_ep_data_out)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_out)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	line	234
	
l5351:; BSR set to: 0

	incf	((USBDeviceInit@i))&0ffh
	
l5353:; BSR set to: 0

		movlw	03h-1
	cpfsgt	((USBDeviceInit@i))&0ffh
	goto	u4691
	goto	u4690

u4691:
	goto	l5349
u4690:
	goto	l5355
	
l616:; BSR set to: 0

	line	242
	
l5355:; BSR set to: 0

;usb_device.c: 239: }
;usb_device.c: 242: pBDTEntryIn[0] = (volatile BDT_ENTRY*)&BDT[2];
		movlw	low(512+08h)
	movwf	((_pBDTEntryIn))&0ffh
	movlw	high(512+08h)
	movwf	((_pBDTEntryIn+1))&0ffh

	line	245
	
l5357:; BSR set to: 0

;usb_device.c: 245: UEP0 = 0b00010110 ;
	movlw	low(016h)
	movlb	15	; () banked
	movwf	((3923))&0ffh	;volatile
	line	247
	
l5359:; BSR set to: 15

;usb_device.c: 247: BDT[0].ADR = ((WORD)(&SetupPkt));
	movlw	high(0230h)
	movlb	2	; () banked
	movwf	(1+(512+02h))&0ffh	;volatile
	movlw	low(0230h)
	movwf	(0+(512+02h))&0ffh	;volatile
	line	248
	
l5361:; BSR set to: 2

;usb_device.c: 248: BDT[0].CNT = 8;
	movlw	low(08h)
	movwf	(0+(512+01h))&0ffh	;volatile
	line	249
	
l5363:; BSR set to: 2

;usb_device.c: 249: BDT[0].STAT.Val = 0x80|0x00|0x04;
	movlw	low(084h)
	movwf	((512))&0ffh	;volatile
	line	252
	
l5365:; BSR set to: 2

;usb_device.c: 252: USBActiveConfiguration = 0;
	movlw	low(0)
	movwf	((c:_USBActiveConfiguration)),c	;volatile
	line	255
	
l5367:; BSR set to: 2

;usb_device.c: 255: USBDeviceState = DETACHED_STATE;
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_USBDeviceState))&0ffh	;volatile
	line	256
	
l617:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBDeviceInit
	__end_of_USBDeviceInit:
	signat	_USBDeviceInit,89
	global	_memset

;; *************** function _memset *****************
;; Defined at:
;;		line 8 in file "C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\memset.c"
;; Parameters:    Size  Location     Type
;;  p1              2   21[BANK0 ] PTR void 
;;		 -> USBAlternateInterface(2), BDT(48), UEP1(1), 
;;  c               2   23[BANK0 ] int 
;;  n               2   25[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  p               2   27[BANK0 ] PTR unsigned char 
;;		 -> USBAlternateInterface(2), BDT(48), UEP1(1), 
;; Return value:  Size  Location     Type
;;                  2   21[BANK0 ] PTR void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       6       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBDeviceInit
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\memset.c"
	line	8
global __ptext3
__ptext3:
psect	text3
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\memset.c"
	line	8
	global	__size_of_memset
	__size_of_memset	equ	__end_of_memset-_memset
	
_memset:; BSR set to: 0

;incstack = 0
	opt	stack 17
	line	18
	
l5057:
		movff	(memset@p1),(memset@p)
	movff	(memset@p1+1),(memset@p+1)

	line	19
	goto	l5063
	
l1266:
	line	20
	
l5059:
	movff	(memset@p),fsr2l
	movff	(memset@p+1),fsr2h
	movff	(memset@c),indf2

	
l5061:
	movlb	0	; () banked
	infsnz	((memset@p))&0ffh
	incf	((memset@p+1))&0ffh
	goto	l5063
	
l1265:; BSR set to: 0

	line	19
	
l5063:
	movlb	0	; () banked
	decf	((memset@n))&0ffh
	btfss	status,0
	decf	((memset@n+1))&0ffh
		incf	((memset@n))&0ffh,w
	bnz	u4441
	incf	((memset@n+1))&0ffh,w
	btfss	status,2
	goto	u4441
	goto	u4440

u4441:
	goto	l5059
u4440:
	goto	l1268
	
l1267:; BSR set to: 0

	line	22
;	Return value of _memset is never used
	
l1268:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_memset
	__end_of_memset:
	signat	_memset,12410
	global	_USBDeviceAttach

;; *************** function _USBDeviceAttach *****************
;; Defined at:
;;		line 566 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	566
global __ptext4
__ptext4:
psect	text4
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	566
	global	__size_of_USBDeviceAttach
	__size_of_USBDeviceAttach	equ	__end_of_USBDeviceAttach-_USBDeviceAttach
	
_USBDeviceAttach:; BSR set to: 0

;incstack = 0
	opt	stack 18
	line	569
	
l5369:
;usb_device.c: 571: if(1 == 1) {
	movlb	0	; () banked
	movf	((_USBDeviceState))&0ffh,w	;volatile
	btfss	status,2
	goto	u4701
	goto	u4700
u4701:
	goto	l666
u4700:
	line	572
	
l5371:; BSR set to: 0

;usb_device.c: 572: UCON = 0;
	movlw	low(0)
	movwf	((c:3940)),c	;volatile
	line	573
;usb_device.c: 573: UIE = 0;
	movlw	low(0)
	movwf	((c:3936)),c	;volatile
	line	575
;usb_device.c: 575: UCFG = 0b00010100 | 0x02 ;
	movlw	low(016h)
	movwf	((c:3937)),c	;volatile
	line	576
;usb_device.c: 576: UEIE = 0b10011111 ;
	movlw	low(09Fh)
	movlb	15	; () banked
	movwf	((3931))&0ffh	;volatile
	line	577
;usb_device.c: 577: UIE = 0b00111011 | 0x40 ;
	movlw	low(07Bh)
	movwf	((c:3936)),c	;volatile
	line	579
	
l5373:; BSR set to: 15

;usb_device.c: 579: RCONbits.IPEN = 1 ;
	bsf	((c:4048)),c,7	;volatile
	line	580
	
l5375:; BSR set to: 15

;usb_device.c: 580: IPR2bits.USBIP = 1 ;
	bsf	((c:4002)),c,2	;volatile
	line	581
	
l5377:; BSR set to: 15

;usb_device.c: 581: PIE2bits.USBIE = 1 ;
	bsf	((c:4000)),c,2	;volatile
	line	582
	
l5379:; BSR set to: 15

;usb_device.c: 582: INTCONbits.GIEH = 1 ;
	bsf	((c:4082)),c,7	;volatile
	line	585
;usb_device.c: 585: while (!UCONbits.USBEN){
	goto	l663
	
l664:
	line	586
;usb_device.c: 586: UCONbits.USBEN = 1 ;
	bsf	((c:3940)),c,3	;volatile
	line	587
	
l663:
	line	585
	btfss	((c:3940)),c,3	;volatile
	goto	u4711
	goto	u4710
u4711:
	goto	l664
u4710:
	goto	l5381
	
l665:
	line	589
	
l5381:
;usb_device.c: 587: }
;usb_device.c: 589: USBDeviceState = ATTACHED_STATE;
	movlw	low(01h)
	movlb	0	; () banked
	movwf	((_USBDeviceState))&0ffh	;volatile
	goto	l666
	line	590
	
l662:; BSR set to: 0

	goto	l666
	line	591
	
l661:; BSR set to: 0

	line	592
	
l666:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBDeviceAttach
	__end_of_USBDeviceAttach:
	signat	_USBDeviceAttach,89
	global	_RGBdata_send

;; *************** function _RGBdata_send *****************
;; Defined at:
;;		line 440 in file "C:\pic\PIC18F\test02\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   24[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		_code
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\main.c"
	line	440
global __ptext5
__ptext5:
psect	text5
	file	"C:\pic\PIC18F\test02\main.c"
	line	440
	global	__size_of_RGBdata_send
	__size_of_RGBdata_send	equ	__end_of_RGBdata_send-_RGBdata_send
	
_RGBdata_send:; BSR set to: 0

;incstack = 0
	opt	stack 17
	line	442
	
l5411:
;main.c: 441: int i;
;main.c: 442: for(i=0;i<60;i+=2){
	movlw	high(0)
	movlb	0	; () banked
	movwf	((RGBdata_send@i+1))&0ffh
	movlw	low(0)
	movwf	((RGBdata_send@i))&0ffh
	
l5413:; BSR set to: 0

	btfsc	((RGBdata_send@i+1))&0ffh,7
	goto	u4781
	movf	((RGBdata_send@i+1))&0ffh,w
	bnz	u4780
	movlw	60
	subwf	 ((RGBdata_send@i))&0ffh,w
	btfss	status,0
	goto	u4781
	goto	u4780

u4781:
	goto	l5417
u4780:
	goto	l460
	
l5415:; BSR set to: 0

	goto	l460
	
l454:; BSR set to: 0

	line	444
	
l5417:; BSR set to: 0

;main.c: 444: code(0);
	movlw	(0)&0ffh
	
	call	_code
	line	445
;main.c: 445: code(0);
	movlw	(0)&0ffh
	
	call	_code
	line	446
;main.c: 446: code(0);
	movlw	(0)&0ffh
	
	call	_code
	line	447
;main.c: 447: code(0);
	movlw	(0)&0ffh
	
	call	_code
	line	449
	
l5419:
;main.c: 449: if(bitdata[i] ){
	movlw	low(_bitdata)
	movlb	0	; () banked
	addwf	((RGBdata_send@i))&0ffh,w
	movwf	c:fsr2l
	movlw	high(_bitdata)
	addwfc	((RGBdata_send@i+1))&0ffh,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u4791
	goto	u4790
u4791:
	goto	l5423
u4790:
	line	450
	
l5421:; BSR set to: 0

;main.c: 450: code(1);
	movlw	(01h)&0ffh
	
	call	_code
	line	451
;main.c: 451: }else{
	goto	l5425
	
l456:
	line	452
	
l5423:
;main.c: 452: code(0);
	movlw	(0)&0ffh
	
	call	_code
	goto	l5425
	line	453
	
l457:
	line	455
	
l5425:
;main.c: 453: }
;main.c: 455: if(bitdata[i+1] ){
	movlw	01h
	movlb	0	; () banked
	addwf	((RGBdata_send@i))&0ffh,w
	movwf	(??_RGBdata_send+0+0)&0ffh
	movlw	0
	addwfc	((RGBdata_send@i+1))&0ffh,w
	movwf	(??_RGBdata_send+0+0+1)&0ffh
	movlw	low(_bitdata)
	addwf	(??_RGBdata_send+0+0)&0ffh,w
	movwf	c:fsr2l
	movlw	high(_bitdata)
	addwfc	(??_RGBdata_send+0+1)&0ffh,w
	movwf	1+c:fsr2l
	movf	indf2,w
	btfsc	status,2
	goto	u4801
	goto	u4800
u4801:
	goto	l5429
u4800:
	line	456
	
l5427:; BSR set to: 0

;main.c: 456: code(1);
	movlw	(01h)&0ffh
	
	call	_code
	line	457
;main.c: 457: }else{
	goto	l459
	
l458:
	line	458
	
l5429:
;main.c: 458: code(0);
	movlw	(0)&0ffh
	
	call	_code
	line	459
	
l459:
	line	461
;main.c: 459: }
;main.c: 461: code(0);
	movlw	(0)&0ffh
	
	call	_code
	line	462
;main.c: 462: code(0);
	movlw	(0)&0ffh
	
	call	_code
	line	442
	
l5431:
	movlw	02h
	movlb	0	; () banked
	addwf	((RGBdata_send@i))&0ffh
	movlw	0
	addwfc	((RGBdata_send@i+1))&0ffh
	
l5433:; BSR set to: 0

	btfsc	((RGBdata_send@i+1))&0ffh,7
	goto	u4811
	movf	((RGBdata_send@i+1))&0ffh,w
	bnz	u4810
	movlw	60
	subwf	 ((RGBdata_send@i))&0ffh,w
	btfss	status,0
	goto	u4811
	goto	u4810

u4811:
	goto	l5417
u4810:
	goto	l460
	
l455:; BSR set to: 0

	line	465
	
l460:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_RGBdata_send
	__end_of_RGBdata_send:
	signat	_RGBdata_send,89
	global	_code

;; *************** function _code *****************
;; Defined at:
;;		line 367 in file "C:\pic\PIC18F\test02\main.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RGBdata_send
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	367
global __ptext6
__ptext6:
psect	text6
	file	"C:\pic\PIC18F\test02\main.c"
	line	367
	global	__size_of_code
	__size_of_code	equ	__end_of_code-_code
	
_code:; BSR set to: 0

;incstack = 0
	opt	stack 17
;code@x stored from wreg
	movlb	0	; () banked
	movwf	((code@x))&0ffh
	line	368
	
l5053:
;main.c: 368: if(x & 0b1){
	movlb	0	; () banked
	
	btfss	((code@x))&0ffh,(0)&7
	goto	u4431
	goto	u4430
u4431:
	goto	l440
u4430:
	line	369
	
l5055:; BSR set to: 0

;main.c: 369: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	370
;main.c: 370: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	371
;main.c: 371: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	373
;main.c: 373: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	374
;main.c: 374: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	375
;main.c: 375: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	377
;main.c: 377: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	378
;main.c: 378: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	379
;main.c: 379: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	381
;main.c: 381: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	382
;main.c: 382: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	383
;main.c: 383: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	385
;main.c: 385: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	386
;main.c: 386: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	388
;main.c: 388: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	389
;main.c: 389: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	391
;main.c: 391: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	392
;main.c: 392: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	394
;main.c: 394: }else{
	goto	l442
	
l440:; BSR set to: 0

	line	395
;main.c: 395: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	396
;main.c: 396: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	398
;main.c: 398: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	399
;main.c: 399: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	401
;main.c: 401: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	402
;main.c: 402: LC0 = 0b00000001;
	bsf	c:(31832/8),(31832)&7	;volatile
	line	405
;main.c: 405: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	406
;main.c: 406: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	407
;main.c: 407: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	409
;main.c: 409: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	410
;main.c: 410: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	411
;main.c: 411: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	413
;main.c: 413: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	414
;main.c: 414: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	415
;main.c: 415: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	417
;main.c: 417: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	418
;main.c: 418: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	line	419
;main.c: 419: LC0 = 0b00000000;
	bcf	c:(31832/8),(31832)&7	;volatile
	goto	l442
	line	421
	
l441:; BSR set to: 0

	line	422
	
l442:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_code
	__end_of_code:
	signat	_code,4217
	global	_ProcessUSB

;; *************** function _ProcessUSB *****************
;; Defined at:
;;		line 79 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  numBytesRead    1   34[BANK0 ] unsigned char 
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   14
;; This function calls:
;;		_CDCTxService
;;		_USBCBSendResume
;;		_getsUSBUSART
;;		_putUSBUSART
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	79
global __ptext7
__ptext7:
psect	text7
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	79
	global	__size_of_ProcessUSB
	__size_of_ProcessUSB	equ	__end_of_ProcessUSB-_ProcessUSB
	
_ProcessUSB:; BSR set to: 0

;incstack = 0
	opt	stack 16
	line	84
	
l5255:
;usb_set.h: 81: BYTE numBytesRead ;
;usb_set.h: 82: BYTE i ;
;usb_set.h: 84: if(PORTCbits.RC0 == 0) {
	btfsc	((c:3970)),c,0	;volatile
	goto	u4611
	goto	u4610
u4611:
	goto	l5259
u4610:
	line	85
	
l5257:
;usb_set.h: 85: USBCBSendResume() ;
	call	_USBCBSendResume	;wreg free
	goto	l5259
	line	86
	
l334:
	line	89
	
l5259:
;usb_set.h: 86: }
;usb_set.h: 89: if ( (USBDeviceState < CONFIGURED_STATE) || (UCONbits.SUSPND == 1) ) return ;
		movlw	020h-1
	movlb	0	; () banked
	cpfsgt	((_USBDeviceState))&0ffh	;volatile
	goto	u4621
	goto	u4620

u4621:
	goto	l338
u4620:
	
l5261:; BSR set to: 0

	btfss	((c:3940)),c,1	;volatile
	goto	u4631
	goto	u4630
u4631:
	goto	l5263
u4630:
	goto	l338
	
l337:; BSR set to: 0

	goto	l338
	
l335:; BSR set to: 0

	line	92
	
l5263:; BSR set to: 0

;usb_set.h: 92: if ((cdc_trf_state == 0)) {
	movf	((_cdc_trf_state))&0ffh,w
	btfss	status,2
	goto	u4641
	goto	u4640
u4641:
	goto	l5307
u4640:
	line	93
	
l5265:; BSR set to: 0

;usb_set.h: 93: numBytesRead = getsUSBUSART(USB_Out_Buffer,64) ;
		movlw	low(_USB_Out_Buffer)
	movwf	((getsUSBUSART@buffer))&0ffh
	movlw	high(_USB_Out_Buffer)
	movwf	((getsUSBUSART@buffer+1))&0ffh

	movlw	low(040h)
	movwf	((getsUSBUSART@len))&0ffh
	call	_getsUSBUSART	;wreg free
	movlb	0	; () banked
	movwf	((ProcessUSB@numBytesRead))&0ffh
	line	98
	
l5267:; BSR set to: 0

;usb_set.h: 98: USB_In_Buffer[0] = 'T';
	movlw	low(054h)
	movwf	((_USB_In_Buffer))&0ffh
	line	99
	
l5269:; BSR set to: 0

;usb_set.h: 99: USB_In_Buffer[1] = 'E';
	movlw	low(045h)
	movwf	(0+(_USB_In_Buffer+01h))&0ffh
	line	100
	
l5271:; BSR set to: 0

;usb_set.h: 100: USB_In_Buffer[2] = 'S';
	movlw	low(053h)
	movwf	(0+(_USB_In_Buffer+02h))&0ffh
	line	101
	
l5273:; BSR set to: 0

;usb_set.h: 101: USB_In_Buffer[3] = 'T';
	movlw	low(054h)
	movwf	(0+(_USB_In_Buffer+03h))&0ffh
	line	102
	
l5275:; BSR set to: 0

;usb_set.h: 102: USB_In_Buffer[4] = ' ';
	movlw	low(020h)
	movwf	(0+(_USB_In_Buffer+04h))&0ffh
	line	104
	
l5277:; BSR set to: 0

;usb_set.h: 104: USB_In_Buffer[5] = tm_disp[0];
	movff	(_tm_disp),0+(_USB_In_Buffer+05h)
	line	105
	
l5279:; BSR set to: 0

;usb_set.h: 105: USB_In_Buffer[6] = tm_disp[1];
	movff	0+(_tm_disp+01h),0+(_USB_In_Buffer+06h)
	line	106
	
l5281:; BSR set to: 0

;usb_set.h: 106: USB_In_Buffer[7] = ':';
	movlw	low(03Ah)
	movwf	(0+(_USB_In_Buffer+07h))&0ffh
	line	107
	
l5283:; BSR set to: 0

;usb_set.h: 107: USB_In_Buffer[8] = tm_disp[2];
	movff	0+(_tm_disp+02h),0+(_USB_In_Buffer+08h)
	line	108
	
l5285:; BSR set to: 0

;usb_set.h: 108: USB_In_Buffer[9] = tm_disp[3];
	movff	0+(_tm_disp+03h),0+(_USB_In_Buffer+09h)
	line	109
	
l5287:; BSR set to: 0

;usb_set.h: 109: USB_In_Buffer[10] = ':';
	movlw	low(03Ah)
	movwf	(0+(_USB_In_Buffer+0Ah))&0ffh
	line	110
	
l5289:; BSR set to: 0

;usb_set.h: 110: USB_In_Buffer[11] = tm_disp[4];
	movff	0+(_tm_disp+04h),0+(_USB_In_Buffer+0Bh)
	line	111
	
l5291:; BSR set to: 0

;usb_set.h: 111: USB_In_Buffer[12] = tm_disp[5];
	movff	0+(_tm_disp+05h),0+(_USB_In_Buffer+0Ch)
	line	113
	
l5293:; BSR set to: 0

;usb_set.h: 113: USB_In_Buffer[13] = ' ';
	movlw	low(020h)
	movwf	(0+(_USB_In_Buffer+0Dh))&0ffh
	line	115
	
l5295:; BSR set to: 0

;usb_set.h: 115: USB_In_Buffer[14] = tmp_disp[0];
	movff	(_tmp_disp),0+(_USB_In_Buffer+0Eh)
	line	116
	
l5297:; BSR set to: 0

;usb_set.h: 116: USB_In_Buffer[15] = tmp_disp[1];
	movff	0+(_tmp_disp+01h),0+(_USB_In_Buffer+0Fh)
	line	117
	
l5299:; BSR set to: 0

;usb_set.h: 117: USB_In_Buffer[16] = '.';
	movlw	low(02Eh)
	movwf	(0+(_USB_In_Buffer+010h))&0ffh
	line	118
	
l5301:; BSR set to: 0

;usb_set.h: 118: USB_In_Buffer[17] = tmp_disp[2];
	movff	0+(_tmp_disp+02h),0+(_USB_In_Buffer+011h)
	line	120
	
l5303:; BSR set to: 0

;usb_set.h: 120: USB_In_Buffer[18] = 0x0A;
	movlw	low(0Ah)
	movwf	(0+(_USB_In_Buffer+012h))&0ffh
	line	139
	
l5305:; BSR set to: 0

;usb_set.h: 139: putUSBUSART(USB_In_Buffer,19) ;
		movlw	low(_USB_In_Buffer)
	movwf	((putUSBUSART@data))&0ffh
	movlw	high(_USB_In_Buffer)
	movwf	((putUSBUSART@data+1))&0ffh

	movlw	low(013h)
	movwf	((putUSBUSART@length))&0ffh
	call	_putUSBUSART	;wreg free
	goto	l5307
	line	142
	
l339:
	line	145
	
l5307:
;usb_set.h: 142: }
;usb_set.h: 145: CDCTxService() ;
	call	_CDCTxService	;wreg free
	line	146
	
l338:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_ProcessUSB
	__end_of_ProcessUSB:
	signat	_ProcessUSB,89
	global	_putUSBUSART

;; *************** function _putUSBUSART *****************
;; Defined at:
;;		line 342 in file "C:\pic\PIC18F\test02\usb_function_cdc.c"
;; Parameters:    Size  Location     Type
;;  data            2   21[BANK0 ] PTR unsigned char 
;;		 -> USB_In_Buffer(32), 
;;  length          1   23[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ProcessUSB
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_function_cdc.c"
	line	342
global __ptext8
__ptext8:
psect	text8
	file	"C:\pic\PIC18F\test02\usb_function_cdc.c"
	line	342
	global	__size_of_putUSBUSART
	__size_of_putUSBUSART	equ	__end_of_putUSBUSART-_putUSBUSART
	
_putUSBUSART:
;incstack = 0
	opt	stack 17
	line	344
	
l4909:
;usb_function_cdc.c: 344: {PIE2bits.USBIE = 0;};
	bcf	((c:4000)),c,2	;volatile
	line	345
	
l4911:
;usb_function_cdc.c: 345: if(cdc_trf_state == 0)
	movlb	0	; () banked
	movf	((_cdc_trf_state))&0ffh,w
	btfss	status,2
	goto	u4221
	goto	u4220
u4221:
	goto	l4921
u4220:
	line	347
	
l4913:; BSR set to: 0

;usb_function_cdc.c: 346: {
;usb_function_cdc.c: 347: { pCDCSrc.bRam = (BYTE*)data; cdc_tx_len = length; cdc_mem_type = 0x01; cdc_trf_state = 1; };
		movff	(putUSBUSART@data),(_pCDCSrc)
	movff	(putUSBUSART@data+1),(_pCDCSrc+1)

	
l4915:; BSR set to: 0

	movff	(putUSBUSART@length),(_cdc_tx_len)
	
l4917:; BSR set to: 0

	movlw	low(01h)
	movwf	((_cdc_mem_type))&0ffh
	
l4919:; BSR set to: 0

	movlw	low(01h)
	movwf	((_cdc_trf_state))&0ffh
	goto	l4921
	line	348
	
l88:; BSR set to: 0

	line	349
	
l4921:; BSR set to: 0

;usb_function_cdc.c: 348: }
;usb_function_cdc.c: 349: {PIE2bits.USBIE = 1;};
	bsf	((c:4000)),c,2	;volatile
	line	350
	
l89:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_putUSBUSART
	__end_of_putUSBUSART:
	signat	_putUSBUSART,8313
	global	_getsUSBUSART

;; *************** function _getsUSBUSART *****************
;; Defined at:
;;		line 311 in file "C:\pic\PIC18F\test02\usb_function_cdc.c"
;; Parameters:    Size  Location     Type
;;  buffer          2   28[BANK0 ] PTR unsigned char 
;;		 -> USB_Out_Buffer(8), 
;;  len             1   30[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       3       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		_USBTransferOnePacket
;; This function is called by:
;;		_ProcessUSB
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	311
global __ptext9
__ptext9:
psect	text9
	file	"C:\pic\PIC18F\test02\usb_function_cdc.c"
	line	311
	global	__size_of_getsUSBUSART
	__size_of_getsUSBUSART	equ	__end_of_getsUSBUSART-_getsUSBUSART
	
_getsUSBUSART:; BSR set to: 0

;incstack = 0
	opt	stack 16
	line	313
	
l4881:
;usb_function_cdc.c: 313: cdc_rx_len = 0;
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_cdc_rx_len))&0ffh
	line	316
	
l4883:; BSR set to: 0

;usb_function_cdc.c: 316: if(!(CDCDataOutHandle==0?0:((volatile BDT_ENTRY*)CDCDataOutHandle)->STAT.UOWN)) {
	movf	((_CDCDataOutHandle))&0ffh,w
iorwf	((_CDCDataOutHandle+1))&0ffh,w
	btfsc	status,2
	goto	u4171
	goto	u4170

u4171:
	goto	l4887
u4170:
	
l4885:; BSR set to: 0

	movff	(_CDCDataOutHandle),fsr2l
	movff	(_CDCDataOutHandle+1),fsr2h
	btfsc	c:indf2,7
	goto	u4181
	goto	u4180
u4181:
	clrf	(??_getsUSBUSART+0+0)&0ffh
	incf	(??_getsUSBUSART+0+0)&0ffh
	goto	u4188
u4180:
	movlb	0	; () banked
	clrf	(??_getsUSBUSART+0+0)&0ffh
u4188:
	movf	(??_getsUSBUSART+0+0)&0ffh,w
	movwf	((_getsUSBUSART$1459))&0ffh
	clrf	((_getsUSBUSART$1459+1))&0ffh
	goto	l4889
	
l78:; BSR set to: 0

	
l4887:; BSR set to: 0

	movlw	high(0)
	movwf	((_getsUSBUSART$1459+1))&0ffh
	movlw	low(0)
	movwf	((_getsUSBUSART$1459))&0ffh
	goto	l4889
	
l80:; BSR set to: 0

	
l4889:; BSR set to: 0

	movf	((_getsUSBUSART$1459))&0ffh,w
iorwf	((_getsUSBUSART$1459+1))&0ffh,w
	btfss	status,2
	goto	u4191
	goto	u4190

u4191:
	goto	l4905
u4190:
	line	318
	
l4891:; BSR set to: 0

;usb_function_cdc.c: 318: if (len > (((volatile BDT_ENTRY*)CDCDataOutHandle)->CNT)) len = (((volatile BDT_ENTRY*)CDCDataOutHandle)->CNT);
	lfsr	2,01h
	movf	((_CDCDataOutHandle))&0ffh,w
	addwf	fsr2l
	movf	((_CDCDataOutHandle+1))&0ffh,w
	addwfc	fsr2h
		movf	((getsUSBUSART@len))&0ffh,w
	subwf	postinc2,w
	btfsc	status,0
	goto	u4201
	goto	u4200

u4201:
	goto	l4895
u4200:
	
l4893:; BSR set to: 0

	lfsr	2,01h
	movf	((_CDCDataOutHandle))&0ffh,w
	addwf	fsr2l
	movf	((_CDCDataOutHandle+1))&0ffh,w
	addwfc	fsr2h
	movf	indf2,w
	movwf	((getsUSBUSART@len))&0ffh
	goto	l4895
	
l81:; BSR set to: 0

	line	321
	
l4895:; BSR set to: 0

;usb_function_cdc.c: 321: for (cdc_rx_len = 0; cdc_rx_len < len; cdc_rx_len++) {
	movlw	low(0)
	movwf	((_cdc_rx_len))&0ffh
	goto	l4901
	
l83:; BSR set to: 0

	line	322
	
l4897:; BSR set to: 0

;usb_function_cdc.c: 322: buffer[cdc_rx_len] = cdc_data_rx[cdc_rx_len];
	movf	((_cdc_rx_len))&0ffh,w
	mullw	01h
	movlw	low(640)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(640)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	((_cdc_rx_len))&0ffh,w
	mullw	01h
	movf	(prodl),c,w
	addwf	((getsUSBUSART@buffer))&0ffh,w
	movwf	c:fsr1l
	movf	(prodh),c,w
	addwfc	((getsUSBUSART@buffer+1))&0ffh,w
	movwf	1+c:fsr1l
	movff	indf2,indf1
	line	321
	
l4899:; BSR set to: 0

	incf	((_cdc_rx_len))&0ffh
	goto	l4901
	
l82:; BSR set to: 0

	
l4901:; BSR set to: 0

		movf	((getsUSBUSART@len))&0ffh,w
	subwf	((_cdc_rx_len))&0ffh,w
	btfss	status,0
	goto	u4211
	goto	u4210

u4211:
	goto	l4897
u4210:
	goto	l4903
	
l84:; BSR set to: 0

	line	326
	
l4903:; BSR set to: 0

;usb_function_cdc.c: 323: }
;usb_function_cdc.c: 326: CDCDataOutHandle = USBTransferOnePacket(2,0,(BYTE*)&cdc_data_rx,sizeof(cdc_data_rx));
	movlw	low(0)
	movwf	((USBTransferOnePacket@dir))&0ffh
		movlw	low(640)
	movwf	((USBTransferOnePacket@data))&0ffh
	movlw	high(640)
	movwf	((USBTransferOnePacket@data+1))&0ffh

	movlw	low(08h)
	movwf	((USBTransferOnePacket@len))&0ffh
	movlw	(02h)&0ffh
	
	call	_USBTransferOnePacket
	movff	0+?_USBTransferOnePacket,(_CDCDataOutHandle)
	movff	1+?_USBTransferOnePacket,(_CDCDataOutHandle+1)
	goto	l4905
	line	327
	
l76:
	line	329
	
l4905:
;usb_function_cdc.c: 327: }
;usb_function_cdc.c: 329: return cdc_rx_len;
	movlb	0	; () banked
	movf	((_cdc_rx_len))&0ffh,w
	goto	l85
	
l4907:; BSR set to: 0

	line	330
	
l85:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_getsUSBUSART
	__end_of_getsUSBUSART:
	signat	_getsUSBUSART,8313
	global	_USBCBSendResume

;; *************** function _USBCBSendResume *****************
;; Defined at:
;;		line 242 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		_USBCBWakeFromSuspend
;; This function is called by:
;;		_ProcessUSB
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	242
global __ptext10
__ptext10:
psect	text10
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	242
	global	__size_of_USBCBSendResume
	__size_of_USBCBSendResume	equ	__end_of_USBCBSendResume-_USBCBSendResume
	
_USBCBSendResume:; BSR set to: 0

;incstack = 0
	opt	stack 16
	line	247
	
l5029:
;usb_set.h: 244: static WORD delay_count;
;usb_set.h: 247: if(RemoteWakeup == TRUE) {
		decf	((c:_RemoteWakeup)),c,w	;volatile
	btfss	status,2
	goto	u4391
	goto	u4390

u4391:
	goto	l371
u4390:
	line	249
	
l5031:
;usb_set.h: 249: if(USBBusIsSuspended == TRUE) {
		decf	((c:_USBBusIsSuspended)),c,w	;volatile
	btfss	status,2
	goto	u4401
	goto	u4400

u4401:
	goto	l371
u4400:
	line	251
	
l5033:
;usb_set.h: 251: {PIE2bits.USBIE = 0;} ;
	bcf	((c:4000)),c,2	;volatile
	line	252
	
l5035:
;usb_set.h: 252: USBCBWakeFromSuspend() ;
	call	_USBCBWakeFromSuspend	;wreg free
	line	253
	
l5037:
;usb_set.h: 253: UCONbits.SUSPND = 0 ;
	bcf	((c:3940)),c,1	;volatile
	line	254
	
l5039:
;usb_set.h: 254: USBBusIsSuspended = FALSE ;
	movlw	low(0)
	movwf	((c:_USBBusIsSuspended)),c	;volatile
	line	255
	
l5041:
;usb_set.h: 255: delay_count = 3600U ;
	movlw	high(0E10h)
	movwf	((c:USBCBSendResume@delay_count+1)),c
	movlw	low(0E10h)
	movwf	((c:USBCBSendResume@delay_count)),c
	goto	l5043
	line	256
;usb_set.h: 256: do {
	
l367:
	line	257
	
l5043:
;usb_set.h: 257: delay_count-- ;
	decf	((c:USBCBSendResume@delay_count)),c
	btfss	status,0
	decf	((c:USBCBSendResume@delay_count+1)),c
	line	258
	
l5045:
;usb_set.h: 258: } while(delay_count) ;
	movf	((c:USBCBSendResume@delay_count)),c,w
iorwf	((c:USBCBSendResume@delay_count+1)),c,w
	btfss	status,2
	goto	u4411
	goto	u4410

u4411:
	goto	l5043
u4410:
	
l368:
	line	259
;usb_set.h: 259: UCONbits.RESUME = 1 ;
	bsf	((c:3940)),c,2	;volatile
	line	260
	
l5047:
;usb_set.h: 260: delay_count = 1800U ;
	movlw	high(0708h)
	movwf	((c:USBCBSendResume@delay_count+1)),c
	movlw	low(0708h)
	movwf	((c:USBCBSendResume@delay_count)),c
	goto	l5049
	line	261
;usb_set.h: 261: do {
	
l369:
	line	262
	
l5049:
;usb_set.h: 262: delay_count-- ;
	decf	((c:USBCBSendResume@delay_count)),c
	btfss	status,0
	decf	((c:USBCBSendResume@delay_count+1)),c
	line	263
	
l5051:
;usb_set.h: 263: }while(delay_count) ;
	movf	((c:USBCBSendResume@delay_count)),c,w
iorwf	((c:USBCBSendResume@delay_count+1)),c,w
	btfss	status,2
	goto	u4421
	goto	u4420

u4421:
	goto	l5049
u4420:
	
l370:
	line	264
;usb_set.h: 264: UCONbits.RESUME = 0 ;
	bcf	((c:3940)),c,2	;volatile
	line	265
;usb_set.h: 265: {PIE2bits.USBIE = 1;};
	bsf	((c:4000)),c,2	;volatile
	goto	l371
	line	266
	
l366:
	goto	l371
	line	267
	
l365:
	line	268
	
l371:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBSendResume
	__end_of_USBCBSendResume:
	signat	_USBCBSendResume,89
	global	_USBCBWakeFromSuspend

;; *************** function _USBCBWakeFromSuspend *****************
;; Defined at:
;;		line 171 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCBSendResume
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	171
global __ptext11
__ptext11:
psect	text11
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	171
	global	__size_of_USBCBWakeFromSuspend
	__size_of_USBCBWakeFromSuspend	equ	__end_of_USBCBWakeFromSuspend-_USBCBWakeFromSuspend
	
_USBCBWakeFromSuspend:
;incstack = 0
	opt	stack 16
	line	175
	
l345:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBWakeFromSuspend
	__end_of_USBCBWakeFromSuspend:
	signat	_USBCBWakeFromSuspend,89
	global	_CDCTxService

;; *************** function _CDCTxService *****************
;; Defined at:
;;		line 393 in file "C:\pic\PIC18F\test02\usb_function_cdc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  byte_to_send    1   32[BANK0 ] unsigned char 
;;  i               1   31[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		_USBTransferOnePacket
;; This function is called by:
;;		_ProcessUSB
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_function_cdc.c"
	line	393
global __ptext12
__ptext12:
psect	text12
	file	"C:\pic\PIC18F\test02\usb_function_cdc.c"
	line	393
	global	__size_of_CDCTxService
	__size_of_CDCTxService	equ	__end_of_CDCTxService-_CDCTxService
	
_CDCTxService:
;incstack = 0
	opt	stack 16
	line	398
	
l4923:
;usb_function_cdc.c: 395: BYTE byte_to_send;
;usb_function_cdc.c: 396: BYTE i;
;usb_function_cdc.c: 398: {PIE2bits.USBIE = 0;};
	bcf	((c:4000)),c,2	;volatile
	line	403
	
l4925:
;usb_function_cdc.c: 401: {};
;usb_function_cdc.c: 403: if((CDCDataInHandle==0?0:((volatile BDT_ENTRY*)CDCDataInHandle)->STAT.UOWN)) {
	movlb	0	; () banked
	movf	((_CDCDataInHandle))&0ffh,w
iorwf	((_CDCDataInHandle+1))&0ffh,w
	btfsc	status,2
	goto	u4231
	goto	u4230

u4231:
	goto	l4929
u4230:
	
l4927:; BSR set to: 0

	movff	(_CDCDataInHandle),fsr2l
	movff	(_CDCDataInHandle+1),fsr2h
	btfsc	c:indf2,7
	goto	u4241
	goto	u4240
u4241:
	clrf	(??_CDCTxService+0+0)&0ffh
	incf	(??_CDCTxService+0+0)&0ffh
	goto	u4248
u4240:
	movlb	0	; () banked
	clrf	(??_CDCTxService+0+0)&0ffh
u4248:
	movf	(??_CDCTxService+0+0)&0ffh,w
	movwf	((_CDCTxService$1511))&0ffh
	clrf	((_CDCTxService$1511+1))&0ffh
	goto	l4931
	
l101:; BSR set to: 0

	
l4929:; BSR set to: 0

	movlw	high(0)
	movwf	((_CDCTxService$1511+1))&0ffh
	movlw	low(0)
	movwf	((_CDCTxService$1511))&0ffh
	goto	l4931
	
l103:; BSR set to: 0

	
l4931:; BSR set to: 0

	movf	((_CDCTxService$1511))&0ffh,w
iorwf	((_CDCTxService$1511+1))&0ffh,w
	btfsc	status,2
	goto	u4251
	goto	u4250

u4251:
	goto	l4935
u4250:
	line	404
	
l4933:; BSR set to: 0

;usb_function_cdc.c: 404: {PIE2bits.USBIE = 1;};
	bsf	((c:4000)),c,2	;volatile
	line	405
;usb_function_cdc.c: 405: return;
	goto	l104
	line	406
	
l99:; BSR set to: 0

	line	409
	
l4935:; BSR set to: 0

;usb_function_cdc.c: 406: }
;usb_function_cdc.c: 409: if(cdc_trf_state == 3) cdc_trf_state = 0 ;
		movlw	3
	xorwf	((_cdc_trf_state))&0ffh,w
	btfss	status,2
	goto	u4261
	goto	u4260

u4261:
	goto	l105
u4260:
	
l4937:; BSR set to: 0

	movlw	low(0)
	movwf	((_cdc_trf_state))&0ffh
	
l105:; BSR set to: 0

	line	411
;usb_function_cdc.c: 411: if(cdc_trf_state == 0) {
	movf	((_cdc_trf_state))&0ffh,w
	btfss	status,2
	goto	u4271
	goto	u4270
u4271:
	goto	l4941
u4270:
	line	412
	
l4939:; BSR set to: 0

;usb_function_cdc.c: 412: {PIE2bits.USBIE = 1;};
	bsf	((c:4000)),c,2	;volatile
	line	413
;usb_function_cdc.c: 413: return;
	goto	l104
	line	414
	
l106:; BSR set to: 0

	line	416
	
l4941:; BSR set to: 0

;usb_function_cdc.c: 414: }
;usb_function_cdc.c: 416: if(cdc_trf_state == 2) {
		movlw	2
	xorwf	((_cdc_trf_state))&0ffh,w
	btfss	status,2
	goto	u4281
	goto	u4280

u4281:
	goto	l4947
u4280:
	line	418
	
l4943:; BSR set to: 0

;usb_function_cdc.c: 418: CDCDataInHandle = USBTransferOnePacket(2,1,(0),0);
	movlw	low(01h)
	movwf	((USBTransferOnePacket@dir))&0ffh
		movlw	low(0)
	movwf	((USBTransferOnePacket@data))&0ffh
	movlw	high(0)
	movwf	((USBTransferOnePacket@data+1))&0ffh

	movlw	low(0)
	movwf	((USBTransferOnePacket@len))&0ffh
	movlw	(02h)&0ffh
	
	call	_USBTransferOnePacket
	movff	0+?_USBTransferOnePacket,(_CDCDataInHandle)
	movff	1+?_USBTransferOnePacket,(_CDCDataInHandle+1)
	line	420
	
l4945:
;usb_function_cdc.c: 420: cdc_trf_state = 3;
	movlw	low(03h)
	movlb	0	; () banked
	movwf	((_cdc_trf_state))&0ffh
	line	421
;usb_function_cdc.c: 421: }
	goto	l4991
	line	422
	
l107:; BSR set to: 0

	
l4947:; BSR set to: 0

;usb_function_cdc.c: 422: else if(cdc_trf_state == 1)
		decf	((_cdc_trf_state))&0ffh,w
	btfss	status,2
	goto	u4291
	goto	u4290

u4291:
	goto	l4991
u4290:
	line	426
	
l4949:; BSR set to: 0

;usb_function_cdc.c: 423: {
;usb_function_cdc.c: 426: if(cdc_tx_len > sizeof(cdc_data_tx)) byte_to_send = sizeof(cdc_data_tx);
		movlw	021h-1
	cpfsgt	((_cdc_tx_len))&0ffh
	goto	u4301
	goto	u4300

u4301:
	goto	l110
u4300:
	
l4951:; BSR set to: 0

	movlw	low(020h)
	movwf	((CDCTxService@byte_to_send))&0ffh
	goto	l4953
	line	427
	
l110:; BSR set to: 0

;usb_function_cdc.c: 427: else byte_to_send = cdc_tx_len;
	movff	(_cdc_tx_len),(CDCTxService@byte_to_send)
	goto	l4953
	
l111:; BSR set to: 0

	line	429
	
l4953:; BSR set to: 0

;usb_function_cdc.c: 429: cdc_tx_len = cdc_tx_len - byte_to_send;
	movf	((CDCTxService@byte_to_send))&0ffh,w
	sublw	0
	addwf	((_cdc_tx_len))&0ffh,w
	movwf	((_cdc_tx_len))&0ffh
	line	432
;usb_function_cdc.c: 432: pCDCDst.bRam = (BYTE*)&cdc_data_tx;
		movlw	low(608)
	movwf	((_pCDCDst))&0ffh
	movlw	high(608)
	movwf	((_pCDCDst+1))&0ffh

	line	433
	
l4955:; BSR set to: 0

;usb_function_cdc.c: 433: i = byte_to_send;
	movff	(CDCTxService@byte_to_send),(CDCTxService@i)
	line	434
	
l4957:; BSR set to: 0

;usb_function_cdc.c: 434: if(cdc_mem_type == 0x00) {
	movf	((_cdc_mem_type))&0ffh,w
	btfss	status,2
	goto	u4311
	goto	u4310
u4311:
	goto	l4979
u4310:
	goto	l4969
	line	435
	
l4959:; BSR set to: 0

;usb_function_cdc.c: 435: while(i) {
	goto	l4969
	
l114:; BSR set to: 0

	line	436
	
l4961:; BSR set to: 0

;usb_function_cdc.c: 436: *pCDCDst.bRam = *pCDCSrc.bRom;
	movff	(_pCDCSrc),fsr2l
	movff	(_pCDCSrc+1),fsr2h
	movff	(_pCDCDst),fsr1l
	movff	(_pCDCDst+1),fsr1h
	movff	indf2,indf1
	line	437
	
l4963:; BSR set to: 0

;usb_function_cdc.c: 437: pCDCDst.bRam++;
	infsnz	((_pCDCDst))&0ffh
	incf	((_pCDCDst+1))&0ffh
	line	438
	
l4965:; BSR set to: 0

;usb_function_cdc.c: 438: pCDCSrc.bRom++;
	infsnz	((_pCDCSrc))&0ffh
	incf	((_pCDCSrc+1))&0ffh
	line	439
	
l4967:; BSR set to: 0

;usb_function_cdc.c: 439: i--;
	decf	((CDCTxService@i))&0ffh
	goto	l4969
	line	440
	
l113:; BSR set to: 0

	line	435
	
l4969:; BSR set to: 0

	movf	((CDCTxService@i))&0ffh,w
	btfss	status,2
	goto	u4321
	goto	u4320
u4321:
	goto	l4961
u4320:
	goto	l4981
	
l115:; BSR set to: 0

	line	441
;usb_function_cdc.c: 440: }
;usb_function_cdc.c: 441: } else {
	goto	l4981
	
l112:; BSR set to: 0

	line	442
;usb_function_cdc.c: 442: while(i) {
	goto	l4979
	
l118:; BSR set to: 0

	line	443
	
l4971:; BSR set to: 0

;usb_function_cdc.c: 443: *pCDCDst.bRam = *pCDCSrc.bRam;
	movff	(_pCDCSrc),fsr2l
	movff	(_pCDCSrc+1),fsr2h
	movff	(_pCDCDst),fsr1l
	movff	(_pCDCDst+1),fsr1h
	movff	indf2,indf1
	line	444
	
l4973:; BSR set to: 0

;usb_function_cdc.c: 444: pCDCDst.bRam++;
	infsnz	((_pCDCDst))&0ffh
	incf	((_pCDCDst+1))&0ffh
	line	445
	
l4975:; BSR set to: 0

;usb_function_cdc.c: 445: pCDCSrc.bRam++;
	infsnz	((_pCDCSrc))&0ffh
	incf	((_pCDCSrc+1))&0ffh
	line	446
	
l4977:; BSR set to: 0

;usb_function_cdc.c: 446: i--;
	decf	((CDCTxService@i))&0ffh
	goto	l4979
	line	447
	
l117:; BSR set to: 0

	line	442
	
l4979:; BSR set to: 0

	movf	((CDCTxService@i))&0ffh,w
	btfss	status,2
	goto	u4331
	goto	u4330
u4331:
	goto	l4971
u4330:
	goto	l4981
	
l119:; BSR set to: 0

	goto	l4981
	line	448
	
l116:; BSR set to: 0

	line	451
	
l4981:; BSR set to: 0

;usb_function_cdc.c: 447: }
;usb_function_cdc.c: 448: }
;usb_function_cdc.c: 451: if(cdc_tx_len == 0) {
	movf	((_cdc_tx_len))&0ffh,w
	btfss	status,2
	goto	u4341
	goto	u4340
u4341:
	goto	l4989
u4340:
	line	454
	
l4983:; BSR set to: 0

;usb_function_cdc.c: 454: if(byte_to_send == 32) cdc_trf_state = 2;
		movlw	32
	xorwf	((CDCTxService@byte_to_send))&0ffh,w
	btfss	status,2
	goto	u4351
	goto	u4350

u4351:
	goto	l4987
u4350:
	
l4985:; BSR set to: 0

	movlw	low(02h)
	movwf	((_cdc_trf_state))&0ffh
	goto	l4989
	line	455
	
l121:; BSR set to: 0

	
l4987:; BSR set to: 0

;usb_function_cdc.c: 455: else cdc_trf_state = 3;
	movlw	low(03h)
	movwf	((_cdc_trf_state))&0ffh
	goto	l4989
	
l122:; BSR set to: 0

	goto	l4989
	line	456
	
l120:; BSR set to: 0

	line	457
	
l4989:; BSR set to: 0

;usb_function_cdc.c: 456: }
;usb_function_cdc.c: 457: CDCDataInHandle = USBTransferOnePacket(2,1,(BYTE*)&cdc_data_tx,byte_to_send);
	movlw	low(01h)
	movwf	((USBTransferOnePacket@dir))&0ffh
		movlw	low(608)
	movwf	((USBTransferOnePacket@data))&0ffh
	movlw	high(608)
	movwf	((USBTransferOnePacket@data+1))&0ffh

	movff	(CDCTxService@byte_to_send),(USBTransferOnePacket@len)
	movlw	(02h)&0ffh
	
	call	_USBTransferOnePacket
	movff	0+?_USBTransferOnePacket,(_CDCDataInHandle)
	movff	1+?_USBTransferOnePacket,(_CDCDataInHandle+1)
	goto	l4991
	line	458
	
l109:
	goto	l4991
	line	460
	
l108:
	
l4991:
;usb_function_cdc.c: 458: }
;usb_function_cdc.c: 460: {PIE2bits.USBIE = 1;};
	bsf	((c:4000)),c,2	;volatile
	line	461
	
l104:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_CDCTxService
	__end_of_CDCTxService:
	signat	_CDCTxService,89
	global	_USBTransferOnePacket

;; *************** function _USBTransferOnePacket *****************
;; Defined at:
;;		line 502 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;  ep              1    wreg     unsigned char 
;;  dir             1   21[BANK0 ] unsigned char 
;;  data            2   22[BANK0 ] PTR unsigned char 
;;		 -> cdc_data_tx(32), NULL(0), cdc_data_rx(8), 
;;  len             1   24[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ep              1   25[BANK0 ] unsigned char 
;;  handle          2   26[BANK0 ] PTR volatile struct __BD
;;		 -> BDT(48), NULL(0), 
;; Return value:  Size  Location     Type
;;                  2   21[BANK0 ] PTR void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       4       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getsUSBUSART
;;		_CDCTxService
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	502
global __ptext13
__ptext13:
psect	text13
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	502
	global	__size_of_USBTransferOnePacket
	__size_of_USBTransferOnePacket	equ	__end_of_USBTransferOnePacket-_USBTransferOnePacket
	
_USBTransferOnePacket:
;incstack = 0
	opt	stack 16
;USBTransferOnePacket@ep stored from wreg
	movlb	0	; () banked
	movwf	((USBTransferOnePacket@ep))&0ffh
	line	507
	
l4817:
;usb_device.c: 504: volatile BDT_ENTRY* handle;
;usb_device.c: 507: if(dir != 0) {
	movlb	0	; () banked
	movf	((USBTransferOnePacket@dir))&0ffh,w
	btfsc	status,2
	goto	u4101
	goto	u4100
u4101:
	goto	l4821
u4100:
	line	508
	
l4819:; BSR set to: 0

;usb_device.c: 508: handle = pBDTEntryIn[ep];
	movf	((USBTransferOnePacket@ep))&0ffh,w
	mullw	02h
	movlw	low(_pBDTEntryIn)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryIn)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(USBTransferOnePacket@handle)
	movff	postdec2,(USBTransferOnePacket@handle+1)
	line	509
;usb_device.c: 509: } else {
	goto	l4823
	
l650:; BSR set to: 0

	line	510
	
l4821:; BSR set to: 0

;usb_device.c: 510: handle = pBDTEntryOut[ep];
	movf	((USBTransferOnePacket@ep))&0ffh,w
	mullw	02h
	movlw	low(_pBDTEntryOut)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryOut)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(USBTransferOnePacket@handle)
	movff	postdec2,(USBTransferOnePacket@handle+1)
	goto	l4823
	line	511
	
l651:; BSR set to: 0

	line	512
	
l4823:; BSR set to: 0

;usb_device.c: 511: }
;usb_device.c: 512: if (handle == 0) return 0 ;
	movf	((USBTransferOnePacket@handle))&0ffh,w
iorwf	((USBTransferOnePacket@handle+1))&0ffh,w
	btfss	status,2
	goto	u4111
	goto	u4110

u4111:
	goto	l4829
u4110:
	
l4825:; BSR set to: 0

		movlw	low(0)
	movwf	((?_USBTransferOnePacket))&0ffh
	movlw	high(0)
	movwf	((?_USBTransferOnePacket+1))&0ffh

	goto	l653
	
l4827:; BSR set to: 0

	goto	l653
	
l652:; BSR set to: 0

	line	522
	
l4829:; BSR set to: 0

;usb_device.c: 522: handle->ADR = ((WORD)(data));
	lfsr	2,02h
	movf	((USBTransferOnePacket@handle))&0ffh,w
	addwf	fsr2l
	movf	((USBTransferOnePacket@handle+1))&0ffh,w
	addwfc	fsr2h
	movff	(USBTransferOnePacket@data),postinc2
	movff	(USBTransferOnePacket@data+1),postdec2
	line	523
;usb_device.c: 523: handle->CNT = len;
	lfsr	2,01h
	movf	((USBTransferOnePacket@handle))&0ffh,w
	addwf	fsr2l
	movf	((USBTransferOnePacket@handle+1))&0ffh,w
	addwfc	fsr2h
	movff	(USBTransferOnePacket@len),indf2

	line	524
	
l4831:; BSR set to: 0

;usb_device.c: 524: handle->STAT.Val &= 0x40;
	movff	(USBTransferOnePacket@handle),fsr2l
	movff	(USBTransferOnePacket@handle+1),fsr2h
	movlw	040h
	andwf	indf2
	line	525
	
l4833:; BSR set to: 0

;usb_device.c: 525: handle->STAT.Val |= 0x80 | (0x08 & 0x08);
	movff	(USBTransferOnePacket@handle),fsr2l
	movff	(USBTransferOnePacket@handle+1),fsr2h
	movlw	088h
	iorwf	indf2
	line	528
	
l4835:; BSR set to: 0

;usb_device.c: 528: if(dir != 0) {
	movf	((USBTransferOnePacket@dir))&0ffh,w
	btfsc	status,2
	goto	u4121
	goto	u4120
u4121:
	goto	l4839
u4120:
	line	530
	
l4837:; BSR set to: 0

;usb_device.c: 530: ((BYTE_VAL*)&pBDTEntryIn[ep])->Val ^= 0x0004;;
	movf	((USBTransferOnePacket@ep))&0ffh,w
	mullw	02h
	movlw	low(_pBDTEntryIn)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryIn)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	04h
	xorwf	indf2
	line	531
;usb_device.c: 531: } else {
	goto	l4841
	
l654:; BSR set to: 0

	line	533
	
l4839:; BSR set to: 0

;usb_device.c: 533: ((BYTE_VAL*)&pBDTEntryOut[ep])->Val ^= 0x0004;;
	movf	((USBTransferOnePacket@ep))&0ffh,w
	mullw	02h
	movlw	low(_pBDTEntryOut)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryOut)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	04h
	xorwf	indf2
	goto	l4841
	line	534
	
l655:; BSR set to: 0

	line	535
	
l4841:; BSR set to: 0

;usb_device.c: 534: }
;usb_device.c: 535: return (void*)handle;
		movff	(USBTransferOnePacket@handle),(?_USBTransferOnePacket)
	movff	(USBTransferOnePacket@handle+1),(?_USBTransferOnePacket+1)

	goto	l653
	
l4843:; BSR set to: 0

	line	536
	
l653:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBTransferOnePacket
	__end_of_USBTransferOnePacket:
	signat	_USBTransferOnePacket,16506
	global	_PICinit

;; *************** function _PICinit *****************
;; Defined at:
;;		line 107 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	107
global __ptext14
__ptext14:
psect	text14
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	107
	global	__size_of_PICinit
	__size_of_PICinit	equ	__end_of_PICinit-_PICinit
	
_PICinit:; BSR set to: 0

;incstack = 0
	opt	stack 18
	line	108
	
l5145:
;i2c.h: 108: OSCCON = 0b01110000;
	movlw	low(070h)
	movwf	((c:4051)),c	;volatile
	line	109
;i2c.h: 109: ANSEL = 0b00000000;
	movlw	low(0)
	movwf	((c:3966)),c	;volatile
	line	111
;i2c.h: 111: TRISB = 0b01010000;
	movlw	low(050h)
	movwf	((c:3987)),c	;volatile
	line	115
	
l276:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_PICinit
	__end_of_PICinit:
	signat	_PICinit,89
	global	_LCD_time

;; *************** function _LCD_time *****************
;; Defined at:
;;		line 220 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;  hr              2    0[BANK1 ] unsigned int 
;;  min             2    2[BANK1 ] unsigned int 
;;  sec             2    4[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  tmp             2    9[BANK1 ] unsigned short 
;;  tpr             2    7[BANK1 ] unsigned short 
;;  wk              1    6[BANK1 ] unsigned char 
;;  c               1    0        unsigned char 
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       6       0       0
;;      Locals:         0       0       5       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       3      11       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   15
;; This function calls:
;;		_I2C_Tsensor
;;		___lwdiv
;;		___lwmod
;;		___wmul
;;		_writeData
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=0
	line	220
global __ptext15
__ptext15:
psect	text15
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	220
	global	__size_of_LCD_time
	__size_of_LCD_time	equ	__end_of_LCD_time-_LCD_time
	
_LCD_time:
;incstack = 0
	opt	stack 15
	line	224
	
l5205:
;i2c.h: 221: unsigned char i,wk,c;
;i2c.h: 222: unsigned short tpr,tmp;
;i2c.h: 224: writeData('t');
	movlw	(074h)&0ffh
	
	call	_writeData
	line	226
;i2c.h: 226: writeData('m');
	movlw	(06Dh)&0ffh
	
	call	_writeData
	line	229
;i2c.h: 229: tm_disp[0] = (hr/10)%10+0x30;
	movlw	high(0Ah)
	movlb	0	; () banked
	movwf	((___lwdiv@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwdiv@divisor))&0ffh
	movff	(LCD_time@hr),(___lwdiv@dividend)
	movff	(LCD_time@hr+1),(___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(___lwmod@dividend)
	movff	1+?___lwdiv,(___lwmod@dividend+1)
	movlw	high(0Ah)
	movlb	0	; () banked
	movwf	((___lwmod@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwmod@divisor))&0ffh
	call	___lwmod	;wreg free
	movlb	0	; () banked
	movf	(0+?___lwmod)&0ffh,w
	addlw	low(030h)
	movwf	((_tm_disp))&0ffh
	line	230
;i2c.h: 230: writeData(tm_disp[0]);
	movf	((_tm_disp))&0ffh,w
	
	call	_writeData
	line	231
;i2c.h: 231: tm_disp[1] =( unsigned char) (hr%10)+0x30;
	movff	(LCD_time@hr),(___lwmod@dividend)
	movff	(LCD_time@hr+1),(___lwmod@dividend+1)
	movlw	high(0Ah)
	movlb	0	; () banked
	movwf	((___lwmod@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwmod@divisor))&0ffh
	call	___lwmod	;wreg free
	movlb	0	; () banked
	movf	(0+?___lwmod)&0ffh,w
	addlw	low(030h)
	movwf	(0+(_tm_disp+01h))&0ffh
	line	232
;i2c.h: 232: writeData(tm_disp[1]);
	movf	(0+(_tm_disp+01h))&0ffh,w
	
	call	_writeData
	line	234
	
l5207:
;i2c.h: 234: wk = ':';
	movlw	low(03Ah)
	movlb	1	; () banked
	movwf	((LCD_time@wk))&0ffh
	line	235
	
l5209:; BSR set to: 1

;i2c.h: 235: writeData(wk);
	movf	((LCD_time@wk))&0ffh,w
	
	call	_writeData
	line	237
	
l5211:
;i2c.h: 237: tm_disp[2] = (min/10)%min+0x30;
	movlw	high(0Ah)
	movlb	0	; () banked
	movwf	((___lwdiv@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwdiv@divisor))&0ffh
	movff	(LCD_time@min),(___lwdiv@dividend)
	movff	(LCD_time@min+1),(___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(___lwmod@dividend)
	movff	1+?___lwdiv,(___lwmod@dividend+1)
	movff	(LCD_time@min),(___lwmod@divisor)
	movff	(LCD_time@min+1),(___lwmod@divisor+1)
	call	___lwmod	;wreg free
	movlb	0	; () banked
	movf	(0+?___lwmod)&0ffh,w
	addlw	low(030h)
	movwf	(0+(_tm_disp+02h))&0ffh
	line	238
	
l5213:; BSR set to: 0

;i2c.h: 238: writeData(tm_disp[2]);
	movf	(0+(_tm_disp+02h))&0ffh,w
	
	call	_writeData
	line	239
	
l5215:
;i2c.h: 239: tm_disp[3] = min%10+0x30;
	movff	(LCD_time@min),(___lwmod@dividend)
	movff	(LCD_time@min+1),(___lwmod@dividend+1)
	movlw	high(0Ah)
	movlb	0	; () banked
	movwf	((___lwmod@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwmod@divisor))&0ffh
	call	___lwmod	;wreg free
	movlb	0	; () banked
	movf	(0+?___lwmod)&0ffh,w
	addlw	low(030h)
	movwf	(0+(_tm_disp+03h))&0ffh
	line	240
	
l5217:; BSR set to: 0

;i2c.h: 240: writeData(tm_disp[3]);
	movf	(0+(_tm_disp+03h))&0ffh,w
	
	call	_writeData
	line	242
;i2c.h: 242: wk = ':';
	movlw	low(03Ah)
	movlb	1	; () banked
	movwf	((LCD_time@wk))&0ffh
	line	243
	
l5219:; BSR set to: 1

;i2c.h: 243: writeData(wk);
	movf	((LCD_time@wk))&0ffh,w
	
	call	_writeData
	line	245
	
l5221:
;i2c.h: 245: tm_disp[4] = (sec/10)%sec+0x30;
	movlw	high(0Ah)
	movlb	0	; () banked
	movwf	((___lwdiv@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwdiv@divisor))&0ffh
	movff	(LCD_time@sec),(___lwdiv@dividend)
	movff	(LCD_time@sec+1),(___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(___lwmod@dividend)
	movff	1+?___lwdiv,(___lwmod@dividend+1)
	movff	(LCD_time@sec),(___lwmod@divisor)
	movff	(LCD_time@sec+1),(___lwmod@divisor+1)
	call	___lwmod	;wreg free
	movlb	0	; () banked
	movf	(0+?___lwmod)&0ffh,w
	addlw	low(030h)
	movwf	(0+(_tm_disp+04h))&0ffh
	line	246
	
l5223:; BSR set to: 0

;i2c.h: 246: writeData(tm_disp[4]);
	movf	(0+(_tm_disp+04h))&0ffh,w
	
	call	_writeData
	line	247
	
l5225:
;i2c.h: 247: tm_disp[5] = sec%10+0x30;
	movff	(LCD_time@sec),(___lwmod@dividend)
	movff	(LCD_time@sec+1),(___lwmod@dividend+1)
	movlw	high(0Ah)
	movlb	0	; () banked
	movwf	((___lwmod@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwmod@divisor))&0ffh
	call	___lwmod	;wreg free
	movlb	0	; () banked
	movf	(0+?___lwmod)&0ffh,w
	addlw	low(030h)
	movwf	(0+(_tm_disp+05h))&0ffh
	line	248
	
l5227:; BSR set to: 0

;i2c.h: 248: writeData(tm_disp[5]);
	movf	(0+(_tm_disp+05h))&0ffh,w
	
	call	_writeData
	line	250
	
l5229:
;i2c.h: 250: writeData(' ');
	movlw	(020h)&0ffh
	
	call	_writeData
	line	252
	
l5231:
;i2c.h: 252: tpr=I2C_Tsensor();
	call	_I2C_Tsensor	;wreg free
	movff	0+?_I2C_Tsensor,(LCD_time@tpr)
	movff	1+?_I2C_Tsensor,(LCD_time@tpr+1)
	line	253
	
l5233:
;i2c.h: 253: tmp=(tpr/16/10)%10;
	movlw	high(0Ah)
	movlb	0	; () banked
	movwf	((___lwdiv@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwdiv@divisor))&0ffh
	movff	(LCD_time@tpr),??_LCD_time+0+0
	movff	(LCD_time@tpr+1),??_LCD_time+0+0+1
	movlw	04h
	movwf	(??_LCD_time+2+0)&0ffh
u4585:
	bcf	status,0
	rrcf	(??_LCD_time+0+1)&0ffh
	rrcf	(??_LCD_time+0+0)&0ffh
	decfsz	(??_LCD_time+2+0)&0ffh
	goto	u4585
	movff	??_LCD_time+0+0,(___lwdiv@dividend)
	movff	??_LCD_time+0+1,(___lwdiv@dividend+1)
	call	___lwdiv	;wreg free
	movff	0+?___lwdiv,(___lwmod@dividend)
	movff	1+?___lwdiv,(___lwmod@dividend+1)
	movlw	high(0Ah)
	movlb	0	; () banked
	movwf	((___lwmod@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwmod@divisor))&0ffh
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(LCD_time@tmp)
	movff	1+?___lwmod,(LCD_time@tmp+1)
	line	254
	
l5235:
;i2c.h: 254: tmp_disp[0] = tmp+ 0x30;
	movlb	1	; () banked
	movf	((LCD_time@tmp))&0ffh,w
	addlw	low(030h)
	movlb	0	; () banked
	movwf	((_tmp_disp))&0ffh
	line	255
	
l5237:; BSR set to: 0

;i2c.h: 255: writeData( tmp_disp[0] );
	movf	((_tmp_disp))&0ffh,w
	
	call	_writeData
	line	257
	
l5239:
;i2c.h: 257: tmp=(tpr/16)%10;
	movff	(LCD_time@tpr),??_LCD_time+0+0
	movff	(LCD_time@tpr+1),??_LCD_time+0+0+1
	movlw	04h
	movlb	0	; () banked
	movwf	(??_LCD_time+2+0)&0ffh
u4595:
	bcf	status,0
	rrcf	(??_LCD_time+0+1)&0ffh
	rrcf	(??_LCD_time+0+0)&0ffh
	decfsz	(??_LCD_time+2+0)&0ffh
	goto	u4595
	movff	??_LCD_time+0+0,(___lwmod@dividend)
	movff	??_LCD_time+0+1,(___lwmod@dividend+1)
	movlw	high(0Ah)
	movwf	((___lwmod@divisor+1))&0ffh
	movlw	low(0Ah)
	movwf	((___lwmod@divisor))&0ffh
	call	___lwmod	;wreg free
	movff	0+?___lwmod,(LCD_time@tmp)
	movff	1+?___lwmod,(LCD_time@tmp+1)
	line	258
	
l5241:
;i2c.h: 258: tmp_disp[1] = tmp+ 0x30;
	movlb	1	; () banked
	movf	((LCD_time@tmp))&0ffh,w
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(_tmp_disp+01h))&0ffh
	line	259
	
l5243:; BSR set to: 0

;i2c.h: 259: writeData( tmp_disp[1] );
	movf	(0+(_tmp_disp+01h))&0ffh,w
	
	call	_writeData
	line	260
	
l5245:
;i2c.h: 260: writeData('.');
	movlw	(02Eh)&0ffh
	
	call	_writeData
	line	262
	
l5247:
;i2c.h: 262: tmp=(tpr & 0xF)*10;
	movlw	0Fh
	movlb	1	; () banked
	andwf	((LCD_time@tpr))&0ffh,w
	movlb	0	; () banked
	movwf	((___wmul@multiplier))&0ffh
	clrf	1+((___wmul@multiplier))&0ffh
	movlw	high(0Ah)
	movwf	((___wmul@multiplicand+1))&0ffh
	movlw	low(0Ah)
	movwf	((___wmul@multiplicand))&0ffh
	call	___wmul	;wreg free
	movff	0+?___wmul,(LCD_time@tmp)
	movff	1+?___wmul,(LCD_time@tmp+1)
	line	263
	
l5249:
;i2c.h: 263: tmp=tmp/16;
	movff	(LCD_time@tmp),??_LCD_time+0+0
	movff	(LCD_time@tmp+1),??_LCD_time+0+0+1
	movlw	04h
	movlb	0	; () banked
	movwf	(??_LCD_time+2+0)&0ffh
u4605:
	bcf	status,0
	rrcf	(??_LCD_time+0+1)&0ffh
	rrcf	(??_LCD_time+0+0)&0ffh
	decfsz	(??_LCD_time+2+0)&0ffh
	goto	u4605
	movff	??_LCD_time+0+0,(LCD_time@tmp)
	movff	??_LCD_time+0+1,(LCD_time@tmp+1)
	line	264
	
l5251:; BSR set to: 0

;i2c.h: 264: tmp_disp[2] = tmp+ 0x30;
	movlb	1	; () banked
	movf	((LCD_time@tmp))&0ffh,w
	addlw	low(030h)
	movlb	0	; () banked
	movwf	(0+(_tmp_disp+02h))&0ffh
	line	265
	
l5253:; BSR set to: 0

;i2c.h: 265: writeData( tmp_disp[2] );
	movf	(0+(_tmp_disp+02h))&0ffh,w
	
	call	_writeData
	line	267
	
l312:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_LCD_time
	__end_of_LCD_time:
	signat	_LCD_time,12409
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2   21[BANK0 ] unsigned int 
;;  multiplicand    2   23[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2   25[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   21[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LCD_time
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\Umul16.c"
	line	15
global __ptext16
__ptext16:
psect	text16
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\Umul16.c"
	line	15
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:
;incstack = 0
	opt	stack 17
	line	37
	
l5065:
	movlb	0	; () banked
	movf	((___wmul@multiplier))&0ffh,w
	mulwf	((___wmul@multiplicand))&0ffh
	movff	prodl,(___wmul@product)
	movff	prodh,(___wmul@product+1)
	line	38
	movf	((___wmul@multiplier))&0ffh,w
	mulwf	(0+(___wmul@multiplicand+01h))&0ffh
	movf	(prodl),c,w
	addwf	((___wmul@product+1))&0ffh

	line	39
	movf	(0+(___wmul@multiplier+01h))&0ffh,w
	mulwf	((___wmul@multiplicand))&0ffh
	movf	(prodl),c,w
	addwf	((___wmul@product+1))&0ffh

	line	52
	
l5067:; BSR set to: 0

	movff	(___wmul@product),(?___wmul)
	movff	(___wmul@product+1),(?___wmul+1)
	goto	l840
	
l5069:; BSR set to: 0

	line	53
	
l840:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	___lwmod

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 8 in file "C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\lwmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        2   28[BANK0 ] unsigned int 
;;  divisor         2   30[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   32[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   28[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       4       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LCD_time
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\lwmod.c"
	line	8
global __ptext17
__ptext17:
psect	text17
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\lwmod.c"
	line	8
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:; BSR set to: 0

;incstack = 0
	opt	stack 17
	line	13
	
l5129:
	movlb	0	; () banked
	movf	((___lwmod@divisor))&0ffh,w
iorwf	((___lwmod@divisor+1))&0ffh,w
	btfsc	status,2
	goto	u4541
	goto	u4540

u4541:
	goto	l1250
u4540:
	line	14
	
l5131:; BSR set to: 0

	movlw	low(01h)
	movwf	((___lwmod@counter))&0ffh
	line	15
	goto	l5135
	
l1252:; BSR set to: 0

	line	16
	
l5133:; BSR set to: 0

	bcf	status,0
	rlcf	((___lwmod@divisor))&0ffh
	rlcf	((___lwmod@divisor+1))&0ffh
	line	17
	incf	((___lwmod@counter))&0ffh
	goto	l5135
	line	18
	
l1251:; BSR set to: 0

	line	15
	
l5135:; BSR set to: 0

	
	btfss	((___lwmod@divisor+1))&0ffh,(15)&7
	goto	u4551
	goto	u4550
u4551:
	goto	l5133
u4550:
	goto	l5137
	
l1253:; BSR set to: 0

	goto	l5137
	line	19
	
l1254:; BSR set to: 0

	line	20
	
l5137:; BSR set to: 0

		movf	((___lwmod@divisor))&0ffh,w
	subwf	((___lwmod@dividend))&0ffh,w
	movf	((___lwmod@divisor+1))&0ffh,w
	subwfb	((___lwmod@dividend+1))&0ffh,w
	btfss	status,0
	goto	u4561
	goto	u4560

u4561:
	goto	l5141
u4560:
	line	21
	
l5139:; BSR set to: 0

	movf	((___lwmod@divisor))&0ffh,w
	subwf	((___lwmod@dividend))&0ffh
	movf	((___lwmod@divisor+1))&0ffh,w
	subwfb	((___lwmod@dividend+1))&0ffh

	goto	l5141
	
l1255:; BSR set to: 0

	line	22
	
l5141:; BSR set to: 0

	bcf	status,0
	rrcf	((___lwmod@divisor+1))&0ffh
	rrcf	((___lwmod@divisor))&0ffh
	line	23
	
l5143:; BSR set to: 0

	decfsz	((___lwmod@counter))&0ffh
	
	goto	l5137
	goto	l1250
	
l1256:; BSR set to: 0

	line	24
	
l1250:; BSR set to: 0

	line	25
	movff	(___lwmod@dividend),(?___lwmod)
	movff	(___lwmod@dividend+1),(?___lwmod+1)
	line	26
	
l1257:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
	signat	___lwmod,8314
	global	___lwdiv

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 8 in file "C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        2   21[BANK0 ] unsigned int 
;;  divisor         2   23[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   26[BANK0 ] unsigned int 
;;  counter         1   25[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   21[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       4       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_LCD_time
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\lwdiv.c"
	line	8
global __ptext18
__ptext18:
psect	text18
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\lwdiv.c"
	line	8
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:; BSR set to: 0

;incstack = 0
	opt	stack 17
	line	14
	
l5107:
	movlw	high(0)
	movlb	0	; () banked
	movwf	((___lwdiv@quotient+1))&0ffh
	movlw	low(0)
	movwf	((___lwdiv@quotient))&0ffh
	line	15
	
l5109:; BSR set to: 0

	movf	((___lwdiv@divisor))&0ffh,w
iorwf	((___lwdiv@divisor+1))&0ffh,w
	btfsc	status,2
	goto	u4511
	goto	u4510

u4511:
	goto	l1240
u4510:
	line	16
	
l5111:; BSR set to: 0

	movlw	low(01h)
	movwf	((___lwdiv@counter))&0ffh
	line	17
	goto	l5115
	
l1242:; BSR set to: 0

	line	18
	
l5113:; BSR set to: 0

	bcf	status,0
	rlcf	((___lwdiv@divisor))&0ffh
	rlcf	((___lwdiv@divisor+1))&0ffh
	line	19
	incf	((___lwdiv@counter))&0ffh
	goto	l5115
	line	20
	
l1241:; BSR set to: 0

	line	17
	
l5115:; BSR set to: 0

	
	btfss	((___lwdiv@divisor+1))&0ffh,(15)&7
	goto	u4521
	goto	u4520
u4521:
	goto	l5113
u4520:
	goto	l5117
	
l1243:; BSR set to: 0

	goto	l5117
	line	21
	
l1244:; BSR set to: 0

	line	22
	
l5117:; BSR set to: 0

	bcf	status,0
	rlcf	((___lwdiv@quotient))&0ffh
	rlcf	((___lwdiv@quotient+1))&0ffh
	line	23
	
l5119:; BSR set to: 0

		movf	((___lwdiv@divisor))&0ffh,w
	subwf	((___lwdiv@dividend))&0ffh,w
	movf	((___lwdiv@divisor+1))&0ffh,w
	subwfb	((___lwdiv@dividend+1))&0ffh,w
	btfss	status,0
	goto	u4531
	goto	u4530

u4531:
	goto	l5125
u4530:
	line	24
	
l5121:; BSR set to: 0

	movf	((___lwdiv@divisor))&0ffh,w
	subwf	((___lwdiv@dividend))&0ffh
	movf	((___lwdiv@divisor+1))&0ffh,w
	subwfb	((___lwdiv@dividend+1))&0ffh

	line	25
	
l5123:; BSR set to: 0

	bsf	(0+(0/8)+(___lwdiv@quotient))&0ffh,(0)&7
	goto	l5125
	line	26
	
l1245:; BSR set to: 0

	line	27
	
l5125:; BSR set to: 0

	bcf	status,0
	rrcf	((___lwdiv@divisor+1))&0ffh
	rrcf	((___lwdiv@divisor))&0ffh
	line	28
	
l5127:; BSR set to: 0

	decfsz	((___lwdiv@counter))&0ffh
	
	goto	l5117
	goto	l1240
	
l1246:; BSR set to: 0

	line	29
	
l1240:; BSR set to: 0

	line	30
	movff	(___lwdiv@quotient),(?___lwdiv)
	movff	(___lwdiv@quotient+1),(?___lwdiv+1)
	line	31
	
l1247:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
	signat	___lwdiv,8314
	global	_I2C_Tsensor

;; *************** function _I2C_Tsensor *****************
;; Defined at:
;;		line 180 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tpr             2   28[BANK0 ] unsigned short 
;;  c               1   30[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   24[BANK0 ] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       2       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   14
;; This function calls:
;;		_I2C_Master_Start
;;		_I2C_Master_Stop
;;		_I2C_Master_Write
;;		_I2C_nacksnd
;; This function is called by:
;;		_LCD_time
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	180
global __ptext19
__ptext19:
psect	text19
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	180
	global	__size_of_I2C_Tsensor
	__size_of_I2C_Tsensor	equ	__end_of_I2C_Tsensor-_I2C_Tsensor
	
_I2C_Tsensor:; BSR set to: 0

;incstack = 0
	opt	stack 15
	line	185
	
l5007:
;i2c.h: 182: unsigned short tpr;
;i2c.h: 183: unsigned char c;
;i2c.h: 185: I2C_Master_Start();
	call	_I2C_Master_Start	;wreg free
	line	186
;i2c.h: 186: I2C_Master_Write(0x94 | 0x00);
	movlw	high(094h)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(094h)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	187
;i2c.h: 187: I2C_Master_Write(0x00);
	movlw	high(0)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(0)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	189
;i2c.h: 189: I2C_Master_Start();
	call	_I2C_Master_Start	;wreg free
	line	190
;i2c.h: 190: I2C_Master_Write(0x94 | 0x01);
	movlw	high(095h)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(095h)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	191
	
l5009:
;i2c.h: 191: _delay((unsigned long)((5)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	26
	movlb	0	; () banked
movwf	(??_I2C_Tsensor+0+0)&0ffh,f
	movlw	248
u4967:
decfsz	wreg,f
	bra	u4967
	decfsz	(??_I2C_Tsensor+0+0)&0ffh,f
	bra	u4967
	nop
opt asmopt_pop

	line	195
	
l5011:
;i2c.h: 195: SSPIF = 0;
	bcf	c:(31987/8),(31987)&7	;volatile
	line	196
	
l5013:
;i2c.h: 196: RCEN = 1;
	bsf	c:(32299/8),(32299)&7	;volatile
	line	197
;i2c.h: 197: while (RCEN) {}
	goto	l303
	
l304:
	
l303:
	btfsc	c:(32299/8),(32299)&7	;volatile
	goto	u4371
	goto	u4370
u4371:
	goto	l303
u4370:
	
l305:
	line	198
;i2c.h: 198: c=(SSPBUF);
	movff	(c:4041),(I2C_Tsensor@c)	;volatile
	line	199
;i2c.h: 199: ACKDT=0;
	bcf	c:(32301/8),(32301)&7	;volatile
	line	200
;i2c.h: 200: ACKEN = 1;
	bsf	c:(32300/8),(32300)&7	;volatile
	line	203
	
l5015:
;i2c.h: 203: tpr = (unsigned short)c<<4;
	movlb	0	; () banked
	movf	((I2C_Tsensor@c))&0ffh,w
	movwf	(??_I2C_Tsensor+0+0)&0ffh
	clrf	(??_I2C_Tsensor+0+0+1)&0ffh

	swapf	(??_I2C_Tsensor+0+0)&0ffh
	swapf	(??_I2C_Tsensor+0+1)&0ffh
	movlw	0f0h
	andwf	(??_I2C_Tsensor+0+1)&0ffh
	movf	(??_I2C_Tsensor+0+0)&0ffh,w
	andlw	0fh
	iorwf	(??_I2C_Tsensor+0+1)&0ffh
	movlw	0f0h
	andwf	(??_I2C_Tsensor+0+0)&0ffh
	movff	??_I2C_Tsensor+0+0,(I2C_Tsensor@tpr)
	movff	??_I2C_Tsensor+0+1,(I2C_Tsensor@tpr+1)
	line	204
	
l5017:; BSR set to: 0

;i2c.h: 204: _delay((unsigned long)((1)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	6
	movlb	0	; () banked
movwf	(??_I2C_Tsensor+0+0)&0ffh,f
	movlw	48
u4977:
decfsz	wreg,f
	bra	u4977
	decfsz	(??_I2C_Tsensor+0+0)&0ffh,f
	bra	u4977
	nop
opt asmopt_pop

	line	207
	
l5019:
;i2c.h: 207: RCEN = 1;
	bsf	c:(32299/8),(32299)&7	;volatile
	line	208
;i2c.h: 208: while (RCEN) {}
	goto	l306
	
l307:
	
l306:
	btfsc	c:(32299/8),(32299)&7	;volatile
	goto	u4381
	goto	u4380
u4381:
	goto	l306
u4380:
	
l308:
	line	209
;i2c.h: 209: c=(SSPBUF);
	movff	(c:4041),(I2C_Tsensor@c)	;volatile
	line	213
	
l5021:
;i2c.h: 213: tpr |= (unsigned short)c>>4;
	movff	(I2C_Tsensor@c),??_I2C_Tsensor+0+0
	movlb	0	; () banked
	swapf	(??_I2C_Tsensor+0+0)&0ffh
	movlw	(0ffh shr 4) & 0ffh
	andwf	(??_I2C_Tsensor+0+0)&0ffh
	movf	(??_I2C_Tsensor+0+0)&0ffh,w
	iorwf	((I2C_Tsensor@tpr))&0ffh
	line	214
	
l5023:; BSR set to: 0

;i2c.h: 214: I2C_nacksnd();
	call	_I2C_nacksnd	;wreg free
	line	215
;i2c.h: 215: I2C_Master_Stop();
	call	_I2C_Master_Stop	;wreg free
	line	217
	
l5025:
;i2c.h: 217: return(tpr);
	movff	(I2C_Tsensor@tpr),(?_I2C_Tsensor)
	movff	(I2C_Tsensor@tpr+1),(?_I2C_Tsensor+1)
	goto	l309
	
l5027:
	line	218
	
l309:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_I2C_Tsensor
	__end_of_I2C_Tsensor:
	signat	_I2C_Tsensor,90
	global	_LCD_str

;; *************** function _LCD_str *****************
;; Defined at:
;;		line 139 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;  c               2   26[BANK0 ] PTR unsigned char 
;;		 -> moji11(19), 
;; Auto vars:     Size  Location     Type
;;  wk              1   29[BANK0 ] unsigned char 
;;  i               1   28[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   15
;; This function calls:
;;		_writeData
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text20,class=CODE,space=0,reloc=2,group=0
	line	139
global __ptext20
__ptext20:
psect	text20
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	139
	global	__size_of_LCD_str
	__size_of_LCD_str	equ	__end_of_LCD_str-_LCD_str
	
_LCD_str:
;incstack = 0
	opt	stack 15
	line	141
	
l5175:
;i2c.h: 140: unsigned char i,wk;
;i2c.h: 141: for (i=0 ; ; i++) {
	movlw	low(0)
	movlb	0	; () banked
	movwf	((LCD_str@i))&0ffh
	goto	l5177
	
l282:; BSR set to: 0

	line	142
	
l5177:; BSR set to: 0

;i2c.h: 142: wk = c[i];
	movf	((LCD_str@i))&0ffh,w
	mullw	01h
	movf	(prodl),c,w
	addwf	((LCD_str@c))&0ffh,w
	movwf	c:fsr2l
	movf	(prodh),c,w
	addwfc	((LCD_str@c+1))&0ffh,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((LCD_str@wk))&0ffh
	line	143
	
l5179:; BSR set to: 0

;i2c.h: 143: if (wk == 0x00) {break;}
	movf	((LCD_str@wk))&0ffh,w
	btfss	status,2
	goto	u4571
	goto	u4570
u4571:
	goto	l5183
u4570:
	goto	l285
	
l5181:; BSR set to: 0

	goto	l285
	
l283:; BSR set to: 0

	line	144
	
l5183:; BSR set to: 0

;i2c.h: 144: writeData(wk);
	movf	((LCD_str@wk))&0ffh,w
	
	call	_writeData
	line	141
	
l5185:
	movlb	0	; () banked
	incf	((LCD_str@i))&0ffh
	goto	l5177
	
l284:; BSR set to: 0

	line	146
	
l285:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_LCD_str
	__end_of_LCD_str:
	signat	_LCD_str,4217
	global	_writeData

;; *************** function _writeData *****************
;; Defined at:
;;		line 91 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;  t_data          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  t_data          1   25[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   14
;; This function calls:
;;		_I2C_Master_Start
;;		_I2C_Master_Stop
;;		_I2C_Master_Write
;; This function is called by:
;;		_LCD_str
;;		_LCD_time
;; This function uses a non-reentrant model
;;
psect	text21,class=CODE,space=0,reloc=2,group=0
	line	91
global __ptext21
__ptext21:
psect	text21
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	91
	global	__size_of_writeData
	__size_of_writeData	equ	__end_of_writeData-_writeData
	
_writeData:; BSR set to: 0

;incstack = 0
	opt	stack 15
;writeData@t_data stored from wreg
	movlb	0	; () banked
	movwf	((writeData@t_data))&0ffh
	line	92
	
l4999:
;i2c.h: 92: I2C_Master_Start();
	call	_I2C_Master_Start	;wreg free
	line	93
;i2c.h: 93: I2C_Master_Write(0x7C);
	movlw	high(07Ch)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(07Ch)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	94
;i2c.h: 94: I2C_Master_Write(0x40);
	movlw	high(040h)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(040h)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	95
;i2c.h: 95: I2C_Master_Write(t_data);
	movff	(writeData@t_data),(I2C_Master_Write@d)
	movlb	0	; () banked
	clrf	((I2C_Master_Write@d+1))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	96
;i2c.h: 96: I2C_Master_Stop();
	call	_I2C_Master_Stop	;wreg free
	line	97
	
l5001:
;i2c.h: 97: _delay((unsigned long)((1)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	6
	movlb	0	; () banked
movwf	(??_writeData+0+0)&0ffh,f
	movlw	48
u4987:
decfsz	wreg,f
	bra	u4987
	decfsz	(??_writeData+0+0)&0ffh,f
	bra	u4987
	nop
opt asmopt_pop

	line	98
	
l270:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_writeData
	__end_of_writeData:
	signat	_writeData,4217
	global	_LCD_Init

;; *************** function _LCD_Init *****************
;; Defined at:
;;		line 116 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   15
;; This function calls:
;;		_I2C_Master_Init
;;		_writeCommand
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=0
	line	116
global __ptext22
__ptext22:
psect	text22
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	116
	global	__size_of_LCD_Init
	__size_of_LCD_Init	equ	__end_of_LCD_Init-_LCD_Init
	
_LCD_Init:
;incstack = 0
	opt	stack 15
	line	117
	
l5147:
;i2c.h: 117: I2C_Master_Init(100000);
	movlw	low(0186A0h)
	movlb	1	; () banked
	movwf	((I2C_Master_Init@c))&0ffh
	movlw	high(0186A0h)
	movwf	((I2C_Master_Init@c+1))&0ffh
	movlw	low highword(0186A0h)
	movwf	((I2C_Master_Init@c+2))&0ffh
	movlw	high highword(0186A0h)
	movwf	((I2C_Master_Init@c+3))&0ffh
	call	_I2C_Master_Init	;wreg free
	line	118
	
l5149:
;i2c.h: 118: _delay((unsigned long)((400)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw  9
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0+1)&0ffh,f
movlw	30
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	228
u4997:
decfsz	wreg,f
	bra	u4997
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u4997
	decfsz	(??_LCD_Init+0+0+1)&0ffh,f
	bra	u4997
	nop
opt asmopt_pop

	line	119
	
l5151:
;i2c.h: 119: writeCommand(0x38);
	movlw	(038h)&0ffh
	
	call	_writeCommand
	line	120
;i2c.h: 120: _delay((unsigned long)((20)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	104
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	228
u5007:
decfsz	wreg,f
	bra	u5007
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u5007
	nop
opt asmopt_pop

	line	121
	
l5153:
;i2c.h: 121: writeCommand(0x39);
	movlw	(039h)&0ffh
	
	call	_writeCommand
	line	122
	
l5155:
;i2c.h: 122: _delay((unsigned long)((20)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	104
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	228
u5017:
decfsz	wreg,f
	bra	u5017
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u5017
	nop
opt asmopt_pop

	line	123
;i2c.h: 123: writeCommand(0x14);
	movlw	(014h)&0ffh
	
	call	_writeCommand
	line	124
	
l5157:
;i2c.h: 124: _delay((unsigned long)((20)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	104
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	228
u5027:
decfsz	wreg,f
	bra	u5027
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u5027
	nop
opt asmopt_pop

	line	125
	
l5159:
;i2c.h: 125: writeCommand(0x73);
	movlw	(073h)&0ffh
	
	call	_writeCommand
	line	126
;i2c.h: 126: _delay((unsigned long)((20)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	104
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	228
u5037:
decfsz	wreg,f
	bra	u5037
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u5037
	nop
opt asmopt_pop

	line	127
	
l5161:
;i2c.h: 127: writeCommand(0x52);
	movlw	(052h)&0ffh
	
	call	_writeCommand
	line	128
	
l5163:
;i2c.h: 128: _delay((unsigned long)((20)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	104
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	228
u5047:
decfsz	wreg,f
	bra	u5047
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u5047
	nop
opt asmopt_pop

	line	129
;i2c.h: 129: writeCommand(0x6C);
	movlw	(06Ch)&0ffh
	
	call	_writeCommand
	line	130
	
l5165:
;i2c.h: 130: _delay((unsigned long)((250)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw  6
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0+1)&0ffh,f
movlw	19
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	173
u5057:
decfsz	wreg,f
	bra	u5057
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u5057
	decfsz	(??_LCD_Init+0+0+1)&0ffh,f
	bra	u5057
	nop2
opt asmopt_pop

	line	131
	
l5167:
;i2c.h: 131: writeCommand(0x38);
	movlw	(038h)&0ffh
	
	call	_writeCommand
	line	132
;i2c.h: 132: _delay((unsigned long)((20)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	104
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	228
u5067:
decfsz	wreg,f
	bra	u5067
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u5067
	nop
opt asmopt_pop

	line	133
	
l5169:
;i2c.h: 133: writeCommand(0x01);
	movlw	(01h)&0ffh
	
	call	_writeCommand
	line	134
	
l5171:
;i2c.h: 134: _delay((unsigned long)((20)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	104
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	228
u5077:
decfsz	wreg,f
	bra	u5077
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u5077
	nop
opt asmopt_pop

	line	135
;i2c.h: 135: writeCommand(0x0C);
	movlw	(0Ch)&0ffh
	
	call	_writeCommand
	line	136
	
l5173:
;i2c.h: 136: _delay((unsigned long)((20)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	104
	movlb	0	; () banked
movwf	(??_LCD_Init+0+0)&0ffh,f
	movlw	228
u5087:
decfsz	wreg,f
	bra	u5087
	decfsz	(??_LCD_Init+0+0)&0ffh,f
	bra	u5087
	nop
opt asmopt_pop

	line	137
	
l279:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_LCD_Init
	__end_of_LCD_Init:
	signat	_LCD_Init,89
	global	_writeCommand

;; *************** function _writeCommand *****************
;; Defined at:
;;		line 99 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;  t_command       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  t_command       1   25[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   14
;; This function calls:
;;		_I2C_Master_Start
;;		_I2C_Master_Stop
;;		_I2C_Master_Write
;; This function is called by:
;;		_LCD_Init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text23,class=CODE,space=0,reloc=2,group=0
	line	99
global __ptext23
__ptext23:
psect	text23
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	99
	global	__size_of_writeCommand
	__size_of_writeCommand	equ	__end_of_writeCommand-_writeCommand
	
_writeCommand:
;incstack = 0
	opt	stack 16
;writeCommand@t_command stored from wreg
	movlb	0	; () banked
	movwf	((writeCommand@t_command))&0ffh
	line	100
	
l5003:
;i2c.h: 100: I2C_Master_Start();
	call	_I2C_Master_Start	;wreg free
	line	101
;i2c.h: 101: I2C_Master_Write(0x7C);
	movlw	high(07Ch)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(07Ch)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	102
;i2c.h: 102: I2C_Master_Write(0x00);
	movlw	high(0)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(0)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	103
;i2c.h: 103: I2C_Master_Write(t_command);
	movff	(writeCommand@t_command),(I2C_Master_Write@d)
	movlb	0	; () banked
	clrf	((I2C_Master_Write@d+1))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	104
;i2c.h: 104: I2C_Master_Stop();
	call	_I2C_Master_Stop	;wreg free
	line	105
	
l5005:
;i2c.h: 105: _delay((unsigned long)((1)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	6
	movlb	0	; () banked
movwf	(??_writeCommand+0+0)&0ffh,f
	movlw	48
u5097:
decfsz	wreg,f
	bra	u5097
	decfsz	(??_writeCommand+0+0)&0ffh,f
	bra	u5097
	nop
opt asmopt_pop

	line	106
	
l273:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_writeCommand
	__end_of_writeCommand:
	signat	_writeCommand,4217
	global	_I2C_Master_Init

;; *************** function _I2C_Master_Init *****************
;; Defined at:
;;		line 55 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;  c               4    0[BANK1 ] const unsigned long 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       4       0       0
;;      Totals:         0       0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		___lldiv
;; This function is called by:
;;		_LCD_Init
;; This function uses a non-reentrant model
;;
psect	text24,class=CODE,space=0,reloc=2,group=0
	line	55
global __ptext24
__ptext24:
psect	text24
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	55
	global	__size_of_I2C_Master_Init
	__size_of_I2C_Master_Init	equ	__end_of_I2C_Master_Init-_I2C_Master_Init
	
_I2C_Master_Init:
;incstack = 0
	opt	stack 16
	line	57
	
l4993:
;i2c.h: 57: SSPCON1 = 0b00101000;
	movlw	low(028h)
	movwf	((c:4038)),c	;volatile
	line	58
;i2c.h: 58: SSPCON2 = 0;
	movlw	low(0)
	movwf	((c:4037)),c	;volatile
	line	59
	
l4995:
;i2c.h: 59: SSPADD =(16000000/(4*c))-1;
	movlw	low(0F42400h)
	movlb	0	; () banked
	movwf	((___lldiv@dividend))&0ffh
	movlw	high(0F42400h)
	movwf	((___lldiv@dividend+1))&0ffh
	movlw	low highword(0F42400h)
	movwf	((___lldiv@dividend+2))&0ffh
	movlw	high highword(0F42400h)
	movwf	((___lldiv@dividend+3))&0ffh
	movff	(I2C_Master_Init@c),??_I2C_Master_Init+0+0
	movff	(I2C_Master_Init@c+1),??_I2C_Master_Init+0+0+1
	movff	(I2C_Master_Init@c+2),??_I2C_Master_Init+0+0+2
	movff	(I2C_Master_Init@c+3),??_I2C_Master_Init+0+0+3
	movlw	02h
u4365:
	bcf	status,0
	movlb	1	; () banked
	rlcf	(??_I2C_Master_Init+0+0)&0ffh
	rlcf	(??_I2C_Master_Init+0+1)&0ffh
	rlcf	(??_I2C_Master_Init+0+2)&0ffh
	rlcf	(??_I2C_Master_Init+0+3)&0ffh
	decfsz	wreg
	goto	u4365
	movff	??_I2C_Master_Init+0+0,(___lldiv@divisor)
	movff	??_I2C_Master_Init+0+1,(___lldiv@divisor+1)
	movff	??_I2C_Master_Init+0+2,(___lldiv@divisor+2)
	movff	??_I2C_Master_Init+0+3,(___lldiv@divisor+3)
	call	___lldiv	;wreg free
	movlb	0	; () banked
	decf	(0+?___lldiv)&0ffh,w
	movwf	((c:4040)),c	;volatile
	line	60
	
l4997:; BSR set to: 0

;i2c.h: 60: SSPSTAT = 0b00000000 ;
	movlw	low(0)
	movwf	((c:4039)),c	;volatile
	line	61
	
l249:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_I2C_Master_Init
	__end_of_I2C_Master_Init:
	signat	_I2C_Master_Init,4217
	global	___lldiv

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 8 in file "C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\lldiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        4   21[BANK0 ] unsigned long 
;;  divisor         4   25[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   29[BANK0 ] unsigned long 
;;  counter         1   33[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   21[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       8       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_Master_Init
;; This function uses a non-reentrant model
;;
psect	text25,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\lldiv.c"
	line	8
global __ptext25
__ptext25:
psect	text25
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\lldiv.c"
	line	8
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:; BSR set to: 0

;incstack = 0
	opt	stack 16
	line	14
	
l4859:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((___lldiv@quotient))&0ffh
	movlw	high(0)
	movwf	((___lldiv@quotient+1))&0ffh
	movlw	low highword(0)
	movwf	((___lldiv@quotient+2))&0ffh
	movlw	high highword(0)
	movwf	((___lldiv@quotient+3))&0ffh
	line	15
	
l4861:; BSR set to: 0

	movf	((___lldiv@divisor))&0ffh,w
iorwf	((___lldiv@divisor+1))&0ffh,w
iorwf	((___lldiv@divisor+2))&0ffh,w
iorwf	((___lldiv@divisor+3))&0ffh,w
	btfsc	status,2
	goto	u4141
	goto	u4140

u4141:
	goto	l1187
u4140:
	line	16
	
l4863:; BSR set to: 0

	movlw	low(01h)
	movwf	((___lldiv@counter))&0ffh
	line	17
	goto	l4867
	
l1189:; BSR set to: 0

	line	18
	
l4865:; BSR set to: 0

	bcf	status,0
	rlcf	((___lldiv@divisor))&0ffh
	rlcf	((___lldiv@divisor+1))&0ffh
	rlcf	((___lldiv@divisor+2))&0ffh
	rlcf	((___lldiv@divisor+3))&0ffh
	line	19
	incf	((___lldiv@counter))&0ffh
	goto	l4867
	line	20
	
l1188:; BSR set to: 0

	line	17
	
l4867:; BSR set to: 0

	
	btfss	((___lldiv@divisor+3))&0ffh,(31)&7
	goto	u4151
	goto	u4150
u4151:
	goto	l4865
u4150:
	goto	l4869
	
l1190:; BSR set to: 0

	goto	l4869
	line	21
	
l1191:; BSR set to: 0

	line	22
	
l4869:; BSR set to: 0

	bcf	status,0
	rlcf	((___lldiv@quotient))&0ffh
	rlcf	((___lldiv@quotient+1))&0ffh
	rlcf	((___lldiv@quotient+2))&0ffh
	rlcf	((___lldiv@quotient+3))&0ffh
	line	23
	
l4871:; BSR set to: 0

		movf	((___lldiv@divisor))&0ffh,w
	subwf	((___lldiv@dividend))&0ffh,w
	movf	((___lldiv@divisor+1))&0ffh,w
	subwfb	((___lldiv@dividend+1))&0ffh,w
	movf	((___lldiv@divisor+2))&0ffh,w
	subwfb	((___lldiv@dividend+2))&0ffh,w
	movf	((___lldiv@divisor+3))&0ffh,w
	subwfb	((___lldiv@dividend+3))&0ffh,w
	btfss	status,0
	goto	u4161
	goto	u4160

u4161:
	goto	l4877
u4160:
	line	24
	
l4873:; BSR set to: 0

	movf	((___lldiv@divisor))&0ffh,w
	subwf	((___lldiv@dividend))&0ffh
	movf	((___lldiv@divisor+1))&0ffh,w
	subwfb	((___lldiv@dividend+1))&0ffh
	movf	((___lldiv@divisor+2))&0ffh,w
	subwfb	((___lldiv@dividend+2))&0ffh
	movf	((___lldiv@divisor+3))&0ffh,w
	subwfb	((___lldiv@dividend+3))&0ffh
	line	25
	
l4875:; BSR set to: 0

	bsf	(0+(0/8)+(___lldiv@quotient))&0ffh,(0)&7
	goto	l4877
	line	26
	
l1192:; BSR set to: 0

	line	27
	
l4877:; BSR set to: 0

	bcf	status,0
	rrcf	((___lldiv@divisor+3))&0ffh
	rrcf	((___lldiv@divisor+2))&0ffh
	rrcf	((___lldiv@divisor+1))&0ffh
	rrcf	((___lldiv@divisor))&0ffh
	line	28
	
l4879:; BSR set to: 0

	decfsz	((___lldiv@counter))&0ffh
	
	goto	l4869
	goto	l1187
	
l1193:; BSR set to: 0

	line	29
	
l1187:; BSR set to: 0

	line	30
	movff	(___lldiv@quotient),(?___lldiv)
	movff	(___lldiv@quotient+1),(?___lldiv+1)
	movff	(___lldiv@quotient+2),(?___lldiv+2)
	movff	(___lldiv@quotient+3),(?___lldiv+3)
	line	31
	
l1194:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_I2C_Tsensor_CFG

;; *************** function _I2C_Tsensor_CFG *****************
;; Defined at:
;;		line 164 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   14
;; This function calls:
;;		_I2C_Master_Start
;;		_I2C_Master_Stop
;;		_I2C_Master_Write
;;		_I2C_nacksnd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text26,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	164
global __ptext26
__ptext26:
psect	text26
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	164
	global	__size_of_I2C_Tsensor_CFG
	__size_of_I2C_Tsensor_CFG	equ	__end_of_I2C_Tsensor_CFG-_I2C_Tsensor_CFG
	
_I2C_Tsensor_CFG:; BSR set to: 0

;incstack = 0
	opt	stack 16
	line	166
	
l5187:
;i2c.h: 166: I2C_Master_Start();
	call	_I2C_Master_Start	;wreg free
	line	167
;i2c.h: 167: I2C_Master_Write(0x94 | 0x00);
	movlw	high(094h)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(094h)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	168
	
l5189:
;i2c.h: 168: _delay((unsigned long)((1)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	6
	movlb	0	; () banked
movwf	(??_I2C_Tsensor_CFG+0+0)&0ffh,f
	movlw	48
u5107:
decfsz	wreg,f
	bra	u5107
	decfsz	(??_I2C_Tsensor_CFG+0+0)&0ffh,f
	bra	u5107
	nop
opt asmopt_pop

	line	169
	
l5191:
;i2c.h: 169: I2C_Master_Write(0x01);
	movlw	high(01h)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(01h)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	170
;i2c.h: 170: _delay((unsigned long)((1)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	6
	movlb	0	; () banked
movwf	(??_I2C_Tsensor_CFG+0+0)&0ffh,f
	movlw	48
u5117:
decfsz	wreg,f
	bra	u5117
	decfsz	(??_I2C_Tsensor_CFG+0+0)&0ffh,f
	bra	u5117
	nop
opt asmopt_pop

	line	171
	
l5193:
;i2c.h: 171: I2C_Master_Write(0x00);
	movlw	high(0)
	movlb	0	; () banked
	movwf	((I2C_Master_Write@d+1))&0ffh
	movlw	low(0)
	movwf	((I2C_Master_Write@d))&0ffh
	call	_I2C_Master_Write	;wreg free
	line	172
	
l5195:
;i2c.h: 172: _delay((unsigned long)((1)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	6
	movlb	0	; () banked
movwf	(??_I2C_Tsensor_CFG+0+0)&0ffh,f
	movlw	48
u5127:
decfsz	wreg,f
	bra	u5127
	decfsz	(??_I2C_Tsensor_CFG+0+0)&0ffh,f
	bra	u5127
	nop
opt asmopt_pop

	line	173
	
l5197:
;i2c.h: 173: I2C_nacksnd();
	call	_I2C_nacksnd	;wreg free
	line	174
	
l5199:
;i2c.h: 174: I2C_Master_Stop();
	call	_I2C_Master_Stop	;wreg free
	line	175
	
l5201:
;i2c.h: 175: _delay((unsigned long)((10)*(16000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw	52
	movlb	0	; () banked
movwf	(??_I2C_Tsensor_CFG+0+0)&0ffh,f
	movlw	241
u5137:
decfsz	wreg,f
	bra	u5137
	decfsz	(??_I2C_Tsensor_CFG+0+0)&0ffh,f
	bra	u5137
	nop2
opt asmopt_pop

	goto	l300
	line	177
	
l5203:
	line	178
;i2c.h: 177: return;
	
l300:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_I2C_Tsensor_CFG
	__end_of_I2C_Tsensor_CFG:
	signat	_I2C_Tsensor_CFG,89
	global	_I2C_nacksnd

;; *************** function _I2C_nacksnd *****************
;; Defined at:
;;		line 156 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_Tsensor_CFG
;;		_I2C_Tsensor
;; This function uses a non-reentrant model
;;
psect	text27,class=CODE,space=0,reloc=2,group=0
	line	156
global __ptext27
__ptext27:
psect	text27
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	156
	global	__size_of_I2C_nacksnd
	__size_of_I2C_nacksnd	equ	__end_of_I2C_nacksnd-_I2C_nacksnd
	
_I2C_nacksnd:
;incstack = 0
	opt	stack 16
	line	157
	
l4857:
;i2c.h: 157: ACKDT = 1;
	bsf	c:(32301/8),(32301)&7	;volatile
	line	158
;i2c.h: 158: ACKEN = 1;
	bsf	c:(32300/8),(32300)&7	;volatile
	line	159
;i2c.h: 159: while (ACKEN) {}
	goto	l294
	
l295:
	
l294:
	btfsc	c:(32300/8),(32300)&7	;volatile
	goto	u4131
	goto	u4130
u4131:
	goto	l294
u4130:
	goto	l297
	
l296:
	line	162
;i2c.h: 161: return;
	
l297:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_I2C_nacksnd
	__end_of_I2C_nacksnd:
	signat	_I2C_nacksnd,89
	global	_I2C_Master_Write

;; *************** function _I2C_Master_Write *****************
;; Defined at:
;;		line 86 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;  d               2   22[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		_I2C_Master_Wait
;; This function is called by:
;;		_writeData
;;		_writeCommand
;;		_I2C_Tsensor_CFG
;;		_I2C_Tsensor
;; This function uses a non-reentrant model
;;
psect	text28,class=CODE,space=0,reloc=2,group=0
	line	86
global __ptext28
__ptext28:
psect	text28
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	86
	global	__size_of_I2C_Master_Write
	__size_of_I2C_Master_Write	equ	__end_of_I2C_Master_Write-_I2C_Master_Write
	
_I2C_Master_Write:
;incstack = 0
	opt	stack 16
	line	88
	
l4853:
;i2c.h: 88: I2C_Master_Wait();
	call	_I2C_Master_Wait	;wreg free
	line	89
	
l4855:
;i2c.h: 89: SSPBUF = d;
	movff	(I2C_Master_Write@d),(c:4041)	;volatile
	line	90
	
l267:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_I2C_Master_Write
	__end_of_I2C_Master_Write:
	signat	_I2C_Master_Write,4217
	global	_I2C_Master_Stop

;; *************** function _I2C_Master_Stop *****************
;; Defined at:
;;		line 80 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		_I2C_Master_Wait
;; This function is called by:
;;		_writeData
;;		_writeCommand
;;		_I2C_Tsensor_CFG
;;		_I2C_Tsensor
;; This function uses a non-reentrant model
;;
psect	text29,class=CODE,space=0,reloc=2,group=0
	line	80
global __ptext29
__ptext29:
psect	text29
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	80
	global	__size_of_I2C_Master_Stop
	__size_of_I2C_Master_Stop	equ	__end_of_I2C_Master_Stop-_I2C_Master_Stop
	
_I2C_Master_Stop:
;incstack = 0
	opt	stack 16
	line	82
	
l4849:
;i2c.h: 82: I2C_Master_Wait();
	call	_I2C_Master_Wait	;wreg free
	line	83
	
l4851:
;i2c.h: 83: PEN = 1;
	bsf	c:(32298/8),(32298)&7	;volatile
	line	84
	
l264:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_I2C_Master_Stop
	__end_of_I2C_Master_Stop:
	signat	_I2C_Master_Stop,89
	global	_I2C_Master_Start

;; *************** function _I2C_Master_Start *****************
;; Defined at:
;;		line 68 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		_I2C_Master_Wait
;; This function is called by:
;;		_writeData
;;		_writeCommand
;;		_I2C_Tsensor_CFG
;;		_I2C_Tsensor
;; This function uses a non-reentrant model
;;
psect	text30,class=CODE,space=0,reloc=2,group=0
	line	68
global __ptext30
__ptext30:
psect	text30
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	68
	global	__size_of_I2C_Master_Start
	__size_of_I2C_Master_Start	equ	__end_of_I2C_Master_Start-_I2C_Master_Start
	
_I2C_Master_Start:
;incstack = 0
	opt	stack 16
	line	70
	
l4845:
;i2c.h: 70: I2C_Master_Wait();
	call	_I2C_Master_Wait	;wreg free
	line	71
	
l4847:
;i2c.h: 71: SEN = 1;
	bsf	c:(32296/8),(32296)&7	;volatile
	line	72
	
l258:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_I2C_Master_Start
	__end_of_I2C_Master_Start:
	signat	_I2C_Master_Start,89
	global	_I2C_Master_Wait

;; *************** function _I2C_Master_Wait *****************
;; Defined at:
;;		line 63 in file "C:\pic\PIC18F\test02\./i2c.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_Master_Start
;;		_I2C_Master_Stop
;;		_I2C_Master_Write
;;		_I2C_Master_RepeatedStart
;; This function uses a non-reentrant model
;;
psect	text31,class=CODE,space=0,reloc=2,group=0
	line	63
global __ptext31
__ptext31:
psect	text31
	file	"C:\pic\PIC18F\test02\./i2c.h"
	line	63
	global	__size_of_I2C_Master_Wait
	__size_of_I2C_Master_Wait	equ	__end_of_I2C_Master_Wait-_I2C_Master_Wait
	
_I2C_Master_Wait:
;incstack = 0
	opt	stack 16
	line	65
	
l4813:
;i2c.h: 65: while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
	goto	l252
	
l253:
	
l252:
	
	btfsc	((c:4039)),c,(2)&7	;volatile
	goto	u4081
	goto	u4080
u4081:
	goto	l252
u4080:
	
l4815:
	movff	(c:4037),??_I2C_Master_Wait+0+0	;volatile
	movlw	01Fh
	movlb	0	; () banked
	andwf	(??_I2C_Master_Wait+0+0)&0ffh
	btfss	status,2
	goto	u4091
	goto	u4090
u4091:
	goto	l252
u4090:
	goto	l255
	
l254:; BSR set to: 0

	line	66
	
l255:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_I2C_Master_Wait
	__end_of_I2C_Master_Wait:
	signat	_I2C_Master_Wait,89
	global	_GRB_tblRD

;; *************** function _GRB_tblRD *****************
;; Defined at:
;;		line 423 in file "C:\pic\PIC18F\test02\main.c"
;; Parameters:    Size  Location     Type
;;  X               2   27[BANK0 ] PTR unsigned char 
;;		 -> GRB_tbl1(30), 
;;  rotate          2   29[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  j               2    2[BANK1 ] int 
;;  i               2    0[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       4       0       0       0
;;      Locals:         0       0       4       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       8       4       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   13
;; This function calls:
;;		___awmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text32,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\main.c"
	line	423
global __ptext32
__ptext32:
psect	text32
	file	"C:\pic\PIC18F\test02\main.c"
	line	423
	global	__size_of_GRB_tblRD
	__size_of_GRB_tblRD	equ	__end_of_GRB_tblRD-_GRB_tblRD
	
_GRB_tblRD:; BSR set to: 0

;incstack = 0
	opt	stack 17
	line	425
	
l5383:
;main.c: 424: int i,j;
;main.c: 425: for(j=0;j<30;j++){
	movlw	high(0)
	movlb	1	; () banked
	movwf	((GRB_tblRD@j+1))&0ffh
	movlw	low(0)
	movwf	((GRB_tblRD@j))&0ffh
	
l5385:; BSR set to: 1

	btfsc	((GRB_tblRD@j+1))&0ffh,7
	goto	u4721
	movf	((GRB_tblRD@j+1))&0ffh,w
	bnz	u4720
	movlw	30
	subwf	 ((GRB_tblRD@j))&0ffh,w
	btfss	status,0
	goto	u4721
	goto	u4720

u4721:
	goto	l5389
u4720:
	goto	l451
	
l5387:; BSR set to: 1

	goto	l451
	
l445:; BSR set to: 1

	line	427
	
l5389:; BSR set to: 1

;main.c: 427: for(i=2;i<4;i++){
	movlw	high(02h)
	movwf	((GRB_tblRD@i+1))&0ffh
	movlw	low(02h)
	movwf	((GRB_tblRD@i))&0ffh
	
l5391:; BSR set to: 1

	btfsc	((GRB_tblRD@i+1))&0ffh,7
	goto	u4731
	movf	((GRB_tblRD@i+1))&0ffh,w
	bnz	u4730
	movlw	4
	subwf	 ((GRB_tblRD@i))&0ffh,w
	btfss	status,0
	goto	u4731
	goto	u4730

u4731:
	goto	l5395
u4730:
	goto	l5407
	
l5393:; BSR set to: 1

	goto	l5407
	
l447:; BSR set to: 1

	line	428
	
l5395:; BSR set to: 1

;main.c: 428: if( ((*(X+(j+rotate)%30) >>(7-i)) & 0b1) == 1 ){
	movf	((GRB_tblRD@i))&0ffh,w
	sublw	0
	movlb	0	; () banked
	movwf	(??_GRB_tblRD+0+0)&0ffh
	movlw	07h
	addwf	((??_GRB_tblRD+0+0))&0ffh
	movf	((GRB_tblRD@rotate))&0ffh,w
	movlb	1	; () banked
	addwf	((GRB_tblRD@j))&0ffh,w
	movlb	0	; () banked
	movwf	((___awmod@dividend))&0ffh
	movf	((GRB_tblRD@rotate+1))&0ffh,w
	movlb	1	; () banked
	addwfc	((GRB_tblRD@j+1))&0ffh,w
	movlb	0	; () banked
	movwf	1+((___awmod@dividend))&0ffh
	movlw	high(01Eh)
	movwf	((___awmod@divisor+1))&0ffh
	movlw	low(01Eh)
	movwf	((___awmod@divisor))&0ffh
	call	___awmod	;wreg free
	movff	(GRB_tblRD@X),??_GRB_tblRD+1+0
	movff	(GRB_tblRD@X+1),??_GRB_tblRD+1+0+1
	movlb	0	; () banked
	movf	(0+?___awmod)&0ffh,w
	addwf	(??_GRB_tblRD+1+0)&0ffh
	movf	(1+?___awmod)&0ffh,w
	addwfc	(??_GRB_tblRD+1+1)&0ffh
	movff	??_GRB_tblRD+1+0,tblptrl
	movff	??_GRB_tblRD+1+1,tblptrh
	if	0	;tblptru may be non-zero
	clrf	tblptru
	endif
	if	0	;tblptru may be non-zero
	global __mediumconst
movlw	low highword(__mediumconst)
	movwf	tblptru
	endif
	tblrd	*
	
	movff	tablat,??_GRB_tblRD+3+0
	incf	((??_GRB_tblRD+0+0))&0ffh
	goto	u4744
u4745:
	bcf	status,0
	rrcf	(??_GRB_tblRD+3+0)&0ffh
u4744:
	decfsz	((??_GRB_tblRD+0+0))&0ffh
	goto	u4745
	movlb	0	; () banked
	
	btfss	(??_GRB_tblRD+3+0)&0ffh,(0)&7
	goto	u4751
	goto	u4750
u4751:
	goto	l5399
u4750:
	line	429
	
l5397:; BSR set to: 0

;main.c: 429: bitdata[ct_bit]=1;
	movlw	low(_bitdata)
	addwf	((_ct_bit))&0ffh,w
	movwf	c:fsr2l
	movlw	high(_bitdata)
	addwfc	((_ct_bit+1))&0ffh,w
	movwf	1+c:fsr2l
	movlw	low(01h)
	movwf	indf2
	line	431
;main.c: 431: }else{
	goto	l5401
	
l449:; BSR set to: 0

	line	432
	
l5399:; BSR set to: 0

;main.c: 432: bitdata[ct_bit]=0;
	movlw	low(_bitdata)
	addwf	((_ct_bit))&0ffh,w
	movwf	c:fsr2l
	movlw	high(_bitdata)
	addwfc	((_ct_bit+1))&0ffh,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	goto	l5401
	line	433
	
l450:; BSR set to: 0

	line	434
	
l5401:; BSR set to: 0

;main.c: 433: }
;main.c: 434: ct_bit++;
	infsnz	((_ct_bit))&0ffh
	incf	((_ct_bit+1))&0ffh
	line	427
	
l5403:; BSR set to: 0

	movlb	1	; () banked
	infsnz	((GRB_tblRD@i))&0ffh
	incf	((GRB_tblRD@i+1))&0ffh
	
l5405:; BSR set to: 1

	btfsc	((GRB_tblRD@i+1))&0ffh,7
	goto	u4761
	movf	((GRB_tblRD@i+1))&0ffh,w
	bnz	u4760
	movlw	4
	subwf	 ((GRB_tblRD@i))&0ffh,w
	btfss	status,0
	goto	u4761
	goto	u4760

u4761:
	goto	l5395
u4760:
	goto	l5407
	
l448:; BSR set to: 1

	line	425
	
l5407:; BSR set to: 1

	infsnz	((GRB_tblRD@j))&0ffh
	incf	((GRB_tblRD@j+1))&0ffh
	
l5409:; BSR set to: 1

	btfsc	((GRB_tblRD@j+1))&0ffh,7
	goto	u4771
	movf	((GRB_tblRD@j+1))&0ffh,w
	bnz	u4770
	movlw	30
	subwf	 ((GRB_tblRD@j))&0ffh,w
	btfss	status,0
	goto	u4771
	goto	u4770

u4771:
	goto	l5389
u4770:
	goto	l451
	
l446:; BSR set to: 1

	line	437
	
l451:; BSR set to: 1

	return	;funcret
	opt stack 0
GLOBAL	__end_of_GRB_tblRD
	__end_of_GRB_tblRD:
	signat	_GRB_tblRD,8313
	global	___awmod

;; *************** function ___awmod *****************
;; Defined at:
;;		line 8 in file "C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\awmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        2   21[BANK0 ] int 
;;  divisor         2   23[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   26[BANK0 ] unsigned char 
;;  counter         1   25[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   21[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   12
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GRB_tblRD
;; This function uses a non-reentrant model
;;
psect	text33,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\awmod.c"
	line	8
global __ptext33
__ptext33:
psect	text33
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\awmod.c"
	line	8
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:; BSR set to: 1

;incstack = 0
	opt	stack 17
	line	13
	
l5071:
	movlw	low(0)
	movlb	0	; () banked
	movwf	((___awmod@sign))&0ffh
	line	14
	
l5073:; BSR set to: 0

	btfsc	((___awmod@dividend+1))&0ffh,7
	goto	u4450
	goto	u4451

u4451:
	goto	l5079
u4450:
	line	15
	
l5075:; BSR set to: 0

	negf	((___awmod@dividend))&0ffh
	comf	((___awmod@dividend+1))&0ffh
	btfsc	status,0
	incf	((___awmod@dividend+1))&0ffh
	line	16
	
l5077:; BSR set to: 0

	movlw	low(01h)
	movwf	((___awmod@sign))&0ffh
	goto	l5079
	line	17
	
l1018:; BSR set to: 0

	line	18
	
l5079:; BSR set to: 0

	btfsc	((___awmod@divisor+1))&0ffh,7
	goto	u4460
	goto	u4461

u4461:
	goto	l5083
u4460:
	line	19
	
l5081:; BSR set to: 0

	negf	((___awmod@divisor))&0ffh
	comf	((___awmod@divisor+1))&0ffh
	btfsc	status,0
	incf	((___awmod@divisor+1))&0ffh
	goto	l5083
	
l1019:; BSR set to: 0

	line	20
	
l5083:; BSR set to: 0

	movf	((___awmod@divisor))&0ffh,w
iorwf	((___awmod@divisor+1))&0ffh,w
	btfsc	status,2
	goto	u4471
	goto	u4470

u4471:
	goto	l5099
u4470:
	line	21
	
l5085:; BSR set to: 0

	movlw	low(01h)
	movwf	((___awmod@counter))&0ffh
	line	22
	goto	l5089
	
l1022:; BSR set to: 0

	line	23
	
l5087:; BSR set to: 0

	bcf	status,0
	rlcf	((___awmod@divisor))&0ffh
	rlcf	((___awmod@divisor+1))&0ffh
	line	24
	incf	((___awmod@counter))&0ffh
	goto	l5089
	line	25
	
l1021:; BSR set to: 0

	line	22
	
l5089:; BSR set to: 0

	
	btfss	((___awmod@divisor+1))&0ffh,(15)&7
	goto	u4481
	goto	u4480
u4481:
	goto	l5087
u4480:
	goto	l5091
	
l1023:; BSR set to: 0

	goto	l5091
	line	26
	
l1024:; BSR set to: 0

	line	27
	
l5091:; BSR set to: 0

		movf	((___awmod@divisor))&0ffh,w
	subwf	((___awmod@dividend))&0ffh,w
	movf	((___awmod@divisor+1))&0ffh,w
	subwfb	((___awmod@dividend+1))&0ffh,w
	btfss	status,0
	goto	u4491
	goto	u4490

u4491:
	goto	l5095
u4490:
	line	28
	
l5093:; BSR set to: 0

	movf	((___awmod@divisor))&0ffh,w
	subwf	((___awmod@dividend))&0ffh
	movf	((___awmod@divisor+1))&0ffh,w
	subwfb	((___awmod@dividend+1))&0ffh

	goto	l5095
	
l1025:; BSR set to: 0

	line	29
	
l5095:; BSR set to: 0

	bcf	status,0
	rrcf	((___awmod@divisor+1))&0ffh
	rrcf	((___awmod@divisor))&0ffh
	line	30
	
l5097:; BSR set to: 0

	decfsz	((___awmod@counter))&0ffh
	
	goto	l5091
	goto	l5099
	
l1026:; BSR set to: 0

	goto	l5099
	line	31
	
l1020:; BSR set to: 0

	line	32
	
l5099:; BSR set to: 0

	movf	((___awmod@sign))&0ffh,w
	btfsc	status,2
	goto	u4501
	goto	u4500
u4501:
	goto	l5103
u4500:
	line	33
	
l5101:; BSR set to: 0

	negf	((___awmod@dividend))&0ffh
	comf	((___awmod@dividend+1))&0ffh
	btfsc	status,0
	incf	((___awmod@dividend+1))&0ffh
	goto	l5103
	
l1027:; BSR set to: 0

	line	34
	
l5103:; BSR set to: 0

	movff	(___awmod@dividend),(?___awmod)
	movff	(___awmod@dividend+1),(?___awmod+1)
	goto	l1028
	
l5105:; BSR set to: 0

	line	35
	
l1028:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
	signat	___awmod,8314
	global	_YourLowPriorityISRCode

;; *************** function _YourLowPriorityISRCode *****************
;; Defined at:
;;		line 529 in file "C:\pic\PIC18F\test02\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0        int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0      21       0       0       0
;;      Totals:         0      21       0       0       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   11
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intcodelo,class=CODE,space=0,reloc=2
global __pintcodelo
__pintcodelo:
psect	intcodelo
	file	"C:\pic\PIC18F\test02\main.c"
	line	529
	global	__size_of_YourLowPriorityISRCode
	__size_of_YourLowPriorityISRCode	equ	__end_of_YourLowPriorityISRCode-_YourLowPriorityISRCode
	
_YourLowPriorityISRCode:; BSR set to: 0

;incstack = 0
	opt	stack 15
	bsf int$flags,0,c ;set compiler interrupt flag (level 1)
	movff	status+0,??_YourLowPriorityISRCode+0
	movff	wreg+0,??_YourLowPriorityISRCode+1
	movff	bsr+0,??_YourLowPriorityISRCode+2
	movff	pclath+0,??_YourLowPriorityISRCode+3
	movff	pclath+1,??_YourLowPriorityISRCode+4
	movff	fsr0l+0,??_YourLowPriorityISRCode+5
	movff	fsr0h+0,??_YourLowPriorityISRCode+6
	movff	fsr1l+0,??_YourLowPriorityISRCode+7
	movff	fsr1h+0,??_YourLowPriorityISRCode+8
	movff	fsr2l+0,??_YourLowPriorityISRCode+9
	movff	fsr2h+0,??_YourLowPriorityISRCode+10
	movff	prodl+0,??_YourLowPriorityISRCode+11
	movff	prodh+0,??_YourLowPriorityISRCode+12
	movff	tblptrl+0,??_YourLowPriorityISRCode+13
	movff	tblptrh+0,??_YourLowPriorityISRCode+14
	movff	tblptru+0,??_YourLowPriorityISRCode+15
	movff	tablat+0,??_YourLowPriorityISRCode+16
	movff	btemp+0,??_YourLowPriorityISRCode+17
	movff	btemp+1+0,??_YourLowPriorityISRCode+18
	movff	btemp+2+0,??_YourLowPriorityISRCode+19
	movff	btemp+3+0,??_YourLowPriorityISRCode+20
	line	534
	
i1l4733:
;main.c: 531: int i;
;main.c: 534: if(PIR1bits.TMR1IF){
	btfss	((c:3998)),c,0	;volatile
	goto	i1u407_21
	goto	i1u407_20
i1u407_21:
	goto	i1l472
i1u407_20:
	line	538
	
i1l4735:
;main.c: 538: TMR1H = 0xFE;
	movlw	low(0FEh)
	movwf	((c:4047)),c	;volatile
	line	539
;main.c: 539: TMR1L = 0x18;
	movlw	low(018h)
	movwf	((c:4046)),c	;volatile
	line	541
;main.c: 541: TMR1H = 0xFE;
	movlw	low(0FEh)
	movwf	((c:4047)),c	;volatile
	line	542
;main.c: 542: TMR1L = 0x18;
	movlw	low(018h)
	movwf	((c:4046)),c	;volatile
	line	544
;main.c: 544: TMR1H = 0xFE;
	movlw	low(0FEh)
	movwf	((c:4047)),c	;volatile
	line	545
;main.c: 545: TMR1L = 0x18;
	movlw	low(018h)
	movwf	((c:4046)),c	;volatile
	line	547
;main.c: 547: TMR1H = 0xFE;
	movlw	low(0FEh)
	movwf	((c:4047)),c	;volatile
	line	548
;main.c: 548: TMR1L = 0x18;
	movlw	low(018h)
	movwf	((c:4046)),c	;volatile
	line	554
	
i1l4737:
;main.c: 554: PIR1bits.TMR1IF = 0;
	bcf	((c:3998)),c,0	;volatile
	line	556
	
i1l4739:
;main.c: 556: g_TimeCnt++;
	movlb	0	; () banked
	incf	((_g_TimeCnt))&0ffh	;volatile
	goto	i1l472
	line	561
	
i1l471:; BSR set to: 0

	line	562
	
i1l472:
	movff	??_YourLowPriorityISRCode+20,btemp+3+0
	movff	??_YourLowPriorityISRCode+19,btemp+2+0
	movff	??_YourLowPriorityISRCode+18,btemp+1+0
	movff	??_YourLowPriorityISRCode+17,btemp+0
	movff	??_YourLowPriorityISRCode+16,tablat+0
	movff	??_YourLowPriorityISRCode+15,tblptru+0
	movff	??_YourLowPriorityISRCode+14,tblptrh+0
	movff	??_YourLowPriorityISRCode+13,tblptrl+0
	movff	??_YourLowPriorityISRCode+12,prodh+0
	movff	??_YourLowPriorityISRCode+11,prodl+0
	movff	??_YourLowPriorityISRCode+10,fsr2h+0
	movff	??_YourLowPriorityISRCode+9,fsr2l+0
	movff	??_YourLowPriorityISRCode+8,fsr1h+0
	movff	??_YourLowPriorityISRCode+7,fsr1l+0
	movff	??_YourLowPriorityISRCode+6,fsr0h+0
	movff	??_YourLowPriorityISRCode+5,fsr0l+0
	movff	??_YourLowPriorityISRCode+4,pclath+1
	movff	??_YourLowPriorityISRCode+3,pclath+0
	movff	??_YourLowPriorityISRCode+2,bsr+0
	movff	??_YourLowPriorityISRCode+1,wreg+0
	movff	??_YourLowPriorityISRCode+0,status+0
	bcf int$flags,0,c ;clear compiler interrupt flag (level 1)
	retfie
	opt stack 0
GLOBAL	__end_of_YourLowPriorityISRCode
	__end_of_YourLowPriorityISRCode:
	signat	_YourLowPriorityISRCode,89
	global	_YourHighPriorityISRCode

;; *************** function _YourHighPriorityISRCode *****************
;; Defined at:
;;		line 467 in file "C:\pic\PIC18F\test02\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0        int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:         18       0       0       0       0
;;      Totals:        18       0       0       0       0
;;Total ram usage:       18 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:   10
;; This function calls:
;;		_USBDeviceTasks
;; This function is called by:
;;		Interrupt level 2
;; This function uses a non-reentrant model
;;
psect	intcode,class=CODE,space=0,reloc=2
global __pintcode
__pintcode:
psect	intcode
	file	"C:\pic\PIC18F\test02\main.c"
	line	467
	global	__size_of_YourHighPriorityISRCode
	__size_of_YourHighPriorityISRCode	equ	__end_of_YourHighPriorityISRCode-_YourHighPriorityISRCode
	
_YourHighPriorityISRCode:
;incstack = 0
	opt	stack 15
	bsf int$flags,1,c ;set compiler interrupt flag (level 2)
	global	int_func
	goto	int_func
psect	intcode_body,class=CODE,space=0,reloc=2
global __pintcode_body
__pintcode_body:
int_func:
	movff	pclath+0,??_YourHighPriorityISRCode+0
	movff	pclath+1,??_YourHighPriorityISRCode+1
	movff	fsr0l+0,??_YourHighPriorityISRCode+2
	movff	fsr0h+0,??_YourHighPriorityISRCode+3
	movff	fsr1l+0,??_YourHighPriorityISRCode+4
	movff	fsr1h+0,??_YourHighPriorityISRCode+5
	movff	fsr2l+0,??_YourHighPriorityISRCode+6
	movff	fsr2h+0,??_YourHighPriorityISRCode+7
	movff	prodl+0,??_YourHighPriorityISRCode+8
	movff	prodh+0,??_YourHighPriorityISRCode+9
	movff	tblptrl+0,??_YourHighPriorityISRCode+10
	movff	tblptrh+0,??_YourHighPriorityISRCode+11
	movff	tblptru+0,??_YourHighPriorityISRCode+12
	movff	tablat+0,??_YourHighPriorityISRCode+13
	movff	btemp+0,??_YourHighPriorityISRCode+14
	movff	btemp+1+0,??_YourHighPriorityISRCode+15
	movff	btemp+2+0,??_YourHighPriorityISRCode+16
	movff	btemp+3+0,??_YourHighPriorityISRCode+17
	line	470
	
i2l4721:
;main.c: 470: USBDeviceTasks();
	call	_USBDeviceTasks	;wreg free
	line	477
	
i2l4723:
;main.c: 474: int i;
;main.c: 477: if(INTCONbits.TMR0IF){
	btfss	((c:4082)),c,2	;volatile
	goto	i2u404_41
	goto	i2u404_40
i2u404_41:
	goto	i2l466
i2u404_40:
	line	481
	
i2l4725:
;main.c: 481: TMR0H = 0x6D84>>8;
	movlw	low(06Dh)
	movwf	((c:4055)),c	;volatile
	line	482
;main.c: 482: TMR0L = 0xFF & 0x6D84;
	movlw	low(084h)
	movwf	((c:4054)),c	;volatile
	line	484
	
i2l4727:
;main.c: 484: INTCONbits.TMR0IF = 0;
	bcf	((c:4082)),c,2	;volatile
	line	485
	
i2l4729:
;main.c: 485: cnt100ms++;
	movlb	0	; () banked
	infsnz	((_cnt100ms))&0ffh
	incf	((_cnt100ms+1))&0ffh
	line	486
	
i2l4731:; BSR set to: 0

;main.c: 486: LC4 = 0b1 & ~LC4;
	btfss	c:(31836/8),(31836)&7	;volatile
	goto	i2u405_41
	goto	i2u405_40
i2u405_41:
	bsf	c:(31836/8),(31836)&7	;volatile
	goto	i2u406_45
i2u405_40:
	bcf	c:(31836/8),(31836)&7	;volatile
i2u406_45:
	goto	i2l466
	line	509
	
i2l465:
	line	526
	
i2l466:
	movff	??_YourHighPriorityISRCode+17,btemp+3+0
	movff	??_YourHighPriorityISRCode+16,btemp+2+0
	movff	??_YourHighPriorityISRCode+15,btemp+1+0
	movff	??_YourHighPriorityISRCode+14,btemp+0
	movff	??_YourHighPriorityISRCode+13,tablat+0
	movff	??_YourHighPriorityISRCode+12,tblptru+0
	movff	??_YourHighPriorityISRCode+11,tblptrh+0
	movff	??_YourHighPriorityISRCode+10,tblptrl+0
	movff	??_YourHighPriorityISRCode+9,prodh+0
	movff	??_YourHighPriorityISRCode+8,prodl+0
	movff	??_YourHighPriorityISRCode+7,fsr2h+0
	movff	??_YourHighPriorityISRCode+6,fsr2l+0
	movff	??_YourHighPriorityISRCode+5,fsr1h+0
	movff	??_YourHighPriorityISRCode+4,fsr1l+0
	movff	??_YourHighPriorityISRCode+3,fsr0h+0
	movff	??_YourHighPriorityISRCode+2,fsr0l+0
	movff	??_YourHighPriorityISRCode+1,pclath+1
	movff	??_YourHighPriorityISRCode+0,pclath+0
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	retfie f
	opt stack 0
GLOBAL	__end_of_YourHighPriorityISRCode
	__end_of_YourHighPriorityISRCode:
	signat	_YourHighPriorityISRCode,89
	global	_USBDeviceTasks

;; *************** function _USBDeviceTasks *****************
;; Defined at:
;;		line 288 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   29[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    9
;; This function calls:
;;		_USBCtrlEPAllowStatusStage
;;		_USBCtrlEPService
;;		_USBStallHandler
;;		_USBSuspend
;;		_USBWakeFromSuspend
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;;		i2_USBDeviceInit
;; This function is called by:
;;		_YourHighPriorityISRCode
;; This function uses a non-reentrant model
;;
psect	text36,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	288
global __ptext36
__ptext36:
psect	text36
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	288
	global	__size_of_USBDeviceTasks
	__size_of_USBDeviceTasks	equ	__end_of_USBDeviceTasks-_USBDeviceTasks
	
_USBDeviceTasks:
;incstack = 0
	opt	stack 15
	line	327
	
i2l4419:
;usb_device.c: 290: BYTE i;
;usb_device.c: 327: if(USBDeviceState == ATTACHED_STATE) {
	movlb	0	; () banked
		decf	((_USBDeviceState))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u363_41
	goto	i2u363_40

i2u363_41:
	goto	i2l4429
i2u363_40:
	line	331
	
i2l4421:; BSR set to: 0

;usb_device.c: 331: if (!UCONbits.SE0) {
	btfsc	((c:3940)),c,5	;volatile
	goto	i2u364_41
	goto	i2u364_40
i2u364_41:
	goto	i2l4429
i2u364_40:
	line	332
	
i2l4423:; BSR set to: 0

;usb_device.c: 332: UIR = 0 ;
	movlw	low(0)
	movwf	((c:3938)),c	;volatile
	line	336
	
i2l4425:; BSR set to: 0

;usb_device.c: 336: UIEbits.URSTIE = 1;
	bsf	((c:3936)),c,0	;volatile
	line	337
	
i2l4427:; BSR set to: 0

;usb_device.c: 337: UIEbits.IDLEIE = 1;
	bsf	((c:3936)),c,4	;volatile
	line	339
;usb_device.c: 339: USBDeviceState = POWERED_STATE;
	movlw	low(02h)
	movwf	((_USBDeviceState))&0ffh	;volatile
	goto	i2l4429
	line	340
	
i2l621:; BSR set to: 0

	goto	i2l4429
	line	341
	
i2l620:; BSR set to: 0

	line	344
	
i2l4429:; BSR set to: 0

;usb_device.c: 340: }
;usb_device.c: 341: }
;usb_device.c: 344: if(UIRbits.ACTVIF && UIEbits.ACTVIE) {
	btfss	((c:3938)),c,2	;volatile
	goto	i2u365_41
	goto	i2u365_40
i2u365_41:
	goto	i2l4435
i2u365_40:
	
i2l4431:; BSR set to: 0

	btfss	((c:3936)),c,2	;volatile
	goto	i2u366_41
	goto	i2u366_40
i2u366_41:
	goto	i2l4435
i2u366_40:
	line	346
	
i2l4433:; BSR set to: 0

;usb_device.c: 346: USBWakeFromSuspend();
	call	_USBWakeFromSuspend	;wreg free
	goto	i2l4435
	line	347
	
i2l622:
	line	350
	
i2l4435:
;usb_device.c: 347: }
;usb_device.c: 350: if(UCONbits.SUSPND == 1) {
	btfss	((c:3940)),c,1	;volatile
	goto	i2u367_41
	goto	i2u367_40
i2u367_41:
	goto	i2l623
i2u367_40:
	line	352
	
i2l4437:
;usb_device.c: 352: PIR2bits.USBIF = 0 ;
	bcf	((c:4001)),c,2	;volatile
	line	353
;usb_device.c: 353: return ;
	goto	i2l624
	line	354
	
i2l623:
	line	358
;usb_device.c: 354: }
;usb_device.c: 358: if(UIRbits.URSTIF && UIEbits.URSTIE) {
	btfss	((c:3938)),c,0	;volatile
	goto	i2u368_41
	goto	i2u368_40
i2u368_41:
	goto	i2l4449
i2u368_40:
	
i2l4439:
	btfss	((c:3936)),c,0	;volatile
	goto	i2u369_41
	goto	i2u369_40
i2u369_41:
	goto	i2l4449
i2u369_40:
	line	360
	
i2l4441:
;usb_device.c: 360: USBDeviceInit();
	call	i2_USBDeviceInit	;wreg free
	line	362
	
i2l4443:
;usb_device.c: 362: PIE2bits.USBIE = 1 ;
	bsf	((c:4000)),c,2	;volatile
	line	364
	
i2l4445:
;usb_device.c: 364: USBDeviceState = DEFAULT_STATE;
	movlw	low(04h)
	movlb	0	; () banked
	movwf	((_USBDeviceState))&0ffh	;volatile
	line	366
	
i2l4447:; BSR set to: 0

;usb_device.c: 366: UIRbits.URSTIF = 0 ;
	bcf	((c:3938)),c,0	;volatile
	goto	i2l4449
	line	367
	
i2l625:; BSR set to: 0

	line	370
	
i2l4449:
;usb_device.c: 367: }
;usb_device.c: 370: if(UIRbits.IDLEIF && UIEbits.IDLEIE) {
	btfss	((c:3938)),c,4	;volatile
	goto	i2u370_41
	goto	i2u370_40
i2u370_41:
	goto	i2l4457
i2u370_40:
	
i2l4451:
	btfss	((c:3936)),c,4	;volatile
	goto	i2u371_41
	goto	i2u371_40
i2u371_41:
	goto	i2l4457
i2u371_40:
	line	372
	
i2l4453:
;usb_device.c: 372: USBSuspend();
	call	_USBSuspend	;wreg free
	line	374
	
i2l4455:
;usb_device.c: 374: UIRbits.IDLEIF = 0 ;
	bcf	((c:3938)),c,4	;volatile
	goto	i2l4457
	line	375
	
i2l626:
	line	378
	
i2l4457:
;usb_device.c: 375: }
;usb_device.c: 378: if(UIRbits.SOFIF) {
	btfss	((c:3938)),c,6	;volatile
	goto	i2u372_41
	goto	i2u372_40
i2u372_41:
	goto	i2l4473
i2u372_40:
	line	380
	
i2l4459:
;usb_device.c: 380: if(UIEbits.SOFIE) {
	btfss	((c:3936)),c,6	;volatile
	goto	i2u373_41
	goto	i2u373_40
i2u373_41:
	goto	i2l4463
i2u373_40:
	line	381
	
i2l4461:
;usb_device.c: 381: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_SOF,0,0);
	movlw	high(073h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	movlw	low(073h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)),c
	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)),c

	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	goto	i2l4463
	line	382
	
i2l628:
	line	383
	
i2l4463:
;usb_device.c: 382: }
;usb_device.c: 383: UIRbits.SOFIF = 0 ;
	bcf	((c:3938)),c,6	;volatile
	line	387
	
i2l4465:
;usb_device.c: 387: if(USBStatusStageTimeoutCounter != 0u) {
	movf	((c:_USBStatusStageTimeoutCounter)),c,w	;volatile
	btfsc	status,2
	goto	i2u374_41
	goto	i2u374_40
i2u374_41:
	goto	i2l4469
i2u374_40:
	line	388
	
i2l4467:
;usb_device.c: 388: USBStatusStageTimeoutCounter--;
	decf	((c:_USBStatusStageTimeoutCounter)),c	;volatile
	goto	i2l4469
	line	389
	
i2l629:
	line	391
	
i2l4469:
;usb_device.c: 389: }
;usb_device.c: 391: if(USBStatusStageTimeoutCounter == 0) {
	movf	((c:_USBStatusStageTimeoutCounter)),c,w	;volatile
	btfss	status,2
	goto	i2u375_41
	goto	i2u375_40
i2u375_41:
	goto	i2l4473
i2u375_40:
	line	392
	
i2l4471:
;usb_device.c: 392: USBCtrlEPAllowStatusStage();
	call	_USBCtrlEPAllowStatusStage	;wreg free
	goto	i2l4473
	line	393
	
i2l630:
	goto	i2l4473
	line	395
	
i2l627:
	line	398
	
i2l4473:
;usb_device.c: 393: }
;usb_device.c: 395: }
;usb_device.c: 398: if(UIRbits.STALLIF && UIEbits.STALLIE) {
	btfss	((c:3938)),c,5	;volatile
	goto	i2u376_41
	goto	i2u376_40
i2u376_41:
	goto	i2l4479
i2u376_40:
	
i2l4475:
	btfss	((c:3936)),c,5	;volatile
	goto	i2u377_41
	goto	i2u377_40
i2u377_41:
	goto	i2l4479
i2u377_40:
	line	400
	
i2l4477:
;usb_device.c: 400: USBStallHandler();
	call	_USBStallHandler	;wreg free
	goto	i2l4479
	line	401
	
i2l631:
	line	404
	
i2l4479:
;usb_device.c: 401: }
;usb_device.c: 404: if(UIRbits.UERRIF && UIEbits.UERRIE) {
	btfss	((c:3938)),c,1	;volatile
	goto	i2u378_41
	goto	i2u378_40
i2u378_41:
	goto	i2l4487
i2u378_40:
	
i2l4481:
	btfss	((c:3936)),c,1	;volatile
	goto	i2u379_41
	goto	i2u379_40
i2u379_41:
	goto	i2l4487
i2u379_40:
	line	406
	
i2l4483:
;usb_device.c: 406: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_BUS_ERROR,0,0);
	movlw	high(07FFFh)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	setf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)),c
	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)),c

	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	line	409
	
i2l4485:
;usb_device.c: 409: UEIR = 0 ;
	movlw	low(0)
	movlb	15	; () banked
	movwf	((3935))&0ffh	;volatile
	goto	i2l4487
	line	410
	
i2l632:; BSR set to: 15

	line	413
	
i2l4487:
;usb_device.c: 410: }
;usb_device.c: 413: if(USBDeviceState < DEFAULT_STATE) {
		movlw	04h-0
	movlb	0	; () banked
	cpfslt	((_USBDeviceState))&0ffh	;volatile
	goto	i2u380_41
	goto	i2u380_40

i2u380_41:
	goto	i2l633
i2u380_40:
	line	415
	
i2l4489:; BSR set to: 0

;usb_device.c: 415: PIR2bits.USBIF = 0 ;
	bcf	((c:4001)),c,2	;volatile
	line	416
;usb_device.c: 416: return ;
	goto	i2l624
	line	417
	
i2l633:; BSR set to: 0

	line	422
;usb_device.c: 417: }
;usb_device.c: 422: if(UIEbits.TRNIE) {
	btfss	((c:3936)),c,3	;volatile
	goto	i2u381_41
	goto	i2u381_40
i2u381_41:
	goto	i2l634
i2u381_40:
	line	424
	
i2l4491:; BSR set to: 0

;usb_device.c: 424: for(i = 0; i < 4u; i++) {
	movlw	low(0)
	movwf	((c:USBDeviceTasks@i)),c
	
i2l4493:; BSR set to: 0

		movlw	04h-1
	cpfsgt	((c:USBDeviceTasks@i)),c
	goto	i2u382_41
	goto	i2u382_40

i2u382_41:
	goto	i2l635
i2u382_40:
	goto	i2l634
	
i2l4495:; BSR set to: 0

	goto	i2l634
	
i2l635:
	line	427
;usb_device.c: 427: if(UIRbits.TRNIF) {
	btfss	((c:3938)),c,3	;volatile
	goto	i2u383_41
	goto	i2u383_40
i2u383_41:
	goto	i2l634
i2u383_40:
	line	428
	
i2l4497:
;usb_device.c: 428: USTATcopy.Val = USTAT ;
	movff	(c:3939),(c:_USTATcopy)	;volatile
	line	429
	
i2l4499:
;usb_device.c: 429: endpoint_number = USTATcopy.endpoint_number ;
	rrcf	((c:_USTATcopy)),c,w	;volatile
	rrcf	wreg,f
	rrcf	wreg,f
	andlw	(1<<4)-1
	movwf	((c:_endpoint_number)),c	;volatile
	line	430
	
i2l4501:
;usb_device.c: 430: UIRbits.TRNIF = 0 ;
	bcf	((c:3938)),c,3	;volatile
	line	434
	
i2l4503:
;usb_device.c: 434: if(USTATcopy.direction == 0) {
	btfsc	((c:_USTATcopy)),c,2	;volatile
	goto	i2u384_41
	goto	i2u384_40
i2u384_41:
	goto	i2l4507
i2u384_40:
	line	436
	
i2l4505:
;usb_device.c: 436: ep_data_out[endpoint_number].bits.ping_pong_state ^= 1 ;
	movf	((c:_endpoint_number)),c,w	;volatile
	mullw	01h
	movlw	low(_ep_data_out)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_out)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlb	0	; () banked
	btg	c:indf2,0
	line	437
;usb_device.c: 437: } else {
	goto	i2l4509
	
i2l638:; BSR set to: 0

	line	439
	
i2l4507:
;usb_device.c: 439: ep_data_in[endpoint_number].bits.ping_pong_state ^= 1 ;
	movf	((c:_endpoint_number)),c,w	;volatile
	mullw	01h
	movlw	low(_ep_data_in)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_in)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlb	0	; () banked
	btg	c:indf2,0
	goto	i2l4509
	line	440
	
i2l639:; BSR set to: 0

	line	444
	
i2l4509:; BSR set to: 0

;usb_device.c: 440: }
;usb_device.c: 444: if(endpoint_number == 0) {
	movf	((c:_endpoint_number)),c,w	;volatile
	btfss	status,2
	goto	i2u385_41
	goto	i2u385_40
i2u385_41:
	goto	i2l4513
i2u385_40:
	line	445
	
i2l4511:; BSR set to: 0

;usb_device.c: 445: USBCtrlEPService();
	call	_USBCtrlEPService	;wreg free
	line	446
;usb_device.c: 446: } else {
	goto	i2l4515
	
i2l640:
	line	448
	
i2l4513:
;usb_device.c: 448: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_TRANSFER,(BYTE*)&USTATcopy.Val,0);
	movlw	high(072h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	movlw	low(072h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movlw	low(_USTATcopy)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)),c
	movlw	high(_USTATcopy)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)),c

	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	goto	i2l4515
	line	449
	
i2l641:
	line	450
;usb_device.c: 449: }
;usb_device.c: 450: } else break ;
	goto	i2l4515
	
i2l637:
	goto	i2l634
	
i2l642:
	line	424
	
i2l4515:
	incf	((c:USBDeviceTasks@i)),c
	
i2l4517:
		movlw	04h-1
	cpfsgt	((c:USBDeviceTasks@i)),c
	goto	i2u386_41
	goto	i2u386_40

i2u386_41:
	goto	i2l635
i2u386_40:
	goto	i2l634
	
i2l636:
	line	452
	
i2l634:
	line	455
;usb_device.c: 451: }
;usb_device.c: 452: }
;usb_device.c: 455: PIR2bits.USBIF = 0 ;
	bcf	((c:4001)),c,2	;volatile
	line	456
	
i2l624:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBDeviceTasks
	__end_of_USBDeviceTasks:
	signat	_USBDeviceTasks,89
	global	i2_USBDeviceInit

;; *************** function i2_USBDeviceInit *****************
;; Defined at:
;;		line 190 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  USBDeviceIni    1    8[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i2_memset
;; This function is called by:
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text37,class=CODE,space=0,reloc=2,group=0
	line	190
global __ptext37
__ptext37:
psect	text37
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	190
	global	__size_ofi2_USBDeviceInit
	__size_ofi2_USBDeviceInit	equ	__end_ofi2_USBDeviceInit-i2_USBDeviceInit
	
i2_USBDeviceInit:
;incstack = 0
	opt	stack 22
	line	195
	
i2l4055:
;usb_device.c: 192: BYTE i;
;usb_device.c: 195: PIE2bits.USBIE = 0 ;
	bcf	((c:4000)),c,2	;volatile
	line	196
	
i2l4057:
;usb_device.c: 196: UEIR = 0 ;
	movlw	low(0)
	movlb	15	; () banked
	movwf	((3935))&0ffh	;volatile
	line	197
;usb_device.c: 197: UIR = 0 ;
	movlw	low(0)
	movwf	((c:3938)),c	;volatile
	line	198
;usb_device.c: 198: UEP0 = 0 ;
	movlw	low(0)
	movwf	((3923))&0ffh	;volatile
	line	200
	
i2l4059:; BSR set to: 15

;usb_device.c: 200: memset((void*)&UEP1,0x00,2) ;
		movlw	low(3924)
	movwf	((c:i2memset@p1)),c
	movlw	high(3924)
	movwf	((c:i2memset@p1+1)),c

	movlw	high(0)
	movwf	((c:i2memset@c+1)),c
	movlw	low(0)
	movwf	((c:i2memset@c)),c
	movlw	high(02h)
	movwf	((c:i2memset@n+1)),c
	movlw	low(02h)
	movwf	((c:i2memset@n)),c
	call	i2_memset	;wreg free
	line	202
	
i2l4061:
;usb_device.c: 202: UCFG = 0b00010100 | 0x02 ;
	movlw	low(016h)
	movwf	((c:3937)),c	;volatile
	line	203
	
i2l4063:
;usb_device.c: 203: UEIE = 0b10011111 ;
	movlw	low(09Fh)
	movlb	15	; () banked
	movwf	((3931))&0ffh	;volatile
	line	204
	
i2l4065:; BSR set to: 15

;usb_device.c: 204: UIE = 0b00111011 | 0x40 ;
	movlw	low(07Bh)
	movwf	((c:3936)),c	;volatile
	line	207
	
i2l4067:; BSR set to: 15

;usb_device.c: 207: for(i=0;i<(sizeof(BDT)/sizeof(BDT_ENTRY));i++) {
	movlw	low(0)
	movwf	((c:i2USBDeviceInit@i)),c
	
i2l4069:; BSR set to: 15

		movlw	0Ch-1
	cpfsgt	((c:i2USBDeviceInit@i)),c
	goto	i2u331_41
	goto	i2u331_40

i2u331_41:
	goto	i2l4073
i2u331_40:
	goto	i2l611
	
i2l4071:; BSR set to: 15

	goto	i2l611
	
i2l610:; BSR set to: 15

	line	208
	
i2l4073:
;usb_device.c: 208: BDT[i].Val = 0x00;
	movf	((c:i2USBDeviceInit@i)),c,w
	mullw	04h
	movlw	low(512)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(512)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	clrf	postinc2,c
	clrf	postinc2,c
	clrf	postinc2,c
	clrf	postdec2,c

	line	207
	
i2l4075:
	incf	((c:i2USBDeviceInit@i)),c
	
i2l4077:
		movlw	0Ch-1
	cpfsgt	((c:i2USBDeviceInit@i)),c
	goto	i2u332_41
	goto	i2u332_40

i2u332_41:
	goto	i2l4073
i2u332_40:
	
i2l611:
	line	211
;usb_device.c: 209: }
;usb_device.c: 211: UCONbits.PPBRST = 1 ;
	bsf	((c:3940)),c,6	;volatile
	line	212
	
i2l4079:
;usb_device.c: 212: UADDR = 0 ;
	movlw	low(0)
	movlb	15	; () banked
	movwf	((3932))&0ffh	;volatile
	line	213
	
i2l4081:; BSR set to: 15

;usb_device.c: 213: UCONbits.PKTDIS = 0 ;
	bcf	((c:3940)),c,4	;volatile
	line	214
	
i2l4083:; BSR set to: 15

;usb_device.c: 214: UCONbits.PPBRST = 0 ;
	bcf	((c:3940)),c,6	;volatile
	line	217
;usb_device.c: 217: while(UIRbits.TRNIF == 1) {
	goto	i2l4087
	
i2l613:
	line	218
;usb_device.c: 218: UIRbits.TRNIF = 0 ;
	bcf	((c:3938)),c,3	;volatile
	line	220
	
i2l4085:
;usb_device.c: 220: inPipes[0].info.Val = 0;
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_inPipes+03h))&0ffh	;volatile
	line	221
;usb_device.c: 221: outPipes[0].info.Val = 0;
	movlw	low(0)
	movwf	(0+(_outPipes+03h))&0ffh	;volatile
	line	222
;usb_device.c: 222: outPipes[0].wCount.Val = 0;
	movlw	high(0)
	movwf	(1+(_outPipes+04h))&0ffh	;volatile
	movlw	low(0)
	movwf	(0+(_outPipes+04h))&0ffh	;volatile
	goto	i2l4087
	line	223
	
i2l612:; BSR set to: 0

	line	217
	
i2l4087:
	btfsc	((c:3938)),c,3	;volatile
	goto	i2u333_41
	goto	i2u333_40
i2u333_41:
	goto	i2l613
i2u333_40:
	goto	i2l4089
	
i2l614:
	line	226
	
i2l4089:
;usb_device.c: 223: }
;usb_device.c: 226: USBStatusStageEnabledFlag1 = TRUE;
	movlw	low(01h)
	movwf	((c:_USBStatusStageEnabledFlag1)),c	;volatile
	line	227
;usb_device.c: 227: USBStatusStageEnabledFlag2 = TRUE;
	movlw	low(01h)
	movwf	((c:_USBStatusStageEnabledFlag2)),c	;volatile
	line	229
;usb_device.c: 229: USBDeferINDataStagePackets = FALSE;
	movlw	low(0)
	movwf	((c:_USBDeferINDataStagePackets)),c	;volatile
	line	230
;usb_device.c: 230: USBDeferOUTDataStagePackets = FALSE;
	movlw	low(0)
	movwf	((c:_USBDeferOUTDataStagePackets)),c	;volatile
	line	231
;usb_device.c: 231: USBBusIsSuspended = FALSE;
	movlw	low(0)
	movwf	((c:_USBBusIsSuspended)),c	;volatile
	line	234
;usb_device.c: 234: for(i = 0; i < (BYTE)(2+1u); i++) {
	movlw	low(0)
	movwf	((c:i2USBDeviceInit@i)),c
	
i2l4091:
		movlw	03h-1
	cpfsgt	((c:i2USBDeviceInit@i)),c
	goto	i2u334_41
	goto	i2u334_40

i2u334_41:
	goto	i2l4095
i2u334_40:
	goto	i2l4101
	
i2l4093:
	goto	i2l4101
	
i2l615:
	line	235
	
i2l4095:
;usb_device.c: 235: pBDTEntryIn[i] = 0u;
	movf	((c:i2USBDeviceInit@i)),c,w
	mullw	02h
	movlw	low(_pBDTEntryIn)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryIn)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	postinc2,c
	movlw	high(0)
	movwf	postdec2,c
	line	236
;usb_device.c: 236: pBDTEntryOut[i] = 0u;
	movf	((c:i2USBDeviceInit@i)),c,w
	mullw	02h
	movlw	low(_pBDTEntryOut)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryOut)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	postinc2,c
	movlw	high(0)
	movwf	postdec2,c
	line	237
;usb_device.c: 237: ep_data_in[i].Val = 0u;
	movf	((c:i2USBDeviceInit@i)),c,w
	mullw	01h
	movlw	low(_ep_data_in)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_in)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	line	238
;usb_device.c: 238: ep_data_out[i].Val = 0u;
	movf	((c:i2USBDeviceInit@i)),c,w
	mullw	01h
	movlw	low(_ep_data_out)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_out)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	line	234
	
i2l4097:
	incf	((c:i2USBDeviceInit@i)),c
	
i2l4099:
		movlw	03h-1
	cpfsgt	((c:i2USBDeviceInit@i)),c
	goto	i2u335_41
	goto	i2u335_40

i2u335_41:
	goto	i2l4095
i2u335_40:
	goto	i2l4101
	
i2l616:
	line	242
	
i2l4101:
;usb_device.c: 239: }
;usb_device.c: 242: pBDTEntryIn[0] = (volatile BDT_ENTRY*)&BDT[2];
		movlw	low(512+08h)
	movlb	0	; () banked
	movwf	((_pBDTEntryIn))&0ffh
	movlw	high(512+08h)
	movwf	((_pBDTEntryIn+1))&0ffh

	line	245
	
i2l4103:; BSR set to: 0

;usb_device.c: 245: UEP0 = 0b00010110 ;
	movlw	low(016h)
	movlb	15	; () banked
	movwf	((3923))&0ffh	;volatile
	line	247
	
i2l4105:; BSR set to: 15

;usb_device.c: 247: BDT[0].ADR = ((WORD)(&SetupPkt));
	movlw	high(0230h)
	movlb	2	; () banked
	movwf	(1+(512+02h))&0ffh	;volatile
	movlw	low(0230h)
	movwf	(0+(512+02h))&0ffh	;volatile
	line	248
	
i2l4107:; BSR set to: 2

;usb_device.c: 248: BDT[0].CNT = 8;
	movlw	low(08h)
	movwf	(0+(512+01h))&0ffh	;volatile
	line	249
	
i2l4109:; BSR set to: 2

;usb_device.c: 249: BDT[0].STAT.Val = 0x80|0x00|0x04;
	movlw	low(084h)
	movwf	((512))&0ffh	;volatile
	line	252
	
i2l4111:; BSR set to: 2

;usb_device.c: 252: USBActiveConfiguration = 0;
	movlw	low(0)
	movwf	((c:_USBActiveConfiguration)),c	;volatile
	line	255
	
i2l4113:; BSR set to: 2

;usb_device.c: 255: USBDeviceState = DETACHED_STATE;
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_USBDeviceState))&0ffh	;volatile
	line	256
	
i2l617:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_ofi2_USBDeviceInit
	__end_ofi2_USBDeviceInit:
	signat	i2_USBDeviceInit,89
	global	_USBWakeFromSuspend

;; *************** function _USBWakeFromSuspend *****************
;; Defined at:
;;		line 1071 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function is called by:
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text38,class=CODE,space=0,reloc=2,group=0
	line	1071
global __ptext38
__ptext38:
psect	text38
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1071
	global	__size_of_USBWakeFromSuspend
	__size_of_USBWakeFromSuspend	equ	__end_of_USBWakeFromSuspend-_USBWakeFromSuspend
	
_USBWakeFromSuspend:; BSR set to: 0

;incstack = 0
	opt	stack 18
	line	1073
	
i2l3913:
;usb_device.c: 1073: USBBusIsSuspended = FALSE;
	movlw	low(0)
	movwf	((c:_USBBusIsSuspended)),c	;volatile
	line	1076
	
i2l3915:
;usb_device.c: 1076: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_RESUME,0,0);
	movlw	high(074h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	movlw	low(074h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)),c
	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)),c

	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	line	1078
	
i2l3917:
;usb_device.c: 1078: UCONbits.SUSPND = 0;
	bcf	((c:3940)),c,1	;volatile
	line	1080
	
i2l3919:
;usb_device.c: 1080: UIEbits.ACTVIE = 0;
	bcf	((c:3936)),c,2	;volatile
	line	1082
;usb_device.c: 1082: while(UIRbits.ACTVIF) {
	goto	i2l756
	
i2l757:
	line	1083
;usb_device.c: 1083: UIRbits.ACTVIF = 0 ;
	bcf	((c:3938)),c,2	;volatile
	line	1084
	
i2l756:
	line	1082
	btfsc	((c:3938)),c,2	;volatile
	goto	i2u310_41
	goto	i2u310_40
i2u310_41:
	goto	i2l757
i2u310_40:
	goto	i2l759
	
i2l758:
	line	1085
	
i2l759:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBWakeFromSuspend
	__end_of_USBWakeFromSuspend:
	signat	_USBWakeFromSuspend,89
	global	_USBSuspend

;; *************** function _USBSuspend *****************
;; Defined at:
;;		line 1051 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function is called by:
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text39,class=CODE,space=0,reloc=2,group=0
	line	1051
global __ptext39
__ptext39:
psect	text39
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1051
	global	__size_of_USBSuspend
	__size_of_USBSuspend	equ	__end_of_USBSuspend-_USBSuspend
	
_USBSuspend:
;incstack = 0
	opt	stack 18
	line	1053
	
i2l3921:
;usb_device.c: 1053: UIEbits.ACTVIE = 1 ;
	bsf	((c:3936)),c,2	;volatile
	line	1054
;usb_device.c: 1054: UIRbits.IDLEIF = 0 ;
	bcf	((c:3938)),c,4	;volatile
	line	1056
;usb_device.c: 1056: UCONbits.SUSPND = 1;
	bsf	((c:3940)),c,1	;volatile
	line	1059
	
i2l3923:
;usb_device.c: 1059: USBBusIsSuspended = TRUE ;
	movlw	low(01h)
	movwf	((c:_USBBusIsSuspended)),c	;volatile
	line	1063
	
i2l3925:
;usb_device.c: 1063: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_SUSPEND,0,0);
	movlw	high(075h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	movlw	low(075h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)),c
	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)),c

	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	line	1064
	
i2l753:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBSuspend
	__end_of_USBSuspend:
	signat	_USBSuspend,89
	global	_USBStallHandler

;; *************** function _USBStallHandler *****************
;; Defined at:
;;		line 1030 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text40,class=CODE,space=0,reloc=2,group=0
	line	1030
global __ptext40
__ptext40:
psect	text40
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1030
	global	__size_of_USBStallHandler
	__size_of_USBStallHandler	equ	__end_of_USBStallHandler-_USBStallHandler
	
_USBStallHandler:
;incstack = 0
	opt	stack 23
	line	1033
	
i2l3927:
;usb_device.c: 1033: if(UEP0bits.EPSTALL == 1) {
	movlb	15	; () banked
	btfss	((3923))&0ffh,0	;volatile
	goto	i2u311_41
	goto	i2u311_40
i2u311_41:
	goto	i2l3937
i2u311_40:
	line	1035
	
i2l3929:; BSR set to: 15

;usb_device.c: 1035: if((pBDTEntryEP0OutCurrent->STAT.Val == 0x80) && (pBDTEntryIn[0]->STAT.Val == (0x80|0x04))) {
	movff	(c:_pBDTEntryEP0OutCurrent),fsr2l
	movff	(c:_pBDTEntryEP0OutCurrent+1),fsr2h
	movlw	128
	xorwf	postinc2,w
	btfss	status,2
	goto	i2u312_41
	goto	i2u312_40

i2u312_41:
	goto	i2l3935
i2u312_40:
	
i2l3931:; BSR set to: 15

	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlw	132
	xorwf	postinc2,w
	btfss	status,2
	goto	i2u313_41
	goto	i2u313_40

i2u313_41:
	goto	i2l3935
i2u313_40:
	line	1037
	
i2l3933:; BSR set to: 15

;usb_device.c: 1037: pBDTEntryEP0OutCurrent->STAT.Val = 0x80|0x00|(0x08 & 0x08)|0x04 ;
	movff	(c:_pBDTEntryEP0OutCurrent),fsr2l
	movff	(c:_pBDTEntryEP0OutCurrent+1),fsr2h
	movlw	low(08Ch)
	movwf	indf2
	goto	i2l3935
	line	1038
	
i2l749:; BSR set to: 15

	line	1039
	
i2l3935:; BSR set to: 15

;usb_device.c: 1038: }
;usb_device.c: 1039: UEP0bits.EPSTALL = 0;
	bcf	((3923))&0ffh,0	;volatile
	goto	i2l3937
	line	1040
	
i2l748:; BSR set to: 15

	line	1042
	
i2l3937:; BSR set to: 15

;usb_device.c: 1040: }
;usb_device.c: 1042: UIRbits.STALLIF = 0 ;
	bcf	((c:3938)),c,5	;volatile
	line	1043
	
i2l750:; BSR set to: 15

	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBStallHandler
	__end_of_USBStallHandler:
	signat	_USBStallHandler,89
	global	_USBCtrlEPService

;; *************** function _USBCtrlEPService *****************
;; Defined at:
;;		line 1097 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  setup_cnt       1   28[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_USBCtrlTrfInHandler
;;		_USBCtrlTrfOutHandler
;;		_USBCtrlTrfSetupHandler
;; This function is called by:
;;		_USBDeviceTasks
;; This function uses a non-reentrant model
;;
psect	text41,class=CODE,space=0,reloc=2,group=0
	line	1097
global __ptext41
__ptext41:
psect	text41
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1097
	global	__size_of_USBCtrlEPService
	__size_of_USBCtrlEPService	equ	__end_of_USBCtrlEPService-_USBCtrlEPService
	
_USBCtrlEPService:; BSR set to: 15

;incstack = 0
	opt	stack 15
	line	1106
	
i2l3939:
;usb_device.c: 1099: unsigned char setup_cnt;
;usb_device.c: 1106: USBStatusStageTimeoutCounter = (BYTE)45;
	movlw	low(02Dh)
	movwf	((c:_USBStatusStageTimeoutCounter)),c	;volatile
	line	1110
	
i2l3941:
;usb_device.c: 1110: if((USTATcopy.Val & ~0x02) == 0x00) {
	movff	(c:_USTATcopy),??_USBCtrlEPService+0+0	;volatile
	movlw	0FDh
	andwf	(??_USBCtrlEPService+0+0),c
	btfss	status,2
	goto	i2u314_41
	goto	i2u314_40
i2u314_41:
	goto	i2l3971
i2u314_40:
	line	1112
	
i2l3943:
;usb_device.c: 1112: pBDTEntryEP0OutCurrent = (volatile BDT_ENTRY*)&BDT[(USTATcopy.Val & 0x7E)>>1];
	movff	(c:_USTATcopy),??_USBCtrlEPService+0+0	;volatile
	bcf	status,0
	rrcf	(??_USBCtrlEPService+0+0),c

	movlw	03Fh
	andwf	(??_USBCtrlEPService+0+0),c
	movf	(??_USBCtrlEPService+0+0),c,w
	mullw	04h
	movlw	low(512)
	addwf	(prodl),c,w
	movwf	((c:_pBDTEntryEP0OutCurrent)),c
	movlw	high(512)
	addwfc	prod+1,w
	movwf	1+((c:_pBDTEntryEP0OutCurrent)),c
	line	1115
	
i2l3945:
;usb_device.c: 1115: pBDTEntryEP0OutNext = pBDTEntryEP0OutCurrent;
		movff	(c:_pBDTEntryEP0OutCurrent),(c:_pBDTEntryEP0OutNext)
	movff	(c:_pBDTEntryEP0OutCurrent+1),(c:_pBDTEntryEP0OutNext+1)

	line	1117
	
i2l3947:
;usb_device.c: 1117: ((BYTE_VAL*)&pBDTEntryEP0OutNext)->Val ^= 0x0004;
	movlw	(04h)&0ffh
	xorwf	((c:_pBDTEntryEP0OutNext)),c
	line	1120
	
i2l3949:
;usb_device.c: 1120: if(pBDTEntryEP0OutCurrent->STAT.PID == 0xD) {
	movff	(c:_pBDTEntryEP0OutCurrent),fsr2l
	movff	(c:_pBDTEntryEP0OutCurrent+1),fsr2h
	rrcf	(c:indf2),c,w
	rrcf	wreg,f
	andlw	(1<<4)-1
	xorlw	0Dh
	btfss	status,2
	goto	i2u315_41
	goto	i2u315_40
i2u315_41:
	goto	i2l3969
i2u315_40:
	line	1122
	
i2l3951:
;usb_device.c: 1122: for(setup_cnt = 0; setup_cnt < 8u; setup_cnt++) {
	movlw	low(0)
	movwf	((c:USBCtrlEPService@setup_cnt)),c
	
i2l3953:
		movlw	08h-1
	cpfsgt	((c:USBCtrlEPService@setup_cnt)),c
	goto	i2u316_41
	goto	i2u316_40

i2u316_41:
	goto	i2l3957
i2u316_40:
	goto	i2l3965
	
i2l3955:
	goto	i2l3965
	
i2l764:
	line	1124
	
i2l3957:
;usb_device.c: 1124: *(BYTE*)((BYTE*)&SetupPkt + setup_cnt) = *(BYTE*)((void *)(pBDTEntryEP0OutCurrent->ADR));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutCurrent)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutCurrent+1)),c,w
	addwfc	fsr2h
	movff	postinc2,??_USBCtrlEPService+0+0
	movff	postdec2,??_USBCtrlEPService+0+0+1
	movff	??_USBCtrlEPService+0+0,fsr2l
	movff	??_USBCtrlEPService+0+1,fsr2h
	movf	((c:USBCtrlEPService@setup_cnt)),c,w
	mullw	01h
	movlw	low(560)
	addwf	(prodl),c,w
	movwf	c:fsr1l
	movlw	high(560)
	addwfc	prod+1,w
	movwf	1+c:fsr1l
	movff	indf2,indf1
	line	1125
	
i2l3959:
;usb_device.c: 1125: pBDTEntryEP0OutCurrent->ADR++;
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutCurrent)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutCurrent+1)),c,w
	addwfc	fsr2h
	incf	postinc2
	movlw	0
	addwfc	postdec2
	line	1122
	
i2l3961:
	incf	((c:USBCtrlEPService@setup_cnt)),c
	
i2l3963:
		movlw	08h-1
	cpfsgt	((c:USBCtrlEPService@setup_cnt)),c
	goto	i2u317_41
	goto	i2u317_40

i2u317_41:
	goto	i2l3957
i2u317_40:
	goto	i2l3965
	
i2l765:
	line	1127
	
i2l3965:
;usb_device.c: 1126: }
;usb_device.c: 1127: pBDTEntryEP0OutCurrent->ADR = ((WORD)(&SetupPkt));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutCurrent)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutCurrent+1)),c,w
	addwfc	fsr2h
	movlw	low(0230h)
	movwf	postinc2,c
	movlw	high(0230h)
	movwf	postdec2,c
	line	1129
	
i2l3967:
;usb_device.c: 1129: USBCtrlTrfSetupHandler();
	call	_USBCtrlTrfSetupHandler	;wreg free
	line	1130
;usb_device.c: 1130: } else {
	goto	i2l769
	
i2l763:
	line	1132
	
i2l3969:
;usb_device.c: 1132: USBCtrlTrfOutHandler();
	call	_USBCtrlTrfOutHandler	;wreg free
	goto	i2l769
	line	1133
	
i2l766:
	line	1134
;usb_device.c: 1133: }
;usb_device.c: 1134: } else {
	goto	i2l769
	
i2l762:
	line	1137
	
i2l3971:
;usb_device.c: 1137: if((USTATcopy.Val & ~0x02) == 0x04) {
	movf	((c:_USTATcopy)),c,w	;volatile
	andlw	low(0FDh)
	xorlw	04h
	btfss	status,2
	goto	i2u318_41
	goto	i2u318_40
i2u318_41:
	goto	i2l769
i2u318_40:
	line	1138
	
i2l3973:
;usb_device.c: 1138: USBCtrlTrfInHandler();
	call	_USBCtrlTrfInHandler	;wreg free
	goto	i2l769
	line	1139
	
i2l768:
	goto	i2l769
	line	1140
	
i2l767:
	line	1141
	
i2l769:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlEPService
	__end_of_USBCtrlEPService:
	signat	_USBCtrlEPService,89
	global	_USBCtrlTrfSetupHandler

;; *************** function _USBCtrlTrfSetupHandler *****************
;; Defined at:
;;		line 1158 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_USBCheckStdRequest
;;		_USBCtrlEPServiceComplete
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function is called by:
;;		_USBCtrlEPService
;; This function uses a non-reentrant model
;;
psect	text42,class=CODE,space=0,reloc=2,group=0
	line	1158
global __ptext42
__ptext42:
psect	text42
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1158
	global	__size_of_USBCtrlTrfSetupHandler
	__size_of_USBCtrlTrfSetupHandler	equ	__end_of_USBCtrlTrfSetupHandler-_USBCtrlTrfSetupHandler
	
_USBCtrlTrfSetupHandler:
;incstack = 0
	opt	stack 15
	line	1161
	
i2l3635:
;usb_device.c: 1161: shortPacketStatus = 0;
	movlw	low(0)
	movwf	((c:_shortPacketStatus)),c	;volatile
	line	1162
;usb_device.c: 1162: USBDeferStatusStagePacket = FALSE;
	movlw	low(0)
	movwf	((c:_USBDeferStatusStagePacket)),c	;volatile
	line	1163
;usb_device.c: 1163: USBDeferINDataStagePackets = FALSE;
	movlw	low(0)
	movwf	((c:_USBDeferINDataStagePackets)),c	;volatile
	line	1164
;usb_device.c: 1164: USBDeferOUTDataStagePackets = FALSE;
	movlw	low(0)
	movwf	((c:_USBDeferOUTDataStagePackets)),c	;volatile
	line	1165
;usb_device.c: 1165: BothEP0OutUOWNsSet = FALSE;
	movlw	low(0)
	movwf	((c:_BothEP0OutUOWNsSet)),c	;volatile
	line	1166
;usb_device.c: 1166: controlTransferState = 0;
	movlw	low(0)
	movwf	((c:_controlTransferState)),c	;volatile
	line	1168
	
i2l3637:
;usb_device.c: 1168: pBDTEntryIn[0]->STAT.Val &= ~(0x80);
	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlw	07Fh
	andwf	indf2
	line	1169
	
i2l3639:
;usb_device.c: 1169: ((BYTE_VAL*)&pBDTEntryIn[0])->Val ^= 0x0004;
	movlw	(04h)&0ffh
	movlb	0	; () banked
	xorwf	((_pBDTEntryIn))&0ffh
	line	1170
	
i2l3641:; BSR set to: 0

;usb_device.c: 1170: pBDTEntryIn[0]->STAT.Val &= ~(0x80);
	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlw	07Fh
	andwf	indf2
	line	1171
	
i2l3643:; BSR set to: 0

;usb_device.c: 1171: ((BYTE_VAL*)&pBDTEntryIn[0])->Val ^= 0x0004;
	movlw	(04h)&0ffh
	xorwf	((_pBDTEntryIn))&0ffh
	line	1173
	
i2l3645:; BSR set to: 0

;usb_device.c: 1173: pBDTEntryEP0OutNext->STAT.Val &= ~(0x80);
	movff	(c:_pBDTEntryEP0OutNext),fsr2l
	movff	(c:_pBDTEntryEP0OutNext+1),fsr2h
	movlw	07Fh
	andwf	indf2
	line	1175
	
i2l3647:; BSR set to: 0

;usb_device.c: 1175: inPipes[0].info.Val = 0;
	movlw	low(0)
	movwf	(0+(_inPipes+03h))&0ffh	;volatile
	line	1176
	
i2l3649:; BSR set to: 0

;usb_device.c: 1176: inPipes[0].wCount.Val = 0;
	movlw	high(0)
	movwf	(1+(_inPipes+04h))&0ffh	;volatile
	movlw	low(0)
	movwf	(0+(_inPipes+04h))&0ffh	;volatile
	line	1177
	
i2l3651:; BSR set to: 0

;usb_device.c: 1177: outPipes[0].info.Val = 0;
	movlw	low(0)
	movwf	(0+(_outPipes+03h))&0ffh	;volatile
	line	1178
	
i2l3653:; BSR set to: 0

;usb_device.c: 1178: outPipes[0].wCount.Val = 0;
	movlw	high(0)
	movwf	(1+(_outPipes+04h))&0ffh	;volatile
	movlw	low(0)
	movwf	(0+(_outPipes+04h))&0ffh	;volatile
	line	1181
	
i2l3655:; BSR set to: 0

;usb_device.c: 1181: USBCheckStdRequest();
	call	_USBCheckStdRequest	;wreg free
	line	1185
	
i2l3657:
;usb_device.c: 1185: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_EP0_REQUEST,0,0);
	movlw	high(03h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	movlw	low(03h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)),c
	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)),c

	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	line	1188
	
i2l3659:
;usb_device.c: 1188: USBCtrlEPServiceComplete();
	call	_USBCtrlEPServiceComplete	;wreg free
	line	1189
	
i2l772:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlTrfSetupHandler
	__end_of_USBCtrlTrfSetupHandler:
	signat	_USBCtrlTrfSetupHandler,89
	global	_USBCtrlEPServiceComplete

;; *************** function _USBCtrlEPServiceComplete *****************
;; Defined at:
;;		line 727 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_USBCtrlEPAllowDataStage
;;		_USBCtrlEPAllowStatusStage
;; This function is called by:
;;		_USBCtrlTrfSetupHandler
;; This function uses a non-reentrant model
;;
psect	text43,class=CODE,space=0,reloc=2,group=0
	line	727
global __ptext43
__ptext43:
psect	text43
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	727
	global	__size_of_USBCtrlEPServiceComplete
	__size_of_USBCtrlEPServiceComplete	equ	__end_of_USBCtrlEPServiceComplete-_USBCtrlEPServiceComplete
	
_USBCtrlEPServiceComplete:
;incstack = 0
	opt	stack 19
	line	731
	
i2l3491:
;usb_device.c: 731: UCONbits.PKTDIS = 0;
	bcf	((c:3940)),c,4	;volatile
	line	735
;usb_device.c: 735: if(inPipes[0].info.bits.busy == 0) {
	movlb	0	; () banked
	btfsc	(0+(_inPipes+03h))&0ffh,7	;volatile
	goto	i2u254_41
	goto	i2u254_40
i2u254_41:
	goto	i2l688
i2u254_40:
	line	736
	
i2l3493:; BSR set to: 0

;usb_device.c: 736: if(outPipes[0].info.bits.busy == 1) {
	btfss	(0+(_outPipes+03h))&0ffh,7	;volatile
	goto	i2u255_41
	goto	i2u255_40
i2u255_41:
	goto	i2l3503
i2u255_40:
	line	739
	
i2l3495:; BSR set to: 0

;usb_device.c: 739: controlTransferState = 2;
	movlw	low(02h)
	movwf	((c:_controlTransferState)),c	;volatile
	line	742
;usb_device.c: 742: if(USBDeferOUTDataStagePackets == FALSE) {
	movf	((c:_USBDeferOUTDataStagePackets)),c,w	;volatile
	btfss	status,2
	goto	i2u256_41
	goto	i2u256_40
i2u256_41:
	goto	i2l3499
i2u256_40:
	line	744
	
i2l3497:; BSR set to: 0

;usb_device.c: 744: USBCtrlEPAllowDataStage();
	call	_USBCtrlEPAllowDataStage	;wreg free
	goto	i2l3499
	line	745
	
i2l690:
	line	750
	
i2l3499:
;usb_device.c: 745: }
;usb_device.c: 750: USBStatusStageEnabledFlag2 = FALSE;
	movlw	low(0)
	movwf	((c:_USBStatusStageEnabledFlag2)),c	;volatile
	line	751
	
i2l3501:
;usb_device.c: 751: USBStatusStageEnabledFlag1 = FALSE;
	movlw	low(0)
	movwf	((c:_USBStatusStageEnabledFlag1)),c	;volatile
	line	752
;usb_device.c: 752: } else {
	goto	i2l698
	
i2l689:
	line	754
	
i2l3503:
;usb_device.c: 754: pBDTEntryEP0OutNext->CNT = 8;
	lfsr	2,01h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(08h)
	movwf	indf2
	line	755
;usb_device.c: 755: pBDTEntryEP0OutNext->ADR = ((WORD)(&SetupPkt));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(0230h)
	movwf	postinc2,c
	movlw	high(0230h)
	movwf	postdec2,c
	line	756
	
i2l3505:
;usb_device.c: 756: pBDTEntryEP0OutNext->STAT.Val = 0x80|0x00|(0x08 & 0x08)|0x04;
	movff	(c:_pBDTEntryEP0OutNext),fsr2l
	movff	(c:_pBDTEntryEP0OutNext+1),fsr2h
	movlw	low(08Ch)
	movwf	indf2
	line	758
	
i2l3507:
;usb_device.c: 758: pBDTEntryIn[0]->STAT.Val = 0x80|0x04;
	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlw	low(084h)
	movwf	indf2
	goto	i2l698
	line	759
	
i2l691:
	line	760
;usb_device.c: 759: }
;usb_device.c: 760: } else {
	goto	i2l698
	
i2l688:; BSR set to: 0

	line	761
;usb_device.c: 761: if(SetupPkt.DataDir == (0x80>>7)) {
	movlb	2	; () banked
	btfss	((560))&0ffh,7	;volatile
	goto	i2u257_41
	goto	i2u257_40
i2u257_41:
	goto	i2l3521
i2u257_40:
	line	765
	
i2l3509:; BSR set to: 2

;usb_device.c: 765: controlTransferState = 1;
	movlw	low(01h)
	movwf	((c:_controlTransferState)),c	;volatile
	line	768
;usb_device.c: 768: if(USBDeferINDataStagePackets == FALSE) {
	movf	((c:_USBDeferINDataStagePackets)),c,w	;volatile
	btfss	status,2
	goto	i2u258_41
	goto	i2u258_40
i2u258_41:
	goto	i2l3513
i2u258_40:
	line	769
	
i2l3511:; BSR set to: 2

;usb_device.c: 769: USBCtrlEPAllowDataStage();
	call	_USBCtrlEPAllowDataStage	;wreg free
	goto	i2l3513
	line	770
	
i2l694:
	line	775
	
i2l3513:
;usb_device.c: 770: }
;usb_device.c: 775: USBStatusStageEnabledFlag2 = FALSE;
	movlw	low(0)
	movwf	((c:_USBStatusStageEnabledFlag2)),c	;volatile
	line	776
	
i2l3515:
;usb_device.c: 776: USBStatusStageEnabledFlag1 = FALSE;
	movlw	low(0)
	movwf	((c:_USBStatusStageEnabledFlag1)),c	;volatile
	line	777
	
i2l3517:
;usb_device.c: 777: if(USBDeferStatusStagePacket == FALSE) {
	movf	((c:_USBDeferStatusStagePacket)),c,w	;volatile
	btfss	status,2
	goto	i2u259_41
	goto	i2u259_40
i2u259_41:
	goto	i2l698
i2u259_40:
	line	778
	
i2l3519:
;usb_device.c: 778: USBCtrlEPAllowStatusStage();
	call	_USBCtrlEPAllowStatusStage	;wreg free
	goto	i2l698
	line	779
	
i2l695:
	line	780
;usb_device.c: 779: }
;usb_device.c: 780: } else {
	goto	i2l698
	
i2l693:
	line	787
	
i2l3521:
;usb_device.c: 787: controlTransferState = 2;
	movlw	low(02h)
	movwf	((c:_controlTransferState)),c	;volatile
	line	790
	
i2l3523:
;usb_device.c: 790: pBDTEntryEP0OutNext->CNT = 8;
	lfsr	2,01h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(08h)
	movwf	indf2
	line	791
	
i2l3525:
;usb_device.c: 791: pBDTEntryEP0OutNext->ADR = ((WORD)(&SetupPkt));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(0230h)
	movwf	postinc2,c
	movlw	high(0230h)
	movwf	postdec2,c
	line	792
	
i2l3527:
;usb_device.c: 792: pBDTEntryEP0OutNext->STAT.Val = 0x80|0x04;
	movff	(c:_pBDTEntryEP0OutNext),fsr2l
	movff	(c:_pBDTEntryEP0OutNext+1),fsr2h
	movlw	low(084h)
	movwf	indf2
	line	795
	
i2l3529:
;usb_device.c: 795: USBStatusStageEnabledFlag2 = FALSE;
	movlw	low(0)
	movwf	((c:_USBStatusStageEnabledFlag2)),c	;volatile
	line	796
	
i2l3531:
;usb_device.c: 796: USBStatusStageEnabledFlag1 = FALSE;
	movlw	low(0)
	movwf	((c:_USBStatusStageEnabledFlag1)),c	;volatile
	line	797
	
i2l3533:
;usb_device.c: 797: if(USBDeferStatusStagePacket == FALSE) {
	movf	((c:_USBDeferStatusStagePacket)),c,w	;volatile
	btfss	status,2
	goto	i2u260_41
	goto	i2u260_40
i2u260_41:
	goto	i2l698
i2u260_40:
	line	798
	
i2l3535:
;usb_device.c: 798: USBCtrlEPAllowStatusStage();
	call	_USBCtrlEPAllowStatusStage	;wreg free
	goto	i2l698
	line	799
	
i2l697:
	goto	i2l698
	line	800
	
i2l696:
	goto	i2l698
	line	801
	
i2l692:
	line	802
	
i2l698:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlEPServiceComplete
	__end_of_USBCtrlEPServiceComplete:
	signat	_USBCtrlEPServiceComplete,89
	global	_USBCtrlEPAllowDataStage

;; *************** function _USBCtrlEPAllowDataStage *****************
;; Defined at:
;;		line 645 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_USBCtrlTrfTxService
;; This function is called by:
;;		_USBCtrlEPServiceComplete
;; This function uses a non-reentrant model
;;
psect	text44,class=CODE,space=0,reloc=2,group=0
	line	645
global __ptext44
__ptext44:
psect	text44
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	645
	global	__size_of_USBCtrlEPAllowDataStage
	__size_of_USBCtrlEPAllowDataStage	equ	__end_of_USBCtrlEPAllowDataStage-_USBCtrlEPAllowDataStage
	
_USBCtrlEPAllowDataStage:
;incstack = 0
	opt	stack 19
	line	647
	
i2l3321:
;usb_device.c: 647: USBDeferINDataStagePackets = FALSE;
	movlw	low(0)
	movwf	((c:_USBDeferINDataStagePackets)),c	;volatile
	line	648
;usb_device.c: 648: USBDeferOUTDataStagePackets = FALSE;
	movlw	low(0)
	movwf	((c:_USBDeferOUTDataStagePackets)),c	;volatile
	line	650
	
i2l3323:
;usb_device.c: 650: if(controlTransferState == 2) {
		movlw	2
	xorwf	((c:_controlTransferState)),c,w	;volatile
	btfss	status,2
	goto	i2u224_41
	goto	i2u224_40

i2u224_41:
	goto	i2l3329
i2u224_40:
	line	653
	
i2l3325:
;usb_device.c: 653: pBDTEntryEP0OutNext->CNT = 8;
	lfsr	2,01h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(08h)
	movwf	indf2
	line	654
;usb_device.c: 654: pBDTEntryEP0OutNext->ADR = ((WORD)(&CtrlTrfData));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(0238h)
	movwf	postinc2,c
	movlw	high(0238h)
	movwf	postdec2,c
	line	655
	
i2l3327:
;usb_device.c: 655: pBDTEntryEP0OutNext->STAT.Val = 0x80|0x40|(0x08 & 0x08);
	movff	(c:_pBDTEntryEP0OutNext),fsr2l
	movff	(c:_pBDTEntryEP0OutNext+1),fsr2h
	movlw	low(0C8h)
	movwf	indf2
	line	656
;usb_device.c: 656: } else {
	goto	i2l680
	
i2l677:
	line	659
	
i2l3329:
;usb_device.c: 659: if(SetupPkt.wLength < inPipes[0].wCount.Val) {
	movlb	0	; () banked
		movf	(0+(_inPipes+04h))&0ffh,w	;volatile
	movlb	2	; () banked
	subwf	(0+(560+06h))&0ffh,w	;volatile
	movlb	0	; () banked
	movf	(1+(_inPipes+04h))&0ffh,w	;volatile
	movlb	2	; () banked
	subwfb	(1+(560+06h))&0ffh,w	;volatile
	btfsc	status,0
	goto	i2u225_41
	goto	i2u225_40

i2u225_41:
	goto	i2l3333
i2u225_40:
	line	660
	
i2l3331:; BSR set to: 2

;usb_device.c: 660: inPipes[0].wCount.Val = SetupPkt.wLength;
	movff	0+(560+06h),0+(_inPipes+04h)	;volatile
	movff	1+(560+06h),1+(_inPipes+04h)	;volatile
	goto	i2l3333
	line	661
	
i2l679:; BSR set to: 2

	line	664
	
i2l3333:; BSR set to: 2

;usb_device.c: 661: }
;usb_device.c: 664: USBCtrlTrfTxService();
	call	_USBCtrlTrfTxService	;wreg free
	line	665
	
i2l3335:
;usb_device.c: 665: pBDTEntryIn[0]->ADR = ((WORD)(&CtrlTrfData));
	movlb	0	; () banked
	lfsr	2,02h
	movf	((_pBDTEntryIn))&0ffh,w
	addwf	fsr2l
	movf	((_pBDTEntryIn+1))&0ffh,w
	addwfc	fsr2h
	movlw	low(0238h)
	movwf	postinc2,c
	movlw	high(0238h)
	movwf	postdec2,c
	line	666
	
i2l3337:; BSR set to: 0

;usb_device.c: 666: pBDTEntryIn[0]->STAT.Val = 0x80|0x40|(0x08 & 0x08);
	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlw	low(0C8h)
	movwf	indf2
	goto	i2l680
	line	667
	
i2l678:; BSR set to: 0

	line	668
	
i2l680:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlEPAllowDataStage
	__end_of_USBCtrlEPAllowDataStage:
	signat	_USBCtrlEPAllowDataStage,89
	global	_USBCheckStdRequest

;; *************** function _USBCheckStdRequest *****************
;; Defined at:
;;		line 1293 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_USBStdFeatureReqHandler
;;		_USBStdGetDscHandler
;;		_USBStdSetCfgHandler
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function is called by:
;;		_USBCtrlTrfSetupHandler
;; This function uses a non-reentrant model
;;
psect	text45,class=CODE,space=0,reloc=2,group=0
	line	1293
global __ptext45
__ptext45:
psect	text45
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1293
	global	__size_of_USBCheckStdRequest
	__size_of_USBCheckStdRequest	equ	__end_of_USBCheckStdRequest-_USBCheckStdRequest
	
_USBCheckStdRequest:
;incstack = 0
	opt	stack 15
	line	1296
	
i2l3575:
;usb_device.c: 1296: if(SetupPkt.RequestType != (0x00>>5)) return;
	movlb	2	; () banked
	swapf	((560))&0ffh,w	;volatile
	rrcf	wreg,f
	andlw	(1<<2)-1
	iorlw	0
	btfsc	status,2
	goto	i2u266_41
	goto	i2u266_40
i2u266_41:
	goto	i2l3591
i2u266_40:
	goto	i2l797
	
i2l3577:; BSR set to: 2

	goto	i2l797
	
i2l796:; BSR set to: 2

	line	1298
;usb_device.c: 1298: switch(SetupPkt.bRequest)
	goto	i2l3591
	line	1300
;usb_device.c: 1299: {
;usb_device.c: 1300: case 5:
	
i2l799:; BSR set to: 2

	line	1302
;usb_device.c: 1302: inPipes[0].info.bits.busy = 1;
	movlb	0	; () banked
	bsf	(0+(_inPipes+03h))&0ffh,7	;volatile
	line	1305
	
i2l3579:; BSR set to: 0

;usb_device.c: 1305: USBDeviceState = ADR_PENDING_STATE;
	movlw	low(08h)
	movwf	((_USBDeviceState))&0ffh	;volatile
	line	1307
;usb_device.c: 1307: break;
	goto	i2l797
	line	1308
;usb_device.c: 1308: case 6:
	
i2l801:; BSR set to: 0

	line	1310
	
i2l3581:
;usb_device.c: 1310: USBStdGetDscHandler();
	call	_USBStdGetDscHandler	;wreg free
	line	1311
;usb_device.c: 1311: break;
	goto	i2l797
	line	1312
;usb_device.c: 1312: case 9:
	
i2l802:
	line	1314
	
i2l3583:
;usb_device.c: 1314: USBStdSetCfgHandler();
	call	_USBStdSetCfgHandler	;wreg free
	line	1315
;usb_device.c: 1315: break;
	goto	i2l797
	line	1317
;usb_device.c: 1317: case 1:
	
i2l803:
	goto	i2l3585
	line	1318
	
i2l804:
	line	1319
	
i2l3585:
;usb_device.c: 1318: case 3:
;usb_device.c: 1319: USBStdFeatureReqHandler();
	call	_USBStdFeatureReqHandler	;wreg free
	line	1320
;usb_device.c: 1320: break;
	goto	i2l797
	line	1321
;usb_device.c: 1321: case 7:
	
i2l805:
	line	1323
	
i2l3587:
;usb_device.c: 1323: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_SET_DESCRIPTOR,0,0);
	movlw	high(02h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	movlw	low(02h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)),c
	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)),c

	movlw	high(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(0)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	line	1324
;usb_device.c: 1324: break;
	goto	i2l797
	line	1325
;usb_device.c: 1325: case 0:
	
i2l806:
	goto	i2l797
	line	1326
	
i2l807:
	goto	i2l797
	line	1327
	
i2l808:
	goto	i2l797
	line	1328
	
i2l809:
	goto	i2l797
	line	1329
	
i2l810:
	goto	i2l797
	line	1330
;usb_device.c: 1326: case 8:
;usb_device.c: 1327: case 10:
;usb_device.c: 1328: case 11:
;usb_device.c: 1329: case 12:
;usb_device.c: 1330: default:
	
i2l811:
	line	1331
;usb_device.c: 1331: break;
	goto	i2l797
	line	1332
	
i2l3589:
;usb_device.c: 1332: }
	goto	i2l797
	line	1298
	
i2l798:
	
i2l3591:
	movlb	2	; () banked
	movf	(0+(560+01h))&0ffh,w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 11, Range of values is 0 to 12
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           34    18 (average)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	i2l797
	xorlw	1^0	; case 1
	skipnz
	goto	i2l3585
	xorlw	3^1	; case 3
	skipnz
	goto	i2l3585
	xorlw	5^3	; case 5
	skipnz
	goto	i2l799
	xorlw	6^5	; case 6
	skipnz
	goto	i2l3581
	xorlw	7^6	; case 7
	skipnz
	goto	i2l3587
	xorlw	8^7	; case 8
	skipnz
	goto	i2l797
	xorlw	9^8	; case 9
	skipnz
	goto	i2l3583
	xorlw	10^9	; case 10
	skipnz
	goto	i2l797
	xorlw	11^10	; case 11
	skipnz
	goto	i2l797
	xorlw	12^11	; case 12
	skipnz
	goto	i2l797
	goto	i2l797

	line	1332
	
i2l800:; BSR set to: 2

	line	1333
	
i2l797:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCheckStdRequest
	__end_of_USBCheckStdRequest:
	signat	_USBCheckStdRequest,89
	global	_USBStdSetCfgHandler

;; *************** function _USBStdSetCfgHandler *****************
;; Defined at:
;;		line 932 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;;		i2_memset
;; This function is called by:
;;		_USBCheckStdRequest
;; This function uses a non-reentrant model
;;
psect	text46,class=CODE,space=0,reloc=2,group=0
	line	932
global __ptext46
__ptext46:
psect	text46
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	932
	global	__size_of_USBStdSetCfgHandler
	__size_of_USBStdSetCfgHandler	equ	__end_of_USBStdSetCfgHandler-_USBStdSetCfgHandler
	
_USBStdSetCfgHandler:
;incstack = 0
	opt	stack 15
	line	937
	
i2l3339:
;usb_device.c: 934: BYTE i;
;usb_device.c: 937: inPipes[0].info.bits.busy = 1;
	movlb	0	; () banked
	bsf	(0+(_inPipes+03h))&0ffh,7	;volatile
	line	939
	
i2l3341:; BSR set to: 0

;usb_device.c: 939: memset((void*)&UEP1,0x00,2) ;
		movlw	low(3924)
	movwf	((c:i2memset@p1)),c
	movlw	high(3924)
	movwf	((c:i2memset@p1+1)),c

	movlw	high(0)
	movwf	((c:i2memset@c+1)),c
	movlw	low(0)
	movwf	((c:i2memset@c)),c
	movlw	high(02h)
	movwf	((c:i2memset@n+1)),c
	movlw	low(02h)
	movwf	((c:i2memset@n)),c
	call	i2_memset	;wreg free
	line	941
;usb_device.c: 941: memset((void*)&BDT[0], 0x00, sizeof(BDT));
		movlw	low(512)
	movwf	((c:i2memset@p1)),c
	movlw	high(512)
	movwf	((c:i2memset@p1+1)),c

	movlw	high(0)
	movwf	((c:i2memset@c+1)),c
	movlw	low(0)
	movwf	((c:i2memset@c)),c
	movlw	high(030h)
	movwf	((c:i2memset@n+1)),c
	movlw	low(030h)
	movwf	((c:i2memset@n)),c
	call	i2_memset	;wreg free
	line	943
	
i2l3343:
;usb_device.c: 943: UCONbits.PPBRST = 1;
	bsf	((c:3940)),c,6	;volatile
	line	945
	
i2l3345:
;usb_device.c: 945: for(i = 0; i < (BYTE)(2+1u); i++) {
	movlw	low(0)
	movwf	((c:USBStdSetCfgHandler@i)),c
	
i2l3347:
		movlw	03h-1
	cpfsgt	((c:USBStdSetCfgHandler@i)),c
	goto	i2u226_41
	goto	i2u226_40

i2u226_41:
	goto	i2l3351
i2u226_40:
	goto	i2l3357
	
i2l3349:
	goto	i2l3357
	
i2l729:
	line	946
	
i2l3351:
;usb_device.c: 946: ep_data_in[i].Val = 0u;
	movf	((c:USBStdSetCfgHandler@i)),c,w
	mullw	01h
	movlw	low(_ep_data_in)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_in)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	line	947
;usb_device.c: 947: ep_data_out[i].Val = 0u;
	movf	((c:USBStdSetCfgHandler@i)),c,w
	mullw	01h
	movlw	low(_ep_data_out)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_out)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	low(0)
	movwf	indf2
	line	945
	
i2l3353:
	incf	((c:USBStdSetCfgHandler@i)),c
	
i2l3355:
		movlw	03h-1
	cpfsgt	((c:USBStdSetCfgHandler@i)),c
	goto	i2u227_41
	goto	i2u227_40

i2u227_41:
	goto	i2l3351
i2u227_40:
	goto	i2l3357
	
i2l730:
	line	950
	
i2l3357:
;usb_device.c: 948: }
;usb_device.c: 950: memset((void*)&USBAlternateInterface,0x00,2);
		movlw	low(_USBAlternateInterface)
	movwf	((c:i2memset@p1)),c
	movlw	high(_USBAlternateInterface)
	movwf	((c:i2memset@p1+1)),c

	movlw	high(0)
	movwf	((c:i2memset@c+1)),c
	movlw	low(0)
	movwf	((c:i2memset@c)),c
	movlw	high(02h)
	movwf	((c:i2memset@n+1)),c
	movlw	low(02h)
	movwf	((c:i2memset@n)),c
	call	i2_memset	;wreg free
	line	952
	
i2l3359:
;usb_device.c: 952: UCONbits.PPBRST = 0;
	bcf	((c:3940)),c,6	;volatile
	line	955
	
i2l3361:
;usb_device.c: 955: pBDTEntryIn[0] = (volatile BDT_ENTRY*)&BDT[2];
		movlw	low(512+08h)
	movlb	0	; () banked
	movwf	((_pBDTEntryIn))&0ffh
	movlw	high(512+08h)
	movwf	((_pBDTEntryIn+1))&0ffh

	line	957
	
i2l3363:; BSR set to: 0

;usb_device.c: 957: pBDTEntryEP0OutCurrent = (volatile BDT_ENTRY*)&BDT[0];
		movlw	low(512)
	movwf	((c:_pBDTEntryEP0OutCurrent)),c
	movlw	high(512)
	movwf	((c:_pBDTEntryEP0OutCurrent+1)),c

	line	958
	
i2l3365:; BSR set to: 0

;usb_device.c: 958: pBDTEntryEP0OutNext = pBDTEntryEP0OutCurrent;
		movff	(c:_pBDTEntryEP0OutCurrent),(c:_pBDTEntryEP0OutNext)
	movff	(c:_pBDTEntryEP0OutCurrent+1),(c:_pBDTEntryEP0OutNext+1)

	line	961
	
i2l3367:; BSR set to: 0

;usb_device.c: 961: USBActiveConfiguration = SetupPkt.bConfigurationValue;
	movff	0+(560+02h),(c:_USBActiveConfiguration)	;volatile
	line	962
	
i2l3369:; BSR set to: 0

;usb_device.c: 962: if(USBActiveConfiguration == 0) {
	movf	((c:_USBActiveConfiguration)),c,w	;volatile
	btfss	status,2
	goto	i2u228_41
	goto	i2u228_40
i2u228_41:
	goto	i2l3373
i2u228_40:
	line	964
	
i2l3371:; BSR set to: 0

;usb_device.c: 964: USBDeviceState = ADDRESS_STATE;
	movlw	low(010h)
	movwf	((_USBDeviceState))&0ffh	;volatile
	line	965
;usb_device.c: 965: } else {
	goto	i2l733
	
i2l731:; BSR set to: 0

	line	968
	
i2l3373:; BSR set to: 0

;usb_device.c: 968: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_CONFIGURED,(void*)&USBActiveConfiguration,1);
	movlw	high(01h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	movlw	low(01h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movlw	low(_USBActiveConfiguration)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)),c
	movlw	high(_USBActiveConfiguration)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)),c

	movlw	high(01h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(01h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	line	971
	
i2l3375:
;usb_device.c: 971: USBDeviceState = CONFIGURED_STATE;
	movlw	low(020h)
	movlb	0	; () banked
	movwf	((_USBDeviceState))&0ffh	;volatile
	goto	i2l733
	line	972
	
i2l732:; BSR set to: 0

	line	973
	
i2l733:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBStdSetCfgHandler
	__end_of_USBStdSetCfgHandler:
	signat	_USBStdSetCfgHandler,89
	global	i2_memset

;; *************** function i2_memset *****************
;; Defined at:
;;		line 8 in file "C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\memset.c"
;; Parameters:    Size  Location     Type
;;  p1              2    0[COMRAM] PTR void 
;;		 -> USBAlternateInterface(2), BDT(48), UEP1(1), 
;;  c               2    2[COMRAM] int 
;;  n               2    4[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  memset          2    6[COMRAM] PTR unsigned char 
;;		 -> USBAlternateInterface(2), BDT(48), UEP1(1), 
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] PTR void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         6       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBStdSetCfgHandler
;;		i2_USBDeviceInit
;; This function uses a non-reentrant model
;;
psect	text47,class=CODE,space=0,reloc=2,group=0
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\memset.c"
	line	8
global __ptext47
__ptext47:
psect	text47
	file	"C:\Program Files (x86)\Microchip\xc8\v1.45\sources\common\memset.c"
	line	8
	global	__size_ofi2_memset
	__size_ofi2_memset	equ	__end_ofi2_memset-i2_memset
	
i2_memset:; BSR set to: 0

;incstack = 0
	opt	stack 22
	line	18
	
i2l3285:
		movff	(c:i2memset@p1),(c:i2memset@p)
	movff	(c:i2memset@p1+1),(c:i2memset@p+1)

	line	19
	goto	i2l3291
	
i2l1266:
	line	20
	
i2l3287:
	movff	(c:i2memset@p),fsr2l
	movff	(c:i2memset@p+1),fsr2h
	movff	(c:i2memset@c),indf2

	
i2l3289:
	infsnz	((c:i2memset@p)),c
	incf	((c:i2memset@p+1)),c
	goto	i2l3291
	
i2l1265:
	line	19
	
i2l3291:
	decf	((c:i2memset@n)),c
	btfss	status,0
	decf	((c:i2memset@n+1)),c
		incf	((c:i2memset@n)),c,w
	bnz	i2u219_41
	incf	((c:i2memset@n+1)),c,w
	btfss	status,2
	goto	i2u219_41
	goto	i2u219_40

i2u219_41:
	goto	i2l3287
i2u219_40:
	goto	i2l1268
	
i2l1267:
	line	22
;	Return value of i2_memset is never used
	
i2l1268:
	return	;funcret
	opt stack 0
GLOBAL	__end_ofi2_memset
	__end_ofi2_memset:
	signat	i2_memset,90
	global	_USBStdGetDscHandler

;; *************** function _USBStdGetDscHandler *****************
;; Defined at:
;;		line 981 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, tblptrl, tblptrh, tblptru, prodl, prodh
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCheckStdRequest
;; This function uses a non-reentrant model
;;
psect	text48,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	981
global __ptext48
__ptext48:
psect	text48
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	981
	global	__size_of_USBStdGetDscHandler
	__size_of_USBStdGetDscHandler	equ	__end_of_USBStdGetDscHandler-_USBStdGetDscHandler
	
_USBStdGetDscHandler:
;incstack = 0
	opt	stack 20
	line	984
	
i2l3377:
;usb_device.c: 984: if(SetupPkt.bmRequestType == 0x80) {
		movlw	128
	movlb	2	; () banked
	xorwf	((560))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u229_41
	goto	i2u229_40

i2u229_41:
	goto	i2l745
i2u229_40:
	line	986
	
i2l3379:; BSR set to: 2

;usb_device.c: 986: inPipes[0].info.Val = 0x00 | 0x80 | 0x40;
	movlw	low(0C0h)
	movlb	0	; () banked
	movwf	(0+(_inPipes+03h))&0ffh	;volatile
	line	988
;usb_device.c: 988: switch(SetupPkt.bDescriptorType)
	goto	i2l3403
	line	990
;usb_device.c: 989: {
;usb_device.c: 990: case 0x01:
	
i2l738:; BSR set to: 0

	line	994
	
i2l3381:
;usb_device.c: 994: inPipes[0].pSrc.bRom = (const BYTE*)&device_dsc;
		movlw	low(_device_dsc)
	movlb	0	; () banked
	movwf	((_inPipes))&0ffh	;volatile
	movlw	high(_device_dsc)
	movwf	((_inPipes+1))&0ffh	;volatile

	line	996
	
i2l3383:; BSR set to: 0

;usb_device.c: 996: inPipes[0].wCount.Val = sizeof(device_dsc);
	movlw	high(012h)
	movwf	(1+(_inPipes+04h))&0ffh	;volatile
	movlw	low(012h)
	movwf	(0+(_inPipes+04h))&0ffh	;volatile
	line	997
;usb_device.c: 997: break;
	goto	i2l745
	line	998
;usb_device.c: 998: case 0x02:
	
i2l740:; BSR set to: 0

	line	1002
	
i2l3385:
;usb_device.c: 1002: inPipes[0].pSrc.bRom = *(USB_CD_Ptr+SetupPkt.bDscIndex);
	movlb	2	; () banked
	movf	(0+(560+02h))&0ffh,w	;volatile
	mullw	02h
	movlw	low((_USB_CD_Ptr))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_USB_CD_Ptr))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(_inPipes)	;volatile
	tblrd*-
	
	movff	tablat,(_inPipes+1)	;volatile

	line	1004
	
i2l3387:; BSR set to: 2

;usb_device.c: 1004: inPipes[0].wCount.byte.LB = *(inPipes[0].pSrc.bRom+2);
	movlw	02h
	movlb	0	; () banked
	addwf	((_inPipes))&0ffh,w	;volatile
	movwf	(??_USBStdGetDscHandler+0+0)&0ffh,c
	movlw	0
	addwfc	((_inPipes+1))&0ffh,w	;volatile
	movwf	(??_USBStdGetDscHandler+0+0+1)&0ffh,c
	movff	??_USBStdGetDscHandler+0+0,tblptrl
	movff	??_USBStdGetDscHandler+0+1,tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	i2u230_47
	tblrd	*
	
	movf	tablat,w
	bra	i2u230_40
i2u230_47:
	movff	tblptrl,fsr1l
	movff	tblptrh,fsr1h
	movf	indf1,w
i2u230_40:
	movlb	0	; () banked
	movwf	(0+(_inPipes+04h))&0ffh	;volatile
	line	1005
	
i2l3389:; BSR set to: 0

;usb_device.c: 1005: inPipes[0].wCount.byte.HB = *(inPipes[0].pSrc.bRom+3);
	movlw	03h
	addwf	((_inPipes))&0ffh,w	;volatile
	movwf	(??_USBStdGetDscHandler+0+0)&0ffh,c
	movlw	0
	addwfc	((_inPipes+1))&0ffh,w	;volatile
	movwf	(??_USBStdGetDscHandler+0+0+1)&0ffh,c
	movff	??_USBStdGetDscHandler+0+0,tblptrl
	movff	??_USBStdGetDscHandler+0+1,tblptrh
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	i2u231_47
	tblrd	*
	
	movf	tablat,w
	bra	i2u231_40
i2u231_47:
	movff	tblptrl,fsr1l
	movff	tblptrh,fsr1h
	movf	indf1,w
i2u231_40:
	movlb	0	; () banked
	movwf	(0+(_inPipes+05h))&0ffh	;volatile
	line	1006
;usb_device.c: 1006: break;
	goto	i2l745
	line	1007
;usb_device.c: 1007: case 0x03:
	
i2l741:; BSR set to: 0

	line	1009
	
i2l3391:
;usb_device.c: 1009: if(SetupPkt.bDscIndex < 3) {
		movlw	03h-0
	movlb	2	; () banked
	cpfslt	(0+(560+02h))&0ffh	;volatile
	goto	i2u232_41
	goto	i2u232_40

i2u232_41:
	goto	i2l3397
i2u232_40:
	line	1010
	
i2l3393:; BSR set to: 2

;usb_device.c: 1010: inPipes[0].pSrc.bRom = *(USB_SD_Ptr+SetupPkt.bDscIndex);
	movf	(0+(560+02h))&0ffh,w	;volatile
	mullw	02h
	movlw	low((_USB_SD_Ptr))
	addwf	(prodl),c,w
	movwf	tblptrl
	movlw	high((_USB_SD_Ptr))
	addwfc	(prodh),c,w
	movwf	tblptrh
	if	0	;There are less than 3 active tblptr bytes
	clrf	tblptru
	global __mediumconst
movlw	low highword(__mediumconst)
	addwfc	tblptru,f
	endif
	tblrd*+
	
	movff	tablat,(_inPipes)	;volatile
	tblrd*-
	
	movff	tablat,(_inPipes+1)	;volatile

	line	1011
	
i2l3395:; BSR set to: 2

;usb_device.c: 1011: inPipes[0].wCount.Val = *inPipes[0].pSrc.bRom;
	movff	(_inPipes),tblptrl	;volatile
	movff	(_inPipes+1),tblptrh	;volatile
	clrf	tblptru
	
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	i2u233_47
	tblrd	*
	
	movf	tablat,w
	bra	i2u233_40
i2u233_47:
	movff	tblptrl,fsr1l
	movff	tblptrh,fsr1h
	movf	indf1,w
i2u233_40:
	movwf	(??_USBStdGetDscHandler+0+0)&0ffh,c
	movf	((??_USBStdGetDscHandler+0+0)),c,w
	movlb	0	; () banked
	movwf	(0+(_inPipes+04h))&0ffh	;volatile
	clrf	(1+(_inPipes+04h))&0ffh	;volatile
	line	1012
;usb_device.c: 1012: } else {
	goto	i2l745
	
i2l742:; BSR set to: 0

	line	1014
	
i2l3397:
;usb_device.c: 1014: inPipes[0].info.Val = 0;
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_inPipes+03h))&0ffh	;volatile
	goto	i2l745
	line	1015
	
i2l743:; BSR set to: 0

	line	1016
;usb_device.c: 1015: }
;usb_device.c: 1016: break;
	goto	i2l745
	line	1017
;usb_device.c: 1017: default:
	
i2l744:; BSR set to: 0

	line	1018
	
i2l3399:
;usb_device.c: 1018: inPipes[0].info.Val = 0;
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_inPipes+03h))&0ffh	;volatile
	line	1019
;usb_device.c: 1019: break;
	goto	i2l745
	line	1020
	
i2l3401:; BSR set to: 0

;usb_device.c: 1020: }
	goto	i2l745
	line	988
	
i2l737:; BSR set to: 0

	
i2l3403:; BSR set to: 0

	movlb	2	; () banked
	movf	(0+(560+03h))&0ffh,w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	i2l3381
	xorlw	2^1	; case 2
	skipnz
	goto	i2l3385
	xorlw	3^2	; case 3
	skipnz
	goto	i2l3391
	goto	i2l3399

	line	1020
	
i2l739:; BSR set to: 2

	goto	i2l745
	line	1021
	
i2l736:; BSR set to: 2

	line	1022
	
i2l745:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBStdGetDscHandler
	__end_of_USBStdGetDscHandler:
	signat	_USBStdGetDscHandler,89
	global	_USBStdFeatureReqHandler

;; *************** function _USBStdFeatureReqHandler *****************
;; Defined at:
;;		line 1344 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  p               2   24[COMRAM] PTR struct __BDT
;;		 -> BDT(48), NULL(0), 
;;  pUEP            2   21[COMRAM] PTR unsigned char 
;;		 -> UEP0(1), 
;;  current_ep_d    1   23[COMRAM] struct .
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         5       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function is called by:
;;		_USBCheckStdRequest
;; This function uses a non-reentrant model
;;
psect	text49,class=CODE,space=0,reloc=2,group=0
	line	1344
global __ptext49
__ptext49:
psect	text49
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1344
	global	__size_of_USBStdFeatureReqHandler
	__size_of_USBStdFeatureReqHandler	equ	__end_of_USBStdFeatureReqHandler-_USBStdFeatureReqHandler
	
_USBStdFeatureReqHandler:
;incstack = 0
	opt	stack 15
	line	1352
	
i2l3405:
;usb_device.c: 1346: BDT_ENTRY *p;
;usb_device.c: 1347: EP_STATUS current_ep_data;
;usb_device.c: 1348: unsigned char* pUEP;
;usb_device.c: 1351: if((SetupPkt.bFeature == 1)&&
;usb_device.c: 1352: (SetupPkt.Recipient == (0x00)))
	movlb	2	; () banked
		decf	(0+(560+02h))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u234_41
	goto	i2u234_40

i2u234_41:
	goto	i2l814
i2u234_40:
	
i2l3407:; BSR set to: 2

	movf	((560))&0ffh,w	;volatile
	andlw	(1<<5)-1
	iorlw	0
	btfss	status,2
	goto	i2u235_41
	goto	i2u235_40
i2u235_41:
	goto	i2l814
i2u235_40:
	line	1355
	
i2l3409:; BSR set to: 2

;usb_device.c: 1353: {
;usb_device.c: 1355: inPipes[0].info.bits.busy = 1;
	movlb	0	; () banked
	bsf	(0+(_inPipes+03h))&0ffh,7	;volatile
	line	1357
	
i2l3411:; BSR set to: 0

;usb_device.c: 1357: if (SetupPkt.bRequest == 3) {
		movlw	3
	movlb	2	; () banked
	xorwf	(0+(560+01h))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u236_41
	goto	i2u236_40

i2u236_41:
	goto	i2l3415
i2u236_40:
	line	1358
	
i2l3413:; BSR set to: 2

;usb_device.c: 1358: RemoteWakeup = TRUE;
	movlw	low(01h)
	movwf	((c:_RemoteWakeup)),c	;volatile
	line	1359
;usb_device.c: 1359: } else {
	goto	i2l814
	
i2l815:; BSR set to: 2

	line	1360
	
i2l3415:; BSR set to: 2

;usb_device.c: 1360: RemoteWakeup = FALSE;
	movlw	low(0)
	movwf	((c:_RemoteWakeup)),c	;volatile
	goto	i2l814
	line	1361
	
i2l816:; BSR set to: 2

	line	1362
	
i2l814:; BSR set to: 2

	line	1369
;usb_device.c: 1361: }
;usb_device.c: 1362: }
;usb_device.c: 1366: if((SetupPkt.bFeature == 0)&&
;usb_device.c: 1367: (SetupPkt.Recipient == (0x02))&&
;usb_device.c: 1368: (SetupPkt.EPNum != 0) && (SetupPkt.EPNum <= 2)&&
;usb_device.c: 1369: (USBDeviceState == CONFIGURED_STATE))
	movf	(0+(560+02h))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u237_41
	goto	i2u237_40
i2u237_41:
	goto	i2l837
i2u237_40:
	
i2l3417:; BSR set to: 2

	movf	((560))&0ffh,w	;volatile
	andlw	(1<<5)-1
	xorlw	02h
	btfss	status,2
	goto	i2u238_41
	goto	i2u238_40
i2u238_41:
	goto	i2l837
i2u238_40:
	
i2l3419:; BSR set to: 2

	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	iorlw	0
	btfsc	status,2
	goto	i2u239_41
	goto	i2u239_40
i2u239_41:
	goto	i2l837
i2u239_40:
	
i2l3421:; BSR set to: 2

	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
		movlw	03h-0
	cpfslt	((??_USBStdFeatureReqHandler+0+0)),c
	goto	i2u240_41
	goto	i2u240_40

i2u240_41:
	goto	i2l837
i2u240_40:
	
i2l3423:; BSR set to: 2

		movlw	32
	movlb	0	; () banked
	xorwf	((_USBDeviceState))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u241_41
	goto	i2u241_40

i2u241_41:
	goto	i2l837
i2u241_40:
	line	1372
	
i2l3425:; BSR set to: 0

;usb_device.c: 1370: {
;usb_device.c: 1372: inPipes[0].info.bits.busy = 1;
	bsf	(0+(_inPipes+03h))&0ffh,7	;volatile
	line	1375
;usb_device.c: 1375: if(SetupPkt.EPDir == 0) {
	movlb	2	; () banked
	btfsc	(0+(560+04h))&0ffh,7	;volatile
	goto	i2u242_41
	goto	i2u242_40
i2u242_41:
	goto	i2l3429
i2u242_40:
	line	1376
	
i2l3427:; BSR set to: 2

;usb_device.c: 1376: p = (BDT_ENTRY*)pBDTEntryOut[SetupPkt.EPNum];
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	02h
	movlw	low(_pBDTEntryOut)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryOut)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:USBStdFeatureReqHandler@p)
	movff	postdec2,(c:USBStdFeatureReqHandler@p+1)
	line	1377
;usb_device.c: 1377: current_ep_data.Val = ep_data_out[SetupPkt.EPNum].Val;
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	01h
	movlw	low(_ep_data_out)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_out)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:USBStdFeatureReqHandler@current_ep_data)),c
	line	1378
;usb_device.c: 1378: } else {
	goto	i2l3431
	
i2l818:; BSR set to: 2

	line	1379
	
i2l3429:; BSR set to: 2

;usb_device.c: 1379: p = (BDT_ENTRY*)pBDTEntryIn[SetupPkt.EPNum];
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	02h
	movlw	low(_pBDTEntryIn)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryIn)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:USBStdFeatureReqHandler@p)
	movff	postdec2,(c:USBStdFeatureReqHandler@p+1)
	line	1380
;usb_device.c: 1380: current_ep_data.Val = ep_data_in[SetupPkt.EPNum].Val;
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	01h
	movlw	low(_ep_data_in)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_in)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	((c:USBStdFeatureReqHandler@current_ep_data)),c
	goto	i2l3431
	line	1381
	
i2l819:; BSR set to: 2

	line	1384
	
i2l3431:; BSR set to: 2

;usb_device.c: 1381: }
;usb_device.c: 1384: if(current_ep_data.bits.ping_pong_state == 0) {
	btfsc	((c:USBStdFeatureReqHandler@current_ep_data)),c,0
	goto	i2u243_41
	goto	i2u243_40
i2u243_41:
	goto	i2l3435
i2u243_40:
	line	1385
	
i2l3433:; BSR set to: 2

;usb_device.c: 1385: {((BYTE_VAL*)&p)->Val &= ~0x0004;};
	bcf	(0+(2/8)+(c:USBStdFeatureReqHandler@p)),c,(2)&7
	line	1386
;usb_device.c: 1386: } else {
	goto	i2l3437
	
i2l820:; BSR set to: 2

	line	1387
	
i2l3435:; BSR set to: 2

;usb_device.c: 1387: {((BYTE_VAL*)&p)->Val |= 0x0004;};
	bsf	(0+(2/8)+(c:USBStdFeatureReqHandler@p)),c,(2)&7
	goto	i2l3437
	line	1388
	
i2l821:; BSR set to: 2

	line	1392
	
i2l3437:; BSR set to: 2

;usb_device.c: 1388: }
;usb_device.c: 1392: if(SetupPkt.EPDir == 0) {
	btfsc	(0+(560+04h))&0ffh,7	;volatile
	goto	i2u244_41
	goto	i2u244_40
i2u244_41:
	goto	i2l3441
i2u244_40:
	line	1393
	
i2l3439:; BSR set to: 2

;usb_device.c: 1393: pBDTEntryOut[SetupPkt.EPNum] = (volatile BDT_ENTRY *)p;
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	02h
	movlw	low(_pBDTEntryOut)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryOut)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:USBStdFeatureReqHandler@p),postinc2
	movff	(c:USBStdFeatureReqHandler@p+1),postdec2
	line	1394
;usb_device.c: 1394: } else {
	goto	i2l3443
	
i2l822:; BSR set to: 2

	line	1395
	
i2l3441:; BSR set to: 2

;usb_device.c: 1395: pBDTEntryIn[SetupPkt.EPNum] = (volatile BDT_ENTRY *)p;
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	02h
	movlw	low(_pBDTEntryIn)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryIn)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:USBStdFeatureReqHandler@p),postinc2
	movff	(c:USBStdFeatureReqHandler@p+1),postdec2
	goto	i2l3443
	line	1396
	
i2l823:; BSR set to: 2

	line	1398
	
i2l3443:; BSR set to: 2

;usb_device.c: 1396: }
;usb_device.c: 1398: if(SetupPkt.bRequest == 3) {
		movlw	3
	xorwf	(0+(560+01h))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u245_41
	goto	i2u245_40

i2u245_41:
	goto	i2l3455
i2u245_40:
	line	1400
	
i2l3445:; BSR set to: 2

;usb_device.c: 1400: if(p->STAT.UOWN == 1) {
	movff	(c:USBStdFeatureReqHandler@p),fsr2l
	movff	(c:USBStdFeatureReqHandler@p+1),fsr2h
	btfss	c:indf2,7
	goto	i2u246_41
	goto	i2u246_40
i2u246_41:
	goto	i2l3453
i2u246_40:
	line	1402
	
i2l3447:; BSR set to: 2

;usb_device.c: 1402: if(SetupPkt.EPDir == 0) {
	btfsc	(0+(560+04h))&0ffh,7	;volatile
	goto	i2u247_41
	goto	i2u247_40
i2u247_41:
	goto	i2l3451
i2u247_40:
	line	1403
	
i2l3449:; BSR set to: 2

;usb_device.c: 1403: ep_data_out[SetupPkt.EPNum].bits.transfer_terminated = 1;
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	01h
	movlw	low(_ep_data_out)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_out)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlb	0	; () banked
	bsf	c:indf2,1
	line	1404
;usb_device.c: 1404: } else {
	goto	i2l3453
	
i2l826:; BSR set to: 0

	line	1405
	
i2l3451:
;usb_device.c: 1405: ep_data_in[SetupPkt.EPNum].bits.transfer_terminated = 1;
	movlb	2	; () banked
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	01h
	movlw	low(_ep_data_in)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_in)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlb	0	; () banked
	bsf	c:indf2,1
	goto	i2l3453
	line	1406
	
i2l827:; BSR set to: 0

	goto	i2l3453
	line	1407
	
i2l825:; BSR set to: 0

	line	1409
	
i2l3453:
;usb_device.c: 1406: }
;usb_device.c: 1407: }
;usb_device.c: 1409: p->STAT.Val |= 0x80|0x04;
	movff	(c:USBStdFeatureReqHandler@p),fsr2l
	movff	(c:USBStdFeatureReqHandler@p+1),fsr2h
	movlw	084h
	iorwf	indf2
	line	1410
;usb_device.c: 1410: } else {
	goto	i2l837
	
i2l824:
	line	1414
	
i2l3455:
;usb_device.c: 1414: ((BYTE_VAL*)&p)->Val ^= 0x0004;;
	movlw	(04h)&0ffh
	xorwf	((c:USBStdFeatureReqHandler@p)),c
	line	1416
	
i2l3457:
;usb_device.c: 1416: if(p->STAT.UOWN == 1) {
	movff	(c:USBStdFeatureReqHandler@p),fsr2l
	movff	(c:USBStdFeatureReqHandler@p+1),fsr2h
	btfss	c:indf2,7
	goto	i2u248_41
	goto	i2u248_40
i2u248_41:
	goto	i2l3465
i2u248_40:
	line	1417
	
i2l3459:
;usb_device.c: 1417: p->STAT.Val &= (~0x80);
	movff	(c:USBStdFeatureReqHandler@p),fsr2l
	movff	(c:USBStdFeatureReqHandler@p+1),fsr2h
	movlw	07Fh
	andwf	indf2
	line	1418
	
i2l3461:
;usb_device.c: 1418: p->STAT.Val |= 0x40;
	movff	(c:USBStdFeatureReqHandler@p),fsr2l
	movff	(c:USBStdFeatureReqHandler@p+1),fsr2h
	movlw	0+(6/8)
	bsf	plusw2,(6)&7
	line	1420
	
i2l3463:
;usb_device.c: 1420: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_TRANSFER_TERMINATED,p,sizeof(p));
	movlw	high(05h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	movlw	low(05h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movff	(c:USBStdFeatureReqHandler@p),(c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)
	movff	(c:USBStdFeatureReqHandler@p+1),(c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)

	movlw	high(02h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(02h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	line	1421
;usb_device.c: 1421: } else {
	goto	i2l3467
	
i2l829:
	line	1422
	
i2l3465:
;usb_device.c: 1422: p->STAT.Val |= 0x40;
	movff	(c:USBStdFeatureReqHandler@p),fsr2l
	movff	(c:USBStdFeatureReqHandler@p+1),fsr2h
	movlw	0+(6/8)
	bsf	plusw2,(6)&7
	goto	i2l3467
	line	1423
	
i2l830:
	line	1427
	
i2l3467:
;usb_device.c: 1423: }
;usb_device.c: 1427: ((BYTE_VAL*)&p)->Val ^= 0x0004;;
	movlw	(04h)&0ffh
	xorwf	((c:USBStdFeatureReqHandler@p)),c
	line	1433
	
i2l3469:
;usb_device.c: 1433: if((current_ep_data.bits.transfer_terminated != 0) || (p->STAT.UOWN == 1)) {
	btfsc	((c:USBStdFeatureReqHandler@current_ep_data)),c,1
	goto	i2u249_41
	goto	i2u249_40
i2u249_41:
	goto	i2l833
i2u249_40:
	
i2l3471:
	movff	(c:USBStdFeatureReqHandler@p),fsr2l
	movff	(c:USBStdFeatureReqHandler@p+1),fsr2h
	btfss	c:indf2,7
	goto	i2u250_41
	goto	i2u250_40
i2u250_41:
	goto	i2l3481
i2u250_40:
	
i2l833:
	line	1434
;usb_device.c: 1434: if(SetupPkt.EPDir == 0) {
	movlb	2	; () banked
	btfsc	(0+(560+04h))&0ffh,7	;volatile
	goto	i2u251_41
	goto	i2u251_40
i2u251_41:
	goto	i2l3475
i2u251_40:
	line	1435
	
i2l3473:; BSR set to: 2

;usb_device.c: 1435: ep_data_out[SetupPkt.EPNum].bits.transfer_terminated = 0;
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	01h
	movlw	low(_ep_data_out)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_out)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlb	0	; () banked
	bcf	c:indf2,1
	line	1436
;usb_device.c: 1436: } else {
	goto	i2l3477
	
i2l834:; BSR set to: 0

	line	1437
	
i2l3475:
;usb_device.c: 1437: ep_data_in[SetupPkt.EPNum].bits.transfer_terminated = 0;
	movlb	2	; () banked
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	01h
	movlw	low(_ep_data_in)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_ep_data_in)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlb	0	; () banked
	bcf	c:indf2,1
	goto	i2l3477
	line	1438
	
i2l835:; BSR set to: 0

	line	1440
	
i2l3477:; BSR set to: 0

;usb_device.c: 1438: }
;usb_device.c: 1440: p->STAT.Val &= ~(0x80 | 0x40 | 0x04);
	movff	(c:USBStdFeatureReqHandler@p),fsr2l
	movff	(c:USBStdFeatureReqHandler@p+1),fsr2h
	movlw	03Bh
	andwf	indf2
	line	1442
	
i2l3479:; BSR set to: 0

;usb_device.c: 1442: USER_USB_CALLBACK_EVENT_HANDLER(EVENT_TRANSFER_TERMINATED,p,sizeof(p));
	movlw	high(05h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event+1)),c
	movlw	low(05h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@event)),c
		movff	(c:USBStdFeatureReqHandler@p),(c:USER_USB_CALLBACK_EVENT_HANDLER@pdata)
	movff	(c:USBStdFeatureReqHandler@p+1),(c:USER_USB_CALLBACK_EVENT_HANDLER@pdata+1)

	movlw	high(02h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size+1)),c
	movlw	low(02h)
	movwf	((c:USER_USB_CALLBACK_EVENT_HANDLER@size)),c
	call	_USER_USB_CALLBACK_EVENT_HANDLER	;wreg free
	line	1443
;usb_device.c: 1443: } else {
	goto	i2l3483
	
i2l831:
	line	1445
	
i2l3481:
;usb_device.c: 1445: p->STAT.Val &= ~(0x80 | 0x40 | 0x04);
	movff	(c:USBStdFeatureReqHandler@p),fsr2l
	movff	(c:USBStdFeatureReqHandler@p+1),fsr2h
	movlw	03Bh
	andwf	indf2
	goto	i2l3483
	line	1446
	
i2l836:
	line	1483
	
i2l3483:
;usb_device.c: 1446: }
;usb_device.c: 1483: pUEP = (unsigned char*)(&UEP0+SetupPkt.EPNum);
	movlb	2	; () banked
	movf	(0+(560+04h))&0ffh,w	;volatile
	andlw	(1<<4)-1
	movwf	(??_USBStdFeatureReqHandler+0+0)&0ffh,c
	movf	((??_USBStdFeatureReqHandler+0+0)),c,w
	mullw	01h
	movlw	low(3923)
	addwf	(prodl),c,w
	movwf	((c:USBStdFeatureReqHandler@pUEP)),c
	movlw	high(3923)
	addwfc	prod+1,w
	movwf	1+((c:USBStdFeatureReqHandler@pUEP)),c
	line	1485
	
i2l3485:; BSR set to: 2

;usb_device.c: 1485: *pUEP &= ~0x0001;
	movff	(c:USBStdFeatureReqHandler@pUEP),fsr2l
	movff	(c:USBStdFeatureReqHandler@pUEP+1),fsr2h
	movlw	0FEh
	andwf	indf2
	goto	i2l837
	line	1486
	
i2l828:; BSR set to: 2

	goto	i2l837
	line	1487
	
i2l817:; BSR set to: 2

	line	1488
	
i2l837:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBStdFeatureReqHandler
	__end_of_USBStdFeatureReqHandler:
	signat	_USBStdFeatureReqHandler,89
	global	_USER_USB_CALLBACK_EVENT_HANDLER

;; *************** function _USER_USB_CALLBACK_EVENT_HANDLER *****************
;; Defined at:
;;		line 290 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;  event           2   12[COMRAM] int 
;;  pdata           2   14[COMRAM] PTR void 
;;		 -> USTATcopy(1), USBActiveConfiguration(1), BDT(48), NULL(0), 
;;  size            2   16[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      enum E3305
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         6       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_USBCBCheckOtherReq
;;		_USBCBErrorHandler
;;		_USBCBInitEP
;;		_USBCBStdSetDscHandler
;;		_USBCBSuspend
;;		_USBCB_SOF_Handler
;;		i2_USBCBWakeFromSuspend
;; This function is called by:
;;		_USBDeviceTasks
;;		_USBStdSetCfgHandler
;;		_USBSuspend
;;		_USBWakeFromSuspend
;;		_USBCtrlTrfSetupHandler
;;		_USBCheckStdRequest
;;		_USBStdFeatureReqHandler
;; This function uses a non-reentrant model
;;
psect	text50,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	290
global __ptext50
__ptext50:
psect	text50
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	290
	global	__size_of_USER_USB_CALLBACK_EVENT_HANDLER
	__size_of_USER_USB_CALLBACK_EVENT_HANDLER	equ	__end_of_USER_USB_CALLBACK_EVENT_HANDLER-_USER_USB_CALLBACK_EVENT_HANDLER
	
_USER_USB_CALLBACK_EVENT_HANDLER:
;incstack = 0
	opt	stack 19
	line	292
	
i2l3213:
;usb_set.h: 292: switch( event )
	goto	i2l3231
	line	294
;usb_set.h: 293: {
;usb_set.h: 294: case EVENT_TRANSFER:
	
i2l375:
	line	296
;usb_set.h: 296: break;
	goto	i2l386
	line	297
;usb_set.h: 297: case EVENT_SOF:
	
i2l377:
	line	298
	
i2l3215:
;usb_set.h: 298: USBCB_SOF_Handler();
	call	_USBCB_SOF_Handler	;wreg free
	line	299
;usb_set.h: 299: break;
	goto	i2l386
	line	300
;usb_set.h: 300: case EVENT_SUSPEND:
	
i2l378:
	line	301
	
i2l3217:
;usb_set.h: 301: USBCBSuspend();
	call	_USBCBSuspend	;wreg free
	line	302
;usb_set.h: 302: break;
	goto	i2l386
	line	303
;usb_set.h: 303: case EVENT_RESUME:
	
i2l379:
	line	304
	
i2l3219:
;usb_set.h: 304: USBCBWakeFromSuspend();
	call	i2_USBCBWakeFromSuspend	;wreg free
	line	305
;usb_set.h: 305: break;
	goto	i2l386
	line	306
;usb_set.h: 306: case EVENT_CONFIGURED:
	
i2l380:
	line	307
	
i2l3221:
;usb_set.h: 307: USBCBInitEP();
	call	_USBCBInitEP	;wreg free
	line	308
;usb_set.h: 308: break;
	goto	i2l386
	line	309
;usb_set.h: 309: case EVENT_SET_DESCRIPTOR:
	
i2l381:
	line	310
	
i2l3223:
;usb_set.h: 310: USBCBStdSetDscHandler();
	call	_USBCBStdSetDscHandler	;wreg free
	line	311
;usb_set.h: 311: break;
	goto	i2l386
	line	312
;usb_set.h: 312: case EVENT_EP0_REQUEST:
	
i2l382:
	line	313
	
i2l3225:
;usb_set.h: 313: USBCBCheckOtherReq();
	call	_USBCBCheckOtherReq	;wreg free
	line	314
;usb_set.h: 314: break;
	goto	i2l386
	line	315
;usb_set.h: 315: case EVENT_BUS_ERROR:
	
i2l383:
	line	316
	
i2l3227:
;usb_set.h: 316: USBCBErrorHandler();
	call	_USBCBErrorHandler	;wreg free
	line	317
;usb_set.h: 317: break;
	goto	i2l386
	line	318
;usb_set.h: 318: case EVENT_TRANSFER_TERMINATED:
	
i2l384:
	line	322
;usb_set.h: 322: break;
	goto	i2l386
	line	323
;usb_set.h: 323: default:
	
i2l385:
	line	324
;usb_set.h: 324: break;
	goto	i2l386
	line	325
	
i2l3229:
;usb_set.h: 325: }
	goto	i2l386
	line	292
	
i2l374:
	
i2l3231:
	movff	(c:USER_USB_CALLBACK_EVENT_HANDLER@event),??_USER_USB_CALLBACK_EVENT_HANDLER+0+0
	movff	(c:USER_USB_CALLBACK_EVENT_HANDLER@event+1),??_USER_USB_CALLBACK_EVENT_HANDLER+0+0+1
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 2 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 127
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
;	Chosen strategy is simple_byte

	movf ??_USER_USB_CALLBACK_EVENT_HANDLER+0+1,c,w
	xorlw	0^0	; case 0
	skipnz
	goto	i2l5655
	xorlw	127^0	; case 127
	skipnz
	goto	i2l5657
	goto	i2l386
	
i2l5655:
; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 1 to 117
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
;	Chosen strategy is simple_byte

	movf ??_USER_USB_CALLBACK_EVENT_HANDLER+0+0,c,w
	xorlw	1^0	; case 1
	skipnz
	goto	i2l3221
	xorlw	2^1	; case 2
	skipnz
	goto	i2l3223
	xorlw	3^2	; case 3
	skipnz
	goto	i2l3225
	xorlw	5^3	; case 5
	skipnz
	goto	i2l386
	xorlw	114^5	; case 114
	skipnz
	goto	i2l386
	xorlw	115^114	; case 115
	skipnz
	goto	i2l3215
	xorlw	116^115	; case 116
	skipnz
	goto	i2l3219
	xorlw	117^116	; case 117
	skipnz
	goto	i2l3217
	goto	i2l386
	
i2l5657:
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 255 to 255
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
;	Chosen strategy is simple_byte

	movf ??_USER_USB_CALLBACK_EVENT_HANDLER+0+0,c,w
	xorlw	255^0	; case 255
	skipnz
	goto	i2l3227
	goto	i2l386

	line	325
	
i2l376:
	line	327
;usb_set.h: 326: return TRUE;
;	Return value of _USER_USB_CALLBACK_EVENT_HANDLER is never used
	
i2l386:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USER_USB_CALLBACK_EVENT_HANDLER
	__end_of_USER_USB_CALLBACK_EVENT_HANDLER:
	signat	_USER_USB_CALLBACK_EVENT_HANDLER,12409
	global	i2_USBCBWakeFromSuspend

;; *************** function i2_USBCBWakeFromSuspend *****************
;; Defined at:
;;		line 171 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function uses a non-reentrant model
;;
psect	text51,class=CODE,space=0,reloc=2,group=0
	line	171
global __ptext51
__ptext51:
psect	text51
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	171
	global	__size_ofi2_USBCBWakeFromSuspend
	__size_ofi2_USBCBWakeFromSuspend	equ	__end_ofi2_USBCBWakeFromSuspend-i2_USBCBWakeFromSuspend
	
i2_USBCBWakeFromSuspend:
;incstack = 0
	opt	stack 22
	line	175
	
i2l345:
	return	;funcret
	opt stack 0
GLOBAL	__end_ofi2_USBCBWakeFromSuspend
	__end_ofi2_USBCBWakeFromSuspend:
	signat	i2_USBCBWakeFromSuspend,89
	global	_USBCB_SOF_Handler

;; *************** function _USBCB_SOF_Handler *****************
;; Defined at:
;;		line 181 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function uses a non-reentrant model
;;
psect	text52,class=CODE,space=0,reloc=2,group=0
	line	181
global __ptext52
__ptext52:
psect	text52
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	181
	global	__size_of_USBCB_SOF_Handler
	__size_of_USBCB_SOF_Handler	equ	__end_of_USBCB_SOF_Handler-_USBCB_SOF_Handler
	
_USBCB_SOF_Handler:
;incstack = 0
	opt	stack 22
	line	185
	
i2l348:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCB_SOF_Handler
	__end_of_USBCB_SOF_Handler:
	signat	_USBCB_SOF_Handler,89
	global	_USBCBSuspend

;; *************** function _USBCBSuspend *****************
;; Defined at:
;;		line 161 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function uses a non-reentrant model
;;
psect	text53,class=CODE,space=0,reloc=2,group=0
	line	161
global __ptext53
__ptext53:
psect	text53
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	161
	global	__size_of_USBCBSuspend
	__size_of_USBCBSuspend	equ	__end_of_USBCBSuspend-_USBCBSuspend
	
_USBCBSuspend:
;incstack = 0
	opt	stack 22
	line	165
	
i2l342:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBSuspend
	__end_of_USBCBSuspend:
	signat	_USBCBSuspend,89
	global	_USBCBStdSetDscHandler

;; *************** function _USBCBStdSetDscHandler *****************
;; Defined at:
;;		line 213 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function uses a non-reentrant model
;;
psect	text54,class=CODE,space=0,reloc=2,group=0
	line	213
global __ptext54
__ptext54:
psect	text54
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	213
	global	__size_of_USBCBStdSetDscHandler
	__size_of_USBCBStdSetDscHandler	equ	__end_of_USBCBStdSetDscHandler-_USBCBStdSetDscHandler
	
_USBCBStdSetDscHandler:
;incstack = 0
	opt	stack 22
	line	217
	
i2l357:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBStdSetDscHandler
	__end_of_USBCBStdSetDscHandler:
	signat	_USBCBStdSetDscHandler,89
	global	_USBCBInitEP

;; *************** function _USBCBInitEP *****************
;; Defined at:
;;		line 225 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_CDCInitEP
;; This function is called by:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function uses a non-reentrant model
;;
psect	text55,class=CODE,space=0,reloc=2,group=0
	line	225
global __ptext55
__ptext55:
psect	text55
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	225
	global	__size_of_USBCBInitEP
	__size_of_USBCBInitEP	equ	__end_of_USBCBInitEP-_USBCBInitEP
	
_USBCBInitEP:
;incstack = 0
	opt	stack 19
	line	230
	
i2l3211:
;usb_set.h: 230: CDCInitEP();
	call	_CDCInitEP	;wreg free
	line	231
	
i2l360:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBInitEP
	__end_of_USBCBInitEP:
	signat	_USBCBInitEP,89
	global	_CDCInitEP

;; *************** function _CDCInitEP *****************
;; Defined at:
;;		line 216 in file "C:\pic\PIC18F\test02\usb_function_cdc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_USBEnableEndpoint
;;		i2_USBTransferOnePacket
;; This function is called by:
;;		_USBCBInitEP
;; This function uses a non-reentrant model
;;
psect	text56,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_function_cdc.c"
	line	216
global __ptext56
__ptext56:
psect	text56
	file	"C:\pic\PIC18F\test02\usb_function_cdc.c"
	line	216
	global	__size_of_CDCInitEP
	__size_of_CDCInitEP	equ	__end_of_CDCInitEP-_CDCInitEP
	
_CDCInitEP:
;incstack = 0
	opt	stack 19
	line	219
	
i2l3199:
;usb_function_cdc.c: 219: line_coding.dwDTERate.Val = 19200;
	movlw	low(04B00h)
	movlb	2	; () banked
	movwf	((648))&0ffh
	movlw	high(04B00h)
	movwf	((648+1))&0ffh
	movlw	low highword(04B00h)
	movwf	((648+2))&0ffh
	movlw	high highword(04B00h)
	movwf	((648+3))&0ffh
	line	220
;usb_function_cdc.c: 220: line_coding.bCharFormat = 0x00;
	movlw	low(0)
	movwf	(0+(648+04h))&0ffh
	line	221
;usb_function_cdc.c: 221: line_coding.bParityType = 0x00;
	movlw	low(0)
	movwf	(0+(648+05h))&0ffh
	line	222
;usb_function_cdc.c: 222: line_coding.bDataBits = 0x08;
	movlw	low(08h)
	movwf	(0+(648+06h))&0ffh
	line	224
;usb_function_cdc.c: 224: cdc_rx_len = 0;
	movlw	low(0)
	movlb	0	; () banked
	movwf	((_cdc_rx_len))&0ffh
	line	229
	
i2l3201:; BSR set to: 0

;usb_function_cdc.c: 229: USBEnableEndpoint(1,0x02|0x10|0x08);
	movlw	low(01Ah)
	movwf	((c:USBEnableEndpoint@options)),c
	movlw	(01h)&0ffh
	
	call	_USBEnableEndpoint
	line	233
	
i2l3203:
;usb_function_cdc.c: 233: USBEnableEndpoint(2,0x02|0x04|0x10|0x08);
	movlw	low(01Eh)
	movwf	((c:USBEnableEndpoint@options)),c
	movlw	(02h)&0ffh
	
	call	_USBEnableEndpoint
	line	235
	
i2l3205:
;usb_function_cdc.c: 235: CDCDataOutHandle = USBTransferOnePacket(2,0,(BYTE*)&cdc_data_rx,sizeof(cdc_data_rx));
	movlw	low(0)
	movwf	((c:i2USBTransferOnePacket@dir)),c
		movlw	low(640)
	movwf	((c:i2USBTransferOnePacket@data)),c
	movlw	high(640)
	movwf	((c:i2USBTransferOnePacket@data+1)),c

	movlw	low(08h)
	movwf	((c:i2USBTransferOnePacket@len)),c
	movlw	(02h)&0ffh
	
	call	i2_USBTransferOnePacket
	movff	0+?i2_USBTransferOnePacket,(_CDCDataOutHandle)
	movff	1+?i2_USBTransferOnePacket,(_CDCDataOutHandle+1)
	line	236
	
i2l3207:
;usb_function_cdc.c: 236: CDCDataInHandle = (0);
		movlw	low(0)
	movlb	0	; () banked
	movwf	((_CDCDataInHandle))&0ffh
	movlw	high(0)
	movwf	((_CDCDataInHandle+1))&0ffh

	line	262
	
i2l3209:; BSR set to: 0

;usb_function_cdc.c: 262: cdc_trf_state = 0;
	movlw	low(0)
	movwf	((_cdc_trf_state))&0ffh
	line	263
	
i2l73:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_CDCInitEP
	__end_of_CDCInitEP:
	signat	_CDCInitEP,89
	global	i2_USBTransferOnePacket

;; *************** function i2_USBTransferOnePacket *****************
;; Defined at:
;;		line 502 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;  ep              1    wreg     unsigned char 
;;  dir             1    0[COMRAM] unsigned char 
;;  data            2    1[COMRAM] PTR unsigned char 
;;		 -> cdc_data_tx(32), NULL(0), cdc_data_rx(8), 
;;  len             1    3[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ep              1    4[COMRAM] unsigned char 
;;  USBTransferO    2    5[COMRAM] PTR volatile struct __BD
;;		 -> BDT(48), NULL(0), 
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] PTR void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_CDCInitEP
;; This function uses a non-reentrant model
;;
psect	text57,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	502
global __ptext57
__ptext57:
psect	text57
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	502
	global	__size_ofi2_USBTransferOnePacket
	__size_ofi2_USBTransferOnePacket	equ	__end_ofi2_USBTransferOnePacket-i2_USBTransferOnePacket
	
i2_USBTransferOnePacket:; BSR set to: 0

;incstack = 0
	opt	stack 20
;i2USBTransferOnePacket@ep stored from wreg
	movwf	((c:i2USBTransferOnePacket@ep)),c
	line	507
	
i2l3171:
;usb_device.c: 504: volatile BDT_ENTRY* handle;
;usb_device.c: 507: if(dir != 0) {
	movf	((c:i2USBTransferOnePacket@dir)),c,w
	btfsc	status,2
	goto	i2u208_41
	goto	i2u208_40
i2u208_41:
	goto	i2l3175
i2u208_40:
	line	508
	
i2l3173:
;usb_device.c: 508: handle = pBDTEntryIn[ep];
	movf	((c:i2USBTransferOnePacket@ep)),c,w
	mullw	02h
	movlw	low(_pBDTEntryIn)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryIn)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:i2USBTransferOnePacket@handle)
	movff	postdec2,(c:i2USBTransferOnePacket@handle+1)
	line	509
;usb_device.c: 509: } else {
	goto	i2l3177
	
i2l650:
	line	510
	
i2l3175:
;usb_device.c: 510: handle = pBDTEntryOut[ep];
	movf	((c:i2USBTransferOnePacket@ep)),c,w
	mullw	02h
	movlw	low(_pBDTEntryOut)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryOut)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	postinc2,(c:i2USBTransferOnePacket@handle)
	movff	postdec2,(c:i2USBTransferOnePacket@handle+1)
	goto	i2l3177
	line	511
	
i2l651:
	line	512
	
i2l3177:
;usb_device.c: 511: }
;usb_device.c: 512: if (handle == 0) return 0 ;
	movf	((c:i2USBTransferOnePacket@handle)),c,w
iorwf	((c:i2USBTransferOnePacket@handle+1)),c,w
	btfss	status,2
	goto	i2u209_41
	goto	i2u209_40

i2u209_41:
	goto	i2l3183
i2u209_40:
	
i2l3179:
		movlw	low(0)
	movwf	((c:?i2_USBTransferOnePacket)),c
	movlw	high(0)
	movwf	((c:?i2_USBTransferOnePacket+1)),c

	goto	i2l653
	
i2l3181:
	goto	i2l653
	
i2l652:
	line	522
	
i2l3183:
;usb_device.c: 522: handle->ADR = ((WORD)(data));
	lfsr	2,02h
	movf	((c:i2USBTransferOnePacket@handle)),c,w
	addwf	fsr2l
	movf	((c:i2USBTransferOnePacket@handle+1)),c,w
	addwfc	fsr2h
	movff	(c:i2USBTransferOnePacket@data),postinc2
	movff	(c:i2USBTransferOnePacket@data+1),postdec2
	line	523
;usb_device.c: 523: handle->CNT = len;
	lfsr	2,01h
	movf	((c:i2USBTransferOnePacket@handle)),c,w
	addwf	fsr2l
	movf	((c:i2USBTransferOnePacket@handle+1)),c,w
	addwfc	fsr2h
	movff	(c:i2USBTransferOnePacket@len),indf2

	line	524
	
i2l3185:
;usb_device.c: 524: handle->STAT.Val &= 0x40;
	movff	(c:i2USBTransferOnePacket@handle),fsr2l
	movff	(c:i2USBTransferOnePacket@handle+1),fsr2h
	movlw	040h
	andwf	indf2
	line	525
	
i2l3187:
;usb_device.c: 525: handle->STAT.Val |= 0x80 | (0x08 & 0x08);
	movff	(c:i2USBTransferOnePacket@handle),fsr2l
	movff	(c:i2USBTransferOnePacket@handle+1),fsr2h
	movlw	088h
	iorwf	indf2
	line	528
	
i2l3189:
;usb_device.c: 528: if(dir != 0) {
	movf	((c:i2USBTransferOnePacket@dir)),c,w
	btfsc	status,2
	goto	i2u210_41
	goto	i2u210_40
i2u210_41:
	goto	i2l3193
i2u210_40:
	line	530
	
i2l3191:
;usb_device.c: 530: ((BYTE_VAL*)&pBDTEntryIn[ep])->Val ^= 0x0004;;
	movf	((c:i2USBTransferOnePacket@ep)),c,w
	mullw	02h
	movlw	low(_pBDTEntryIn)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryIn)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	04h
	xorwf	indf2
	line	531
;usb_device.c: 531: } else {
	goto	i2l3195
	
i2l654:
	line	533
	
i2l3193:
;usb_device.c: 533: ((BYTE_VAL*)&pBDTEntryOut[ep])->Val ^= 0x0004;;
	movf	((c:i2USBTransferOnePacket@ep)),c,w
	mullw	02h
	movlw	low(_pBDTEntryOut)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryOut)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movlw	04h
	xorwf	indf2
	goto	i2l3195
	line	534
	
i2l655:
	line	535
	
i2l3195:
;usb_device.c: 534: }
;usb_device.c: 535: return (void*)handle;
		movff	(c:i2USBTransferOnePacket@handle),(c:?i2_USBTransferOnePacket)
	movff	(c:i2USBTransferOnePacket@handle+1),(c:?i2_USBTransferOnePacket+1)

	goto	i2l653
	
i2l3197:
	line	536
	
i2l653:
	return	;funcret
	opt stack 0
GLOBAL	__end_ofi2_USBTransferOnePacket
	__end_ofi2_USBTransferOnePacket:
	signat	i2_USBTransferOnePacket,90
	global	_USBEnableEndpoint

;; *************** function _USBEnableEndpoint *****************
;; Defined at:
;;		line 467 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;  ep              1    wreg     unsigned char 
;;  options         1    8[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ep              1   11[COMRAM] unsigned char 
;;  p               2    9[COMRAM] PTR unsigned char 
;;		 -> UEP0(1), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         1       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_USBConfigureEndpoint
;; This function is called by:
;;		_CDCInitEP
;; This function uses a non-reentrant model
;;
psect	text58,class=CODE,space=0,reloc=2,group=0
	line	467
global __ptext58
__ptext58:
psect	text58
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	467
	global	__size_of_USBEnableEndpoint
	__size_of_USBEnableEndpoint	equ	__end_of_USBEnableEndpoint-_USBEnableEndpoint
	
_USBEnableEndpoint:
;incstack = 0
	opt	stack 19
;USBEnableEndpoint@ep stored from wreg
	movwf	((c:USBEnableEndpoint@ep)),c
	line	472
	
i2l3159:
;usb_device.c: 469: unsigned char* p;
;usb_device.c: 472: if(options & 0x04) {
	
	btfss	((c:USBEnableEndpoint@options)),c,(2)&7
	goto	i2u206_41
	goto	i2u206_40
i2u206_41:
	goto	i2l3163
i2u206_40:
	line	475
	
i2l3161:
;usb_device.c: 475: USBConfigureEndpoint(ep, 0);
	movlw	low(0)
	movwf	((c:USBConfigureEndpoint@direction)),c
	movf	((c:USBEnableEndpoint@ep)),c,w
	
	call	_USBConfigureEndpoint
	goto	i2l3163
	line	476
	
i2l645:
	line	478
	
i2l3163:
;usb_device.c: 476: }
;usb_device.c: 478: if(options & 0x02) {
	
	btfss	((c:USBEnableEndpoint@options)),c,(1)&7
	goto	i2u207_41
	goto	i2u207_40
i2u207_41:
	goto	i2l3167
i2u207_40:
	line	481
	
i2l3165:
;usb_device.c: 481: USBConfigureEndpoint(ep, 1);
	movlw	low(01h)
	movwf	((c:USBConfigureEndpoint@direction)),c
	movf	((c:USBEnableEndpoint@ep)),c,w
	
	call	_USBConfigureEndpoint
	goto	i2l3167
	line	482
	
i2l646:
	line	485
	
i2l3167:
;usb_device.c: 482: }
;usb_device.c: 485: p = (unsigned char*)(&UEP0+ep);
	movf	((c:USBEnableEndpoint@ep)),c,w
	mullw	01h
	movlw	low(3923)
	addwf	(prodl),c,w
	movwf	((c:USBEnableEndpoint@p)),c
	movlw	high(3923)
	addwfc	prod+1,w
	movwf	1+((c:USBEnableEndpoint@p)),c
	line	486
	
i2l3169:
;usb_device.c: 486: *p = options;
	movff	(c:USBEnableEndpoint@p),fsr2l
	movff	(c:USBEnableEndpoint@p+1),fsr2h
	movff	(c:USBEnableEndpoint@options),indf2

	line	487
	
i2l647:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBEnableEndpoint
	__end_of_USBEnableEndpoint:
	signat	_USBEnableEndpoint,8313
	global	_USBConfigureEndpoint

;; *************** function _USBConfigureEndpoint *****************
;; Defined at:
;;		line 684 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;  EPNum           1    wreg     unsigned char 
;;  direction       1    0[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EPNum           1    5[COMRAM] unsigned char 
;;  handle          2    6[COMRAM] PTR volatile struct __BD
;;		 -> BDT(48), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, prodl, prodh
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         1       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBEnableEndpoint
;; This function uses a non-reentrant model
;;
psect	text59,class=CODE,space=0,reloc=2,group=0
	line	684
global __ptext59
__ptext59:
psect	text59
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	684
	global	__size_of_USBConfigureEndpoint
	__size_of_USBConfigureEndpoint	equ	__end_of_USBConfigureEndpoint-_USBConfigureEndpoint
	
_USBConfigureEndpoint:
;incstack = 0
	opt	stack 19
;USBConfigureEndpoint@EPNum stored from wreg
	movwf	((c:USBConfigureEndpoint@EPNum)),c
	line	689
	
i2l3143:
;usb_device.c: 686: volatile BDT_ENTRY* handle;
;usb_device.c: 689: handle = (volatile BDT_ENTRY*)&BDT[0];
		movlw	low(512)
	movwf	((c:USBConfigureEndpoint@handle)),c
	movlw	high(512)
	movwf	((c:USBConfigureEndpoint@handle+1)),c

	line	691
	
i2l3145:
;usb_device.c: 691: handle += (4*EPNum+2*direction+0u);
	movf	((c:USBConfigureEndpoint@direction)),c,w
	movwf	(??_USBConfigureEndpoint+0+0)&0ffh,c
	clrf	(??_USBConfigureEndpoint+0+0+1)&0ffh,c

	bcf	status,0
	rlcf	(??_USBConfigureEndpoint+0+0),c,f
	rlcf	(??_USBConfigureEndpoint+0+1),c,f
	movf	((c:USBConfigureEndpoint@EPNum)),c,w
	movwf	(??_USBConfigureEndpoint+2+0)&0ffh,c
	clrf	(??_USBConfigureEndpoint+2+0+1)&0ffh,c

	bcf	status,0
	rlcf	(??_USBConfigureEndpoint+2+0),c
	rlcf	(??_USBConfigureEndpoint+2+1),c
	bcf	status,0
	rlcf	(??_USBConfigureEndpoint+2+0),c
	rlcf	(??_USBConfigureEndpoint+2+1),c
	movf	(??_USBConfigureEndpoint+0+0),c,w
	addwf	(??_USBConfigureEndpoint+2+0),c
	movf	(??_USBConfigureEndpoint+0+1),c,w
	addwfc	(??_USBConfigureEndpoint+2+1),c
	bcf	status,0
	rlcf	(??_USBConfigureEndpoint+2+0),c
	rlcf	(??_USBConfigureEndpoint+2+1),c
	bcf	status,0
	rlcf	(??_USBConfigureEndpoint+2+0),c
	rlcf	(??_USBConfigureEndpoint+2+1),c
	movf	(??_USBConfigureEndpoint+2+0),c,w
	addwf	((c:USBConfigureEndpoint@handle)),c
	movf	(??_USBConfigureEndpoint+2+1),c,w
	addwfc	((c:USBConfigureEndpoint@handle+1)),c

	line	694
	
i2l3147:
;usb_device.c: 694: handle->STAT.UOWN = 0;
	movff	(c:USBConfigureEndpoint@handle),fsr2l
	movff	(c:USBConfigureEndpoint@handle+1),fsr2h
	bcf	c:indf2,7
	line	697
	
i2l3149:
;usb_device.c: 697: if(direction == 0) {
	movf	((c:USBConfigureEndpoint@direction)),c,w
	btfss	status,2
	goto	i2u205_41
	goto	i2u205_40
i2u205_41:
	goto	i2l3153
i2u205_40:
	line	698
	
i2l3151:
;usb_device.c: 698: pBDTEntryOut[EPNum] = handle;
	movf	((c:USBConfigureEndpoint@EPNum)),c,w
	mullw	02h
	movlw	low(_pBDTEntryOut)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryOut)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:USBConfigureEndpoint@handle),postinc2
	movff	(c:USBConfigureEndpoint@handle+1),postdec2
	line	699
;usb_device.c: 699: } else {
	goto	i2l3155
	
i2l683:
	line	700
	
i2l3153:
;usb_device.c: 700: pBDTEntryIn[EPNum] = handle;
	movf	((c:USBConfigureEndpoint@EPNum)),c,w
	mullw	02h
	movlw	low(_pBDTEntryIn)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(_pBDTEntryIn)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(c:USBConfigureEndpoint@handle),postinc2
	movff	(c:USBConfigureEndpoint@handle+1),postdec2
	goto	i2l3155
	line	701
	
i2l684:
	line	705
	
i2l3155:
;usb_device.c: 701: }
;usb_device.c: 705: handle->STAT.DTS = 0;
	movff	(c:USBConfigureEndpoint@handle),fsr2l
	movff	(c:USBConfigureEndpoint@handle+1),fsr2h
	bcf	c:indf2,6
	line	706
	
i2l3157:
;usb_device.c: 706: (handle+1)->STAT.DTS = 1;
	lfsr	2,04h
	movf	((c:USBConfigureEndpoint@handle)),c,w
	addwf	fsr2l
	movf	((c:USBConfigureEndpoint@handle+1)),c,w
	addwfc	fsr2h
	bsf	c:indf2,6
	line	719
	
i2l685:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBConfigureEndpoint
	__end_of_USBConfigureEndpoint:
	signat	_USBConfigureEndpoint,8313
	global	_USBCBErrorHandler

;; *************** function _USBCBErrorHandler *****************
;; Defined at:
;;		line 192 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function uses a non-reentrant model
;;
psect	text60,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	192
global __ptext60
__ptext60:
psect	text60
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	192
	global	__size_of_USBCBErrorHandler
	__size_of_USBCBErrorHandler	equ	__end_of_USBCBErrorHandler-_USBCBErrorHandler
	
_USBCBErrorHandler:
;incstack = 0
	opt	stack 22
	line	196
	
i2l351:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBErrorHandler
	__end_of_USBCBErrorHandler:
	signat	_USBCBErrorHandler,89
	global	_USBCBCheckOtherReq

;; *************** function _USBCBCheckOtherReq *****************
;; Defined at:
;;		line 201 in file "C:\pic\PIC18F\test02\usb_set.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USER_USB_CALLBACK_EVENT_HANDLER
;; This function uses a non-reentrant model
;;
psect	text61,class=CODE,space=0,reloc=2,group=0
	line	201
global __ptext61
__ptext61:
psect	text61
	file	"C:\pic\PIC18F\test02\usb_set.h"
	line	201
	global	__size_of_USBCBCheckOtherReq
	__size_of_USBCBCheckOtherReq	equ	__end_of_USBCBCheckOtherReq-_USBCBCheckOtherReq
	
_USBCBCheckOtherReq:
;incstack = 0
	opt	stack 22
	line	207
	
i2l354:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCBCheckOtherReq
	__end_of_USBCBCheckOtherReq:
	signat	_USBCBCheckOtherReq,89
	global	_USBCtrlTrfOutHandler

;; *************** function _USBCtrlTrfOutHandler *****************
;; Defined at:
;;		line 1196 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_USBCtrlTrfRxService
;; This function is called by:
;;		_USBCtrlEPService
;; This function uses a non-reentrant model
;;
psect	text62,class=CODE,space=0,reloc=2,group=0
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1196
global __ptext62
__ptext62:
psect	text62
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1196
	global	__size_of_USBCtrlTrfOutHandler
	__size_of_USBCtrlTrfOutHandler	equ	__end_of_USBCtrlTrfOutHandler-_USBCtrlTrfOutHandler
	
_USBCtrlTrfOutHandler:
;incstack = 0
	opt	stack 20
	line	1198
	
i2l3661:
;usb_device.c: 1198: if(controlTransferState == 2) {
		movlw	2
	xorwf	((c:_controlTransferState)),c,w	;volatile
	btfss	status,2
	goto	i2u271_41
	goto	i2u271_40

i2u271_41:
	goto	i2l3665
i2u271_40:
	line	1202
	
i2l3663:
;usb_device.c: 1202: USBCtrlTrfRxService();
	call	_USBCtrlTrfRxService	;wreg free
	line	1203
;usb_device.c: 1203: } else {
	goto	i2l779
	
i2l775:
	line	1208
	
i2l3665:
;usb_device.c: 1208: controlTransferState = 0;
	movlw	low(0)
	movwf	((c:_controlTransferState)),c	;volatile
	line	1210
;usb_device.c: 1210: if(BothEP0OutUOWNsSet == FALSE) {
	movf	((c:_BothEP0OutUOWNsSet)),c,w	;volatile
	btfss	status,2
	goto	i2u272_41
	goto	i2u272_40
i2u272_41:
	goto	i2l3671
i2u272_40:
	line	1212
	
i2l3667:
;usb_device.c: 1212: pBDTEntryEP0OutNext->CNT = 8;
	lfsr	2,01h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(08h)
	movwf	indf2
	line	1213
;usb_device.c: 1213: pBDTEntryEP0OutNext->ADR = ((WORD)(&SetupPkt));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(0230h)
	movwf	postinc2,c
	movlw	high(0230h)
	movwf	postdec2,c
	line	1214
	
i2l3669:
;usb_device.c: 1214: pBDTEntryEP0OutNext->STAT.Val = 0x80|0x00|(0x08 & 0x08)|0x04;
	movff	(c:_pBDTEntryEP0OutNext),fsr2l
	movff	(c:_pBDTEntryEP0OutNext+1),fsr2h
	movlw	low(08Ch)
	movwf	indf2
	line	1215
;usb_device.c: 1215: } else {
	goto	i2l779
	
i2l777:
	line	1216
	
i2l3671:
;usb_device.c: 1216: BothEP0OutUOWNsSet = FALSE;
	movlw	low(0)
	movwf	((c:_BothEP0OutUOWNsSet)),c	;volatile
	goto	i2l779
	line	1217
	
i2l778:
	goto	i2l779
	line	1218
	
i2l776:
	line	1219
	
i2l779:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlTrfOutHandler
	__end_of_USBCtrlTrfOutHandler:
	signat	_USBCtrlTrfOutHandler,89
	global	_USBCtrlTrfRxService

;; *************** function _USBCtrlTrfRxService *****************
;; Defined at:
;;		line 863 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  byteToRead      1    3[COMRAM] unsigned char 
;;  i               1    2[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, prodl, prodh, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_USBCtrlEPAllowStatusStage
;; This function is called by:
;;		_USBCtrlTrfOutHandler
;; This function uses a non-reentrant model
;;
psect	text63,class=CODE,space=0,reloc=2,group=0
	line	863
global __ptext63
__ptext63:
psect	text63
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	863
	global	__size_of_USBCtrlTrfRxService
	__size_of_USBCtrlTrfRxService	equ	__end_of_USBCtrlTrfRxService-_USBCtrlTrfRxService
	
_USBCtrlTrfRxService:
;incstack = 0
	opt	stack 20
	line	869
	
i2l3537:
;usb_device.c: 865: BYTE byteToRead;
;usb_device.c: 866: BYTE i;
;usb_device.c: 869: byteToRead = pBDTEntryEP0OutCurrent->CNT;
	lfsr	2,01h
	movf	((c:_pBDTEntryEP0OutCurrent)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutCurrent+1)),c,w
	addwfc	fsr2h
	movf	indf2,w
	movwf	((c:USBCtrlTrfRxService@byteToRead)),c
	line	873
	
i2l3539:
;usb_device.c: 873: if(byteToRead > outPipes[0].wCount.Val) {
	movf	((c:USBCtrlTrfRxService@byteToRead)),c,w
	movlb	0	; () banked
	subwf	(0+(_outPipes+04h))&0ffh,w	;volatile
	movlw	0
	subwfb	(1+(_outPipes+04h))&0ffh,w	;volatile
	btfsc	status,0
	goto	i2u261_41
	goto	i2u261_40
i2u261_41:
	goto	i2l3543
i2u261_40:
	line	874
	
i2l3541:; BSR set to: 0

;usb_device.c: 874: byteToRead = outPipes[0].wCount.Val;
	movff	0+(_outPipes+04h),(c:USBCtrlTrfRxService@byteToRead)	;volatile
	goto	i2l3543
	line	875
	
i2l716:; BSR set to: 0

	line	877
	
i2l3543:; BSR set to: 0

;usb_device.c: 875: }
;usb_device.c: 877: outPipes[0].wCount.Val = outPipes[0].wCount.Val - byteToRead;
	movf	((c:USBCtrlTrfRxService@byteToRead)),c,w
	movwf	(??_USBCtrlTrfRxService+0+0)&0ffh,c
	clrf	(??_USBCtrlTrfRxService+0+0+1)&0ffh,c

	comf	(??_USBCtrlTrfRxService+0+0),c
	comf	(??_USBCtrlTrfRxService+0+1),c
	infsnz	(??_USBCtrlTrfRxService+0+0),c
	incf	(??_USBCtrlTrfRxService+0+1),c
	movf	(0+(_outPipes+04h))&0ffh,w	;volatile
	addwf	(??_USBCtrlTrfRxService+0+0),c,w
	movwf	(0+(_outPipes+04h))&0ffh	;volatile
	movf	(1+(_outPipes+04h))&0ffh,w	;volatile
	addwfc	(??_USBCtrlTrfRxService+0+1),c,w
	movwf	1+(0+(_outPipes+04h))&0ffh	;volatile
	line	880
	
i2l3545:; BSR set to: 0

;usb_device.c: 880: for(i=0;i<byteToRead;i++) {
	movlw	low(0)
	movwf	((c:USBCtrlTrfRxService@i)),c
	goto	i2l3553
	
i2l718:; BSR set to: 0

	line	881
	
i2l3547:; BSR set to: 0

;usb_device.c: 881: *outPipes[0].pDst.bRam++ = CtrlTrfData[i];
	movf	((c:USBCtrlTrfRxService@i)),c,w
	mullw	01h
	movlw	low(568)
	addwf	(prodl),c,w
	movwf	c:fsr2l
	movlw	high(568)
	addwfc	prod+1,w
	movwf	1+c:fsr2l
	movff	(_outPipes),fsr1l	;volatile
	movff	(_outPipes+1),fsr1h	;volatile
	movff	indf2,indf1
	
i2l3549:; BSR set to: 0

	infsnz	((_outPipes))&0ffh	;volatile
	incf	((_outPipes+1))&0ffh	;volatile
	line	880
	
i2l3551:; BSR set to: 0

	incf	((c:USBCtrlTrfRxService@i)),c
	goto	i2l3553
	
i2l717:; BSR set to: 0

	
i2l3553:; BSR set to: 0

		movf	((c:USBCtrlTrfRxService@byteToRead)),c,w
	subwf	((c:USBCtrlTrfRxService@i)),c,w
	btfss	status,0
	goto	i2u262_41
	goto	i2u262_40

i2u262_41:
	goto	i2l3547
i2u262_40:
	goto	i2l3555
	
i2l719:; BSR set to: 0

	line	884
	
i2l3555:; BSR set to: 0

;usb_device.c: 882: }
;usb_device.c: 884: if(outPipes[0].wCount.Val > 0) {
	movf	(0+(_outPipes+04h))&0ffh,w	;volatile
iorwf	(1+(_outPipes+04h))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u263_41
	goto	i2u263_40

i2u263_41:
	goto	i2l3565
i2u263_40:
	line	887
	
i2l3557:; BSR set to: 0

;usb_device.c: 887: pBDTEntryEP0OutNext->CNT = 8;
	lfsr	2,01h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(08h)
	movwf	indf2
	line	888
;usb_device.c: 888: pBDTEntryEP0OutNext->ADR = ((WORD)(&CtrlTrfData));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(0238h)
	movwf	postinc2,c
	movlw	high(0238h)
	movwf	postdec2,c
	line	889
	
i2l3559:; BSR set to: 0

;usb_device.c: 889: if(pBDTEntryEP0OutCurrent->STAT.DTS == 0) {
	movff	(c:_pBDTEntryEP0OutCurrent),fsr2l
	movff	(c:_pBDTEntryEP0OutCurrent+1),fsr2h
	btfsc	c:indf2,6
	goto	i2u264_41
	goto	i2u264_40
i2u264_41:
	goto	i2l3563
i2u264_40:
	line	890
	
i2l3561:; BSR set to: 0

;usb_device.c: 890: pBDTEntryEP0OutNext->STAT.Val = 0x80|0x40|(0x08 & 0x08);
	movff	(c:_pBDTEntryEP0OutNext),fsr2l
	movff	(c:_pBDTEntryEP0OutNext+1),fsr2h
	movlw	low(0C8h)
	movwf	indf2
	line	891
;usb_device.c: 891: } else {
	goto	i2l726
	
i2l721:; BSR set to: 0

	line	892
	
i2l3563:; BSR set to: 0

;usb_device.c: 892: pBDTEntryEP0OutNext->STAT.Val = 0x80|0x00|(0x08 & 0x08);
	movff	(c:_pBDTEntryEP0OutNext),fsr2l
	movff	(c:_pBDTEntryEP0OutNext+1),fsr2h
	movlw	low(088h)
	movwf	indf2
	goto	i2l726
	line	893
	
i2l722:; BSR set to: 0

	line	894
;usb_device.c: 893: }
;usb_device.c: 894: } else {
	goto	i2l726
	
i2l720:; BSR set to: 0

	line	897
	
i2l3565:; BSR set to: 0

;usb_device.c: 897: pBDTEntryEP0OutNext->CNT = 8;
	lfsr	2,01h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(08h)
	movwf	indf2
	line	898
;usb_device.c: 898: pBDTEntryEP0OutNext->ADR = ((WORD)(&SetupPkt));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(0230h)
	movwf	postinc2,c
	movlw	high(0230h)
	movwf	postdec2,c
	line	900
	
i2l3567:; BSR set to: 0

;usb_device.c: 900: pBDTEntryEP0OutNext->STAT.Val = 0x80|0x04;
	movff	(c:_pBDTEntryEP0OutNext),fsr2l
	movff	(c:_pBDTEntryEP0OutNext+1),fsr2h
	movlw	low(084h)
	movwf	indf2
	line	903
	
i2l3569:; BSR set to: 0

;usb_device.c: 909: outPipes[0].pFunc();
	line	914
	
i2l724:; BSR set to: 0

	line	915
;usb_device.c: 914: }
;usb_device.c: 915: outPipes[0].info.bits.busy = 0;
	bcf	(0+(_outPipes+03h))&0ffh,7	;volatile
	line	920
	
i2l3571:; BSR set to: 0

;usb_device.c: 920: if(USBDeferStatusStagePacket == FALSE) {
	movf	((c:_USBDeferStatusStagePacket)),c,w	;volatile
	btfss	status,2
	goto	i2u265_41
	goto	i2u265_40
i2u265_41:
	goto	i2l726
i2u265_40:
	line	921
	
i2l3573:; BSR set to: 0

;usb_device.c: 921: USBCtrlEPAllowStatusStage();
	call	_USBCtrlEPAllowStatusStage	;wreg free
	goto	i2l726
	line	922
	
i2l725:
	goto	i2l726
	line	923
	
i2l723:
	line	924
	
i2l726:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlTrfRxService
	__end_of_USBCtrlTrfRxService:
	signat	_USBCtrlTrfRxService,89
	global	_USBCtrlEPAllowStatusStage

;; *************** function _USBCtrlEPAllowStatusStage *****************
;; Defined at:
;;		line 602 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBDeviceTasks
;;		_USBCtrlEPServiceComplete
;;		_USBCtrlTrfRxService
;; This function uses a non-reentrant model
;;
psect	text64,class=CODE,space=0,reloc=2,group=0
	line	602
global __ptext64
__ptext64:
psect	text64
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	602
	global	__size_of_USBCtrlEPAllowStatusStage
	__size_of_USBCtrlEPAllowStatusStage	equ	__end_of_USBCtrlEPAllowStatusStage-_USBCtrlEPAllowStatusStage
	
_USBCtrlEPAllowStatusStage:
;incstack = 0
	opt	stack 20
	line	609
	
i2l3293:
;usb_device.c: 609: if(USBStatusStageEnabledFlag1 == FALSE) {
	movf	((c:_USBStatusStageEnabledFlag1)),c,w	;volatile
	btfss	status,2
	goto	i2u220_41
	goto	i2u220_40
i2u220_41:
	goto	i2l674
i2u220_40:
	line	610
	
i2l3295:
;usb_device.c: 610: USBStatusStageEnabledFlag1 = TRUE;
	movlw	low(01h)
	movwf	((c:_USBStatusStageEnabledFlag1)),c	;volatile
	line	611
;usb_device.c: 611: if(USBStatusStageEnabledFlag2 == FALSE) {
	movf	((c:_USBStatusStageEnabledFlag2)),c,w	;volatile
	btfss	status,2
	goto	i2u221_41
	goto	i2u221_40
i2u221_41:
	goto	i2l674
i2u221_40:
	line	612
	
i2l3297:
;usb_device.c: 612: USBStatusStageEnabledFlag2 = TRUE;
	movlw	low(01h)
	movwf	((c:_USBStatusStageEnabledFlag2)),c	;volatile
	line	615
	
i2l3299:
;usb_device.c: 615: if(controlTransferState == 2) {
		movlw	2
	xorwf	((c:_controlTransferState)),c,w	;volatile
	btfss	status,2
	goto	i2u222_41
	goto	i2u222_40

i2u222_41:
	goto	i2l3305
i2u222_40:
	line	616
	
i2l3301:
;usb_device.c: 616: pBDTEntryIn[0]->CNT = 0;
	movlb	0	; () banked
	lfsr	2,01h
	movf	((_pBDTEntryIn))&0ffh,w
	addwf	fsr2l
	movf	((_pBDTEntryIn+1))&0ffh,w
	addwfc	fsr2h
	movlw	low(0)
	movwf	indf2
	line	617
	
i2l3303:; BSR set to: 0

;usb_device.c: 617: pBDTEntryIn[0]->STAT.Val = 0x80|0x40|(0x08 & 0x08);
	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlw	low(0C8h)
	movwf	indf2
	line	618
;usb_device.c: 618: } else if(controlTransferState == 1) {
	goto	i2l674
	
i2l671:; BSR set to: 0

	
i2l3305:
		decf	((c:_controlTransferState)),c,w	;volatile
	btfss	status,2
	goto	i2u223_41
	goto	i2u223_40

i2u223_41:
	goto	i2l674
i2u223_40:
	line	619
	
i2l3307:
;usb_device.c: 619: BothEP0OutUOWNsSet = FALSE;
	movlw	low(0)
	movwf	((c:_BothEP0OutUOWNsSet)),c	;volatile
	line	623
	
i2l3309:
;usb_device.c: 623: pBDTEntryEP0OutCurrent->CNT = 8;
	lfsr	2,01h
	movf	((c:_pBDTEntryEP0OutCurrent)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutCurrent+1)),c,w
	addwfc	fsr2h
	movlw	low(08h)
	movwf	indf2
	line	624
	
i2l3311:
;usb_device.c: 624: pBDTEntryEP0OutCurrent->ADR = ((WORD)(&SetupPkt));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutCurrent)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutCurrent+1)),c,w
	addwfc	fsr2h
	movlw	low(0230h)
	movwf	postinc2,c
	movlw	high(0230h)
	movwf	postdec2,c
	line	625
	
i2l3313:
;usb_device.c: 625: pBDTEntryEP0OutCurrent->STAT.Val = 0x80|0x04;
	movff	(c:_pBDTEntryEP0OutCurrent),fsr2l
	movff	(c:_pBDTEntryEP0OutCurrent+1),fsr2h
	movlw	low(084h)
	movwf	indf2
	line	626
	
i2l3315:
;usb_device.c: 626: BothEP0OutUOWNsSet = TRUE;
	movlw	low(01h)
	movwf	((c:_BothEP0OutUOWNsSet)),c	;volatile
	line	630
	
i2l3317:
;usb_device.c: 630: pBDTEntryEP0OutNext->CNT = 8;
	lfsr	2,01h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(08h)
	movwf	indf2
	line	631
	
i2l3319:
;usb_device.c: 631: pBDTEntryEP0OutNext->ADR = ((WORD)(&SetupPkt));
	lfsr	2,02h
	movf	((c:_pBDTEntryEP0OutNext)),c,w
	addwf	fsr2l
	movf	((c:_pBDTEntryEP0OutNext+1)),c,w
	addwfc	fsr2h
	movlw	low(0230h)
	movwf	postinc2,c
	movlw	high(0230h)
	movwf	postdec2,c
	line	632
;usb_device.c: 632: pBDTEntryEP0OutNext->STAT.Val = 0x80;
	movff	(c:_pBDTEntryEP0OutNext),fsr2l
	movff	(c:_pBDTEntryEP0OutNext+1),fsr2h
	movlw	low(080h)
	movwf	indf2
	goto	i2l674
	line	633
	
i2l673:
	goto	i2l674
	line	634
	
i2l672:
	goto	i2l674
	
i2l670:
	goto	i2l674
	line	635
	
i2l669:
	line	636
	
i2l674:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlEPAllowStatusStage
	__end_of_USBCtrlEPAllowStatusStage:
	signat	_USBCtrlEPAllowStatusStage,89
	global	_USBCtrlTrfInHandler

;; *************** function _USBCtrlTrfInHandler *****************
;; Defined at:
;;		line 1234 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  lastDTS         1    3[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_USBCtrlTrfTxService
;; This function is called by:
;;		_USBCtrlEPService
;; This function uses a non-reentrant model
;;
psect	text65,class=CODE,space=0,reloc=2,group=0
	line	1234
global __ptext65
__ptext65:
psect	text65
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	1234
	global	__size_of_USBCtrlTrfInHandler
	__size_of_USBCtrlTrfInHandler	equ	__end_of_USBCtrlTrfInHandler-_USBCtrlTrfInHandler
	
_USBCtrlTrfInHandler:
;incstack = 0
	opt	stack 21
	line	1239
	
i2l3673:
;usb_device.c: 1236: BYTE lastDTS;
;usb_device.c: 1239: lastDTS = pBDTEntryIn[0]->STAT.DTS;
	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlb	0	; () banked
	movlw	0
	btfsc	c:indf2,6
	movlw	1
	movwf	((c:USBCtrlTrfInHandler@lastDTS)),c
	line	1242
	
i2l3675:; BSR set to: 0

;usb_device.c: 1242: ((BYTE_VAL*)&pBDTEntryIn[0])->Val ^= 0x0004;
	movlw	(04h)&0ffh
	xorwf	((_pBDTEntryIn))&0ffh
	line	1245
	
i2l3677:; BSR set to: 0

;usb_device.c: 1245: if(USBDeviceState == ADR_PENDING_STATE) {
		movlw	8
	xorwf	((_USBDeviceState))&0ffh,w	;volatile
	btfss	status,2
	goto	i2u273_41
	goto	i2u273_40

i2u273_41:
	goto	i2l3687
i2u273_40:
	line	1246
	
i2l3679:; BSR set to: 0

;usb_device.c: 1246: UADDR = SetupPkt.bDevADR.Val;
	movff	0+(560+02h),(3932)	;volatile
	line	1247
	
i2l3681:; BSR set to: 0

;usb_device.c: 1247: if(UADDR != 0u) {
	movlb	15	; () banked
	movf	((3932))&0ffh,w	;volatile
	btfsc	status,2
	goto	i2u274_41
	goto	i2u274_40
i2u274_41:
	goto	i2l3685
i2u274_40:
	line	1248
	
i2l3683:; BSR set to: 15

;usb_device.c: 1248: USBDeviceState=ADDRESS_STATE;
	movlw	low(010h)
	movlb	0	; () banked
	movwf	((_USBDeviceState))&0ffh	;volatile
	line	1249
;usb_device.c: 1249: } else {
	goto	i2l3687
	
i2l783:; BSR set to: 0

	line	1250
	
i2l3685:
;usb_device.c: 1250: USBDeviceState=DEFAULT_STATE;
	movlw	low(04h)
	movlb	0	; () banked
	movwf	((_USBDeviceState))&0ffh	;volatile
	goto	i2l3687
	line	1251
	
i2l784:; BSR set to: 0

	goto	i2l3687
	line	1252
	
i2l782:; BSR set to: 0

	line	1254
	
i2l3687:; BSR set to: 0

;usb_device.c: 1251: }
;usb_device.c: 1252: }
;usb_device.c: 1254: if(controlTransferState == 1) {
		decf	((c:_controlTransferState)),c,w	;volatile
	btfss	status,2
	goto	i2u275_41
	goto	i2u275_40

i2u275_41:
	goto	i2l785
i2u275_40:
	line	1257
	
i2l3689:; BSR set to: 0

;usb_device.c: 1257: pBDTEntryIn[0]->ADR = ((WORD)(CtrlTrfData));
	lfsr	2,02h
	movf	((_pBDTEntryIn))&0ffh,w
	addwf	fsr2l
	movf	((_pBDTEntryIn+1))&0ffh,w
	addwfc	fsr2h
	movlw	low(0238h)
	movwf	postinc2,c
	movlw	high(0238h)
	movwf	postdec2,c
	line	1258
	
i2l3691:; BSR set to: 0

;usb_device.c: 1258: USBCtrlTrfTxService();
	call	_USBCtrlTrfTxService	;wreg free
	line	1260
	
i2l3693:
;usb_device.c: 1260: if(shortPacketStatus == 2) {
		movlw	2
	xorwf	((c:_shortPacketStatus)),c,w	;volatile
	btfss	status,2
	goto	i2u276_41
	goto	i2u276_40

i2u276_41:
	goto	i2l3697
i2u276_40:
	line	1262
	
i2l3695:
;usb_device.c: 1262: pBDTEntryIn[0]->STAT.Val = 0x80|0x04;
	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlw	low(084h)
	movwf	indf2
	line	1263
;usb_device.c: 1263: } else {
	goto	i2l793
	
i2l786:
	line	1265
	
i2l3697:
;usb_device.c: 1265: if(lastDTS == 0) {
	movf	((c:USBCtrlTrfInHandler@lastDTS)),c,w
	btfss	status,2
	goto	i2u277_41
	goto	i2u277_40
i2u277_41:
	goto	i2l3701
i2u277_40:
	line	1266
	
i2l3699:
;usb_device.c: 1266: pBDTEntryIn[0]->STAT.Val = 0x80|0x40|(0x08 & 0x08);
	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlw	low(0C8h)
	movwf	indf2
	line	1267
;usb_device.c: 1267: } else {
	goto	i2l793
	
i2l788:
	line	1268
	
i2l3701:
;usb_device.c: 1268: pBDTEntryIn[0]->STAT.Val = 0x80|0x00|(0x08 & 0x08);
	movff	(_pBDTEntryIn),fsr2l
	movff	(_pBDTEntryIn+1),fsr2h
	movlw	low(088h)
	movwf	indf2
	goto	i2l793
	line	1269
	
i2l789:
	goto	i2l793
	line	1270
	
i2l787:
	line	1271
;usb_device.c: 1269: }
;usb_device.c: 1270: }
;usb_device.c: 1271: } else {
	goto	i2l793
	
i2l785:; BSR set to: 0

	line	1275
;usb_device.c: 1275: if(outPipes[0].info.bits.busy == 1)
	btfss	(0+(_outPipes+03h))&0ffh,7	;volatile
	goto	i2u278_41
	goto	i2u278_40
i2u278_41:
	goto	i2l3705
i2u278_40:
	line	1277
	
i2l3703:; BSR set to: 0

;usb_device.c: 1278: {
;usb_device.c: 1279: outPipes[0].pFunc();
	line	1280
	
i2l792:; BSR set to: 0

	line	1281
;usb_device.c: 1280: }
;usb_device.c: 1281: outPipes[0].info.bits.busy = 0;
	bcf	(0+(_outPipes+03h))&0ffh,7	;volatile
	goto	i2l3705
	line	1282
	
i2l791:; BSR set to: 0

	line	1284
	
i2l3705:; BSR set to: 0

;usb_device.c: 1282: }
;usb_device.c: 1284: controlTransferState = 0;
	movlw	low(0)
	movwf	((c:_controlTransferState)),c	;volatile
	goto	i2l793
	line	1285
	
i2l790:; BSR set to: 0

	line	1286
	
i2l793:
	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlTrfInHandler
	__end_of_USBCtrlTrfInHandler:
	signat	_USBCtrlTrfInHandler,89
	global	_USBCtrlTrfTxService

;; *************** function _USBCtrlTrfTxService *****************
;; Defined at:
;;		line 811 in file "C:\pic\PIC18F\test02\usb_device.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  byteToSend      1    2[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, tblptrl, tblptrh, tblptru
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1 BANK2hl BANK2hh
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USBCtrlEPAllowDataStage
;;		_USBCtrlTrfInHandler
;; This function uses a non-reentrant model
;;
psect	text66,class=CODE,space=0,reloc=2,group=0
	line	811
global __ptext66
__ptext66:
psect	text66
	file	"C:\pic\PIC18F\test02\usb_device.c"
	line	811
	global	__size_of_USBCtrlTrfTxService
	__size_of_USBCtrlTrfTxService	equ	__end_of_USBCtrlTrfTxService-_USBCtrlTrfTxService
	
_USBCtrlTrfTxService:
;incstack = 0
	opt	stack 19
	line	815
	
i2l3241:
;usb_device.c: 813: BYTE byteToSend;
;usb_device.c: 815: byteToSend = 8;
	movlw	low(08h)
	movwf	((c:USBCtrlTrfTxService@byteToSend)),c
	line	818
	
i2l3243:
;usb_device.c: 818: if(inPipes[0].wCount.Val < (BYTE)8) {
	movlb	0	; () banked
		movf	(1+(_inPipes+04h))&0ffh,w	;volatile
	bnz	i2u211_41
	movlw	8
	subwf	 (0+(_inPipes+04h))&0ffh,w	;volatile
	btfsc	status,0
	goto	i2u211_41
	goto	i2u211_40

i2u211_41:
	goto	i2l3255
i2u211_40:
	line	819
	
i2l3245:; BSR set to: 0

;usb_device.c: 819: byteToSend = inPipes[0].wCount.Val;
	movff	0+(_inPipes+04h),(c:USBCtrlTrfTxService@byteToSend)	;volatile
	line	821
	
i2l3247:; BSR set to: 0

;usb_device.c: 821: if(shortPacketStatus == 0) {
	movf	((c:_shortPacketStatus)),c,w	;volatile
	btfss	status,2
	goto	i2u212_41
	goto	i2u212_40
i2u212_41:
	goto	i2l3251
i2u212_40:
	line	823
	
i2l3249:; BSR set to: 0

;usb_device.c: 823: shortPacketStatus = 1;
	movlw	low(01h)
	movwf	((c:_shortPacketStatus)),c	;volatile
	line	824
;usb_device.c: 824: } else if(shortPacketStatus == 1) {
	goto	i2l3255
	
i2l702:; BSR set to: 0

	
i2l3251:; BSR set to: 0

		decf	((c:_shortPacketStatus)),c,w	;volatile
	btfss	status,2
	goto	i2u213_41
	goto	i2u213_40

i2u213_41:
	goto	i2l3255
i2u213_40:
	line	826
	
i2l3253:; BSR set to: 0

;usb_device.c: 826: shortPacketStatus = 2;
	movlw	low(02h)
	movwf	((c:_shortPacketStatus)),c	;volatile
	goto	i2l3255
	line	827
	
i2l704:; BSR set to: 0

	goto	i2l3255
	line	828
	
i2l703:; BSR set to: 0

	goto	i2l3255
	
i2l701:; BSR set to: 0

	line	831
	
i2l3255:; BSR set to: 0

;usb_device.c: 827: }
;usb_device.c: 828: }
;usb_device.c: 831: inPipes[0].wCount.Val = inPipes[0].wCount.Val - byteToSend;
	movf	((c:USBCtrlTrfTxService@byteToSend)),c,w
	movwf	(??_USBCtrlTrfTxService+0+0)&0ffh,c
	clrf	(??_USBCtrlTrfTxService+0+0+1)&0ffh,c

	comf	(??_USBCtrlTrfTxService+0+0),c
	comf	(??_USBCtrlTrfTxService+0+1),c
	infsnz	(??_USBCtrlTrfTxService+0+0),c
	incf	(??_USBCtrlTrfTxService+0+1),c
	movf	(0+(_inPipes+04h))&0ffh,w	;volatile
	addwf	(??_USBCtrlTrfTxService+0+0),c,w
	movwf	(0+(_inPipes+04h))&0ffh	;volatile
	movf	(1+(_inPipes+04h))&0ffh,w	;volatile
	addwfc	(??_USBCtrlTrfTxService+0+1),c,w
	movwf	1+(0+(_inPipes+04h))&0ffh	;volatile
	line	834
	
i2l3257:; BSR set to: 0

;usb_device.c: 834: pBDTEntryIn[0]->CNT = byteToSend;
	lfsr	2,01h
	movf	((_pBDTEntryIn))&0ffh,w
	addwf	fsr2l
	movf	((_pBDTEntryIn+1))&0ffh,w
	addwfc	fsr2h
	movff	(c:USBCtrlTrfTxService@byteToSend),indf2

	line	837
	
i2l3259:; BSR set to: 0

;usb_device.c: 837: pDst = (volatile BYTE*)CtrlTrfData;
		movlw	low(568)
	movwf	((c:_pDst)),c
	movlw	high(568)
	movwf	((c:_pDst+1)),c

	line	838
	
i2l3261:; BSR set to: 0

;usb_device.c: 838: if(inPipes[0].info.bits.ctrl_trf_mem == 0x00) {
	btfsc	(0+(_inPipes+03h))&0ffh,0	;volatile
	goto	i2u214_41
	goto	i2u214_40
i2u214_41:
	goto	i2l3283
i2u214_40:
	goto	i2l3273
	line	839
	
i2l3263:; BSR set to: 0

;usb_device.c: 839: while(byteToSend) {
	goto	i2l3273
	
i2l707:; BSR set to: 0

	line	840
	
i2l3265:; BSR set to: 0

;usb_device.c: 840: *pDst++ = *inPipes[0].pSrc.bRom++;
	movff	(_inPipes),tblptrl	;volatile
	movff	(_inPipes+1),tblptrh	;volatile
	clrf	tblptru
	
	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	i2u215_47
	tblrd	*
	
	movf	tablat,w
	bra	i2u215_40
i2u215_47:
	movff	tblptrl,fsr1l
	movff	tblptrh,fsr1h
	movf	indf1,w
i2u215_40:
	movwf	indf2
	
i2l3267:
	movlb	0	; () banked
	infsnz	((_inPipes))&0ffh	;volatile
	incf	((_inPipes+1))&0ffh	;volatile
	
i2l3269:; BSR set to: 0

	infsnz	((c:_pDst)),c
	incf	((c:_pDst+1)),c
	line	841
	
i2l3271:; BSR set to: 0

;usb_device.c: 841: byteToSend--;
	decf	((c:USBCtrlTrfTxService@byteToSend)),c
	goto	i2l3273
	line	842
	
i2l706:; BSR set to: 0

	line	839
	
i2l3273:; BSR set to: 0

	movf	((c:USBCtrlTrfTxService@byteToSend)),c,w
	btfss	status,2
	goto	i2u216_41
	goto	i2u216_40
i2u216_41:
	goto	i2l3265
i2u216_40:
	goto	i2l713
	
i2l708:; BSR set to: 0

	line	843
;usb_device.c: 842: }
;usb_device.c: 843: } else {
	goto	i2l713
	
i2l705:; BSR set to: 0

	line	844
;usb_device.c: 844: while(byteToSend) {
	goto	i2l3283
	
i2l711:; BSR set to: 0

	line	845
	
i2l3275:; BSR set to: 0

;usb_device.c: 845: *pDst++ = *inPipes[0].pSrc.bRam++;
	movff	(_inPipes),tblptrl	;volatile
	movff	(_inPipes+1),tblptrh	;volatile
	clrf	tblptru
	
	movff	(c:_pDst),fsr2l
	movff	(c:_pDst+1),fsr2h
	movlw	high __ramtop-1
	cpfsgt	tblptrh
	bra	i2u217_47
	tblrd	*
	
	movf	tablat,w
	bra	i2u217_40
i2u217_47:
	movff	tblptrl,fsr1l
	movff	tblptrh,fsr1h
	movf	indf1,w
i2u217_40:
	movwf	indf2
	
i2l3277:
	movlb	0	; () banked
	infsnz	((_inPipes))&0ffh	;volatile
	incf	((_inPipes+1))&0ffh	;volatile
	
i2l3279:; BSR set to: 0

	infsnz	((c:_pDst)),c
	incf	((c:_pDst+1)),c
	line	846
	
i2l3281:; BSR set to: 0

;usb_device.c: 846: byteToSend--;
	decf	((c:USBCtrlTrfTxService@byteToSend)),c
	goto	i2l3283
	line	847
	
i2l710:; BSR set to: 0

	line	844
	
i2l3283:; BSR set to: 0

	movf	((c:USBCtrlTrfTxService@byteToSend)),c,w
	btfss	status,2
	goto	i2u218_41
	goto	i2u218_40
i2u218_41:
	goto	i2l3275
i2u218_40:
	goto	i2l713
	
i2l712:; BSR set to: 0

	goto	i2l713
	line	848
	
i2l709:; BSR set to: 0

	line	849
	
i2l713:; BSR set to: 0

	return	;funcret
	opt stack 0
GLOBAL	__end_of_USBCtrlTrfTxService
	__end_of_USBCtrlTrfTxService:
	signat	_USBCtrlTrfTxService,89
psect	mediumconst
	db 0	; dummy byte at the end
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	2
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
       psect   temp,common,ovrld,class=COMRAM,space=1
	global	btemp
btemp:
	ds	1
	global	int$flags
	int$flags	set btemp
	global	wtemp6
	wtemp6 set btemp+1
	end
