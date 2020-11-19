#ifndef _UART_H_
#define _UART_H_

void UART_Init(unsigned int baudRate);
void UART_SendByte(char myData);
//send 1 string function
void UART_Write(char *str);
//receive 1 byte data function
char UART_ReceiveByte(void);
//receive 1 string
void UART_ReceiveString(unsigned char *str);

#endif