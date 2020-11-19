
_main:

;main.c,4 :: 		void main() {
;main.c,5 :: 		float temp = 0,  volt = 0;
;main.c,7 :: 		unsigned int temp_display1 = 0, temp_display2 = 0, adc_input = 0;
	CLRF       main_temp_display2_L0+0
	CLRF       main_temp_display2_L0+1
;main.c,9 :: 		GLCD_Init();
	CALL       _GLCD_Init+0
;main.c,10 :: 		GLCD_Clear();
	CALL       _GLCD_Clear+0
;main.c,11 :: 		ADC_Init();
	CALL       _ADC_Init+0
;main.c,12 :: 		TRISD = 0x00; //Port D as output to use LCD
	CLRF       TRISD+0
;main.c,13 :: 		TRISA.B0 = 1; //Pin PA0 as input to use LM35
	BSF        TRISA+0, 0
;main.c,15 :: 		while(1)
L_main0:
;main.c,17 :: 		adc_input = ADC_ReadChannel(0); //read adc value from ADC_Channel 0
	CLRF       FARG_ADC_ReadChannel_channel+0
	CLRF       FARG_ADC_ReadChannel_channel+1
	CALL       _ADC_ReadChannel+0
;main.c,18 :: 		volt = adc_input * 10000.0f / 1023;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      64
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      140
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
;main.c,19 :: 		temp = volt/ 10.0f;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+2
	MOVF       R0+1, 0
	MOVWF      FLOC__main+3
	MOVF       R0+2, 0
	MOVWF      FLOC__main+4
	MOVF       R0+3, 0
	MOVWF      FLOC__main+5
	MOVF       FLOC__main+2, 0
	MOVWF      R0+0
	MOVF       FLOC__main+3, 0
	MOVWF      R0+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+2
	MOVF       FLOC__main+5, 0
	MOVWF      R0+3
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
;main.c,21 :: 		temp_display2 = (temp - temp_display1) * 100;
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__main+2, 0
	MOVWF      R0+0
	MOVF       FLOC__main+3, 0
	MOVWF      R0+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+2
	MOVF       FLOC__main+5, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      main_temp_display2_L0+0
	MOVF       R0+1, 0
	MOVWF      main_temp_display2_L0+1
;main.c,22 :: 		sprinti(buffer, "%d", temp_display1);
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      ?lstr_1_main+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_1_main+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       FLOC__main+0, 0
	MOVWF      FARG_sprinti_wh+3
	MOVF       FLOC__main+1, 0
	MOVWF      FARG_sprinti_wh+4
	CALL       _sprinti+0
;main.c,23 :: 		GLCD_GotoXY(0, 1);
	CLRF       FARG_GLCD_GotoXY_page+0
	CLRF       FARG_GLCD_GotoXY_page+1
	MOVLW      1
	MOVWF      FARG_GLCD_GotoXY_col+0
	MOVLW      0
	MOVWF      FARG_GLCD_GotoXY_col+1
	CALL       _GLCD_GotoXY+0
;main.c,24 :: 		GLCD_Print57(0, 1, buffer);
	CLRF       FARG_GLCD_Print57_page+0
	MOVLW      1
	MOVWF      FARG_GLCD_Print57_col+0
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_GLCD_Print57_str+0
	CALL       _GLCD_Print57+0
;main.c,25 :: 		GLCD_PutChar57(0, 11, '.');
	CLRF       FARG_GLCD_PutChar57_x+0
	MOVLW      11
	MOVWF      FARG_GLCD_PutChar57_y+0
	MOVLW      46
	MOVWF      FARG_GLCD_PutChar57_chr+0
	CALL       _GLCD_PutChar57+0
;main.c,26 :: 		sprinti(buffer, "%d", temp_display2);
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      ?lstr_2_main+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_2_main+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       main_temp_display2_L0+0, 0
	MOVWF      FARG_sprinti_wh+3
	MOVF       main_temp_display2_L0+1, 0
	MOVWF      FARG_sprinti_wh+4
	CALL       _sprinti+0
;main.c,27 :: 		GLCD_Print57(0, 16, buffer);
	CLRF       FARG_GLCD_Print57_page+0
	MOVLW      16
	MOVWF      FARG_GLCD_Print57_col+0
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_GLCD_Print57_str+0
	CALL       _GLCD_Print57+0
;main.c,28 :: 		}
	GOTO       L_main0
;main.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
