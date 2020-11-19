
_IC74595_SeConds0_7:

;ic74595_lib.c,30 :: 		void IC74595_SeConds0_7(unsigned char myData)
;ic74595_lib.c,33 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_SeConds0_70:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_SeConds0_71
;ic74595_lib.c,36 :: 		if(myData & 0x80) DSS0 = 1;
	BTFSS      FARG_IC74595_SeConds0_7_myData+0, 7
	GOTO       L_IC74595_SeConds0_73
	BSF        PORTC+0, 0
	GOTO       L_IC74595_SeConds0_74
L_IC74595_SeConds0_73:
;ic74595_lib.c,37 :: 		else DSS0 = 0;
	BCF        PORTC+0, 0
L_IC74595_SeConds0_74:
;ic74595_lib.c,38 :: 		myData <<= 1;
	RLF        FARG_IC74595_SeConds0_7_myData+0, 1
	BCF        FARG_IC74595_SeConds0_7_myData+0, 0
;ic74595_lib.c,41 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,42 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,33 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,43 :: 		}
	GOTO       L_IC74595_SeConds0_70
L_IC74595_SeConds0_71:
;ic74595_lib.c,45 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,46 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,47 :: 		}
L_end_IC74595_SeConds0_7:
	RETURN
; end of _IC74595_SeConds0_7

_IC74595_SeConds8_15:

;ic74595_lib.c,48 :: 		void IC74595_SeConds8_15(unsigned char myData)
;ic74595_lib.c,51 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_SeConds8_155:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_SeConds8_156
;ic74595_lib.c,54 :: 		if(myData & 0x80) DSS1 = 1;
	BTFSS      FARG_IC74595_SeConds8_15_myData+0, 7
	GOTO       L_IC74595_SeConds8_158
	BSF        PORTC+0, 1
	GOTO       L_IC74595_SeConds8_159
L_IC74595_SeConds8_158:
;ic74595_lib.c,55 :: 		else DSS1 = 0;
	BCF        PORTC+0, 1
L_IC74595_SeConds8_159:
;ic74595_lib.c,56 :: 		myData <<= 1;
	RLF        FARG_IC74595_SeConds8_15_myData+0, 1
	BCF        FARG_IC74595_SeConds8_15_myData+0, 0
;ic74595_lib.c,59 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,60 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,51 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,61 :: 		}
	GOTO       L_IC74595_SeConds8_155
L_IC74595_SeConds8_156:
;ic74595_lib.c,63 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,64 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,65 :: 		}
L_end_IC74595_SeConds8_15:
	RETURN
; end of _IC74595_SeConds8_15

_IC74595_SeConds16_23:

;ic74595_lib.c,66 :: 		void IC74595_SeConds16_23(unsigned char myData)
;ic74595_lib.c,69 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_SeConds16_2310:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_SeConds16_2311
;ic74595_lib.c,72 :: 		if(myData & 0x80) DSS2 = 1;
	BTFSS      FARG_IC74595_SeConds16_23_myData+0, 7
	GOTO       L_IC74595_SeConds16_2313
	BSF        PORTC+0, 2
	GOTO       L_IC74595_SeConds16_2314
L_IC74595_SeConds16_2313:
;ic74595_lib.c,73 :: 		else DSS2 = 0;
	BCF        PORTC+0, 2
L_IC74595_SeConds16_2314:
;ic74595_lib.c,74 :: 		myData <<= 1;
	RLF        FARG_IC74595_SeConds16_23_myData+0, 1
	BCF        FARG_IC74595_SeConds16_23_myData+0, 0
;ic74595_lib.c,77 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,78 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,69 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,79 :: 		}
	GOTO       L_IC74595_SeConds16_2310
L_IC74595_SeConds16_2311:
;ic74595_lib.c,81 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,82 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,83 :: 		}
L_end_IC74595_SeConds16_23:
	RETURN
; end of _IC74595_SeConds16_23

_IC74595_SeConds24_31:

;ic74595_lib.c,84 :: 		void IC74595_SeConds24_31(unsigned char myData)
;ic74595_lib.c,87 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_SeConds24_3115:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_SeConds24_3116
;ic74595_lib.c,90 :: 		if(myData & 0x80) DSS3 = 1;
	BTFSS      FARG_IC74595_SeConds24_31_myData+0, 7
	GOTO       L_IC74595_SeConds24_3118
	BSF        PORTC+0, 3
	GOTO       L_IC74595_SeConds24_3119
L_IC74595_SeConds24_3118:
;ic74595_lib.c,91 :: 		else DSS3 = 0;
	BCF        PORTC+0, 3
L_IC74595_SeConds24_3119:
;ic74595_lib.c,92 :: 		myData <<= 1;
	RLF        FARG_IC74595_SeConds24_31_myData+0, 1
	BCF        FARG_IC74595_SeConds24_31_myData+0, 0
;ic74595_lib.c,95 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,96 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,87 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,97 :: 		}
	GOTO       L_IC74595_SeConds24_3115
L_IC74595_SeConds24_3116:
;ic74595_lib.c,99 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,100 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,101 :: 		}
L_end_IC74595_SeConds24_31:
	RETURN
; end of _IC74595_SeConds24_31

_IC74595_SeConds32_39:

;ic74595_lib.c,102 :: 		void IC74595_SeConds32_39(unsigned char myData)
;ic74595_lib.c,105 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_SeConds32_3920:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_SeConds32_3921
;ic74595_lib.c,108 :: 		if(myData & 0x80) DSS4 = 1;
	BTFSS      FARG_IC74595_SeConds32_39_myData+0, 7
	GOTO       L_IC74595_SeConds32_3923
	BSF        PORTC+0, 4
	GOTO       L_IC74595_SeConds32_3924
L_IC74595_SeConds32_3923:
;ic74595_lib.c,109 :: 		else DSS4 = 0;
	BCF        PORTC+0, 4
L_IC74595_SeConds32_3924:
;ic74595_lib.c,110 :: 		myData <<= 1;
	RLF        FARG_IC74595_SeConds32_39_myData+0, 1
	BCF        FARG_IC74595_SeConds32_39_myData+0, 0
;ic74595_lib.c,113 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,114 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,105 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,115 :: 		}
	GOTO       L_IC74595_SeConds32_3920
L_IC74595_SeConds32_3921:
;ic74595_lib.c,117 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,118 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,119 :: 		}
L_end_IC74595_SeConds32_39:
	RETURN
; end of _IC74595_SeConds32_39

_IC74595_SeConds40_47:

;ic74595_lib.c,120 :: 		void IC74595_SeConds40_47(unsigned char myData)
;ic74595_lib.c,123 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_SeConds40_4725:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_SeConds40_4726
;ic74595_lib.c,126 :: 		if(myData & 0x80) DSS5 = 1;
	BTFSS      FARG_IC74595_SeConds40_47_myData+0, 7
	GOTO       L_IC74595_SeConds40_4728
	BSF        PORTC+0, 5
	GOTO       L_IC74595_SeConds40_4729
L_IC74595_SeConds40_4728:
;ic74595_lib.c,127 :: 		else DSS5 = 0;
	BCF        PORTC+0, 5
L_IC74595_SeConds40_4729:
;ic74595_lib.c,128 :: 		myData <<= 1;
	RLF        FARG_IC74595_SeConds40_47_myData+0, 1
	BCF        FARG_IC74595_SeConds40_47_myData+0, 0
;ic74595_lib.c,131 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,132 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,123 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,133 :: 		}
	GOTO       L_IC74595_SeConds40_4725
L_IC74595_SeConds40_4726:
;ic74595_lib.c,135 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,136 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,137 :: 		}
L_end_IC74595_SeConds40_47:
	RETURN
; end of _IC74595_SeConds40_47

_IC74595_SeConds48_55:

;ic74595_lib.c,138 :: 		void IC74595_SeConds48_55(unsigned char myData)
;ic74595_lib.c,141 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_SeConds48_5530:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_SeConds48_5531
;ic74595_lib.c,144 :: 		if(myData & 0x80) DSS6 = 1;
	BTFSS      FARG_IC74595_SeConds48_55_myData+0, 7
	GOTO       L_IC74595_SeConds48_5533
	BSF        PORTC+0, 6
	GOTO       L_IC74595_SeConds48_5534
L_IC74595_SeConds48_5533:
;ic74595_lib.c,145 :: 		else DSS6 = 0;
	BCF        PORTC+0, 6
L_IC74595_SeConds48_5534:
;ic74595_lib.c,146 :: 		myData <<= 1;
	RLF        FARG_IC74595_SeConds48_55_myData+0, 1
	BCF        FARG_IC74595_SeConds48_55_myData+0, 0
;ic74595_lib.c,149 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,150 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,141 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,151 :: 		}
	GOTO       L_IC74595_SeConds48_5530
L_IC74595_SeConds48_5531:
;ic74595_lib.c,153 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,154 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,155 :: 		}
L_end_IC74595_SeConds48_55:
	RETURN
; end of _IC74595_SeConds48_55

_IC74595_Seconds56_59:

;ic74595_lib.c,156 :: 		void IC74595_Seconds56_59(unsigned char myData)
;ic74595_lib.c,159 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Seconds56_5935:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Seconds56_5936
;ic74595_lib.c,162 :: 		if(myData & 0x80) DSS7 = 1;
	BTFSS      FARG_IC74595_Seconds56_59_myData+0, 7
	GOTO       L_IC74595_Seconds56_5938
	BSF        PORTC+0, 7
	GOTO       L_IC74595_Seconds56_5939
L_IC74595_Seconds56_5938:
;ic74595_lib.c,163 :: 		else DSS7 = 0;
	BCF        PORTC+0, 7
L_IC74595_Seconds56_5939:
;ic74595_lib.c,164 :: 		myData <<= 1;
	RLF        FARG_IC74595_Seconds56_59_myData+0, 1
	BCF        FARG_IC74595_Seconds56_59_myData+0, 0
;ic74595_lib.c,167 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,168 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,159 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,169 :: 		}
	GOTO       L_IC74595_Seconds56_5935
L_IC74595_Seconds56_5936:
;ic74595_lib.c,171 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,172 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,173 :: 		}
L_end_IC74595_Seconds56_59:
	RETURN
; end of _IC74595_Seconds56_59

_IC74595_Minute0_7:

;ic74595_lib.c,178 :: 		void IC74595_Minute0_7(unsigned char myData)
;ic74595_lib.c,181 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Minute0_740:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Minute0_741
;ic74595_lib.c,184 :: 		if(myData & 0x80) DSM0 = 1;
	BTFSS      FARG_IC74595_Minute0_7_myData+0, 7
	GOTO       L_IC74595_Minute0_743
	BSF        PORTD+0, 0
	GOTO       L_IC74595_Minute0_744
L_IC74595_Minute0_743:
;ic74595_lib.c,185 :: 		else DSM0 = 0;
	BCF        PORTD+0, 0
L_IC74595_Minute0_744:
;ic74595_lib.c,186 :: 		myData <<= 1;
	RLF        FARG_IC74595_Minute0_7_myData+0, 1
	BCF        FARG_IC74595_Minute0_7_myData+0, 0
;ic74595_lib.c,189 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,190 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,181 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,191 :: 		}
	GOTO       L_IC74595_Minute0_740
L_IC74595_Minute0_741:
;ic74595_lib.c,193 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,194 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,195 :: 		}
L_end_IC74595_Minute0_7:
	RETURN
; end of _IC74595_Minute0_7

_IC74595_Minute8_15:

;ic74595_lib.c,196 :: 		void IC74595_Minute8_15(unsigned char myData)
;ic74595_lib.c,199 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Minute8_1545:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Minute8_1546
;ic74595_lib.c,202 :: 		if(myData & 0x80) DSM1 = 1;
	BTFSS      FARG_IC74595_Minute8_15_myData+0, 7
	GOTO       L_IC74595_Minute8_1548
	BSF        PORTD+0, 1
	GOTO       L_IC74595_Minute8_1549
L_IC74595_Minute8_1548:
;ic74595_lib.c,203 :: 		else DSM1 = 0;
	BCF        PORTD+0, 1
L_IC74595_Minute8_1549:
;ic74595_lib.c,204 :: 		myData <<= 1;
	RLF        FARG_IC74595_Minute8_15_myData+0, 1
	BCF        FARG_IC74595_Minute8_15_myData+0, 0
;ic74595_lib.c,207 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,208 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,199 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,209 :: 		}
	GOTO       L_IC74595_Minute8_1545
L_IC74595_Minute8_1546:
;ic74595_lib.c,211 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,212 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,213 :: 		}
L_end_IC74595_Minute8_15:
	RETURN
; end of _IC74595_Minute8_15

_IC74595_Minute16_23:

;ic74595_lib.c,214 :: 		void IC74595_Minute16_23(unsigned char myData)
;ic74595_lib.c,217 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Minute16_2350:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Minute16_2351
;ic74595_lib.c,220 :: 		if(myData & 0x80) DSM2 = 1;
	BTFSS      FARG_IC74595_Minute16_23_myData+0, 7
	GOTO       L_IC74595_Minute16_2353
	BSF        PORTD+0, 2
	GOTO       L_IC74595_Minute16_2354
L_IC74595_Minute16_2353:
;ic74595_lib.c,221 :: 		else DSM2 = 0;
	BCF        PORTD+0, 2
L_IC74595_Minute16_2354:
;ic74595_lib.c,222 :: 		myData <<= 1;
	RLF        FARG_IC74595_Minute16_23_myData+0, 1
	BCF        FARG_IC74595_Minute16_23_myData+0, 0
;ic74595_lib.c,225 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,226 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,217 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,227 :: 		}
	GOTO       L_IC74595_Minute16_2350
L_IC74595_Minute16_2351:
;ic74595_lib.c,229 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,230 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,231 :: 		}
L_end_IC74595_Minute16_23:
	RETURN
; end of _IC74595_Minute16_23

_IC74595_Minute24_31:

;ic74595_lib.c,232 :: 		void IC74595_Minute24_31(unsigned char myData)
;ic74595_lib.c,235 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Minute24_3155:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Minute24_3156
;ic74595_lib.c,238 :: 		if(myData & 0x80) DSM3 = 1;
	BTFSS      FARG_IC74595_Minute24_31_myData+0, 7
	GOTO       L_IC74595_Minute24_3158
	BSF        PORTD+0, 3
	GOTO       L_IC74595_Minute24_3159
L_IC74595_Minute24_3158:
;ic74595_lib.c,239 :: 		else DSM3 = 0;
	BCF        PORTD+0, 3
L_IC74595_Minute24_3159:
;ic74595_lib.c,240 :: 		myData <<= 1;
	RLF        FARG_IC74595_Minute24_31_myData+0, 1
	BCF        FARG_IC74595_Minute24_31_myData+0, 0
;ic74595_lib.c,243 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,244 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,235 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,245 :: 		}
	GOTO       L_IC74595_Minute24_3155
L_IC74595_Minute24_3156:
;ic74595_lib.c,247 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,248 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,249 :: 		}
L_end_IC74595_Minute24_31:
	RETURN
; end of _IC74595_Minute24_31

_IC74595_Minute32_39:

;ic74595_lib.c,250 :: 		void IC74595_Minute32_39(unsigned char myData)
;ic74595_lib.c,253 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Minute32_3960:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Minute32_3961
;ic74595_lib.c,256 :: 		if(myData & 0x80) DSM4 = 1;
	BTFSS      FARG_IC74595_Minute32_39_myData+0, 7
	GOTO       L_IC74595_Minute32_3963
	BSF        PORTD+0, 4
	GOTO       L_IC74595_Minute32_3964
L_IC74595_Minute32_3963:
;ic74595_lib.c,257 :: 		else DSM4 = 0;
	BCF        PORTD+0, 4
L_IC74595_Minute32_3964:
;ic74595_lib.c,258 :: 		myData <<= 1;
	RLF        FARG_IC74595_Minute32_39_myData+0, 1
	BCF        FARG_IC74595_Minute32_39_myData+0, 0
;ic74595_lib.c,261 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,262 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,253 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,263 :: 		}
	GOTO       L_IC74595_Minute32_3960
L_IC74595_Minute32_3961:
;ic74595_lib.c,265 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,266 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,267 :: 		}
L_end_IC74595_Minute32_39:
	RETURN
; end of _IC74595_Minute32_39

_IC74595_Minute40_47:

;ic74595_lib.c,268 :: 		void IC74595_Minute40_47(unsigned char myData)
;ic74595_lib.c,271 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Minute40_4765:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Minute40_4766
;ic74595_lib.c,274 :: 		if(myData & 0x80) DSM5 = 1;
	BTFSS      FARG_IC74595_Minute40_47_myData+0, 7
	GOTO       L_IC74595_Minute40_4768
	BSF        PORTD+0, 5
	GOTO       L_IC74595_Minute40_4769
L_IC74595_Minute40_4768:
;ic74595_lib.c,275 :: 		else DSM5 = 0;
	BCF        PORTD+0, 5
L_IC74595_Minute40_4769:
;ic74595_lib.c,276 :: 		myData <<= 1;
	RLF        FARG_IC74595_Minute40_47_myData+0, 1
	BCF        FARG_IC74595_Minute40_47_myData+0, 0
;ic74595_lib.c,279 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,280 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,271 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,281 :: 		}
	GOTO       L_IC74595_Minute40_4765
L_IC74595_Minute40_4766:
;ic74595_lib.c,283 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,284 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,285 :: 		}
L_end_IC74595_Minute40_47:
	RETURN
; end of _IC74595_Minute40_47

_IC74595_Minute48_55:

;ic74595_lib.c,286 :: 		void IC74595_Minute48_55(unsigned char myData)
;ic74595_lib.c,289 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Minute48_5570:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Minute48_5571
;ic74595_lib.c,292 :: 		if(myData & 0x80) DSM6 = 1;
	BTFSS      FARG_IC74595_Minute48_55_myData+0, 7
	GOTO       L_IC74595_Minute48_5573
	BSF        PORTD+0, 6
	GOTO       L_IC74595_Minute48_5574
L_IC74595_Minute48_5573:
;ic74595_lib.c,293 :: 		else DSM6 = 0;
	BCF        PORTD+0, 6
L_IC74595_Minute48_5574:
;ic74595_lib.c,294 :: 		myData <<= 1;
	RLF        FARG_IC74595_Minute48_55_myData+0, 1
	BCF        FARG_IC74595_Minute48_55_myData+0, 0
;ic74595_lib.c,297 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,298 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,289 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,299 :: 		}
	GOTO       L_IC74595_Minute48_5570
L_IC74595_Minute48_5571:
;ic74595_lib.c,301 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,302 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,303 :: 		}
L_end_IC74595_Minute48_55:
	RETURN
; end of _IC74595_Minute48_55

_IC74595_Minute56_59:

;ic74595_lib.c,304 :: 		void IC74595_Minute56_59(unsigned char myData)
;ic74595_lib.c,307 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Minute56_5975:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Minute56_5976
;ic74595_lib.c,310 :: 		if(myData & 0x80) DSM7 = 1;
	BTFSS      FARG_IC74595_Minute56_59_myData+0, 7
	GOTO       L_IC74595_Minute56_5978
	BSF        PORTD+0, 7
	GOTO       L_IC74595_Minute56_5979
L_IC74595_Minute56_5978:
;ic74595_lib.c,311 :: 		else DSM7 = 0;
	BCF        PORTD+0, 7
L_IC74595_Minute56_5979:
;ic74595_lib.c,312 :: 		myData <<= 1;
	RLF        FARG_IC74595_Minute56_59_myData+0, 1
	BCF        FARG_IC74595_Minute56_59_myData+0, 0
;ic74595_lib.c,315 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,316 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,307 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,317 :: 		}
	GOTO       L_IC74595_Minute56_5975
L_IC74595_Minute56_5976:
;ic74595_lib.c,319 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,320 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,321 :: 		}
L_end_IC74595_Minute56_59:
	RETURN
; end of _IC74595_Minute56_59

_IC74595_Hour0_7:

;ic74595_lib.c,324 :: 		void IC74595_Hour0_7(unsigned char myData)
;ic74595_lib.c,327 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Hour0_780:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Hour0_781
;ic74595_lib.c,330 :: 		if(myData & 0x80) DSH0 = 1;
	BTFSS      FARG_IC74595_Hour0_7_myData+0, 7
	GOTO       L_IC74595_Hour0_783
	BSF        PORTB+0, 4
	GOTO       L_IC74595_Hour0_784
L_IC74595_Hour0_783:
;ic74595_lib.c,331 :: 		else DSH0 = 0;
	BCF        PORTB+0, 4
L_IC74595_Hour0_784:
;ic74595_lib.c,332 :: 		myData <<= 1;
	RLF        FARG_IC74595_Hour0_7_myData+0, 1
	BCF        FARG_IC74595_Hour0_7_myData+0, 0
;ic74595_lib.c,335 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,336 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,327 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,337 :: 		}
	GOTO       L_IC74595_Hour0_780
L_IC74595_Hour0_781:
;ic74595_lib.c,339 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,340 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,341 :: 		}
L_end_IC74595_Hour0_7:
	RETURN
; end of _IC74595_Hour0_7

_IC74595_Hour8_11:

;ic74595_lib.c,343 :: 		void IC74595_Hour8_11(unsigned char myData)
;ic74595_lib.c,346 :: 		for(i = 0; i < 8; i++)
	CLRF       R1+0
L_IC74595_Hour8_1185:
	MOVLW      8
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_IC74595_Hour8_1186
;ic74595_lib.c,349 :: 		if(myData & 0x80) DSH1 = 1;
	BTFSS      FARG_IC74595_Hour8_11_myData+0, 7
	GOTO       L_IC74595_Hour8_1188
	BSF        PORTB+0, 5
	GOTO       L_IC74595_Hour8_1189
L_IC74595_Hour8_1188:
;ic74595_lib.c,350 :: 		else DSH1 = 0;
	BCF        PORTB+0, 5
L_IC74595_Hour8_1189:
;ic74595_lib.c,351 :: 		myData <<= 1;
	RLF        FARG_IC74595_Hour8_11_myData+0, 1
	BCF        FARG_IC74595_Hour8_11_myData+0, 0
;ic74595_lib.c,354 :: 		SH_CP1 = 0;
	BCF        PORTB+0, 6
;ic74595_lib.c,355 :: 		SH_CP1 = 1;
	BSF        PORTB+0, 6
;ic74595_lib.c,346 :: 		for(i = 0; i < 8; i++)
	INCF       R1+0, 1
;ic74595_lib.c,356 :: 		}
	GOTO       L_IC74595_Hour8_1185
L_IC74595_Hour8_1186:
;ic74595_lib.c,358 :: 		ST_CP1 = 0;
	BCF        PORTB+0, 7
;ic74595_lib.c,359 :: 		ST_CP1 = 1;
	BSF        PORTB+0, 7
;ic74595_lib.c,360 :: 		}
L_end_IC74595_Hour8_11:
	RETURN
; end of _IC74595_Hour8_11
