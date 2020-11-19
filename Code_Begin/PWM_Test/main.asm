
_PR2_Value:

;main.c,1 :: 		float PR2_Value(float frequency)
;main.c,3 :: 		float value =  (8000000/(16*4*frequency))-1;
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
;main.c,4 :: 		return value;
;main.c,5 :: 		}
L_end_PR2_Value:
	RETURN
; end of _PR2_Value

_PWM_Initialaze:

;main.c,6 :: 		void PWM_Initialaze(void)
;main.c,8 :: 		PR2 = PR2_Value(5000); //(8000000/(16*4*5000))-1;
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
;main.c,9 :: 		CCP1CON.CCP1M3 = 1; // PWM mode
	BSF        CCP1CON+0, 3
;main.c,10 :: 		CCP1CON.CCP1M2 = 1; // PWM mode
	BSF        CCP1CON+0, 2
;main.c,11 :: 		T2CON.TMR2ON = 1;   // TIMER2 ON
	BSF        T2CON+0, 2
;main.c,12 :: 		T2CON.T2CKPS1 = 1;
	BSF        T2CON+0, 1
;main.c,13 :: 		T2CON.T2CKPS0 = 0; // Prescaler is 16
	BCF        T2CON+0, 0
;main.c,15 :: 		}
L_end_PWM_Initialaze:
	RETURN
; end of _PWM_Initialaze

_PWM_Duty:

;main.c,16 :: 		void PWM_Duty(unsigned int duty)
;main.c,18 :: 		CCP1CON.CCP1X = duty & 2; //Store the 1st bit
	MOVLW      2
	ANDWF      FARG_PWM_Duty_duty+0, 0
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__PWM_Duty3
	BCF        CCP1CON+0, 5
	GOTO       L__PWM_Duty4
L__PWM_Duty3:
	BSF        CCP1CON+0, 5
L__PWM_Duty4:
;main.c,19 :: 		CCP1CON.CCP1Y = duty & 1; //Store the 0th bit
	MOVLW      1
	ANDWF      FARG_PWM_Duty_duty+0, 0
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__PWM_Duty5
	BCF        CCP1CON+0, 4
	GOTO       L__PWM_Duty6
L__PWM_Duty5:
	BSF        CCP1CON+0, 4
L__PWM_Duty6:
;main.c,20 :: 		CCPR1L = duty>>2;// Store the remining 8 bit
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
;main.c,21 :: 		}
L_end_PWM_Duty:
	RETURN
; end of _PWM_Duty

_main:

;main.c,22 :: 		void main()
;main.c,24 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;main.c,25 :: 		PWM_Initialaze();
	CALL       _PWM_Initialaze+0
;main.c,26 :: 		PWM_Duty(84);
	MOVLW      84
	MOVWF      FARG_PWM_Duty_duty+0
	MOVLW      0
	MOVWF      FARG_PWM_Duty_duty+1
	CALL       _PWM_Duty+0
;main.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
