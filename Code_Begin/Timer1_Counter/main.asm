
_main:

;main.c,3 :: 		void main() {
;main.c,6 :: 		TRISC = 0x0F;
	MOVLW      15
	MOVWF      TRISC+0
;main.c,7 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;main.c,10 :: 		T1CON.B1 = 1; //counter mode
	BSF        T1CON+0, 1
;main.c,11 :: 		T1CON.B4 = T1CON.B5 = 0; //prescale 1:1
	BCF        T1CON+0, 5
	BTFSC      T1CON+0, 5
	GOTO       L__main3
	BCF        T1CON+0, 4
	GOTO       L__main4
L__main3:
	BSF        T1CON+0, 4
L__main4:
;main.c,13 :: 		TMR1H = TMR1L = 0;
	CLRF       TMR1L+0
	MOVF       TMR1L+0, 0
	MOVWF      TMR1H+0
;main.c,14 :: 		T1CON.B0 = 1; //enable timer 1
	BSF        T1CON+0, 0
;main.c,16 :: 		while(1)
L_main0:
;main.c,18 :: 		count = TMR1H;
	MOVF       TMR1H+0, 0
	MOVWF      main_count_L0+0
	CLRF       main_count_L0+1
;main.c,19 :: 		count <<= 8;
	MOVF       main_count_L0+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       R0+0, 0
	MOVWF      main_count_L0+0
	MOVF       R0+1, 0
	MOVWF      main_count_L0+1
;main.c,20 :: 		count |= TMR1L;
	MOVF       TMR1L+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      main_count_L0+0
	MOVF       R0+1, 0
	MOVWF      main_count_L0+1
;main.c,22 :: 		Led7_Quartet(count);
	MOVF       R0+0, 0
	MOVWF      FARG_Led7_Quartet_number+0
	MOVF       R0+1, 0
	MOVWF      FARG_Led7_Quartet_number+1
	CALL       _Led7_Quartet+0
;main.c,23 :: 		}
	GOTO       L_main0
;main.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
