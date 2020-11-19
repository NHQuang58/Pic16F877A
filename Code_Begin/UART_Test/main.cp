#line 1 "D:/Hoc_PIC/Code_Begin/UART_Test/main.c"
void UART_Init(unsigned int baudRate);
void UART_SendByte(char myData);

void UART_Write(char *str);

char UART_ReceiveByte(void);



void main()
{
 char getValue = 0;
 TRISB.B3 = 0;
 UART_Init(9600);
 UART_Write("Initialize UART mode\n");
 while(1)
 {

 getValue = UART_ReceiveByte();
 if(getValue == '1')
 {
 PORTB.B3 = 1;

 UART_Write("LED ON");
 UART_SendByte(13);

 }
 if(getValue == '0')
 {
 PORTB.B3 = 0;

 UART_Write("LED OFF");
 UART_SendByte(13);
 }
#line 45 "D:/Hoc_PIC/Code_Begin/UART_Test/main.c"
 }
}

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
