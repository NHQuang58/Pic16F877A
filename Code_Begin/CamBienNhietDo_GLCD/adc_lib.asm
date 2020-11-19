
_ADC_Init:

;adc_lib.c,1 :: 		void ADC_Init(void)
;adc_lib.c,3 :: 		ADCON0 = 0x41;  // config ADCON0: ADC mode: ON, with Fosc/16
	MOVLW      65
	MOVWF      ADCON0+0
;adc_lib.c,4 :: 		ADCON1 = 0xCB;  // 1100 1011, AN3(+), AN2(-) set to Vref, Fosc/16
	MOVLW      203
	MOVWF      ADCON1+0
;adc_lib.c,5 :: 		}
L_end_ADC_Init:
	RETURN
; end of _ADC_Init

_ADC_ReadChannel:

;adc_lib.c,6 :: 		unsigned int ADC_ReadChannel(unsigned int channel)
;adc_lib.c,8 :: 		ADCON0 &= 0xC5; // 1100 0101, clear bit 5-3(analog channel select bit)
	MOVLW      197
	ANDWF      ADCON0+0, 1
;adc_lib.c,9 :: 		ADCON0 |= channel << 3; //setting bit bit 5-3(analog channel select bit)
	MOVLW      3
	MOVWF      R1+0
	MOVF       FARG_ADC_ReadChannel_channel+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__ADC_ReadChannel5:
	BTFSC      STATUS+0, 2
	GOTO       L__ADC_ReadChannel6
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__ADC_ReadChannel5
L__ADC_ReadChannel6:
	MOVF       R0+0, 0
	IORWF      ADCON0+0, 1
;adc_lib.c,10 :: 		Delay_ms(2); //time hold capacitor
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_ADC_ReadChannel0:
	DECFSZ     R13+0, 1
	GOTO       L_ADC_ReadChannel0
	DECFSZ     R12+0, 1
	GOTO       L_ADC_ReadChannel0
	NOP
;adc_lib.c,11 :: 		GO_DONE_bit  = 1; // Go/DONE bit high(1), A/D conversion in progress
	BSF        GO_DONE_bit+0, BitPos(GO_DONE_bit+0)
;adc_lib.c,12 :: 		while(GO_DONE_bit); //wait A/D conversion complete, after completed GO/DONE bit will low(0)
L_ADC_ReadChannel1:
	BTFSS      GO_DONE_bit+0, BitPos(GO_DONE_bit+0)
	GOTO       L_ADC_ReadChannel2
	GOTO       L_ADC_ReadChannel1
L_ADC_ReadChannel2:
;adc_lib.c,14 :: 		return ((ADRESH<<8)+ADRESL); //Returns Result
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
;adc_lib.c,15 :: 		}
L_end_ADC_ReadChannel:
	RETURN
; end of _ADC_ReadChannel
