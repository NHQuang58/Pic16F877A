
_main:

;main.c,4 :: 		void main()
;main.c,6 :: 		char getValue = 'a', i = 0;
	CLRF       main_i_L0+0
;main.c,8 :: 		GLCD_Init();
	CALL       _GLCD_Init+0
;main.c,9 :: 		GLCD_Clear();
	CALL       _GLCD_Clear+0
;main.c,10 :: 		UART_Init(9600);
	MOVLW      128
	MOVWF      FARG_UART_Init_baudRate+0
	MOVLW      37
	MOVWF      FARG_UART_Init_baudRate+1
	CALL       _UART_Init+0
;main.c,15 :: 		while(1)
L_main0:
;main.c,21 :: 		UART_ReceiveString(receive_string);
	MOVLW      main_receive_string_L0+0
	MOVWF      FARG_UART_ReceiveString_str+0
	CALL       _UART_ReceiveString+0
;main.c,22 :: 		GLCD_Print57(0, 0, receive_string);
	CLRF       FARG_GLCD_Print57_page+0
	CLRF       FARG_GLCD_Print57_col+0
	MOVLW      main_receive_string_L0+0
	MOVWF      FARG_GLCD_Print57_str+0
	CALL       _GLCD_Print57+0
;main.c,23 :: 		for(i = 0; i < strlen(receive_string); i++)
	CLRF       main_i_L0+0
L_main2:
	MOVLW      main_receive_string_L0+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVF       R0+0, 0
	SUBWF      main_i_L0+0, 0
L__main6:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;main.c,25 :: 		receive_string[i] = toupper(receive_string[i]);
	MOVF       main_i_L0+0, 0
	ADDLW      main_receive_string_L0+0
	MOVWF      FLOC__main+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_toupper_character+0
	CALL       _toupper+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;main.c,23 :: 		for(i = 0; i < strlen(receive_string); i++)
	INCF       main_i_L0+0, 1
;main.c,26 :: 		}
	GOTO       L_main2
L_main3:
;main.c,27 :: 		UART_Write(receive_string);
	MOVLW      main_receive_string_L0+0
	MOVWF      FARG_UART_Write_str+0
	CALL       _UART_Write+0
;main.c,30 :: 		}
	GOTO       L_main0
;main.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
