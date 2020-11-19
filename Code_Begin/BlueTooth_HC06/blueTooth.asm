
_BlueTooth_Init:

;blueTooth.c,2 :: 		void BlueTooth_Init(void)
;blueTooth.c,5 :: 		TRISC.B6 = 0; //TX pin set as output
	BCF        TRISC+0, 6
;blueTooth.c,6 :: 		TRISC.B7 = 1; //RX pin set as input
	BSF        TRISC+0, 7
;blueTooth.c,9 :: 		BRGH_bit = 1; //high baud rate
	BSF        BRGH_bit+0, BitPos(BRGH_bit+0)
;blueTooth.c,10 :: 		SPBRG = 51;
	MOVLW      51
	MOVWF      SPBRG+0
;blueTooth.c,13 :: 		SYNC_bit = 0; //Asynchronous mode
	BCF        SYNC_bit+0, BitPos(SYNC_bit+0)
;blueTooth.c,14 :: 		SPEN_bit = 1; //serial port enable
	BSF        SPEN_bit+0, BitPos(SPEN_bit+0)
;blueTooth.c,17 :: 		TXEN_bit = 1; //transmit enable
	BSF        TXEN_bit+0, BitPos(TXEN_bit+0)
;blueTooth.c,18 :: 		CREN_bit = 1; //enable continous receive
	BSF        CREN_bit+0, BitPos(CREN_bit+0)
;blueTooth.c,19 :: 		TX9_bit = 0; //8 bits transmission
	BCF        TX9_bit+0, BitPos(TX9_bit+0)
;blueTooth.c,20 :: 		RX9_bit = 0; //8 bits reception
	BCF        RX9_bit+0, BitPos(RX9_bit+0)
;blueTooth.c,23 :: 		GIE_bit = 1; //enable global interrupt
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;blueTooth.c,24 :: 		PEIE_bit = 1; //enable peripharal interrupt
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;blueTooth.c,25 :: 		RCIE_bit = 1; //enable RX interrupt
	BSF        RCIE_bit+0, BitPos(RCIE_bit+0)
;blueTooth.c,26 :: 		TXIE_bit = 1; //enable TX interrupt
	BSF        TXIE_bit+0, BitPos(TXIE_bit+0)
;blueTooth.c,27 :: 		}
L_end_BlueTooth_Init:
	RETURN
; end of _BlueTooth_Init

_BlueTooth_SendByte:

;blueTooth.c,29 :: 		void BlueTooth_SendByte(char myData)
;blueTooth.c,31 :: 		TXREG = myData; //load the data to TX buffer
	MOVF       FARG_BlueTooth_SendByte_myData+0, 0
	MOVWF      TXREG+0
;blueTooth.c,32 :: 		while(!TXIF_bit); //wait complete transmitting
L_BlueTooth_SendByte0:
	BTFSC      TXIF_bit+0, BitPos(TXIF_bit+0)
	GOTO       L_BlueTooth_SendByte1
	GOTO       L_BlueTooth_SendByte0
L_BlueTooth_SendByte1:
;blueTooth.c,33 :: 		while(!TRMT_bit);
L_BlueTooth_SendByte2:
	BTFSC      TRMT_bit+0, BitPos(TRMT_bit+0)
	GOTO       L_BlueTooth_SendByte3
	GOTO       L_BlueTooth_SendByte2
L_BlueTooth_SendByte3:
;blueTooth.c,35 :: 		}
L_end_BlueTooth_SendByte:
	RETURN
; end of _BlueTooth_SendByte

_BlueTooth_Write:

;blueTooth.c,37 :: 		void BlueTooth_Write(char *str)
;blueTooth.c,39 :: 		while(*str) //if character != NULL
L_BlueTooth_Write4:
	MOVF       FARG_BlueTooth_Write_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_BlueTooth_Write5
;blueTooth.c,41 :: 		BlueTooth_SendByte(*str++);
	MOVF       FARG_BlueTooth_Write_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_BlueTooth_SendByte_myData+0
	CALL       _BlueTooth_SendByte+0
	INCF       FARG_BlueTooth_Write_str+0, 1
;blueTooth.c,42 :: 		}
	GOTO       L_BlueTooth_Write4
L_BlueTooth_Write5:
;blueTooth.c,43 :: 		}
L_end_BlueTooth_Write:
	RETURN
; end of _BlueTooth_Write

_BlueTooth_GetChar:

;blueTooth.c,46 :: 		char BlueTooth_GetChar(void)
;blueTooth.c,48 :: 		if(OERR_bit) //if Error flag = 1
	BTFSS      OERR_bit+0, BitPos(OERR_bit+0)
	GOTO       L_BlueTooth_GetChar6
;blueTooth.c,50 :: 		CREN_bit = 0;
	BCF        CREN_bit+0, BitPos(CREN_bit+0)
;blueTooth.c,51 :: 		CREN_bit = 1;
	BSF        CREN_bit+0, BitPos(CREN_bit+0)
;blueTooth.c,52 :: 		}
L_BlueTooth_GetChar6:
;blueTooth.c,60 :: 		while(!RCIF_bit); //wait complete receive
L_BlueTooth_GetChar7:
	BTFSC      RCIF_bit+0, BitPos(RCIF_bit+0)
	GOTO       L_BlueTooth_GetChar8
	GOTO       L_BlueTooth_GetChar7
L_BlueTooth_GetChar8:
;blueTooth.c,61 :: 		return RCREG;
	MOVF       RCREG+0, 0
	MOVWF      R0+0
;blueTooth.c,62 :: 		}
L_end_BlueTooth_GetChar:
	RETURN
; end of _BlueTooth_GetChar

_BlueTooth_BroadCast:

;blueTooth.c,63 :: 		void BlueTooth_BroadCast(void)
;blueTooth.c,65 :: 		TXREG = 13;
	MOVLW      13
	MOVWF      TXREG+0
;blueTooth.c,66 :: 		Delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_BlueTooth_BroadCast9:
	DECFSZ     R13+0, 1
	GOTO       L_BlueTooth_BroadCast9
	DECFSZ     R12+0, 1
	GOTO       L_BlueTooth_BroadCast9
	DECFSZ     R11+0, 1
	GOTO       L_BlueTooth_BroadCast9
	NOP
	NOP
;blueTooth.c,67 :: 		}
L_end_BlueTooth_BroadCast:
	RETURN
; end of _BlueTooth_BroadCast
