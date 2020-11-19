
_main:

;main.c,3 :: 		void main() {
;main.c,4 :: 		int hour = 5, minute = 8;
	MOVLW      5
	MOVWF      main_hour_L0+0
	MOVLW      0
	MOVWF      main_hour_L0+1
	MOVLW      8
	MOVWF      main_minute_L0+0
	MOVLW      0
	MOVWF      main_minute_L0+1
;main.c,6 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;main.c,7 :: 		Lcd_Cmd(0x0C);    //on display and turn off cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_myCommand+0
	CALL       _Lcd_Cmd+0
;main.c,8 :: 		Lcd_GoToXY(0, 0);
	CLRF       FARG_Lcd_GoToXY_row+0
	CLRF       FARG_Lcd_GoToXY_col+0
	CALL       _Lcd_GoToXY+0
;main.c,11 :: 		sprinti(buffer, "%d", hour);
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      ?lstr_1_main+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_1_main+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       main_hour_L0+0, 0
	MOVWF      FARG_sprinti_wh+3
	MOVF       main_hour_L0+1, 0
	MOVWF      FARG_sprinti_wh+4
	CALL       _sprinti+0
;main.c,12 :: 		Lcd_Puts(buffer);
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
;main.c,13 :: 		Lcd_PutChar(0x3A);
	MOVLW      58
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,14 :: 		sprinti(buffer, "%d", minute);
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      ?lstr_2_main+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_2_main+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       main_minute_L0+0, 0
	MOVWF      FARG_sprinti_wh+3
	MOVF       main_minute_L0+1, 0
	MOVWF      FARG_sprinti_wh+4
	CALL       _sprinti+0
;main.c,15 :: 		Lcd_Puts(buffer);
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
;main.c,17 :: 		while(1)
L_main0:
;main.c,23 :: 		}
	GOTO       L_main0
;main.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
