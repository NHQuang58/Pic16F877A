
_main:

;ADC_Test.c,15 :: 		void main() {
;ADC_Test.c,20 :: 		TRISC = 0x00; //port C set as output
	CLRF       TRISC+0
;ADC_Test.c,21 :: 		TRISD = 0xF0; //pin 0, 1, 2, 3 of port D set as output
	MOVLW      240
	MOVWF      TRISD+0
;ADC_Test.c,22 :: 		PORTC = 0xFF; // off led 7seg
	MOVLW      255
	MOVWF      PORTC+0
;ADC_Test.c,24 :: 		ADC_Init();   //adc intilaze
	CALL       _ADC_Init+0
;ADC_Test.c,33 :: 		while(1)
L_main0:
;ADC_Test.c,35 :: 		adc_input = ADC_ReadChannel(0);
	CLRF       FARG_ADC_ReadChannel_channel+0
	CLRF       FARG_ADC_ReadChannel_channel+1
	CALL       _ADC_ReadChannel+0
;ADC_Test.c,36 :: 		volt = adc_input * 10000.0f / 1023;
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
;ADC_Test.c,37 :: 		temp = volt/ 10.0f;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
;ADC_Test.c,38 :: 		temp_display = temp * 100;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      main_temp_display_L0+0
	MOVF       R0+1, 0
	MOVWF      main_temp_display_L0+1
	MOVF       R0+2, 0
	MOVWF      main_temp_display_L0+2
	MOVF       R0+3, 0
	MOVWF      main_temp_display_L0+3
;ADC_Test.c,39 :: 		for(i = 0; i <= 125; i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVF       main_i_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       main_i_L0+0, 0
	SUBLW      125
L__main13:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;ADC_Test.c,40 :: 		Led7_Quartet(temp_display);
	MOVF       main_temp_display_L0+0, 0
	MOVWF      R0+0
	MOVF       main_temp_display_L0+1, 0
	MOVWF      R0+1
	MOVF       main_temp_display_L0+2, 0
	MOVWF      R0+2
	MOVF       main_temp_display_L0+3, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_Led7_Quartet_number+0
	MOVF       R0+1, 0
	MOVWF      FARG_Led7_Quartet_number+1
	CALL       _Led7_Quartet+0
;ADC_Test.c,39 :: 		for(i = 0; i <= 125; i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;ADC_Test.c,40 :: 		Led7_Quartet(temp_display);
	GOTO       L_main2
L_main3:
;ADC_Test.c,41 :: 		}
	GOTO       L_main0
;ADC_Test.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ADC_Init:

;ADC_Test.c,44 :: 		void ADC_Init(void)
;ADC_Test.c,46 :: 		ADCON0 = 0x41;  // config ADCON0: ADC mode: ON, with Fosc/16
	MOVLW      65
	MOVWF      ADCON0+0
;ADC_Test.c,47 :: 		ADCON1 = 0xCB;  // 1100 1011, AN3(+), AN2(-) set to Vref, Fosc/16
	MOVLW      203
	MOVWF      ADCON1+0
;ADC_Test.c,48 :: 		}
L_end_ADC_Init:
	RETURN
; end of _ADC_Init

_ADC_ReadChannel:

;ADC_Test.c,49 :: 		unsigned int ADC_ReadChannel(unsigned int channel)
;ADC_Test.c,51 :: 		ADCON0 &= 0xC5; // 1100 0101, clear bit 5-3(analog channel select bit)
	MOVLW      197
	ANDWF      ADCON0+0, 1
;ADC_Test.c,52 :: 		ADCON0 |= channel << 3; //setting bit bit 5-3(analog channel select bit)
	MOVLW      3
	MOVWF      R1+0
	MOVF       FARG_ADC_ReadChannel_channel+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__ADC_ReadChannel16:
	BTFSC      STATUS+0, 2
	GOTO       L__ADC_ReadChannel17
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__ADC_ReadChannel16
L__ADC_ReadChannel17:
	MOVF       R0+0, 0
	IORWF      ADCON0+0, 1
;ADC_Test.c,53 :: 		Delay_ms(2); //time hold capacitor
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_ADC_ReadChannel5:
	DECFSZ     R13+0, 1
	GOTO       L_ADC_ReadChannel5
	DECFSZ     R12+0, 1
	GOTO       L_ADC_ReadChannel5
	NOP
	NOP
;ADC_Test.c,54 :: 		GO_DONE_bit  = 1; // Go/DONE bit high(1), A/D conversion in progress
	BSF        GO_DONE_bit+0, BitPos(GO_DONE_bit+0)
;ADC_Test.c,55 :: 		while(GO_DONE_bit); //wait A/D conversion complete, after completed GO/DONE bit will low(0)
L_ADC_ReadChannel6:
	BTFSS      GO_DONE_bit+0, BitPos(GO_DONE_bit+0)
	GOTO       L_ADC_ReadChannel7
	GOTO       L_ADC_ReadChannel6
L_ADC_ReadChannel7:
;ADC_Test.c,57 :: 		return ((ADRESH<<8)+ADRESL); //Returns Result
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
;ADC_Test.c,58 :: 		}
L_end_ADC_ReadChannel:
	RETURN
; end of _ADC_ReadChannel

_Hien_Thi_ChuSo:

;ADC_Test.c,59 :: 		void Hien_Thi_ChuSo(int number)
;ADC_Test.c,61 :: 		PORTC =  arr_number[number];
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
	MOVWF      PORTC+0
;ADC_Test.c,62 :: 		}
L_end_Hien_Thi_ChuSo:
	RETURN
; end of _Hien_Thi_ChuSo

_Hien_Thi_DP:

;ADC_Test.c,63 :: 		void Hien_Thi_DP(int number)
;ADC_Test.c,65 :: 		PORTC =  arr_number_dp[number];
	MOVF       FARG_Hien_Thi_DP_number+0, 0
	ADDLW      _arr_number_dp+0
	MOVWF      R0+0
	MOVLW      hi_addr(_arr_number_dp+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_Hien_Thi_DP_number+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;ADC_Test.c,66 :: 		}
L_end_Hien_Thi_DP:
	RETURN
; end of _Hien_Thi_DP

_Led7_Quartet:

;ADC_Test.c,67 :: 		void Led7_Quartet(int number)
;ADC_Test.c,69 :: 		int hangNghin = number / 1000;
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
;ADC_Test.c,70 :: 		int hangTram = (number % 1000) / 100;
	MOVF       R0+0, 0
	MOVWF      Led7_Quartet_hangTram_L0+0
	MOVF       R0+1, 0
	MOVWF      Led7_Quartet_hangTram_L0+1
;ADC_Test.c,71 :: 		int hangChuc = ((number % 1000) % 100) / 10;
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
;ADC_Test.c,72 :: 		int hangDonVi = ((number % 1000) % 100) % 10;
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
;ADC_Test.c,74 :: 		Hien_Thi_ChuSo(hangNghin);
	MOVF       FLOC__Led7_Quartet+2, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       FLOC__Led7_Quartet+3, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;ADC_Test.c,75 :: 		led1 = 1;
	BSF        PORTD+0, 0
;ADC_Test.c,76 :: 		Delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_Led7_Quartet8:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet8
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet8
;ADC_Test.c,77 :: 		led1 = 0;
	BCF        PORTD+0, 0
;ADC_Test.c,79 :: 		Hien_Thi_DP(hangTram);
	MOVF       Led7_Quartet_hangTram_L0+0, 0
	MOVWF      FARG_Hien_Thi_DP_number+0
	MOVF       Led7_Quartet_hangTram_L0+1, 0
	MOVWF      FARG_Hien_Thi_DP_number+1
	CALL       _Hien_Thi_DP+0
;ADC_Test.c,80 :: 		led2 = 1;
	BSF        PORTD+0, 1
;ADC_Test.c,81 :: 		Delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_Led7_Quartet9:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet9
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet9
;ADC_Test.c,82 :: 		led2 = 0;
	BCF        PORTD+0, 1
;ADC_Test.c,84 :: 		Hien_Thi_ChuSo(hangChuc);
	MOVF       Led7_Quartet_hangChuc_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangChuc_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;ADC_Test.c,85 :: 		led3 = 1;
	BSF        PORTD+0, 2
;ADC_Test.c,86 :: 		Delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_Led7_Quartet10:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet10
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet10
;ADC_Test.c,87 :: 		led3 = 0;
	BCF        PORTD+0, 2
;ADC_Test.c,89 :: 		Hien_Thi_ChuSo(hangDonVi);
	MOVF       Led7_Quartet_hangDonVi_L0+0, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+0
	MOVF       Led7_Quartet_hangDonVi_L0+1, 0
	MOVWF      FARG_Hien_Thi_ChuSo_number+1
	CALL       _Hien_Thi_ChuSo+0
;ADC_Test.c,90 :: 		led4 = 1;
	BSF        PORTD+0, 3
;ADC_Test.c,91 :: 		Delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_Led7_Quartet11:
	DECFSZ     R13+0, 1
	GOTO       L_Led7_Quartet11
	DECFSZ     R12+0, 1
	GOTO       L_Led7_Quartet11
;ADC_Test.c,92 :: 		led4 = 0;
	BCF        PORTD+0, 3
;ADC_Test.c,93 :: 		}
L_end_Led7_Quartet:
	RETURN
; end of _Led7_Quartet
