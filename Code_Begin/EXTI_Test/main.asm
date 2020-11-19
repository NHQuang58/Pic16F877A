
_main:

;main.c,11 :: 		void main() {
;main.c,12 :: 		volatile unsigned char temp = 0, key = 0;
	CLRF       main_temp_L0+0
;main.c,14 :: 		TRISB = 0xF0; //set PB7-4 as input
	MOVLW      240
	MOVWF      TRISB+0
;main.c,15 :: 		TRISD = 0x00; //set port D as output
	CLRF       TRISD+0
;main.c,16 :: 		TRISC = 0x00; //set port C as output
	CLRF       TRISC+0
;main.c,20 :: 		OPTION_REG.INTEDG = 1;   //rising trigger
	BSF        OPTION_REG+0, 6
;main.c,21 :: 		GIE_bit = 1;  //enable global interrupt
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;main.c,24 :: 		RBIE_bit = 1; //enable interrupt on port B
	BSF        RBIE_bit+0, BitPos(RBIE_bit+0)
;main.c,26 :: 		while(1)
L_main0:
;main.c,34 :: 		keyPress()  ;
	CALL       _keyPress+0
;main.c,35 :: 		if(count != 0)
	MOVF       _count+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;main.c,37 :: 		temp = count;
	MOVF       _count+0, 0
	MOVWF      main_temp_L0+0
;main.c,38 :: 		}
L_main2:
;main.c,39 :: 		Led7_Quartet(Number[temp-1]);
	MOVLW      1
	SUBWF      main_temp_L0+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _Number+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Led7_Quartet_number+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FARG_Led7_Quartet_number+1
	CALL       _Led7_Quartet+0
;main.c,42 :: 		}
	GOTO       L_main0
;main.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;main.c,53 :: 		void interrupt(void)
;main.c,55 :: 		if(RBIF_bit == 1)
	BTFSS      RBIF_bit+0, BitPos(RBIF_bit+0)
	GOTO       L_interrupt3
;main.c,57 :: 		count = keyPress_INT();
	CALL       _keyPress_INT+0
	MOVF       R0+0, 0
	MOVWF      _count+0
;main.c,58 :: 		PORTB.F0 = !PORTB.F0;
	MOVLW      1
	XORWF      PORTB+0, 1
;main.c,60 :: 		RBIF_bit = 0;
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;main.c,61 :: 		}
L_interrupt3:
;main.c,62 :: 		}
L_end_interrupt:
L__interrupt6:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
