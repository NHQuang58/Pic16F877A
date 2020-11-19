
_Config_TIM0:

;led7_timer0.c,13 :: 		void Config_TIM0()
;led7_timer0.c,16 :: 		DATA_TRIS = 0x00;
	CLRF       TRISD+0
;led7_timer0.c,18 :: 		TRISB.B4 = 0;
	BCF        TRISB+0, 4
;led7_timer0.c,19 :: 		TRISB.B5 = 0;
	BCF        TRISB+0, 5
;led7_timer0.c,20 :: 		TRISB.B6 = 0;
	BCF        TRISB+0, 6
;led7_timer0.c,21 :: 		TRISB.B7 = 0;
	BCF        TRISB+0, 7
;led7_timer0.c,24 :: 		OPTION_REG.T0CS = 0;  //dem xung noi
	BCF        OPTION_REG+0, 5
;led7_timer0.c,25 :: 		OPTION_REG.PSA = 0;   //bo chia duoc su dung cho timer 0
	BCF        OPTION_REG+0, 3
;led7_timer0.c,28 :: 		OPTION_REG.PS2 = 1;
	BSF        OPTION_REG+0, 2
;led7_timer0.c,29 :: 		OPTION_REG.PS1 = 0;
	BCF        OPTION_REG+0, 1
;led7_timer0.c,30 :: 		OPTION_REG.PS0 = 0;
	BCF        OPTION_REG+0, 0
;led7_timer0.c,32 :: 		}
L_end_Config_TIM0:
	RETURN
; end of _Config_TIM0

_Delay_Timer0:

;led7_timer0.c,33 :: 		void Delay_Timer0(unsigned int time)
;led7_timer0.c,36 :: 		while(time--)
L_Delay_Timer00:
	MOVF       FARG_Delay_Timer0_time+0, 0
	MOVWF      R0+0
	MOVF       FARG_Delay_Timer0_time+1, 0
	MOVWF      R0+1
	MOVLW      1
	SUBWF      FARG_Delay_Timer0_time+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_Delay_Timer0_time+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Delay_Timer01
;led7_timer0.c,39 :: 		TMR0 = 100; //init value of TME0 register = 100
	MOVLW      100
	MOVWF      TMR0+0
;led7_timer0.c,40 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;led7_timer0.c,41 :: 		while(!INTCON.TMR0IF);  //if INTCON.TMR0IF == 1, overload flag
L_Delay_Timer02:
	BTFSC      INTCON+0, 2
	GOTO       L_Delay_Timer03
	GOTO       L_Delay_Timer02
L_Delay_Timer03:
;led7_timer0.c,43 :: 		}
	GOTO       L_Delay_Timer00
L_Delay_Timer01:
;led7_timer0.c,44 :: 		}
L_end_Delay_Timer0:
	RETURN
; end of _Delay_Timer0

_Hien_Thi_ChuSo:

;led7_timer0.c,45 :: 		void Hien_Thi_ChuSo(int number)
;led7_timer0.c,47 :: 		DATA_PORT =  arr_number[number];
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
;led7_timer0.c,48 :: 		}
L_end_Hien_Thi_ChuSo:
	RETURN
; end of _Hien_Thi_ChuSo

_Led7_Double:

;led7_timer0.c,50 :: 		void Led7_Double(int number)
;led7_timer0.c,52 :: 		int hangChuc = number / 10;
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
;led7_timer0.c,53 :: 		int hangDonVi = number % 10;
	MOVF       R0+0, 0
	MOVWF      Led7_Double_hangDonVi_L0+0
	MOVF       R0+1, 0
	MOVWF      Led7_Double_hangDonVi_L0+1
;led7_timer0.c,55 :: 		Hien_Thi_ChuSo(hangChuc);
	MOVF       FLOC__Led7_Double+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       FLOC__Led7_Double+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7_timer0.c,56 :: 		led1 = 1;
	BSF        PORTB+0, 4
;led7_timer0.c,57 :: 		Delay_Timer0(10);
	MOVLW      10
	MOVWF      FARG_Delay_Timer0_time+0
	MOVLW      0
	MOVWF      FARG_Delay_Timer0_time+1
	CALL       _Delay_Timer0+0
;led7_timer0.c,58 :: 		led1 = 0;
	BCF        PORTB+0, 4
;led7_timer0.c,60 :: 		Hien_Thi_ChuSo(hangDonVi);
	MOVF       Led7_Double_hangDonVi_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Double_hangDonVi_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7_timer0.c,61 :: 		led2 = 1;
	BSF        PORTB+0, 5
;led7_timer0.c,62 :: 		Delay_Timer0(10);
	MOVLW      10
	MOVWF      FARG_Delay_Timer0_time+0
	MOVLW      0
	MOVWF      FARG_Delay_Timer0_time+1
	CALL       _Delay_Timer0+0
;led7_timer0.c,63 :: 		led2 = 0;
	BCF        PORTB+0, 5
;led7_timer0.c,64 :: 		}
L_end_Led7_Double:
	RETURN
; end of _Led7_Double

_Led7_Quartet:

;led7_timer0.c,66 :: 		void Led7_Quartet(int number)
;led7_timer0.c,68 :: 		int hangNghin = number / 1000;
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
;led7_timer0.c,69 :: 		int hangTram = (number % 1000) / 100;
	MOVF       R0+0, 0
	MOVWF      Led7_Quartet_hangTram_L0+0
	MOVF       R0+1, 0
	MOVWF      Led7_Quartet_hangTram_L0+1
;led7_timer0.c,70 :: 		int hangChuc = ((number % 1000) % 100) / 10;
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
;led7_timer0.c,71 :: 		int hangDonVi = ((number % 1000) % 100) % 10;
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
;led7_timer0.c,73 :: 		Hien_Thi_ChuSo(hangNghin);
	MOVF       FLOC__Led7_Quartet+2, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       FLOC__Led7_Quartet+3, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7_timer0.c,74 :: 		led1 = 1;
	BSF        PORTB+0, 4
;led7_timer0.c,75 :: 		Delay_Timer0(1);
	MOVLW      1
	MOVWF      FARG_Delay_Timer0_time+0
	MOVLW      0
	MOVWF      FARG_Delay_Timer0_time+1
	CALL       _Delay_Timer0+0
;led7_timer0.c,76 :: 		led1 = 0;
	BCF        PORTB+0, 4
;led7_timer0.c,78 :: 		Hien_Thi_ChuSo(hangTram);
	MOVF       Led7_Quartet_hangTram_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangTram_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7_timer0.c,79 :: 		led2 = 1;
	BSF        PORTB+0, 5
;led7_timer0.c,80 :: 		Delay_Timer0(1);
	MOVLW      1
	MOVWF      FARG_Delay_Timer0_time+0
	MOVLW      0
	MOVWF      FARG_Delay_Timer0_time+1
	CALL       _Delay_Timer0+0
;led7_timer0.c,81 :: 		led2 = 0;
	BCF        PORTB+0, 5
;led7_timer0.c,83 :: 		Hien_Thi_ChuSo(hangChuc);
	MOVF       Led7_Quartet_hangChuc_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangChuc_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7_timer0.c,84 :: 		led3 = 1;
	BSF        PORTB+0, 6
;led7_timer0.c,85 :: 		Delay_Timer0(1);
	MOVLW      1
	MOVWF      FARG_Delay_Timer0_time+0
	MOVLW      0
	MOVWF      FARG_Delay_Timer0_time+1
	CALL       _Delay_Timer0+0
;led7_timer0.c,86 :: 		led3 = 0;
	BCF        PORTB+0, 6
;led7_timer0.c,88 :: 		Hien_Thi_ChuSo(hangDonVi);
	MOVF       Led7_Quartet_hangDonVi_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangDonVi_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;led7_timer0.c,89 :: 		led4 = 1;
	BSF        PORTB+0, 7
;led7_timer0.c,90 :: 		Delay_Timer0(1);
	MOVLW      1
	MOVWF      FARG_Delay_Timer0_time+0
	MOVLW      0
	MOVWF      FARG_Delay_Timer0_time+1
	CALL       _Delay_Timer0+0
;led7_timer0.c,91 :: 		led4 = 0;
	BCF        PORTB+0, 7
;led7_timer0.c,92 :: 		}
L_end_Led7_Quartet:
	RETURN
; end of _Led7_Quartet
