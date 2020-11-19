
_Seconds_Run:

;seconds.h,9 :: 		void Seconds_Run(void)
;seconds.h,11 :: 		int i = 0;
	CLRF       Seconds_Run_i_L0+0
	CLRF       Seconds_Run_i_L0+1
;seconds.h,13 :: 		for(i = 0; i < 8; i++)
	CLRF       Seconds_Run_i_L0+0
	CLRF       Seconds_Run_i_L0+1
L_Seconds_Run0:
	MOVLW      128
	XORWF      Seconds_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Seconds_Run65
	MOVLW      8
	SUBWF      Seconds_Run_i_L0+0, 0
L__Seconds_Run65:
	BTFSC      STATUS+0, 0
	GOTO       L_Seconds_Run1
;seconds.h,15 :: 		IC74595_Seconds0_7(0x80 >> i);
	MOVF       Seconds_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_SeConds0_7_myData+0
	MOVF       R0+0, 0
L__Seconds_Run66:
	BTFSC      STATUS+0, 2
	GOTO       L__Seconds_Run67
	RRF        FARG_IC74595_SeConds0_7_myData+0, 1
	BCF        FARG_IC74595_SeConds0_7_myData+0, 7
	ADDLW      255
	GOTO       L__Seconds_Run66
L__Seconds_Run67:
	CALL       _IC74595_SeConds0_7+0
;seconds.h,16 :: 		Delay_ms(time);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Seconds_Run3:
	DECFSZ     R13+0, 1
	GOTO       L_Seconds_Run3
	DECFSZ     R12+0, 1
	GOTO       L_Seconds_Run3
	DECFSZ     R11+0, 1
	GOTO       L_Seconds_Run3
	NOP
;seconds.h,13 :: 		for(i = 0; i < 8; i++)
	INCF       Seconds_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Seconds_Run_i_L0+1, 1
;seconds.h,17 :: 		}
	GOTO       L_Seconds_Run0
L_Seconds_Run1:
;seconds.h,18 :: 		IC74595_Seconds0_7(0x00);
	CLRF       FARG_IC74595_SeConds0_7_myData+0
	CALL       _IC74595_SeConds0_7+0
;seconds.h,21 :: 		for(i = 0; i < 8; i++)
	CLRF       Seconds_Run_i_L0+0
	CLRF       Seconds_Run_i_L0+1
L_Seconds_Run4:
	MOVLW      128
	XORWF      Seconds_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Seconds_Run68
	MOVLW      8
	SUBWF      Seconds_Run_i_L0+0, 0
L__Seconds_Run68:
	BTFSC      STATUS+0, 0
	GOTO       L_Seconds_Run5
;seconds.h,23 :: 		IC74595_Seconds8_15(0x80 >> i);
	MOVF       Seconds_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_SeConds8_15_myData+0
	MOVF       R0+0, 0
L__Seconds_Run69:
	BTFSC      STATUS+0, 2
	GOTO       L__Seconds_Run70
	RRF        FARG_IC74595_SeConds8_15_myData+0, 1
	BCF        FARG_IC74595_SeConds8_15_myData+0, 7
	ADDLW      255
	GOTO       L__Seconds_Run69
L__Seconds_Run70:
	CALL       _IC74595_SeConds8_15+0
;seconds.h,24 :: 		Delay_ms(time);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Seconds_Run7:
	DECFSZ     R13+0, 1
	GOTO       L_Seconds_Run7
	DECFSZ     R12+0, 1
	GOTO       L_Seconds_Run7
	DECFSZ     R11+0, 1
	GOTO       L_Seconds_Run7
	NOP
;seconds.h,21 :: 		for(i = 0; i < 8; i++)
	INCF       Seconds_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Seconds_Run_i_L0+1, 1
;seconds.h,25 :: 		}
	GOTO       L_Seconds_Run4
L_Seconds_Run5:
;seconds.h,26 :: 		IC74595_Seconds8_15(0x00);
	CLRF       FARG_IC74595_SeConds8_15_myData+0
	CALL       _IC74595_SeConds8_15+0
;seconds.h,29 :: 		for(i = 0; i < 8; i++)
	CLRF       Seconds_Run_i_L0+0
	CLRF       Seconds_Run_i_L0+1
L_Seconds_Run8:
	MOVLW      128
	XORWF      Seconds_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Seconds_Run71
	MOVLW      8
	SUBWF      Seconds_Run_i_L0+0, 0
L__Seconds_Run71:
	BTFSC      STATUS+0, 0
	GOTO       L_Seconds_Run9
;seconds.h,31 :: 		IC74595_Seconds16_23(0x80 >> i);
	MOVF       Seconds_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_SeConds16_23_myData+0
	MOVF       R0+0, 0
L__Seconds_Run72:
	BTFSC      STATUS+0, 2
	GOTO       L__Seconds_Run73
	RRF        FARG_IC74595_SeConds16_23_myData+0, 1
	BCF        FARG_IC74595_SeConds16_23_myData+0, 7
	ADDLW      255
	GOTO       L__Seconds_Run72
L__Seconds_Run73:
	CALL       _IC74595_SeConds16_23+0
;seconds.h,32 :: 		Delay_ms(time);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Seconds_Run11:
	DECFSZ     R13+0, 1
	GOTO       L_Seconds_Run11
	DECFSZ     R12+0, 1
	GOTO       L_Seconds_Run11
	DECFSZ     R11+0, 1
	GOTO       L_Seconds_Run11
	NOP
;seconds.h,29 :: 		for(i = 0; i < 8; i++)
	INCF       Seconds_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Seconds_Run_i_L0+1, 1
;seconds.h,33 :: 		}
	GOTO       L_Seconds_Run8
L_Seconds_Run9:
;seconds.h,34 :: 		IC74595_Seconds16_23(0x00);
	CLRF       FARG_IC74595_SeConds16_23_myData+0
	CALL       _IC74595_SeConds16_23+0
;seconds.h,37 :: 		for(i = 0; i < 8; i++)
	CLRF       Seconds_Run_i_L0+0
	CLRF       Seconds_Run_i_L0+1
L_Seconds_Run12:
	MOVLW      128
	XORWF      Seconds_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Seconds_Run74
	MOVLW      8
	SUBWF      Seconds_Run_i_L0+0, 0
L__Seconds_Run74:
	BTFSC      STATUS+0, 0
	GOTO       L_Seconds_Run13
;seconds.h,39 :: 		IC74595_Seconds24_31(0x80 >> i);
	MOVF       Seconds_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_SeConds24_31_myData+0
	MOVF       R0+0, 0
L__Seconds_Run75:
	BTFSC      STATUS+0, 2
	GOTO       L__Seconds_Run76
	RRF        FARG_IC74595_SeConds24_31_myData+0, 1
	BCF        FARG_IC74595_SeConds24_31_myData+0, 7
	ADDLW      255
	GOTO       L__Seconds_Run75
L__Seconds_Run76:
	CALL       _IC74595_SeConds24_31+0
;seconds.h,40 :: 		Delay_ms(time);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Seconds_Run15:
	DECFSZ     R13+0, 1
	GOTO       L_Seconds_Run15
	DECFSZ     R12+0, 1
	GOTO       L_Seconds_Run15
	DECFSZ     R11+0, 1
	GOTO       L_Seconds_Run15
	NOP
;seconds.h,37 :: 		for(i = 0; i < 8; i++)
	INCF       Seconds_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Seconds_Run_i_L0+1, 1
;seconds.h,41 :: 		}
	GOTO       L_Seconds_Run12
L_Seconds_Run13:
;seconds.h,42 :: 		IC74595_Seconds24_31(0x00);
	CLRF       FARG_IC74595_SeConds24_31_myData+0
	CALL       _IC74595_SeConds24_31+0
;seconds.h,45 :: 		for(i = 0; i < 8; i++)
	CLRF       Seconds_Run_i_L0+0
	CLRF       Seconds_Run_i_L0+1
L_Seconds_Run16:
	MOVLW      128
	XORWF      Seconds_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Seconds_Run77
	MOVLW      8
	SUBWF      Seconds_Run_i_L0+0, 0
L__Seconds_Run77:
	BTFSC      STATUS+0, 0
	GOTO       L_Seconds_Run17
;seconds.h,47 :: 		IC74595_Seconds32_39(0x80 >> i);
	MOVF       Seconds_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_SeConds32_39_myData+0
	MOVF       R0+0, 0
L__Seconds_Run78:
	BTFSC      STATUS+0, 2
	GOTO       L__Seconds_Run79
	RRF        FARG_IC74595_SeConds32_39_myData+0, 1
	BCF        FARG_IC74595_SeConds32_39_myData+0, 7
	ADDLW      255
	GOTO       L__Seconds_Run78
L__Seconds_Run79:
	CALL       _IC74595_SeConds32_39+0
;seconds.h,48 :: 		Delay_ms(time);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Seconds_Run19:
	DECFSZ     R13+0, 1
	GOTO       L_Seconds_Run19
	DECFSZ     R12+0, 1
	GOTO       L_Seconds_Run19
	DECFSZ     R11+0, 1
	GOTO       L_Seconds_Run19
	NOP
;seconds.h,45 :: 		for(i = 0; i < 8; i++)
	INCF       Seconds_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Seconds_Run_i_L0+1, 1
;seconds.h,49 :: 		}
	GOTO       L_Seconds_Run16
L_Seconds_Run17:
;seconds.h,50 :: 		IC74595_Seconds32_39(0x00);
	CLRF       FARG_IC74595_SeConds32_39_myData+0
	CALL       _IC74595_SeConds32_39+0
;seconds.h,53 :: 		for(i = 0; i < 8; i++)
	CLRF       Seconds_Run_i_L0+0
	CLRF       Seconds_Run_i_L0+1
L_Seconds_Run20:
	MOVLW      128
	XORWF      Seconds_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Seconds_Run80
	MOVLW      8
	SUBWF      Seconds_Run_i_L0+0, 0
L__Seconds_Run80:
	BTFSC      STATUS+0, 0
	GOTO       L_Seconds_Run21
;seconds.h,55 :: 		IC74595_Seconds40_47(0x80 >> i);
	MOVF       Seconds_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_SeConds40_47_myData+0
	MOVF       R0+0, 0
L__Seconds_Run81:
	BTFSC      STATUS+0, 2
	GOTO       L__Seconds_Run82
	RRF        FARG_IC74595_SeConds40_47_myData+0, 1
	BCF        FARG_IC74595_SeConds40_47_myData+0, 7
	ADDLW      255
	GOTO       L__Seconds_Run81
L__Seconds_Run82:
	CALL       _IC74595_SeConds40_47+0
;seconds.h,56 :: 		Delay_ms(time);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Seconds_Run23:
	DECFSZ     R13+0, 1
	GOTO       L_Seconds_Run23
	DECFSZ     R12+0, 1
	GOTO       L_Seconds_Run23
	DECFSZ     R11+0, 1
	GOTO       L_Seconds_Run23
	NOP
;seconds.h,53 :: 		for(i = 0; i < 8; i++)
	INCF       Seconds_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Seconds_Run_i_L0+1, 1
;seconds.h,57 :: 		}
	GOTO       L_Seconds_Run20
L_Seconds_Run21:
;seconds.h,58 :: 		IC74595_Seconds40_47(0x00);
	CLRF       FARG_IC74595_SeConds40_47_myData+0
	CALL       _IC74595_SeConds40_47+0
;seconds.h,61 :: 		for(i = 0; i < 8; i++)
	CLRF       Seconds_Run_i_L0+0
	CLRF       Seconds_Run_i_L0+1
L_Seconds_Run24:
	MOVLW      128
	XORWF      Seconds_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Seconds_Run83
	MOVLW      8
	SUBWF      Seconds_Run_i_L0+0, 0
L__Seconds_Run83:
	BTFSC      STATUS+0, 0
	GOTO       L_Seconds_Run25
;seconds.h,63 :: 		IC74595_Seconds48_55(0x80 >> i);
	MOVF       Seconds_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_SeConds48_55_myData+0
	MOVF       R0+0, 0
L__Seconds_Run84:
	BTFSC      STATUS+0, 2
	GOTO       L__Seconds_Run85
	RRF        FARG_IC74595_SeConds48_55_myData+0, 1
	BCF        FARG_IC74595_SeConds48_55_myData+0, 7
	ADDLW      255
	GOTO       L__Seconds_Run84
L__Seconds_Run85:
	CALL       _IC74595_SeConds48_55+0
;seconds.h,64 :: 		Delay_ms(time);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Seconds_Run27:
	DECFSZ     R13+0, 1
	GOTO       L_Seconds_Run27
	DECFSZ     R12+0, 1
	GOTO       L_Seconds_Run27
	DECFSZ     R11+0, 1
	GOTO       L_Seconds_Run27
	NOP
;seconds.h,61 :: 		for(i = 0; i < 8; i++)
	INCF       Seconds_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Seconds_Run_i_L0+1, 1
;seconds.h,65 :: 		}
	GOTO       L_Seconds_Run24
L_Seconds_Run25:
;seconds.h,66 :: 		IC74595_Seconds48_55(0x00);
	CLRF       FARG_IC74595_SeConds48_55_myData+0
	CALL       _IC74595_SeConds48_55+0
;seconds.h,69 :: 		for(i = 0; i < 5; i++)
	CLRF       Seconds_Run_i_L0+0
	CLRF       Seconds_Run_i_L0+1
L_Seconds_Run28:
	MOVLW      128
	XORWF      Seconds_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Seconds_Run86
	MOVLW      5
	SUBWF      Seconds_Run_i_L0+0, 0
L__Seconds_Run86:
	BTFSC      STATUS+0, 0
	GOTO       L_Seconds_Run29
;seconds.h,71 :: 		IC74595_Seconds56_59(0x80 >> i);
	MOVF       Seconds_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_SeConds56_59_myData+0
	MOVF       R0+0, 0
L__Seconds_Run87:
	BTFSC      STATUS+0, 2
	GOTO       L__Seconds_Run88
	RRF        FARG_IC74595_SeConds56_59_myData+0, 1
	BCF        FARG_IC74595_SeConds56_59_myData+0, 7
	ADDLW      255
	GOTO       L__Seconds_Run87
L__Seconds_Run88:
	CALL       _IC74595_SeConds56_59+0
;seconds.h,72 :: 		Delay_ms(time);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Seconds_Run31:
	DECFSZ     R13+0, 1
	GOTO       L_Seconds_Run31
	DECFSZ     R12+0, 1
	GOTO       L_Seconds_Run31
	DECFSZ     R11+0, 1
	GOTO       L_Seconds_Run31
	NOP
;seconds.h,69 :: 		for(i = 0; i < 5; i++)
	INCF       Seconds_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Seconds_Run_i_L0+1, 1
;seconds.h,73 :: 		}
	GOTO       L_Seconds_Run28
L_Seconds_Run29:
;seconds.h,74 :: 		IC74595_Seconds56_59(0x00);
	CLRF       FARG_IC74595_SeConds56_59_myData+0
	CALL       _IC74595_SeConds56_59+0
;seconds.h,75 :: 		}
L_end_Seconds_Run:
	RETURN
; end of _Seconds_Run

_Minute_Run:

;minute.h,7 :: 		void Minute_Run(void)
;minute.h,9 :: 		int i = 0;
	CLRF       Minute_Run_i_L0+0
	CLRF       Minute_Run_i_L0+1
;minute.h,11 :: 		for(i = 0; i < 8; i++)
	CLRF       Minute_Run_i_L0+0
	CLRF       Minute_Run_i_L0+1
L_Minute_Run32:
	MOVLW      128
	XORWF      Minute_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Minute_Run90
	MOVLW      8
	SUBWF      Minute_Run_i_L0+0, 0
L__Minute_Run90:
	BTFSC      STATUS+0, 0
	GOTO       L_Minute_Run33
;minute.h,13 :: 		IC74595_Minute0_7(0x80 >> i);
	MOVF       Minute_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Minute0_7_myData+0
	MOVF       R0+0, 0
L__Minute_Run91:
	BTFSC      STATUS+0, 2
	GOTO       L__Minute_Run92
	RRF        FARG_IC74595_Minute0_7_myData+0, 1
	BCF        FARG_IC74595_Minute0_7_myData+0, 7
	ADDLW      255
	GOTO       L__Minute_Run91
L__Minute_Run92:
	CALL       _IC74595_Minute0_7+0
;minute.h,14 :: 		Seconds_Run();
	CALL       _Seconds_Run+0
;minute.h,11 :: 		for(i = 0; i < 8; i++)
	INCF       Minute_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Minute_Run_i_L0+1, 1
;minute.h,15 :: 		}
	GOTO       L_Minute_Run32
L_Minute_Run33:
;minute.h,16 :: 		IC74595_Minute0_7(0x00);
	CLRF       FARG_IC74595_Minute0_7_myData+0
	CALL       _IC74595_Minute0_7+0
;minute.h,19 :: 		for(i = 0; i < 8; i++)
	CLRF       Minute_Run_i_L0+0
	CLRF       Minute_Run_i_L0+1
L_Minute_Run35:
	MOVLW      128
	XORWF      Minute_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Minute_Run93
	MOVLW      8
	SUBWF      Minute_Run_i_L0+0, 0
L__Minute_Run93:
	BTFSC      STATUS+0, 0
	GOTO       L_Minute_Run36
;minute.h,21 :: 		IC74595_Minute8_15(0x80 >> i);
	MOVF       Minute_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Minute8_15_myData+0
	MOVF       R0+0, 0
L__Minute_Run94:
	BTFSC      STATUS+0, 2
	GOTO       L__Minute_Run95
	RRF        FARG_IC74595_Minute8_15_myData+0, 1
	BCF        FARG_IC74595_Minute8_15_myData+0, 7
	ADDLW      255
	GOTO       L__Minute_Run94
L__Minute_Run95:
	CALL       _IC74595_Minute8_15+0
;minute.h,22 :: 		Seconds_Run();
	CALL       _Seconds_Run+0
;minute.h,19 :: 		for(i = 0; i < 8; i++)
	INCF       Minute_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Minute_Run_i_L0+1, 1
;minute.h,23 :: 		}
	GOTO       L_Minute_Run35
L_Minute_Run36:
;minute.h,24 :: 		IC74595_Minute8_15(0x00);
	CLRF       FARG_IC74595_Minute8_15_myData+0
	CALL       _IC74595_Minute8_15+0
;minute.h,27 :: 		for(i = 0; i < 8; i++)
	CLRF       Minute_Run_i_L0+0
	CLRF       Minute_Run_i_L0+1
L_Minute_Run38:
	MOVLW      128
	XORWF      Minute_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Minute_Run96
	MOVLW      8
	SUBWF      Minute_Run_i_L0+0, 0
L__Minute_Run96:
	BTFSC      STATUS+0, 0
	GOTO       L_Minute_Run39
;minute.h,29 :: 		IC74595_Minute16_23(0x80 >> i);
	MOVF       Minute_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Minute16_23_myData+0
	MOVF       R0+0, 0
L__Minute_Run97:
	BTFSC      STATUS+0, 2
	GOTO       L__Minute_Run98
	RRF        FARG_IC74595_Minute16_23_myData+0, 1
	BCF        FARG_IC74595_Minute16_23_myData+0, 7
	ADDLW      255
	GOTO       L__Minute_Run97
L__Minute_Run98:
	CALL       _IC74595_Minute16_23+0
;minute.h,30 :: 		Seconds_Run();
	CALL       _Seconds_Run+0
;minute.h,27 :: 		for(i = 0; i < 8; i++)
	INCF       Minute_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Minute_Run_i_L0+1, 1
;minute.h,31 :: 		}
	GOTO       L_Minute_Run38
L_Minute_Run39:
;minute.h,32 :: 		IC74595_Seconds16_23(0x00);
	CLRF       FARG_IC74595_SeConds16_23_myData+0
	CALL       _IC74595_SeConds16_23+0
;minute.h,35 :: 		for(i = 0; i < 8; i++)
	CLRF       Minute_Run_i_L0+0
	CLRF       Minute_Run_i_L0+1
L_Minute_Run41:
	MOVLW      128
	XORWF      Minute_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Minute_Run99
	MOVLW      8
	SUBWF      Minute_Run_i_L0+0, 0
L__Minute_Run99:
	BTFSC      STATUS+0, 0
	GOTO       L_Minute_Run42
;minute.h,37 :: 		IC74595_Minute24_31(0x80 >> i);
	MOVF       Minute_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Minute24_31_myData+0
	MOVF       R0+0, 0
L__Minute_Run100:
	BTFSC      STATUS+0, 2
	GOTO       L__Minute_Run101
	RRF        FARG_IC74595_Minute24_31_myData+0, 1
	BCF        FARG_IC74595_Minute24_31_myData+0, 7
	ADDLW      255
	GOTO       L__Minute_Run100
L__Minute_Run101:
	CALL       _IC74595_Minute24_31+0
;minute.h,38 :: 		Seconds_Run();
	CALL       _Seconds_Run+0
;minute.h,35 :: 		for(i = 0; i < 8; i++)
	INCF       Minute_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Minute_Run_i_L0+1, 1
;minute.h,39 :: 		}
	GOTO       L_Minute_Run41
L_Minute_Run42:
;minute.h,40 :: 		IC74595_Minute24_31(0x00);
	CLRF       FARG_IC74595_Minute24_31_myData+0
	CALL       _IC74595_Minute24_31+0
;minute.h,43 :: 		for(i = 0; i < 8; i++)
	CLRF       Minute_Run_i_L0+0
	CLRF       Minute_Run_i_L0+1
L_Minute_Run44:
	MOVLW      128
	XORWF      Minute_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Minute_Run102
	MOVLW      8
	SUBWF      Minute_Run_i_L0+0, 0
L__Minute_Run102:
	BTFSC      STATUS+0, 0
	GOTO       L_Minute_Run45
;minute.h,45 :: 		IC74595_Minute32_39(0x80 >> i);
	MOVF       Minute_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Minute32_39_myData+0
	MOVF       R0+0, 0
L__Minute_Run103:
	BTFSC      STATUS+0, 2
	GOTO       L__Minute_Run104
	RRF        FARG_IC74595_Minute32_39_myData+0, 1
	BCF        FARG_IC74595_Minute32_39_myData+0, 7
	ADDLW      255
	GOTO       L__Minute_Run103
L__Minute_Run104:
	CALL       _IC74595_Minute32_39+0
;minute.h,46 :: 		Seconds_Run();
	CALL       _Seconds_Run+0
;minute.h,43 :: 		for(i = 0; i < 8; i++)
	INCF       Minute_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Minute_Run_i_L0+1, 1
;minute.h,47 :: 		}
	GOTO       L_Minute_Run44
L_Minute_Run45:
;minute.h,48 :: 		IC74595_Minute32_39(0x00);
	CLRF       FARG_IC74595_Minute32_39_myData+0
	CALL       _IC74595_Minute32_39+0
;minute.h,51 :: 		for(i = 0; i < 8; i++)
	CLRF       Minute_Run_i_L0+0
	CLRF       Minute_Run_i_L0+1
L_Minute_Run47:
	MOVLW      128
	XORWF      Minute_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Minute_Run105
	MOVLW      8
	SUBWF      Minute_Run_i_L0+0, 0
L__Minute_Run105:
	BTFSC      STATUS+0, 0
	GOTO       L_Minute_Run48
;minute.h,53 :: 		IC74595_Minute40_47(0x80 >> i);
	MOVF       Minute_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Minute40_47_myData+0
	MOVF       R0+0, 0
L__Minute_Run106:
	BTFSC      STATUS+0, 2
	GOTO       L__Minute_Run107
	RRF        FARG_IC74595_Minute40_47_myData+0, 1
	BCF        FARG_IC74595_Minute40_47_myData+0, 7
	ADDLW      255
	GOTO       L__Minute_Run106
L__Minute_Run107:
	CALL       _IC74595_Minute40_47+0
;minute.h,54 :: 		Seconds_Run();
	CALL       _Seconds_Run+0
;minute.h,51 :: 		for(i = 0; i < 8; i++)
	INCF       Minute_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Minute_Run_i_L0+1, 1
;minute.h,55 :: 		}
	GOTO       L_Minute_Run47
L_Minute_Run48:
;minute.h,56 :: 		IC74595_Minute40_47(0x00);
	CLRF       FARG_IC74595_Minute40_47_myData+0
	CALL       _IC74595_Minute40_47+0
;minute.h,59 :: 		for(i = 0; i < 8; i++)
	CLRF       Minute_Run_i_L0+0
	CLRF       Minute_Run_i_L0+1
L_Minute_Run50:
	MOVLW      128
	XORWF      Minute_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Minute_Run108
	MOVLW      8
	SUBWF      Minute_Run_i_L0+0, 0
L__Minute_Run108:
	BTFSC      STATUS+0, 0
	GOTO       L_Minute_Run51
;minute.h,61 :: 		IC74595_Minute48_55(0x80 >> i);
	MOVF       Minute_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Minute48_55_myData+0
	MOVF       R0+0, 0
L__Minute_Run109:
	BTFSC      STATUS+0, 2
	GOTO       L__Minute_Run110
	RRF        FARG_IC74595_Minute48_55_myData+0, 1
	BCF        FARG_IC74595_Minute48_55_myData+0, 7
	ADDLW      255
	GOTO       L__Minute_Run109
L__Minute_Run110:
	CALL       _IC74595_Minute48_55+0
;minute.h,62 :: 		Seconds_Run();
	CALL       _Seconds_Run+0
;minute.h,59 :: 		for(i = 0; i < 8; i++)
	INCF       Minute_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Minute_Run_i_L0+1, 1
;minute.h,63 :: 		}
	GOTO       L_Minute_Run50
L_Minute_Run51:
;minute.h,64 :: 		IC74595_Minute48_55(0x00);
	CLRF       FARG_IC74595_Minute48_55_myData+0
	CALL       _IC74595_Minute48_55+0
;minute.h,67 :: 		for(i = 0; i < 5; i++)
	CLRF       Minute_Run_i_L0+0
	CLRF       Minute_Run_i_L0+1
L_Minute_Run53:
	MOVLW      128
	XORWF      Minute_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Minute_Run111
	MOVLW      5
	SUBWF      Minute_Run_i_L0+0, 0
L__Minute_Run111:
	BTFSC      STATUS+0, 0
	GOTO       L_Minute_Run54
;minute.h,69 :: 		IC74595_Minute56_59(0x80 >> i);
	MOVF       Minute_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Minute56_59_myData+0
	MOVF       R0+0, 0
L__Minute_Run112:
	BTFSC      STATUS+0, 2
	GOTO       L__Minute_Run113
	RRF        FARG_IC74595_Minute56_59_myData+0, 1
	BCF        FARG_IC74595_Minute56_59_myData+0, 7
	ADDLW      255
	GOTO       L__Minute_Run112
L__Minute_Run113:
	CALL       _IC74595_Minute56_59+0
;minute.h,70 :: 		Seconds_Run();
	CALL       _Seconds_Run+0
;minute.h,67 :: 		for(i = 0; i < 5; i++)
	INCF       Minute_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Minute_Run_i_L0+1, 1
;minute.h,71 :: 		}
	GOTO       L_Minute_Run53
L_Minute_Run54:
;minute.h,72 :: 		IC74595_Minute56_59(0x00);
	CLRF       FARG_IC74595_Minute56_59_myData+0
	CALL       _IC74595_Minute56_59+0
;minute.h,73 :: 		}
L_end_Minute_Run:
	RETURN
; end of _Minute_Run

_Hour_Run:

;hour.h,8 :: 		void Hour_Run(void)
;hour.h,10 :: 		int i = 0;
	CLRF       Hour_Run_i_L0+0
	CLRF       Hour_Run_i_L0+1
;hour.h,13 :: 		for(i = 0; i < 8; i++)
	CLRF       Hour_Run_i_L0+0
	CLRF       Hour_Run_i_L0+1
L_Hour_Run56:
	MOVLW      128
	XORWF      Hour_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Hour_Run115
	MOVLW      8
	SUBWF      Hour_Run_i_L0+0, 0
L__Hour_Run115:
	BTFSC      STATUS+0, 0
	GOTO       L_Hour_Run57
;hour.h,15 :: 		IC74595_Hour0_7(0x80>>i);
	MOVF       Hour_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Hour0_7_myData+0
	MOVF       R0+0, 0
L__Hour_Run116:
	BTFSC      STATUS+0, 2
	GOTO       L__Hour_Run117
	RRF        FARG_IC74595_Hour0_7_myData+0, 1
	BCF        FARG_IC74595_Hour0_7_myData+0, 7
	ADDLW      255
	GOTO       L__Hour_Run116
L__Hour_Run117:
	CALL       _IC74595_Hour0_7+0
;hour.h,16 :: 		Minute_Run();
	CALL       _Minute_Run+0
;hour.h,13 :: 		for(i = 0; i < 8; i++)
	INCF       Hour_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Hour_Run_i_L0+1, 1
;hour.h,17 :: 		}
	GOTO       L_Hour_Run56
L_Hour_Run57:
;hour.h,20 :: 		for(i = 0; i < 4; i++)
	CLRF       Hour_Run_i_L0+0
	CLRF       Hour_Run_i_L0+1
L_Hour_Run59:
	MOVLW      128
	XORWF      Hour_Run_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Hour_Run118
	MOVLW      4
	SUBWF      Hour_Run_i_L0+0, 0
L__Hour_Run118:
	BTFSC      STATUS+0, 0
	GOTO       L_Hour_Run60
;hour.h,22 :: 		IC74595_Hour8_11(0x80>>i);
	MOVF       Hour_Run_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	MOVWF      FARG_IC74595_Hour8_11_myData+0
	MOVF       R0+0, 0
L__Hour_Run119:
	BTFSC      STATUS+0, 2
	GOTO       L__Hour_Run120
	RRF        FARG_IC74595_Hour8_11_myData+0, 1
	BCF        FARG_IC74595_Hour8_11_myData+0, 7
	ADDLW      255
	GOTO       L__Hour_Run119
L__Hour_Run120:
	CALL       _IC74595_Hour8_11+0
;hour.h,23 :: 		Minute_Run();
	CALL       _Minute_Run+0
;hour.h,20 :: 		for(i = 0; i < 4; i++)
	INCF       Hour_Run_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Hour_Run_i_L0+1, 1
;hour.h,24 :: 		}
	GOTO       L_Hour_Run59
L_Hour_Run60:
;hour.h,25 :: 		}
L_end_Hour_Run:
	RETURN
; end of _Hour_Run

_main:

;main.c,9 :: 		void main()
;main.c,11 :: 		int i = 0;
;main.c,12 :: 		CLOCK_TRIS = 0x00;
	CLRF       TRISB+0
;main.c,13 :: 		SECONDS_TRIS = 0x00;
	CLRF       TRISC+0
;main.c,14 :: 		MINUTE_TRIS = 0x00;
	CLRF       TRISD+0
;main.c,16 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;main.c,17 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;main.c,18 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;main.c,21 :: 		while(1)
L_main62:
;main.c,25 :: 		IC74595_Minute0_7(0x80);
	MOVLW      128
	MOVWF      FARG_IC74595_Minute0_7_myData+0
	CALL       _IC74595_Minute0_7+0
;main.c,35 :: 		}
	GOTO       L_main62
;main.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
