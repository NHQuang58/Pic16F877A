
_I2C_Init:

;my_I2C.c,3 :: 		void I2C_Init(const unsigned long freq_KHz) //freq_KHz = 100KHz ~ 1MHz
;my_I2C.c,5 :: 		int SSPADD_value = (8000000 / (4*freq_KHz)) - 1;
	MOVF       FARG_I2C_Init_freq_KHz+0, 0
	MOVWF      R4+0
	MOVF       FARG_I2C_Init_freq_KHz+1, 0
	MOVWF      R4+1
	MOVF       FARG_I2C_Init_freq_KHz+2, 0
	MOVWF      R4+2
	MOVF       FARG_I2C_Init_freq_KHz+3, 0
	MOVWF      R4+3
	RLF        R4+0, 1
	RLF        R4+1, 1
	RLF        R4+2, 1
	RLF        R4+3, 1
	BCF        R4+0, 0
	RLF        R4+0, 1
	RLF        R4+1, 1
	RLF        R4+2, 1
	RLF        R4+3, 1
	BCF        R4+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVLW      18
	MOVWF      R0+1
	MOVLW      122
	MOVWF      R0+2
	MOVLW      0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVLW      1
	MOVWF      R8+0
	CLRF       R8+1
	CLRF       R8+2
	CLRF       R8+3
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       R8+0, 0
	SUBWF      R4+0, 1
	MOVF       R8+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R8+1, 0
	SUBWF      R4+1, 1
	MOVF       R8+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R8+2, 0
	SUBWF      R4+2, 1
	MOVF       R8+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R8+3, 0
	SUBWF      R4+3, 1
;my_I2C.c,6 :: 		TRISC.B3 = 1;    //set SDA and SCL pins as input
	BSF        TRISC+0, 3
;my_I2C.c,7 :: 		TRISC.B4 = 1;
	BSF        TRISC+0, 4
;my_I2C.c,15 :: 		SSPCON = 0x28;
	MOVLW      40
	MOVWF      SSPCON+0
;my_I2C.c,16 :: 		SSPCON2 = 0x00;
	CLRF       SSPCON2+0
;my_I2C.c,18 :: 		SSPADD = SSPADD_value;
	MOVF       R4+0, 0
	MOVWF      SSPADD+0
;my_I2C.c,19 :: 		SSPSTAT = 0x00;       //clear SSPSTAT register
	CLRF       SSPSTAT+0
;my_I2C.c,20 :: 		}
L_end_I2C_Init:
	RETURN
; end of _I2C_Init

_I2C_Hold:

;my_I2C.c,23 :: 		void I2C_Hold(void)
;my_I2C.c,25 :: 		while( (SSPCON2 & 0x1F) || (SSPSTAT & 0x04) );  //check I2C is not in progress
L_I2C_Hold0:
	MOVLW      31
	ANDWF      SSPCON2+0, 0
	MOVWF      R0+0
	BTFSS      STATUS+0, 2
	GOTO       L__I2C_Hold6
	BTFSC      SSPSTAT+0, 2
	GOTO       L__I2C_Hold6
	GOTO       L_I2C_Hold1
L__I2C_Hold6:
	GOTO       L_I2C_Hold0
L_I2C_Hold1:
;my_I2C.c,26 :: 		}
L_end_I2C_Hold:
	RETURN
; end of _I2C_Hold

_I2C_Start:

;my_I2C.c,28 :: 		void I2C_Start(void)
;my_I2C.c,30 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;my_I2C.c,31 :: 		SEN_bit = 1;  //Initiate Start condition on SDA and SCL pins
	BSF        SEN_bit+0, BitPos(SEN_bit+0)
;my_I2C.c,32 :: 		}
L_end_I2C_Start:
	RETURN
; end of _I2C_Start

_I2C_RepeatStart:

;my_I2C.c,33 :: 		void I2C_RepeatStart(void)
;my_I2C.c,35 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;my_I2C.c,36 :: 		RSEN_bit = 1;
	BSF        RSEN_bit+0, BitPos(RSEN_bit+0)
;my_I2C.c,37 :: 		}
L_end_I2C_RepeatStart:
	RETURN
; end of _I2C_RepeatStart

_I2C_End:

;my_I2C.c,38 :: 		void I2C_End(void)
;my_I2C.c,40 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;my_I2C.c,41 :: 		PEN_bit = 1;   //Initiate Stop condition on SDA and SCL pins
	BSF        PEN_bit+0, BitPos(PEN_bit+0)
;my_I2C.c,42 :: 		}
L_end_I2C_End:
	RETURN
; end of _I2C_End

_I2C_Write:

;my_I2C.c,44 :: 		void I2C_Write(unsigned char dataSend)
;my_I2C.c,46 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;my_I2C.c,47 :: 		SSPBUF = dataSend;
	MOVF       FARG_I2C_Write_dataSend+0, 0
	MOVWF      SSPBUF+0
;my_I2C.c,48 :: 		}
L_end_I2C_Write:
	RETURN
; end of _I2C_Write

_I2C_Read:

;my_I2C.c,54 :: 		unsigned char I2C_Read(unsigned char ack)
;my_I2C.c,57 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;my_I2C.c,58 :: 		RCEN_bit = 1; //enable receive mode for I2C
	BSF        RCEN_bit+0, BitPos(RCEN_bit+0)
;my_I2C.c,60 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;my_I2C.c,61 :: 		inComing = SSPBUF; //load data saved in SSPBUF to inComing
	MOVF       SSPBUF+0, 0
	MOVWF      I2C_Read_inComing_L0+0
;my_I2C.c,63 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;my_I2C.c,64 :: 		ACKDT_bit = (ack) ? 0 : 1; //check if ack bit received
	MOVF       FARG_I2C_Read_ack+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_Read4
	CLRF       ?FLOC___I2C_ReadT10+0
	GOTO       L_I2C_Read5
L_I2C_Read4:
	MOVLW      1
	MOVWF      ?FLOC___I2C_ReadT10+0
L_I2C_Read5:
	BTFSC      ?FLOC___I2C_ReadT10+0, 0
	GOTO       L__I2C_Read14
	BCF        ACKDT_bit+0, BitPos(ACKDT_bit+0)
	GOTO       L__I2C_Read15
L__I2C_Read14:
	BSF        ACKDT_bit+0, BitPos(ACKDT_bit+0)
L__I2C_Read15:
;my_I2C.c,65 :: 		ACKEN_bit = 1; //Initiate Acknowledge sequence on SDA and SCL pins and transmit ACKDT data bit
	BSF        ACKEN_bit+0, BitPos(ACKEN_bit+0)
;my_I2C.c,67 :: 		return inComing;
	MOVF       I2C_Read_inComing_L0+0, 0
	MOVWF      R0+0
;my_I2C.c,68 :: 		}
L_end_I2C_Read:
	RETURN
; end of _I2C_Read
