
_I2C_Init:

;main.c,3 :: 		void I2C_Init(const unsigned long freq_KHz) //freq_KHz = 100KHz ~ 1MHz
;main.c,5 :: 		int SSPADD_value = (8000000 / (4*freq_KHz)) - 1;
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
;main.c,6 :: 		TRISC.B3 = 1;    //set SDA and SCL pins as input
	BSF        TRISC+0, 3
;main.c,7 :: 		TRISC.B4 = 1;
	BSF        TRISC+0, 4
;main.c,15 :: 		SSPCON = 0x28;
	MOVLW      40
	MOVWF      SSPCON+0
;main.c,16 :: 		SSPCON2 = 0x00;
	CLRF       SSPCON2+0
;main.c,18 :: 		SSPADD = SSPADD_value;
	MOVF       R4+0, 0
	MOVWF      SSPADD+0
;main.c,19 :: 		SSPSTAT = 0x00;       //clear SSPSTAT register
	CLRF       SSPSTAT+0
;main.c,20 :: 		}
L_end_I2C_Init:
	RETURN
; end of _I2C_Init

_I2C_Hold:

;main.c,23 :: 		void I2C_Hold(void)
;main.c,25 :: 		while( (SSPCON2 & 0x1F) || (SSPSTAT & 0x04) );  //check I2C is not in progress
L_I2C_Hold0:
	MOVLW      31
	ANDWF      SSPCON2+0, 0
	MOVWF      R0+0
	BTFSS      STATUS+0, 2
	GOTO       L__I2C_Hold10
	BTFSC      SSPSTAT+0, 2
	GOTO       L__I2C_Hold10
	GOTO       L_I2C_Hold1
L__I2C_Hold10:
	GOTO       L_I2C_Hold0
L_I2C_Hold1:
;main.c,26 :: 		}
L_end_I2C_Hold:
	RETURN
; end of _I2C_Hold

_I2C_Start:

;main.c,28 :: 		void I2C_Start(void)
;main.c,30 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;main.c,31 :: 		SEN_bit = 1;  //Initiate Start condition on SDA and SCL pins
	BSF        SEN_bit+0, BitPos(SEN_bit+0)
;main.c,32 :: 		}
L_end_I2C_Start:
	RETURN
; end of _I2C_Start

_I2C_RepeatStart:

;main.c,33 :: 		void I2C_RepeatStart(void)
;main.c,35 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;main.c,36 :: 		RSEN_bit = 1;
	BSF        RSEN_bit+0, BitPos(RSEN_bit+0)
;main.c,37 :: 		}
L_end_I2C_RepeatStart:
	RETURN
; end of _I2C_RepeatStart

_I2C_End:

;main.c,38 :: 		void I2C_End(void)
;main.c,40 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;main.c,41 :: 		PEN_bit = 1;   //Initiate Stop condition on SDA and SCL pins
	BSF        PEN_bit+0, BitPos(PEN_bit+0)
;main.c,42 :: 		}
L_end_I2C_End:
	RETURN
; end of _I2C_End

_I2C_Write:

;main.c,44 :: 		void I2C_Write(unsigned char dataSend)
;main.c,46 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;main.c,47 :: 		SSPBUF = dataSend;
	MOVF       FARG_I2C_Write_dataSend+0, 0
	MOVWF      SSPBUF+0
;main.c,48 :: 		}
L_end_I2C_Write:
	RETURN
; end of _I2C_Write

_I2C_Read:

;main.c,54 :: 		unsigned char I2C_Read(unsigned char ack)
;main.c,57 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;main.c,58 :: 		RCEN_bit = 1; //enable receive mode for I2C
	BSF        RCEN_bit+0, BitPos(RCEN_bit+0)
;main.c,60 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;main.c,61 :: 		inComing = SSPBUF; //load data saved in SSPBUF to inComing
	MOVF       SSPBUF+0, 0
	MOVWF      I2C_Read_inComing_L0+0
;main.c,63 :: 		I2C_Hold();
	CALL       _I2C_Hold+0
;main.c,64 :: 		ACKDT_bit = (ack) ? 0 : 1; //check if ack bit received
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
	GOTO       L__I2C_Read18
	BCF        ACKDT_bit+0, BitPos(ACKDT_bit+0)
	GOTO       L__I2C_Read19
L__I2C_Read18:
	BSF        ACKDT_bit+0, BitPos(ACKDT_bit+0)
L__I2C_Read19:
;main.c,65 :: 		ACKEN_bit = 1; //Initiate Acknowledge sequence on SDA and SCL pins and transmit ACKDT data bit
	BSF        ACKEN_bit+0, BitPos(ACKEN_bit+0)
;main.c,67 :: 		return inComing;
	MOVF       I2C_Read_inComing_L0+0, 0
	MOVWF      R0+0
;main.c,68 :: 		}
L_end_I2C_Read:
	RETURN
; end of _I2C_Read

_main:

;main.c,74 :: 		void main()
;main.c,76 :: 		unsigned char data_Recv = 0;
;main.c,77 :: 		I2C_Init(100000); //Init clock 100KHz
	MOVLW      160
	MOVWF      FARG_I2C_Init_freq_KHz+0
	MOVLW      134
	MOVWF      FARG_I2C_Init_freq_KHz+1
	MOVLW      1
	MOVWF      FARG_I2C_Init_freq_KHz+2
	MOVLW      0
	MOVWF      FARG_I2C_Init_freq_KHz+3
	CALL       _I2C_Init+0
;main.c,79 :: 		while(1)
L_main6:
;main.c,81 :: 		I2C_Start();
	CALL       _I2C_Start+0
;main.c,82 :: 		I2C_Write(0xA0);
	MOVLW      160
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;main.c,83 :: 		I2C_Write(0x01);
	MOVLW      1
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;main.c,84 :: 		I2C_Write('y');
	MOVLW      121
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;main.c,85 :: 		I2C_End();
	CALL       _I2C_End+0
;main.c,86 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;main.c,88 :: 		I2C_Start();
	CALL       _I2C_Start+0
;main.c,89 :: 		I2C_Write(0xA0|0x01);
	MOVLW      161
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;main.c,91 :: 		data_Recv = I2C_Read(0);
	CLRF       FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
;main.c,92 :: 		I2C_End();
	CALL       _I2C_End+0
;main.c,93 :: 		Delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;main.c,94 :: 		}
	GOTO       L_main6
;main.c,96 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
