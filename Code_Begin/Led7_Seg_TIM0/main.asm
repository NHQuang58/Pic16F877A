
_main:

;main.c,3 :: 		void main()
;main.c,5 :: 		int count = 0, i = 0;
	CLRF       main_count_L0+0
	CLRF       main_count_L0+1
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;main.c,6 :: 		Config_TIM0();
	CALL       _Config_TIM0+0
;main.c,8 :: 		while(1)
L_main0:
;main.c,10 :: 		for(count = 0; count <= 9999; count++)
	CLRF       main_count_L0+0
	CLRF       main_count_L0+1
L_main2:
	MOVLW      128
	XORLW      39
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_count_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       main_count_L0+0, 0
	SUBLW      15
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;main.c,12 :: 		for(i = 0; i <= 10; i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main5:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       main_i_L0+0, 0
	SUBLW      10
L__main10:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
;main.c,14 :: 		Led7_Quartet(count);
	MOVF       main_count_L0+0, 0
	MOVWF      FARG_Led7_Quartet_number+0
	MOVF       main_count_L0+1, 0
	MOVWF      FARG_Led7_Quartet_number+1
	CALL       _Led7_Quartet+0
;main.c,12 :: 		for(i = 0; i <= 10; i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;main.c,15 :: 		}
	GOTO       L_main5
L_main6:
;main.c,10 :: 		for(count = 0; count <= 9999; count++)
	INCF       main_count_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_count_L0+1, 1
;main.c,16 :: 		}
	GOTO       L_main2
L_main3:
;main.c,17 :: 		}
	GOTO       L_main0
;main.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
