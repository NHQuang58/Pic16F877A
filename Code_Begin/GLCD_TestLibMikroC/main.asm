
_main:

;main.c,18 :: 		void main() {
;main.c,21 :: 		Glcd_Init();
	CALL       _Glcd_Init+0
;main.c,25 :: 		Glcd_Write_Text("haha", 0, 2, 0);
	MOVLW      ?lstr1_main+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	CLRF       FARG_Glcd_Write_Text_x_pos+0
	MOVLW      2
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	CLRF       FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;main.c,28 :: 		while(1)
L_main0:
;main.c,32 :: 		}
	GOTO       L_main0
;main.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
