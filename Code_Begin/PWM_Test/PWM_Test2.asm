
_PR2_Value:

;PWM_Test2.c,2 :: 		float PR2_Value(float frequency)
;PWM_Test2.c,4 :: 		float value =  (8000000/(16*4*frequency))-1;
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      133
	MOVWF      R0+3
	MOVF       FARG_PR2_Value_frequency+0, 0
	MOVWF      R4+0
	MOVF       FARG_PR2_Value_frequency+1, 0
	MOVWF      R4+1
	MOVF       FARG_PR2_Value_frequency+2, 0
	MOVWF      R4+2
	MOVF       FARG_PR2_Value_frequency+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      36
	MOVWF      R0+1
	MOVLW      116
	MOVWF      R0+2
	MOVLW      149
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	CALL       _Sub_32x32_FP+0
;PWM_Test2.c,5 :: 		return value;
;PWM_Test2.c,6 :: 		}
L_end_PR2_Value:
	RETURN
; end of _PR2_Value

_PWM_Initialaze:

;PWM_Test2.c,7 :: 		void PWM_Initialaze(void)
;PWM_Test2.c,9 :: 		PR2 = PR2_Value(5000); //(8000000/(16*4*5000))-1;
	MOVLW      0
	MOVWF      FARG_PR2_Value_frequency+0
	MOVLW      64
	MOVWF      FARG_PR2_Value_frequency+1
	MOVLW      28
	MOVWF      FARG_PR2_Value_frequency+2
	MOVLW      139
	MOVWF      FARG_PR2_Value_frequency+3
	CALL       _PR2_Value+0
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      PR2+0
;PWM_Test2.c,10 :: 		CCP1CON.CCP1M3 = 1; // PWM mode
	BSF        CCP1CON+0, 3
;PWM_Test2.c,11 :: 		CCP1CON.CCP1M2 = 1; // PWM mode
	BSF        CCP1CON+0, 2
;PWM_Test2.c,12 :: 		T2CON.TMR2ON = 1;   // TIMER2 ON
	BSF        T2CON+0, 2
;PWM_Test2.c,13 :: 		T2CON.T2CKPS1 = 1;
	BSF        T2CON+0, 1
;PWM_Test2.c,14 :: 		T2CON.T2CKPS0 = 0; // Prescaler is 16
	BCF        T2CON+0, 0
;PWM_Test2.c,16 :: 		}
L_end_PWM_Initialaze:
	RETURN
; end of _PWM_Initialaze

_PWM_Duty:

;PWM_Test2.c,17 :: 		void PWM_Duty(unsigned int duty)
;PWM_Test2.c,19 :: 		CCP1CON.CCP1X = duty & 2; //Store the 1st bit
	MOVLW      2
	ANDWF      FARG_PWM_Duty_duty+0, 0
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__PWM_Duty12
	BCF        CCP1CON+0, 5
	GOTO       L__PWM_Duty13
L__PWM_Duty12:
	BSF        CCP1CON+0, 5
L__PWM_Duty13:
;PWM_Test2.c,20 :: 		CCP1CON.CCP1Y = duty & 1; //Store the 0th bit
	MOVLW      1
	ANDWF      FARG_PWM_Duty_duty+0, 0
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__PWM_Duty14
	BCF        CCP1CON+0, 4
	GOTO       L__PWM_Duty15
L__PWM_Duty14:
	BSF        CCP1CON+0, 4
L__PWM_Duty15:
;PWM_Test2.c,21 :: 		CCPR1L = duty>>2;// Store the remining 8 bit
	MOVF       FARG_PWM_Duty_duty+0, 0
	MOVWF      R0+0
	MOVF       FARG_PWM_Duty_duty+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      CCPR1L+0
;PWM_Test2.c,22 :: 		}
L_end_PWM_Duty:
	RETURN
; end of _PWM_Duty

_main:

;PWM_Test2.c,25 :: 		void main()
;PWM_Test2.c,27 :: 		int i = 0, change_duty = 5;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	MOVLW      5
	MOVWF      main_change_duty_L0+0
	MOVLW      0
	MOVWF      main_change_duty_L0+1
;PWM_Test2.c,28 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;PWM_Test2.c,29 :: 		TRISD = 0xFF;
	MOVLW      255
	MOVWF      TRISD+0
;PWM_Test2.c,30 :: 		PWM_Initialaze();
	CALL       _PWM_Initialaze+0
;PWM_Test2.c,32 :: 		while(1)
L_main0:
;PWM_Test2.c,34 :: 		if(PORTD.B4 == 0)
	BTFSC      PORTD+0, 4
	GOTO       L_main2
;PWM_Test2.c,36 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;PWM_Test2.c,37 :: 		i += change_duty;
	MOVF       main_change_duty_L0+0, 0
	ADDWF      main_i_L0+0, 0
	MOVWF      R1+0
	MOVF       main_i_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_change_duty_L0+1, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      main_i_L0+0
	MOVF       R1+1, 0
	MOVWF      main_i_L0+1
;PWM_Test2.c,38 :: 		if(i>100) i = 100;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVF       R1+0, 0
	SUBLW      100
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      100
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main4:
;PWM_Test2.c,39 :: 		}
L_main2:
;PWM_Test2.c,40 :: 		if(PORTD.B5 == 0)
	BTFSC      PORTD+0, 5
	GOTO       L_main5
;PWM_Test2.c,42 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;PWM_Test2.c,43 :: 		i -= change_duty;
	MOVF       main_change_duty_L0+0, 0
	SUBWF      main_i_L0+0, 0
	MOVWF      R1+0
	MOVF       main_change_duty_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_i_L0+1, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      main_i_L0+0
	MOVF       R1+1, 0
	MOVWF      main_i_L0+1
;PWM_Test2.c,44 :: 		if(i<0) i = 0;
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      0
	SUBWF      R1+0, 0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main7:
;PWM_Test2.c,45 :: 		}
L_main5:
;PWM_Test2.c,46 :: 		PWM_duty(i);
	MOVF       main_i_L0+0, 0
	MOVWF      FARG_PWM_Duty_duty+0
	MOVF       main_i_L0+1, 0
	MOVWF      FARG_PWM_Duty_duty+1
	CALL       _PWM_Duty+0
;PWM_Test2.c,47 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;PWM_Test2.c,48 :: 		}
	GOTO       L_main0
;PWM_Test2.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
