
	; Microchip MPLAB XC8 C Compiler V1.45
	; Copyright (C) 1984-2017 HI-TECH Software

	; Auto-generated runtime startup code for final link stage.

	;
	; Compiler options:
	;
	; -oCDC - Basic.cof -mCDC - Basic.map --summary=default \
	; --output=default usb_descriptors.p1 usb_function_cdc.p1 main.p1 \
	; usb_device.p1 --chip=18F14K50 -IC:\pic\PIC18F\test02 \
	; -IC:\pic\PIC18F\lib\USB -IC:\pic\PIC18F\lib -P --runtime=default \
	; --opt=default -N-1 -D__DEBUG=1 -g --asmlist \
	; --errformat=Error   [%n] %f; %l.%c %s --msgformat=Advisory[%n] %s \
	; --warnformat=Warning [%n] %f; %l.%c %s
	;


	processor	18F14K50

	GLOBAL	_main,start
	FNROOT	_main

	pic18cxx	equ	1

	psect	config,class=CONFIG,delta=1,noexec
	psect	idloc,class=IDLOC,delta=1,noexec
	psect	const,class=CONST,delta=1,reloc=2,noexec
	psect	smallconst,class=SMALLCONST,delta=1,reloc=2,noexec
	psect	mediumconst,class=MEDIUMCONST,delta=1,reloc=2,noexec
	psect	rbss,class=COMRAM,space=1,noexec
	psect	bss,class=RAM,space=1,noexec
	psect	rdata,class=COMRAM,space=1,noexec
	psect	irdata,class=CODE,space=0,reloc=2,noexec
	psect	bss,class=RAM,space=1,noexec
	psect	data,class=RAM,space=1,noexec
	psect	idata,class=CODE,space=0,reloc=2,noexec
	psect	nvrram,class=COMRAM,space=1,noexec
	psect	nvbit,class=COMRAM,bit,space=1,noexec
	psect	temp,ovrld,class=COMRAM,space=1,noexec
	psect	struct,ovrld,class=COMRAM,space=1,noexec
	psect	rbit,class=COMRAM,bit,space=1,noexec
	psect	bigbss,class=BIGRAM,space=1,noexec
	psect	bigdata,class=BIGRAM,space=1,noexec
	psect	ibigdata,class=CODE,space=0,reloc=2,noexec
	psect	farbss,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	nvFARRAM,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	fardata,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	ifardata,class=CODE,space=0,reloc=2,delta=1,noexec

	psect	reset_vec,class=CODE,delta=1,reloc=2
	psect	powerup,class=CODE,delta=1,reloc=2
	psect	init,class=CODE,delta=1,reloc=2
	psect	text,class=CODE,delta=1,reloc=2
GLOBAL	intlevel0,intlevel1,intlevel2
intlevel0:
intlevel1:
intlevel2:
GLOBAL	intlevel3
intlevel3:
	psect	clrtext,class=CODE,delta=1,reloc=2

	psect	intcode,class=CODE,delta=1,reloc=2
	psect	intcode_body,class=CODE,delta=1,reloc=2
	psect	intcodelo,class=CODE,delta=1,reloc=2
	psect	intret,class=CODE,delta=1,reloc=2
	psect	intentry,class=CODE,delta=1,reloc=2
	psect	intsave_regs,class=BIGRAM,space=1

	psect	eeprom_data,class=EEDATA,delta=1,noexec
	psect	smallconst
	GLOBAL	__smallconst
__smallconst:
	psect	mediumconst
	GLOBAL	__mediumconst
__mediumconst:
wreg	EQU	0FE8h
fsr0l	EQU	0FE9h
fsr0h	EQU	0FEAh
fsr1l	EQU	0FE1h
fsr1h	EQU	0FE2h
fsr2l	EQU	0FD9h
fsr2h	EQU	0FDAh
postinc0	EQU	0FEEh
postdec0	EQU	0FEDh
postinc1	EQU	0FE6h
postdec1	EQU	0FE5h
postinc2	EQU	0FDEh
postdec2	EQU	0FDDh
tblptrl	EQU	0FF6h
tblptrh	EQU	0FF7h
tblptru	EQU	0FF8h
tablat		EQU	0FF5h

	PSECT	ramtop,class=RAM,noexec
	GLOBAL	__S1			; top of RAM usage
	GLOBAL	__ramtop
	GLOBAL	__LRAM,__HRAM
__ramtop:

	psect	reset_vec
reset_vec:
	; No powerup routine
	global start

; jump to start
	goto start
	GLOBAL __accesstop
__accesstop EQU 96

;Initialize the stack pointer (FSR1)
	global stacklo, stackhi
	stacklo	equ	0190h
	stackhi	equ	01FFh


	psect	stack,class=STACK,space=2,noexec
	global ___sp,___inthi_sp,___intlo_sp
___sp:
___inthi_sp:
___intlo_sp:



	psect	init
start:
	global start_initialization
	goto start_initialization	;jump to C runtime clear & initialization

; Config register CONFIG1L @ 0x300000
;	CPU System Clock Selection bits
;	CPUDIV = NOCLKDIV, No CPU System Clock divide
;	USB Clock Selection bit
;	USBDIV = OFF, USB clock comes directly from the OSC1/OSC2 oscillator block; no divide

	psect	config,class=CONFIG,delta=1,noexec
		org 0x0
		db 0x0

; Config register CONFIG1H @ 0x300001
;	Oscillator Selection bits
;	FOSC = HS, HS oscillator
;	4 X PLL Enable bit
;	PLLEN = ON, Oscillator multiplied by 4
;	Primary Clock Enable bit
;	PCLKEN = ON, Primary clock enabled
;	Fail-Safe Clock Monitor Enable
;	FCMEN = OFF, Fail-Safe Clock Monitor disabled
;	Internal/External Oscillator Switchover bit
;	IESO = OFF, Oscillator Switchover mode disabled

	psect	config,class=CONFIG,delta=1,noexec
		org 0x1
		db 0x32

; Config register CONFIG2L @ 0x300002
;	Power-up Timer Enable bit
;	PWRTEN = OFF, PWRT disabled
;	Brown-out Reset Enable bits
;	BOREN = OFF, Brown-out Reset disabled in hardware and software
;	Brown-out Reset Voltage bits
;	BORV = 30, VBOR set to 3.0 V nominal

	psect	config,class=CONFIG,delta=1,noexec
		org 0x2
		db 0x1

; Config register CONFIG2H @ 0x300003
;	Watchdog Timer Enable bit
;	WDTEN = OFF, WDT is controlled by SWDTEN bit of the WDTCON register
;	Watchdog Timer Postscale Select bits
;	WDTPS = 32768, 1:32768

	psect	config,class=CONFIG,delta=1,noexec
		org 0x3
		db 0x1E

; Padding undefined space
	psect	config,class=CONFIG,delta=1,noexec
		org 0x4
		db 0xFF

; Config register CONFIG3H @ 0x300005
;	HFINTOSC Fast Start-up bit
;	HFOFST = OFF, The system clock is held off until the HFINTOSC is stable.
;	MCLR Pin Enable bit
;	MCLRE = OFF, RA3 input pin enabled; MCLR disabled

	psect	config,class=CONFIG,delta=1,noexec
		org 0x5
		db 0x0

; Config register CONFIG4L @ 0x300006
;	Stack Full/Underflow Reset Enable bit
;	STVREN = ON, Stack full/underflow will cause Reset
;	Single-Supply ICSP Enable bit
;	LVP = OFF, Single-Supply ICSP disabled
;	Boot Block Size Select bit
;	BBSIZ = 0x0, unprogrammed default
;	Extended Instruction Set Enable bit
;	XINST = OFF, Instruction set extension and Indexed Addressing mode disabled (Legacy mode)
;	Background Debugger Enable bit
;	DEBUG = 0x1, unprogrammed default

	psect	config,class=CONFIG,delta=1,noexec
		org 0x6
		db 0x81

; Padding undefined space
	psect	config,class=CONFIG,delta=1,noexec
		org 0x7
		db 0xFF


psect comram,class=COMRAM,space=1
psect abs1,class=ABS1,space=1
psect bigram,class=BIGRAM,space=1
psect ram,class=RAM,space=1
psect bank0,class=BANK0,space=1
psect bank1,class=BANK1,space=1
psect bank2,class=BANK2,space=1
psect sfr,class=SFR,space=1


	end	start
