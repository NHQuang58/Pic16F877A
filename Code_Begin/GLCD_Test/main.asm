
_main:

;main.c,4 :: 		void main() {
;main.c,6 :: 		int i = 0;
;main.c,7 :: 		GLCD_Init();
	CALL       _GLCD_Init+0
;main.c,8 :: 		GLCD_Clear();
	CALL       _GLCD_Clear+0
;main.c,10 :: 		GLCD_Print57(1, 0, "DevZone 2020");
	MOVLW      1
	MOVWF      FARG_GLCD_Print57_page+0
	CLRF       FARG_GLCD_Print57_col+0
	MOVLW      ?lstr1_main+0
	MOVWF      FARG_GLCD_Print57_str+0
	CALL       _GLCD_Print57+0
;main.c,11 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;main.c,13 :: 		GLCD_PutBMP(cat);
	MOVLW      _cat+0
	MOVWF      FARG_GLCD_PutBMP_bmp+0
	MOVLW      hi_addr(_cat+0)
	MOVWF      FARG_GLCD_PutBMP_bmp+1
	CALL       _GLCD_PutBMP+0
;main.c,15 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;main.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
