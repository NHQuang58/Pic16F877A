
_Hien_Thi_ChuSo:

;led7seg.c,9 :: 		void Hien_Thi_ChuSo(int number)
;led7seg.c,11 :: 		PORTD =  arr_number[number];
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
;led7seg.c,12 :: 		}
L_end_Hien_Thi_ChuSo:
	RETURN
; end of _Hien_Thi_ChuSo

_Led7_Double:

;led7seg.c,14 :: 		void Led7_Double(int number)
;led7seg.c,16 :: 		int hangChuc = number / 10;
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
;led7seg.c,17 :: 		int hangDonVi = number % 10;
	MOVF       R0+0, 0
	MOVWF      Led7_Double_hangDonVi_L0+0
	MOVF       R0+1, 0
	MOVWF      Led7_Double_hangDonVi_L0+1
;led7seg.c,19 :: 		Hien_Thi_ChuSo(hangChuc);
	MOVF       FLOC__Led7_Double+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       FLOC__Led7_Double+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7seg.c,20 :: 		led1 = 1;
	BSF        PORTC+0, 4
;led7seg.c,21 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Led7_Double0:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Double0
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Double0
	NOP
;led7seg.c,22 :: 		led1 = 0;
	BCF        PORTC+0, 4
;led7seg.c,24 :: 		Hien_Thi_ChuSo(hangDonVi);
	MOVF       Led7_Double_hangDonVi_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Double_hangDonVi_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7seg.c,25 :: 		led2 = 1;
	BSF        PORTC+0, 5
;led7seg.c,26 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Led7_Double1:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Double1
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Double1
	NOP
;led7seg.c,27 :: 		led2 = 0;
	BCF        PORTC+0, 5
;led7seg.c,28 :: 		}
L_end_Led7_Double:
	RETURN
; end of _Led7_Double

_Led7_Quartet:

;led7seg.c,30 :: 		void Led7_Quartet(int number)
;led7seg.c,32 :: 		int hangNghin = number / 1000;
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
;led7seg.c,33 :: 		int hangTram = (number % 1000) / 100;
	MOVF       R0+0, 0
	MOVWF      Led7_Quartet_hangTram_L0+0
	MOVF       R0+1, 0
	MOVWF      Led7_Quartet_hangTram_L0+1
;led7seg.c,34 :: 		int hangChuc = ((number % 1000) % 100) / 10;
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
;led7seg.c,35 :: 		int hangDonVi = ((number % 1000) % 100) % 10;
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
;led7seg.c,37 :: 		Hien_Thi_ChuSo(hangNghin);
	MOVF       FLOC__Led7_Quartet+2, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       FLOC__Led7_Quartet+3, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7seg.c,38 :: 		led1 = 1;
	BSF        PORTC+0, 4
;led7seg.c,39 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led7_Quartet2:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet2
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet2
	NOP
	NOP
;led7seg.c,40 :: 		led1 = 0;
	BCF        PORTC+0, 4
;led7seg.c,42 :: 		Hien_Thi_ChuSo(hangTram);
	MOVF       Led7_Quartet_hangTram_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangTram_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7seg.c,43 :: 		led2 = 1;
	BSF        PORTC+0, 5
;led7seg.c,44 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led7_Quartet3:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet3
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet3
	NOP
	NOP
;led7seg.c,45 :: 		led2 = 0;
	BCF        PORTC+0, 5
;led7seg.c,47 :: 		Hien_Thi_ChuSo(hangChuc);
	MOVF       Led7_Quartet_hangChuc_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangChuc_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7seg.c,48 :: 		led3 = 1;
	BSF        PORTC+0, 6
;led7seg.c,49 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led7_Quartet4:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet4
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet4
	NOP
	NOP
;led7seg.c,50 :: 		led3 = 0;
	BCF        PORTC+0, 6
;led7seg.c,52 :: 		Hien_Thi_ChuSo(hangDonVi);
	MOVF       Led7_Quartet_hangDonVi_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangDonVi_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7seg.c,53 :: 		led4 = 1;
	BSF        PORTC+0, 7
;led7seg.c,54 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Led7_Quartet5:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet5
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet5
	NOP
	NOP
;led7seg.c,55 :: 		led4 = 0;
	BCF        PORTC+0, 7
;led7seg.c,56 :: 		}
L_end_Led7_Quartet:
	RETURN
; end of _Led7_Quartet
