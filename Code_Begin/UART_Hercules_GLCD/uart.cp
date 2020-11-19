#line 1 "D:/Hoc_PIC/Code_Begin/UART_Hercules_GLCD/uart.c"
void UART_Init(unsigned int baudRate)
{
 int value_register = (500000 / baudRate) - 1;


 TRISC.B6 = 0;
 TRISC.B7 = 1;


 BRGH_bit = 1;
 SPBRG = value_register;


 SYNC_bit = 0;
 SPEN_bit = 1;


 TXEN_bit = 1;
 CREN_bit = 1;
 TX9_bit = 0;
 RX9_bit = 0;
}

void UART_SendByte(char myData)
{
 while(!TXIF_bit);
 TXREG = myData;
}

void UART_Write(char *str)
{
 while(*str)
 {
 UART_SendByte(*str++);
 }
}


char UART_ReceiveByte(void)
{
 if(OERR_bit)
 {
 CREN_bit = 0;
 CREN_bit = 1;
 }
 while(!RCIF_bit);
 return RCREG;
}

void UART_ReceiveString(unsigned char *str)
{
 unsigned char i = 0, j = 0;
 do
 {
 *(str + i) = UART_ReceiveByte();
 j = *(str + i);
 i++;
 }while(j != '@');

 *(str + (i-1)) = '\0';

}
