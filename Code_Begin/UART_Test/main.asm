
_main:

;main.c,10 :: 		void main()
;main.c,12 :: 		char getValue = 0;
	CLRF       main_getValue_L0+0
;main.c,13 :: 		TRISB.B3 = 0;
	BCF        TRISB+0, 3
;main.c,14 :: 		UART_Init(9600);
	MOVLW      128
	MOVWF      FARG_UART_Init_baudRate+0
	MOVLW      37
	MOVWF      FARG_UART_Init_baudRate+1
	CALL       _UART_Init+0
;main.c,15 :: 		UART_Write("Initialize UART mode\n");
	MOVLW      ?lstr1_main+0
	MOVWF      FARG_UART_Write_str+0
	CALL       _UART_Write+0
;main.c,16 :: 		while(1)
L_main0:
;main.c,19 :: 		getValue = UART_ReceiveByte();
	CALL       _UART_ReceiveByte+0
	MOVF       R0+0, 0
	MOVWF      main_getValue_L0+0
;main.c,20 :: 		if(getValue == '1')//if user send '1'
	MOVF       R0+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;main.c,22 :: 		PORTB.B3 = 1;
	BSF        PORTB+0, 3
;main.c,24 :: 		UART_Write("LED ON");
	MOVLW      ?lstr2_main+0
	MOVWF      FARG_UART_Write_str+0
	CALL       _UART_Write+0
;main.c,25 :: 		UART_SendByte(13); // \n
	MOVLW      13
	MOVWF      FARG_UART_SendByte_myData+0
	CALL       _UART_SendByte+0
;main.c,27 :: 		}
L_main2:
;main.c,28 :: 		if(getValue == '0')//if user send '0'
	MOVF       main_getValue_L0+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;main.c,30 :: 		PORTB.B3 = 0;
	BCF        PORTB+0, 3
;main.c,32 :: 		UART_Write("LED OFF");
	MOVLW      ?lstr3_main+0
	MOVWF      FARG_UART_Write_str+0
	CALL       _UART_Write+0
;main.c,33 :: 		UART_SendByte(13); // \n
	MOVLW      13
	MOVWF      FARG_UART_SendByte_myData+0
	CALL       _UART_SendByte+0
;main.c,34 :: 		}
L_main3:
;main.c,45 :: 		}
	GOTO       L_main0
;main.c,46 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_UART_Init:

;main.c,48 :: 		void UART_Init(unsigned int baudRate)
;main.c,50 :: 		int value_register = (500000 / baudRate) - 1; //((Fosc/16) / baud rate) - 1
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
;main.c,53 :: 		TRISC.B6 = 0; //TX pin set as output
	BCF        TRISC+0, 6
;main.c,54 :: 		TRISC.B7 = 1; //RX pin set as input
	BSF        TRISC+0, 7
;main.c,57 :: 		BRGH_bit = 1; //high baud rate
	BSF        BRGH_bit+0, BitPos(BRGH_bit+0)
;main.c,58 :: 		SPBRG = value_register;
	MOVF       R4+0, 0
	MOVWF      SPBRG+0
;main.c,61 :: 		SYNC_bit = 0; //Asynchronous mode
	BCF        SYNC_bit+0, BitPos(SYNC_bit+0)
;main.c,62 :: 		SPEN_bit = 1; //serial port enable
	BSF        SPEN_bit+0, BitPos(SPEN_bit+0)
;main.c,65 :: 		TXEN_bit = 1; //transmit enable
	BSF        TXEN_bit+0, BitPos(TXEN_bit+0)
;main.c,66 :: 		CREN_bit = 1; //enable contunous receive
	BSF        CREN_bit+0, BitPos(CREN_bit+0)
;main.c,67 :: 		TX9_bit = 0; //8 bits transmission
	BCF        TX9_bit+0, BitPos(TX9_bit+0)
;main.c,68 :: 		RX9_bit = 0; //8 bits reception
	BCF        RX9_bit+0, BitPos(RX9_bit+0)
;main.c,69 :: 		}
L_end_UART_Init:
	RETURN
; end of _UART_Init

_UART_SendByte:

;main.c,71 :: 		void UART_SendByte(char myData)
;main.c,73 :: 		while(!TXIF_bit); //wait complete transmitting
L_UART_SendByte4:
	BTFSC      TXIF_bit+0, BitPos(TXIF_bit+0)
	GOTO       L_UART_SendByte5
	GOTO       L_UART_SendByte4
L_UART_SendByte5:
;main.c,74 :: 		TXREG = myData; //load the data to TX buffer
	MOVF       FARG_UART_SendByte_myData+0, 0
	MOVWF      TXREG+0
;main.c,75 :: 		}
L_end_UART_SendByte:
	RETURN
; end of _UART_SendByte

_UART_Write:

;main.c,77 :: 		void UART_Write(char *str)
;main.c,79 :: 		while(*str) //if character != NULL
L_UART_Write6:
	MOVF       FARG_UART_Write_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_UART_Write7
;main.c,81 :: 		UART_SendByte(*str++);
	MOVF       FARG_UART_Write_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART_SendByte_myData+0
	CALL       _UART_SendByte+0
	INCF       FARG_UART_Write_str+0, 1
;main.c,82 :: 		}
	GOTO       L_UART_Write6
L_UART_Write7:
;main.c,83 :: 		}
L_end_UART_Write:
	RETURN
; end of _UART_Write

_UART_ReceiveByte:

;main.c,86 :: 		char UART_ReceiveByte(void)
;main.c,88 :: 		if(OERR_bit) //if Error flag = 1
	BTFSS      OERR_bit+0, BitPos(OERR_bit+0)
	GOTO       L_UART_ReceiveByte8
;main.c,90 :: 		CREN_bit = 0;
	BCF        CREN_bit+0, BitPos(CREN_bit+0)
;main.c,91 :: 		CREN_bit = 1;
	BSF        CREN_bit+0, BitPos(CREN_bit+0)
;main.c,92 :: 		}
L_UART_ReceiveByte8:
;main.c,93 :: 		while(!RCIF_bit); //wait complete receive
L_UART_ReceiveByte9:
	BTFSC      RCIF_bit+0, BitPos(RCIF_bit+0)
	GOTO       L_UART_ReceiveByte10
	GOTO       L_UART_ReceiveByte9
L_UART_ReceiveByte10:
;main.c,94 :: 		return RCREG;
	MOVF       RCREG+0, 0
	MOVWF      R0+0
;main.c,95 :: 		}
L_end_UART_ReceiveByte:
	RETURN
; end of _UART_ReceiveByte
