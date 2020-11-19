
_GLCD_Cmd:

;myGLCD.c,25 :: 		void GLCD_Cmd(char command)
;myGLCD.c,27 :: 		Data_Tris = 0x00; //set data port as output
	CLRF       TRISD+0
;myGLCD.c,28 :: 		Data_Port = command;
	MOVF       FARG_GLCD_Cmd_command+0, 0
	MOVWF      PORTD+0
;myGLCD.c,29 :: 		RS = 0; //RS pin LOW to select instruction mode
	BCF        PORTC+0, 2
;myGLCD.c,30 :: 		RW = 0; //RW pin LOW to select Write mode
	BCF        PORTC+0, 3
;myGLCD.c,31 :: 		E = 1;
	BSF        PORTC+0, 4
;myGLCD.c,32 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_GLCD_Cmd0:
	DECFSZ     R13+0, 1
	GOTO       L_GLCD_Cmd0
	DECFSZ     R12+0, 1
	GOTO       L_GLCD_Cmd0
	NOP
;myGLCD.c,33 :: 		E = 0;
	BCF        PORTC+0, 4
;myGLCD.c,34 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_GLCD_Cmd1:
	DECFSZ     R13+0, 1
	GOTO       L_GLCD_Cmd1
	DECFSZ     R12+0, 1
	GOTO       L_GLCD_Cmd1
	NOP
;myGLCD.c,36 :: 		}
L_end_GLCD_Cmd:
	RETURN
; end of _GLCD_Cmd

_GLCD_SetSide:

;myGLCD.c,39 :: 		void GLCD_SetSide(char side)  //side = 0: right / 1: left
;myGLCD.c,42 :: 		if(side == 0)   //right
	MOVF       FARG_GLCD_SetSide_side+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_GLCD_SetSide2
;myGLCD.c,44 :: 		CS2 = 1;
	BSF        PORTC+0, 1
;myGLCD.c,45 :: 		CS1 = 0;
	BCF        PORTC+0, 0
;myGLCD.c,46 :: 		}
	GOTO       L_GLCD_SetSide3
L_GLCD_SetSide2:
;myGLCD.c,47 :: 		else if(side == 1)//left
	MOVF       FARG_GLCD_SetSide_side+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_GLCD_SetSide4
;myGLCD.c,49 :: 		CS2 = 0;
	BCF        PORTC+0, 1
;myGLCD.c,50 :: 		CS1 = 1;
	BSF        PORTC+0, 0
;myGLCD.c,51 :: 		}
L_GLCD_SetSide4:
L_GLCD_SetSide3:
;myGLCD.c,52 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_GLCD_SetSide5:
	DECFSZ     R13+0, 1
	GOTO       L_GLCD_SetSide5
	DECFSZ     R12+0, 1
	GOTO       L_GLCD_SetSide5
	NOP
;myGLCD.c,53 :: 		}
L_end_GLCD_SetSide:
	RETURN
; end of _GLCD_SetSide

_Wait_GLCD:

;myGLCD.c,55 :: 		void Wait_GLCD(void)
;myGLCD.c,58 :: 		Data_Tris    = 0xFF; //set port data as input
	MOVLW      255
	MOVWF      TRISD+0
;myGLCD.c,59 :: 		RS = 0; RW = 1; //read RLCD -> PIC
	BCF        PORTC+0, 2
	BSF        PORTC+0, 3
;myGLCD.c,60 :: 		E = 1;
	BSF        PORTC+0, 4
;myGLCD.c,61 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_Wait_GLCD6:
	DECFSZ     R13+0, 1
	GOTO       L_Wait_GLCD6
	DECFSZ     R12+0, 1
	GOTO       L_Wait_GLCD6
	NOP
;myGLCD.c,62 :: 		E = 0;
	BCF        PORTC+0, 4
;myGLCD.c,64 :: 		while(GLCD_BusyBit == 1) //GLCD in operatin
L_Wait_GLCD7:
	BTFSS      PORTD+0, 7
	GOTO       L_Wait_GLCD8
;myGLCD.c,66 :: 		E = 1;
	BSF        PORTC+0, 4
;myGLCD.c,67 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_Wait_GLCD9:
	DECFSZ     R13+0, 1
	GOTO       L_Wait_GLCD9
	DECFSZ     R12+0, 1
	GOTO       L_Wait_GLCD9
	NOP
;myGLCD.c,68 :: 		E = 0;
	BCF        PORTC+0, 4
;myGLCD.c,69 :: 		}
	GOTO       L_Wait_GLCD7
L_Wait_GLCD8:
;myGLCD.c,70 :: 		}
L_end_Wait_GLCD:
	RETURN
; end of _Wait_GLCD

_GLCD_SetColum:

;myGLCD.c,72 :: 		void GLCD_SetColum(char col) //col: 0~63
;myGLCD.c,74 :: 		Wait_GLCD();
	CALL       _Wait_GLCD+0
;myGLCD.c,75 :: 		Data_Tris = 0x00; //set data port as output
	CLRF       TRISD+0
;myGLCD.c,76 :: 		RS = RW = 0; //write instruction PIC -> GLCD
	BCF        PORTC+0, 3
	BTFSC      PORTC+0, 3
	GOTO       L__GLCD_SetColum59
	BCF        PORTC+0, 2
	GOTO       L__GLCD_SetColum60
L__GLCD_SetColum59:
	BSF        PORTC+0, 2
L__GLCD_SetColum60:
;myGLCD.c,78 :: 		GLCD_Cmd(GLCD_Colum + col);
	MOVF       FARG_GLCD_SetColum_col+0, 0
	ADDLW      64
	MOVWF      FARG_GLCD_Cmd_command+0
	CALL       _GLCD_Cmd+0
;myGLCD.c,79 :: 		E = 1;
	BSF        PORTC+0, 4
;myGLCD.c,80 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_GLCD_SetColum10:
	DECFSZ     R13+0, 1
	GOTO       L_GLCD_SetColum10
	DECFSZ     R12+0, 1
	GOTO       L_GLCD_SetColum10
	NOP
;myGLCD.c,81 :: 		E = 0;
	BCF        PORTC+0, 4
;myGLCD.c,82 :: 		}
L_end_GLCD_SetColum:
	RETURN
; end of _GLCD_SetColum

_GLCD_SetPage:

;myGLCD.c,84 :: 		void GLCD_SetPage(char page) //page: 0~7
;myGLCD.c,86 :: 		Wait_GLCD();
	CALL       _Wait_GLCD+0
;myGLCD.c,87 :: 		Data_Tris = 0x00; //set data port as output
	CLRF       TRISD+0
;myGLCD.c,88 :: 		RS = RW = 0; //write instruction PIC -> GLCD
	BCF        PORTC+0, 3
	BTFSC      PORTC+0, 3
	GOTO       L__GLCD_SetPage62
	BCF        PORTC+0, 2
	GOTO       L__GLCD_SetPage63
L__GLCD_SetPage62:
	BSF        PORTC+0, 2
L__GLCD_SetPage63:
;myGLCD.c,90 :: 		GLCD_Cmd(GLCD_Page + page);
	MOVF       FARG_GLCD_SetPage_page+0, 0
	ADDLW      184
	MOVWF      FARG_GLCD_Cmd_command+0
	CALL       _GLCD_Cmd+0
;myGLCD.c,91 :: 		E = 1;
	BSF        PORTC+0, 4
;myGLCD.c,92 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_GLCD_SetPage11:
	DECFSZ     R13+0, 1
	GOTO       L_GLCD_SetPage11
	DECFSZ     R12+0, 1
	GOTO       L_GLCD_SetPage11
	NOP
;myGLCD.c,93 :: 		E = 0;
	BCF        PORTC+0, 4
;myGLCD.c,94 :: 		}
L_end_GLCD_SetPage:
	RETURN
; end of _GLCD_SetPage

_GLCD_ScrollUp:

;myGLCD.c,96 :: 		void GLCD_ScrollUp(char lineValue) //lineValue: 0~63
;myGLCD.c,98 :: 		Wait_GLCD();
	CALL       _Wait_GLCD+0
;myGLCD.c,99 :: 		Data_Tris = 0x00; //set data port as output
	CLRF       TRISD+0
;myGLCD.c,100 :: 		RS = RW = 0; //write instruction PIC -> GLCD
	BCF        PORTC+0, 3
	BTFSC      PORTC+0, 3
	GOTO       L__GLCD_ScrollUp65
	BCF        PORTC+0, 2
	GOTO       L__GLCD_ScrollUp66
L__GLCD_ScrollUp65:
	BSF        PORTC+0, 2
L__GLCD_ScrollUp66:
;myGLCD.c,102 :: 		GLCD_Cmd(GLCD_Line + lineValue);
	MOVF       FARG_GLCD_ScrollUp_lineValue+0, 0
	ADDLW      192
	MOVWF      FARG_GLCD_Cmd_command+0
	CALL       _GLCD_Cmd+0
;myGLCD.c,103 :: 		E = 1;
	BSF        PORTC+0, 4
;myGLCD.c,104 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_GLCD_ScrollUp12:
	DECFSZ     R13+0, 1
	GOTO       L_GLCD_ScrollUp12
	DECFSZ     R12+0, 1
	GOTO       L_GLCD_ScrollUp12
	NOP
;myGLCD.c,105 :: 		E = 0;
	BCF        PORTC+0, 4
;myGLCD.c,106 :: 		}
L_end_GLCD_ScrollUp:
	RETURN
; end of _GLCD_ScrollUp

_GLCD_Init:

;myGLCD.c,110 :: 		void GLCD_Init(void)
;myGLCD.c,112 :: 		Control_Tris = 0x00; //config port control as output
	CLRF       TRISC+0
;myGLCD.c,113 :: 		CS1 = CS2 = 1; //select left & right display
	BSF        PORTC+0, 1
	BTFSC      PORTC+0, 1
	GOTO       L__GLCD_Init68
	BCF        PORTC+0, 0
	GOTO       L__GLCD_Init69
L__GLCD_Init68:
	BSF        PORTC+0, 0
L__GLCD_Init69:
;myGLCD.c,114 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_GLCD_Init13:
	DECFSZ     R13+0, 1
	GOTO       L_GLCD_Init13
	DECFSZ     R12+0, 1
	GOTO       L_GLCD_Init13
	NOP
	NOP
;myGLCD.c,115 :: 		GLCD_Cmd(GLCD_OFF); //display OFF
	MOVLW      62
	MOVWF      FARG_GLCD_Cmd_command+0
	CALL       _GLCD_Cmd+0
;myGLCD.c,116 :: 		GLCD_Cmd(GLCD_Page); //set X (page = 0)
	MOVLW      184
	MOVWF      FARG_GLCD_Cmd_command+0
	CALL       _GLCD_Cmd+0
;myGLCD.c,117 :: 		GLCD_Cmd(GLCD_Colum); //set Y (colum = 0)
	MOVLW      64
	MOVWF      FARG_GLCD_Cmd_command+0
	CALL       _GLCD_Cmd+0
;myGLCD.c,118 :: 		GLCD_Cmd(GLCD_Line); //set Z (line = 0)
	MOVLW      192
	MOVWF      FARG_GLCD_Cmd_command+0
	CALL       _GLCD_Cmd+0
;myGLCD.c,119 :: 		GLCD_Cmd(GLCD_ON); //display ON
	MOVLW      63
	MOVWF      FARG_GLCD_Cmd_command+0
	CALL       _GLCD_Cmd+0
;myGLCD.c,120 :: 		}
L_end_GLCD_Init:
	RETURN
; end of _GLCD_Init

_GLCD_SendData:

;myGLCD.c,122 :: 		void GLCD_SendData(char myData)
;myGLCD.c,124 :: 		Data_Tris = 0x00; //set data port as output
	CLRF       TRISD+0
;myGLCD.c,125 :: 		Data_Port = myData;
	MOVF       FARG_GLCD_SendData_myData+0, 0
	MOVWF      PORTD+0
;myGLCD.c,126 :: 		RS = 1; //RS pin HIGH to select data mode
	BSF        PORTC+0, 2
;myGLCD.c,127 :: 		RW = 0; //RW pin LOW to select Write mode
	BCF        PORTC+0, 3
;myGLCD.c,128 :: 		E = 1;
	BSF        PORTC+0, 4
;myGLCD.c,129 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_GLCD_SendData14:
	DECFSZ     R13+0, 1
	GOTO       L_GLCD_SendData14
	DECFSZ     R12+0, 1
	GOTO       L_GLCD_SendData14
	NOP
;myGLCD.c,130 :: 		E = 0;
	BCF        PORTC+0, 4
;myGLCD.c,131 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_GLCD_SendData15:
	DECFSZ     R13+0, 1
	GOTO       L_GLCD_SendData15
	DECFSZ     R12+0, 1
	GOTO       L_GLCD_SendData15
	NOP
;myGLCD.c,132 :: 		}
L_end_GLCD_SendData:
	RETURN
; end of _GLCD_SendData

_GLCD_GotoXY:

;myGLCD.c,135 :: 		void GLCD_GotoXY(int page, int col) //page: 0~7, col: 0~127
;myGLCD.c,137 :: 		int side = 0;
	CLRF       GLCD_GotoXY_side_L0+0
	CLRF       GLCD_GotoXY_side_L0+1
;myGLCD.c,138 :: 		side = col/64;     //0: right; 1:left
	MOVLW      64
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_GLCD_GotoXY_col+0, 0
	MOVWF      R0+0
	MOVF       FARG_GLCD_GotoXY_col+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      GLCD_GotoXY_side_L0+0
	MOVF       R0+1, 0
	MOVWF      GLCD_GotoXY_side_L0+1
;myGLCD.c,139 :: 		GLCD_SetSide(side);
	MOVF       R0+0, 0
	MOVWF      FARG_GLCD_SetSide_side+0
	CALL       _GLCD_SetSide+0
;myGLCD.c,141 :: 		col -= 64 * side; //update real colum: 0~63
	MOVLW      6
	MOVWF      R2+0
	MOVF       GLCD_GotoXY_side_L0+0, 0
	MOVWF      R0+0
	MOVF       GLCD_GotoXY_side_L0+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__GLCD_GotoXY72:
	BTFSC      STATUS+0, 2
	GOTO       L__GLCD_GotoXY73
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__GLCD_GotoXY72
L__GLCD_GotoXY73:
	MOVF       R0+0, 0
	SUBWF      FARG_GLCD_GotoXY_col+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_GLCD_GotoXY_col+1, 1
	MOVF       R0+1, 0
	SUBWF      FARG_GLCD_GotoXY_col+1, 1
;myGLCD.c,142 :: 		GLCD_SetPage(page);
	MOVF       FARG_GLCD_GotoXY_page+0, 0
	MOVWF      FARG_GLCD_SetPage_page+0
	CALL       _GLCD_SetPage+0
;myGLCD.c,143 :: 		GLCD_SetColum(col);
	MOVF       FARG_GLCD_GotoXY_col+0, 0
	MOVWF      FARG_GLCD_SetColum_col+0
	CALL       _GLCD_SetColum+0
;myGLCD.c,144 :: 		}
L_end_GLCD_GotoXY:
	RETURN
; end of _GLCD_GotoXY

_GLCD_Clear:

;myGLCD.c,146 :: 		void GLCD_Clear(void)
;myGLCD.c,149 :: 		for(page = 0; page <= 7; page++)      //clear left display
	CLRF       GLCD_Clear_page_L0+0
	CLRF       GLCD_Clear_page_L0+1
L_GLCD_Clear16:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      GLCD_Clear_page_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GLCD_Clear75
	MOVF       GLCD_Clear_page_L0+0, 0
	SUBLW      7
L__GLCD_Clear75:
	BTFSS      STATUS+0, 0
	GOTO       L_GLCD_Clear17
;myGLCD.c,151 :: 		GLCD_GotoXY(page, 0); //start at colum of page
	MOVF       GLCD_Clear_page_L0+0, 0
	MOVWF      FARG_GLCD_GotoXY_page+0
	MOVF       GLCD_Clear_page_L0+1, 0
	MOVWF      FARG_GLCD_GotoXY_page+1
	CLRF       FARG_GLCD_GotoXY_col+0
	CLRF       FARG_GLCD_GotoXY_col+1
	CALL       _GLCD_GotoXY+0
;myGLCD.c,152 :: 		for(colum = 0; colum <= 63; colum++) GLCD_SendData(0);
	CLRF       GLCD_Clear_colum_L0+0
	CLRF       GLCD_Clear_colum_L0+1
L_GLCD_Clear19:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      GLCD_Clear_colum_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GLCD_Clear76
	MOVF       GLCD_Clear_colum_L0+0, 0
	SUBLW      63
L__GLCD_Clear76:
	BTFSS      STATUS+0, 0
	GOTO       L_GLCD_Clear20
	CLRF       FARG_GLCD_SendData_myData+0
	CALL       _GLCD_SendData+0
	INCF       GLCD_Clear_colum_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       GLCD_Clear_colum_L0+1, 1
	GOTO       L_GLCD_Clear19
L_GLCD_Clear20:
;myGLCD.c,149 :: 		for(page = 0; page <= 7; page++)      //clear left display
	INCF       GLCD_Clear_page_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       GLCD_Clear_page_L0+1, 1
;myGLCD.c,153 :: 		}
	GOTO       L_GLCD_Clear16
L_GLCD_Clear17:
;myGLCD.c,154 :: 		for(page = 0; page <= 7; page++)     //clear right display
	CLRF       GLCD_Clear_page_L0+0
	CLRF       GLCD_Clear_page_L0+1
L_GLCD_Clear22:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      GLCD_Clear_page_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GLCD_Clear77
	MOVF       GLCD_Clear_page_L0+0, 0
	SUBLW      7
L__GLCD_Clear77:
	BTFSS      STATUS+0, 0
	GOTO       L_GLCD_Clear23
;myGLCD.c,156 :: 		GLCD_GotoXY(page, 64); //start at colum of page
	MOVF       GLCD_Clear_page_L0+0, 0
	MOVWF      FARG_GLCD_GotoXY_page+0
	MOVF       GLCD_Clear_page_L0+1, 0
	MOVWF      FARG_GLCD_GotoXY_page+1
	MOVLW      64
	MOVWF      FARG_GLCD_GotoXY_col+0
	MOVLW      0
	MOVWF      FARG_GLCD_GotoXY_col+1
	CALL       _GLCD_GotoXY+0
;myGLCD.c,157 :: 		for(colum = 0; colum <= 63; colum++) GLCD_SendData(0);
	CLRF       GLCD_Clear_colum_L0+0
	CLRF       GLCD_Clear_colum_L0+1
L_GLCD_Clear25:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      GLCD_Clear_colum_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GLCD_Clear78
	MOVF       GLCD_Clear_colum_L0+0, 0
	SUBLW      63
L__GLCD_Clear78:
	BTFSS      STATUS+0, 0
	GOTO       L_GLCD_Clear26
	CLRF       FARG_GLCD_SendData_myData+0
	CALL       _GLCD_SendData+0
	INCF       GLCD_Clear_colum_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       GLCD_Clear_colum_L0+1, 1
	GOTO       L_GLCD_Clear25
L_GLCD_Clear26:
;myGLCD.c,154 :: 		for(page = 0; page <= 7; page++)     //clear right display
	INCF       GLCD_Clear_page_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       GLCD_Clear_page_L0+1, 1
;myGLCD.c,158 :: 		}
	GOTO       L_GLCD_Clear22
L_GLCD_Clear23:
;myGLCD.c,159 :: 		}
L_end_GLCD_Clear:
	RETURN
; end of _GLCD_Clear

_GLCD_PutChar57:

;myGLCD.c,161 :: 		void GLCD_PutChar57(unsigned char x, unsigned char y, unsigned char chr)
;myGLCD.c,164 :: 		if((y>59) && (y<64))
	MOVF       FARG_GLCD_PutChar57_y+0, 0
	SUBLW      59
	BTFSC      STATUS+0, 0
	GOTO       L_GLCD_PutChar5730
	MOVLW      64
	SUBWF      FARG_GLCD_PutChar57_y+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_GLCD_PutChar5730
L__GLCD_PutChar5754:
;myGLCD.c,166 :: 		GLCD_GotoXY(x, y);
	MOVF       FARG_GLCD_PutChar57_x+0, 0
	MOVWF      FARG_GLCD_GotoXY_page+0
	CLRF       FARG_GLCD_GotoXY_page+1
	MOVF       FARG_GLCD_PutChar57_y+0, 0
	MOVWF      FARG_GLCD_GotoXY_col+0
	CLRF       FARG_GLCD_GotoXY_col+1
	CALL       _GLCD_GotoXY+0
;myGLCD.c,167 :: 		for(i = 0; i < 64-y; i++)
	CLRF       GLCD_PutChar57_i_L0+0
L_GLCD_PutChar5731:
	MOVF       FARG_GLCD_PutChar57_y+0, 0
	SUBLW      64
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__GLCD_PutChar5780
	MOVF       R1+0, 0
	SUBWF      GLCD_PutChar57_i_L0+0, 0
L__GLCD_PutChar5780:
	BTFSC      STATUS+0, 0
	GOTO       L_GLCD_PutChar5732
;myGLCD.c,168 :: 		GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
	MOVLW      32
	SUBWF      FARG_GLCD_PutChar57_chr+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       GLCD_PutChar57_i_L0+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      _my_font5x7+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_my_font5x7+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_GLCD_SendData_myData+0
	CALL       _GLCD_SendData+0
;myGLCD.c,167 :: 		for(i = 0; i < 64-y; i++)
	INCF       GLCD_PutChar57_i_L0+0, 1
;myGLCD.c,168 :: 		GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
	GOTO       L_GLCD_PutChar5731
L_GLCD_PutChar5732:
;myGLCD.c,169 :: 		GLCD_GotoXY(x, 64);
	MOVF       FARG_GLCD_PutChar57_x+0, 0
	MOVWF      FARG_GLCD_GotoXY_page+0
	CLRF       FARG_GLCD_GotoXY_page+1
	MOVLW      64
	MOVWF      FARG_GLCD_GotoXY_col+0
	MOVLW      0
	MOVWF      FARG_GLCD_GotoXY_col+1
	CALL       _GLCD_GotoXY+0
;myGLCD.c,170 :: 		for(i = 64 - y; i < 5; i++)
	MOVF       FARG_GLCD_PutChar57_y+0, 0
	SUBLW      64
	MOVWF      GLCD_PutChar57_i_L0+0
L_GLCD_PutChar5734:
	MOVLW      5
	SUBWF      GLCD_PutChar57_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_GLCD_PutChar5735
;myGLCD.c,171 :: 		GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
	MOVLW      32
	SUBWF      FARG_GLCD_PutChar57_chr+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       GLCD_PutChar57_i_L0+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      _my_font5x7+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_my_font5x7+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_GLCD_SendData_myData+0
	CALL       _GLCD_SendData+0
;myGLCD.c,170 :: 		for(i = 64 - y; i < 5; i++)
	INCF       GLCD_PutChar57_i_L0+0, 1
;myGLCD.c,171 :: 		GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
	GOTO       L_GLCD_PutChar5734
L_GLCD_PutChar5735:
;myGLCD.c,172 :: 		}
	GOTO       L_GLCD_PutChar5737
L_GLCD_PutChar5730:
;myGLCD.c,175 :: 		GLCD_GotoXY(x, y);
	MOVF       FARG_GLCD_PutChar57_x+0, 0
	MOVWF      FARG_GLCD_GotoXY_page+0
	CLRF       FARG_GLCD_GotoXY_page+1
	MOVF       FARG_GLCD_PutChar57_y+0, 0
	MOVWF      FARG_GLCD_GotoXY_col+0
	CLRF       FARG_GLCD_GotoXY_col+1
	CALL       _GLCD_GotoXY+0
;myGLCD.c,176 :: 		for(i = 0; i < 5; i++)
	CLRF       GLCD_PutChar57_i_L0+0
L_GLCD_PutChar5738:
	MOVLW      5
	SUBWF      GLCD_PutChar57_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_GLCD_PutChar5739
;myGLCD.c,177 :: 		GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
	MOVLW      32
	SUBWF      FARG_GLCD_PutChar57_chr+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       GLCD_PutChar57_i_L0+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      _my_font5x7+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_my_font5x7+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_GLCD_SendData_myData+0
	CALL       _GLCD_SendData+0
;myGLCD.c,176 :: 		for(i = 0; i < 5; i++)
	INCF       GLCD_PutChar57_i_L0+0, 1
;myGLCD.c,177 :: 		GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
	GOTO       L_GLCD_PutChar5738
L_GLCD_PutChar5739:
;myGLCD.c,178 :: 		}
L_GLCD_PutChar5737:
;myGLCD.c,179 :: 		}
L_end_GLCD_PutChar57:
	RETURN
; end of _GLCD_PutChar57

_GLCD_Print57:

;myGLCD.c,181 :: 		void GLCD_Print57(unsigned char page, unsigned char col, char* str)
;myGLCD.c,184 :: 		j = col;
	MOVF       FARG_GLCD_Print57_col+0, 0
	MOVWF      GLCD_Print57_j_L0+0
;myGLCD.c,185 :: 		for( i = 0; str[i] != 0; i++)
	CLRF       GLCD_Print57_i_L0+0
L_GLCD_Print5741:
	MOVF       GLCD_Print57_i_L0+0, 0
	ADDWF      FARG_GLCD_Print57_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_GLCD_Print5742
;myGLCD.c,187 :: 		if(j>=128)
	MOVLW      128
	SUBWF      GLCD_Print57_j_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_GLCD_Print5744
;myGLCD.c,189 :: 		col = 0;
	CLRF       FARG_GLCD_Print57_col+0
;myGLCD.c,190 :: 		j = col;
	CLRF       GLCD_Print57_j_L0+0
;myGLCD.c,191 :: 		page++;
	INCF       FARG_GLCD_Print57_page+0, 1
;myGLCD.c,192 :: 		}
L_GLCD_Print5744:
;myGLCD.c,193 :: 		GLCD_PutChar57(page, j, str[i]);
	MOVF       FARG_GLCD_Print57_page+0, 0
	MOVWF      FARG_GLCD_PutChar57_x+0
	MOVF       GLCD_Print57_j_L0+0, 0
	MOVWF      FARG_GLCD_PutChar57_y+0
	MOVF       GLCD_Print57_i_L0+0, 0
	ADDWF      FARG_GLCD_Print57_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_GLCD_PutChar57_chr+0
	CALL       _GLCD_PutChar57+0
;myGLCD.c,194 :: 		j += 7;
	MOVLW      7
	ADDWF      GLCD_Print57_j_L0+0, 1
;myGLCD.c,185 :: 		for( i = 0; str[i] != 0; i++)
	INCF       GLCD_Print57_i_L0+0, 1
;myGLCD.c,195 :: 		}
	GOTO       L_GLCD_Print5741
L_GLCD_Print5742:
;myGLCD.c,196 :: 		}
L_end_GLCD_Print57:
	RETURN
; end of _GLCD_Print57

_GLCD_PutBMP:

;myGLCD.c,197 :: 		void GLCD_PutBMP(code unsigned char* bmp)
;myGLCD.c,201 :: 		for(line = 0; line < 8; line++)
	CLRF       GLCD_PutBMP_line_L0+0
L_GLCD_PutBMP45:
	MOVLW      8
	SUBWF      GLCD_PutBMP_line_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_GLCD_PutBMP46
;myGLCD.c,203 :: 		GLCD_GotoXY(line, 0);
	MOVF       GLCD_PutBMP_line_L0+0, 0
	MOVWF      FARG_GLCD_GotoXY_page+0
	CLRF       FARG_GLCD_GotoXY_page+1
	CLRF       FARG_GLCD_GotoXY_col+0
	CLRF       FARG_GLCD_GotoXY_col+1
	CALL       _GLCD_GotoXY+0
;myGLCD.c,204 :: 		for(col = 0; col < 64; col++)   //left
	CLRF       GLCD_PutBMP_col_L0+0
L_GLCD_PutBMP48:
	MOVLW      64
	SUBWF      GLCD_PutBMP_col_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_GLCD_PutBMP49
;myGLCD.c,206 :: 		i = 128 * line + col;
	MOVLW      7
	MOVWF      R2+0
	MOVF       GLCD_PutBMP_line_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R2+0, 0
L__GLCD_PutBMP83:
	BTFSC      STATUS+0, 2
	GOTO       L__GLCD_PutBMP84
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__GLCD_PutBMP83
L__GLCD_PutBMP84:
	MOVF       GLCD_PutBMP_col_L0+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
;myGLCD.c,207 :: 		GLCD_SendData(bmp[i]);
	MOVF       FARG_GLCD_PutBMP_bmp+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_GLCD_PutBMP_bmp+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_GLCD_SendData_myData+0
	CALL       _GLCD_SendData+0
;myGLCD.c,204 :: 		for(col = 0; col < 64; col++)   //left
	INCF       GLCD_PutBMP_col_L0+0, 1
;myGLCD.c,208 :: 		}
	GOTO       L_GLCD_PutBMP48
L_GLCD_PutBMP49:
;myGLCD.c,209 :: 		GLCD_GotoXY(line, 64);
	MOVF       GLCD_PutBMP_line_L0+0, 0
	MOVWF      FARG_GLCD_GotoXY_page+0
	CLRF       FARG_GLCD_GotoXY_page+1
	MOVLW      64
	MOVWF      FARG_GLCD_GotoXY_col+0
	MOVLW      0
	MOVWF      FARG_GLCD_GotoXY_col+1
	CALL       _GLCD_GotoXY+0
;myGLCD.c,210 :: 		for(col = 64; col < 128; col++) //right
	MOVLW      64
	MOVWF      GLCD_PutBMP_col_L0+0
L_GLCD_PutBMP51:
	MOVLW      128
	SUBWF      GLCD_PutBMP_col_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_GLCD_PutBMP52
;myGLCD.c,212 :: 		i = 128 * line + col;
	MOVLW      7
	MOVWF      R2+0
	MOVF       GLCD_PutBMP_line_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R2+0, 0
L__GLCD_PutBMP85:
	BTFSC      STATUS+0, 2
	GOTO       L__GLCD_PutBMP86
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__GLCD_PutBMP85
L__GLCD_PutBMP86:
	MOVF       GLCD_PutBMP_col_L0+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
;myGLCD.c,213 :: 		GLCD_SendData(bmp[i]);
	MOVF       FARG_GLCD_PutBMP_bmp+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_GLCD_PutBMP_bmp+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_GLCD_SendData_myData+0
	CALL       _GLCD_SendData+0
;myGLCD.c,210 :: 		for(col = 64; col < 128; col++) //right
	INCF       GLCD_PutBMP_col_L0+0, 1
;myGLCD.c,214 :: 		}
	GOTO       L_GLCD_PutBMP51
L_GLCD_PutBMP52:
;myGLCD.c,201 :: 		for(line = 0; line < 8; line++)
	INCF       GLCD_PutBMP_line_L0+0, 1
;myGLCD.c,215 :: 		}
	GOTO       L_GLCD_PutBMP45
L_GLCD_PutBMP46:
;myGLCD.c,216 :: 		}
L_end_GLCD_PutBMP:
	RETURN
; end of _GLCD_PutBMP
