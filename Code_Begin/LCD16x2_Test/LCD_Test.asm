
_main:

;LCD_Test.c,23 :: 		void main() {
;LCD_Test.c,25 :: 		unsigned int intNumber = 28;
;LCD_Test.c,26 :: 		unsigned char temp = 0;
	CLRF       main_temp_L0+0
;LCD_Test.c,31 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LCD_Test.c,44 :: 		while(1)
L_main0:
;LCD_Test.c,46 :: 		temp = keyPress();
	CALL       _keyPress+0
	MOVF       R0+0, 0
	MOVWF      main_temp_L0+0
;LCD_Test.c,47 :: 		if(temp)
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;LCD_Test.c,49 :: 		if(temp == 10) Lcd_Cmd(0x01);
	MOVF       main_temp_L0+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main3
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L_main3:
;LCD_Test.c,52 :: 		Lcd_Out_Number(temp);
	MOVF       main_temp_L0+0, 0
	MOVWF      FARG_Lcd_Out_Number_number+0
	CLRF       FARG_Lcd_Out_Number_number+1
	CALL       _Lcd_Out_Number+0
;LCD_Test.c,53 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;LCD_Test.c,54 :: 		LCD_Cmd(0x06);
	MOVLW      6
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Test.c,55 :: 		Delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
;LCD_Test.c,56 :: 		}
L_main2:
;LCD_Test.c,57 :: 		}
	GOTO       L_main0
;LCD_Test.c,59 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_Lcd_Out_Number:

;LCD_Test.c,60 :: 		void Lcd_Out_Number(unsigned int number)
;LCD_Test.c,62 :: 		Lcd_Chr_CP(number + 0x30);
	MOVLW      48
	ADDWF      FARG_Lcd_Out_Number_number+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;LCD_Test.c,63 :: 		}
L_end_Lcd_Out_Number:
	RETURN
; end of _Lcd_Out_Number
