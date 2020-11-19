
_UART_Init:

;uart.c,1 :: 		void UART_Init(unsigned int baudRate)
;uart.c,3 :: 		int value_register = (500000 / baudRate) - 1; //((Fosc/16) / baud rate) - 1
	MOVF       FARG_UART_Init_baudRate+0, 0
	MOVWF      R4+0
	MOVF       FARG_UART_Init_baudRate+1, 0
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVLW      32
	MOVWF      R0+0
	MOVLW      161
	MOVWF      R0+1
	MOVLW      7
	MOVWF      R0+2
	MOVLW      0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
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
;uart.c,6 :: 		TRISC.B6 = 0; //TX pin set as output
	BCF        TRISC+0, 6
;uart.c,7 :: 		TRISC.B7 = 1; //RX pin set as input
	BSF        TRISC+0, 7
;uart.c,10 :: 		BRGH_bit = 1; //high baud rate
	BSF        BRGH_bit+0, BitPos(BRGH_bit+0)
;uart.c,11 :: 		SPBRG = value_register;
	MOVF       R4+0, 0
	MOVWF      SPBRG+0
;uart.c,14 :: 		SYNC_bit = 0; //Asynchronous mode
	BCF        SYNC_bit+0, BitPos(SYNC_bit+0)
;uart.c,15 :: 		SPEN_bit = 1; //serial port enable
	BSF        SPEN_bit+0, BitPos(SPEN_bit+0)
;uart.c,18 :: 		TXEN_bit = 1; //transmit enable
	BSF        TXEN_bit+0, BitPos(TXEN_bit+0)
;uart.c,19 :: 		CREN_bit = 1; //enable contunous receive
	BSF        CREN_bit+0, BitPos(CREN_bit+0)
;uart.c,20 :: 		TX9_bit = 0; //8 bits transmission
	BCF        TX9_bit+0, BitPos(TX9_bit+0)
;uart.c,21 :: 		RX9_bit = 0; //8 bits reception
	BCF        RX9_bit+0, BitPos(RX9_bit+0)
;uart.c,22 :: 		}
L_end_UART_Init:
	RETURN
; end of _UART_Init

_UART_SendByte:

;uart.c,24 :: 		void UART_SendByte(char myData)
;uart.c,26 :: 		while(!TXIF_bit); //wait complete transmitting
L_UART_SendByte0:
	BTFSC      TXIF_bit+0, BitPos(TXIF_bit+0)
	GOTO       L_UART_SendByte1
	GOTO       L_UART_SendByte0
L_UART_SendByte1:
;uart.c,27 :: 		TXREG = myData; //load the data to TX buffer
	MOVF       FARG_UART_SendByte_myData+0, 0
	MOVWF      TXREG+0
;uart.c,28 :: 		}
L_end_UART_SendByte:
	RETURN
; end of _UART_SendByte

_UART_Write:

;uart.c,30 :: 		void UART_Write(char *str)
;uart.c,32 :: 		while(*str) //if character != NULL
L_UART_Write2:
	MOVF       FARG_UART_Write_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_UART_Write3
;uart.c,34 :: 		UART_SendByte(*str++);
	MOVF       FARG_UART_Write_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART_SendByte_myData+0
	CALL       _UART_SendByte+0
	INCF       FARG_UART_Write_str+0, 1
;uart.c,35 :: 		}
	GOTO       L_UART_Write2
L_UART_Write3:
;uart.c,36 :: 		}
L_end_UART_Write:
	RETURN
; end of _UART_Write

_UART_ReceiveByte:

;uart.c,39 :: 		char UART_ReceiveByte(void)
;uart.c,41 :: 		if(OERR_bit) //if Error flag = 1
	BTFSS      OERR_bit+0, BitPos(OERR_bit+0)
	GOTO       L_UART_ReceiveByte4
;uart.c,43 :: 		CREN_bit = 0;
	BCF        CREN_bit+0, BitPos(CREN_bit+0)
;uart.c,44 :: 		CREN_bit = 1;
	BSF        CREN_bit+0, BitPos(CREN_bit+0)
;uart.c,45 :: 		}
L_UART_ReceiveByte4:
;uart.c,46 :: 		while(!RCIF_bit); //wait complete receive
L_UART_ReceiveByte5:
	BTFSC      RCIF_bit+0, BitPos(RCIF_bit+0)
	GOTO       L_UART_ReceiveByte6
	GOTO       L_UART_ReceiveByte5
L_UART_ReceiveByte6:
;uart.c,47 :: 		return RCREG;
	MOVF       RCREG+0, 0
	MOVWF      R0+0
;uart.c,48 :: 		}
L_end_UART_ReceiveByte:
	RETURN
; end of _UART_ReceiveByte

_UART_ReceiveString:

;uart.c,50 :: 		void UART_ReceiveString(unsigned char *str)
;uart.c,52 :: 		unsigned char i = 0, j = 0;
	CLRF       UART_ReceiveString_i_L0+0
;uart.c,53 :: 		do
L_UART_ReceiveString7:
;uart.c,55 :: 		*(str + i) = UART_ReceiveByte();
	MOVF       UART_ReceiveString_i_L0+0, 0
	ADDWF      FARG_UART_ReceiveString_str+0, 0
	MOVWF      FLOC__UART_ReceiveString+0
	CALL       _UART_ReceiveByte+0
	MOVF       FLOC__UART_ReceiveString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;uart.c,56 :: 		j = *(str + i);
	MOVF       UART_ReceiveString_i_L0+0, 0
	ADDWF      FARG_UART_ReceiveString_str+0, 0
	MOVWF      FSR
;uart.c,57 :: 		i++;
	INCF       UART_ReceiveString_i_L0+0, 1
;uart.c,58 :: 		}while(j != '@');
	MOVF       INDF+0, 0
	XORLW      64
	BTFSS      STATUS+0, 2
	GOTO       L_UART_ReceiveString7
;uart.c,60 :: 		*(str + (i-1)) = '\0';
	MOVLW      1
	SUBWF      UART_ReceiveString_i_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      FARG_UART_ReceiveString_str+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;uart.c,62 :: 		}
L_end_UART_ReceiveString:
	RETURN
; end of _UART_ReceiveString
