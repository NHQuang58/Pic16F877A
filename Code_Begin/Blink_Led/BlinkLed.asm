
_main:

;BlinkLed.c,15 :: 		void main() {
;BlinkLed.c,16 :: 		int i, count = 0;
;BlinkLed.c,18 :: 		DATA_TRIS = 0X00; //port D set as output
	CLRF       TRISD+0
;BlinkLed.c,21 :: 		TRISB.B4 = 0;
	BCF        TRISB+0, 4
;BlinkLed.c,22 :: 		TRISB.B5 = 0;
	BCF        TRISB+0, 5
;BlinkLed.c,23 :: 		TRISB.B6 = 0;
	BCF        TRISB+0, 6
;BlinkLed.c,24 :: 		TRISB.B7 = 0;
	BCF        TRISB+0, 7
;BlinkLed.c,25 :: 		DATA_PORT = 0XFF;
	MOVLW      255
	MOVWF      PORTD+0
;BlinkLed.c,27 :: 		while(1)
L_main0:
;BlinkLed.c,36 :: 		DATA_PORT = 0xFF;
	MOVLW      255
	MOVWF      PORTD+0
;BlinkLed.c,37 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;BlinkLed.c,38 :: 		DATA_PORT = 0x00;
	CLRF       PORTD+0
;BlinkLed.c,39 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;BlinkLed.c,40 :: 		}
	GOTO       L_main0
;BlinkLed.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_Hien_Thi_ChuSo:

;BlinkLed.c,44 :: 		void Hien_Thi_ChuSo(int number)
;BlinkLed.c,46 :: 		DATA_PORT =  arr_number[number];
	MOVF       FARG_Hien_Thi_ChuSo_number+0, 0
	ADDLW      _arr_number+0
	MOVWF      R0+0
	MOVLW      hi_addr(_arr_number+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_Hien_Thi_ChuSo_number+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTD+0
;BlinkLed.c,47 :: 		}
L_end_Hien_Thi_ChuSo:
	RETURN
; end of _Hien_Thi_ChuSo

_Led7_Double:

;BlinkLed.c,49 :: 		void Led7_Double(int number)
;BlinkLed.c,51 :: 		int hangChuc = number / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Led7_Double_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_Led7_Double_number+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Led7_Double+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Led7_Double+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Led7_Double_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_Led7_Double_number+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
;BlinkLed.c,52 :: 		int hangDonVi = number % 10;
	MOVF       R0+0, 0
	MOVWF      Led7_Double_hangDonVi_L0+0
	MOVF       R0+1, 0
	MOVWF      Led7_Double_hangDonVi_L0+1
;BlinkLed.c,54 :: 		Hien_Thi_ChuSo(hangChuc);
	MOVF       FLOC__Led7_Double+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       FLOC__Led7_Double+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;BlinkLed.c,55 :: 		led1 = 1;
	BSF        PORTB+0, 4
;BlinkLed.c,56 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Led7_Double4:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Double4
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Double4
	NOP
;BlinkLed.c,57 :: 		led1 = 0;
	BCF        PORTB+0, 4
;BlinkLed.c,59 :: 		Hien_Thi_ChuSo(hangDonVi);
	MOVF       Led7_Double_hangDonVi_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Double_hangDonVi_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;BlinkLed.c,60 :: 		led2 = 1;
	BSF        PORTB+0, 5
;BlinkLed.c,61 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Led7_Double5:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Double5
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Double5
	NOP
;BlinkLed.c,62 :: 		led2 = 0;
	BCF        PORTB+0, 5
;BlinkLed.c,63 :: 		}
L_end_Led7_Double:
	RETURN
; end of _Led7_Double

_Led7_Quartet:

;BlinkLed.c,65 :: 		void Led7_Quartet(int number)
;BlinkLed.c,67 :: 		int hangNghin = number / 1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_Led7_Quartet_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_Led7_Quartet_number+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Led7_Quartet+2
	MOVF       R0+1, 0
	MOVWF      FLOC__Led7_Quartet+3
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_Led7_Quartet_number+0, 0
	MOVWF      R0+0
	MOVF       FARG_Led7_Quartet_number+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__Led7_Quartet+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Led7_Quartet+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Led7_Quartet+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Led7_Quartet+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
;BlinkLed.c,68 :: 		int hangTram = (number % 1000) / 100;
	MOVF       R0+0, 0
	MOVWF      Led7_Quartet_hangTram_L0+0
	MOVF       R0+1, 0
	MOVWF      Led7_Quartet_hangTram_L0+1
;BlinkLed.c,69 :: 		int hangChuc = ((number % 1000) % 100) / 10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Led7_Quartet+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Led7_Quartet+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__Led7_Quartet+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Led7_Quartet+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Led7_Quartet+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Led7_Quartet+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      Led7_Quartet_hangChuc_L0+0
	MOVF       R0+1, 0
	MOVWF      Led7_Quartet_hangChuc_L0+1
;BlinkLed.c,70 :: 		int hangDonVi = ((number % 1000) % 100) % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Led7_Quartet+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Led7_Quartet+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      Led7_Quartet_hangDonVi_L0+0
	MOVF       R0+1, 0
	MOVWF      Led7_Quartet_hangDonVi_L0+1
;BlinkLed.c,72 :: 		Hien_Thi_ChuSo(hangNghin);
	MOVF       FLOC__Led7_Quartet+2, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       FLOC__Led7_Quartet+3, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;BlinkLed.c,73 :: 		led1 = 1;
	BSF        PORTB+0, 4
;BlinkLed.c,74 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led7_Quartet6:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet6
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet6
	NOP
	NOP
;BlinkLed.c,75 :: 		led1 = 0;
	BCF        PORTB+0, 4
;BlinkLed.c,77 :: 		Hien_Thi_ChuSo(hangTram);
	MOVF       Led7_Quartet_hangTram_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangTram_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;BlinkLed.c,78 :: 		led2 = 1;
	BSF        PORTB+0, 5
;BlinkLed.c,79 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led7_Quartet7:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet7
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet7
	NOP
	NOP
;BlinkLed.c,80 :: 		led2 = 0;
	BCF        PORTB+0, 5
;BlinkLed.c,82 :: 		Hien_Thi_ChuSo(hangChuc);
	MOVF       Led7_Quartet_hangChuc_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangChuc_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;BlinkLed.c,83 :: 		led3 = 1;
	BSF        PORTB+0, 6
;BlinkLed.c,84 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led7_Quartet8:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet8
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet8
	NOP
	NOP
;BlinkLed.c,85 :: 		led3 = 0;
	BCF        PORTB+0, 6
;BlinkLed.c,87 :: 		Hien_Thi_ChuSo(hangDonVi);
	MOVF       Led7_Quartet_hangDonVi_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangDonVi_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;BlinkLed.c,88 :: 		led4 = 1;
	BSF        PORTB+0, 7
;BlinkLed.c,89 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led7_Quartet9:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet9
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet9
	NOP
	NOP
;BlinkLed.c,90 :: 		led4 = 0;
	BCF        PORTB+0, 7
;BlinkLed.c,91 :: 		}
L_end_Led7_Quartet:
	RETURN
; end of _Led7_Quartet
