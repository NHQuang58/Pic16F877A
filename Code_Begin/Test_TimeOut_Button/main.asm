
_main:

;main.c,14 :: 		void main() {
;main.c,16 :: 		TRISD = 0xF0;     //1111 0000
	MOVLW      240
	MOVWF      TRISD+0
;main.c,17 :: 		led1 = 0;
	BCF        PORTD+0, 0
;main.c,18 :: 		led2 = 0;
	BCF        PORTD+0, 1
;main.c,19 :: 		led3 = 0;
	BCF        PORTD+0, 2
;main.c,20 :: 		led4 = 0;
	BCF        PORTD+0, 3
;main.c,21 :: 		while(1)
L_main0:
;main.c,34 :: 		if(Button(&PORTD, 7, 10, 0)) PORTD ^= 0x0F;
	MOVLW      PORTD+0
	MOVWF      FARG_Button_port+0
	MOVLW      7
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
	MOVLW      15
	XORWF      PORTD+0, 1
L_main2:
;main.c,36 :: 		}
	GOTO       L_main0
;main.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_Press:

;main.c,50 :: 		int Press(void)
;main.c,52 :: 		if(SW1 == 0)
	BTFSC      PORTD+0, 4
	GOTO       L_Press3
;main.c,54 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_Press4:
	DECFSZ     R13+0, 1
	GOTO       L_Press4
	DECFSZ     R12+0, 1
	GOTO       L_Press4
	NOP
	NOP
;main.c,55 :: 		if(SW1 == 0)
	BTFSC      PORTD+0, 4
	GOTO       L_Press5
;main.c,57 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_Press
;main.c,59 :: 		}
L_Press5:
;main.c,60 :: 		}
L_Press3:
;main.c,61 :: 		}
L_end_Press:
	RETURN
; end of _Press
