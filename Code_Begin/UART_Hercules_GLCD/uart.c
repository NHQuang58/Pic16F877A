void UART_Init(unsigned int baudRate)
{
     int value_register = (500000 / baudRate) - 1; //((Fosc/16) / baud rate) - 1

     //config pins for UART
     TRISC.B6 = 0; //TX pin set as output
     TRISC.B7 = 1; //RX pin set as input

     //initialize SPBRB register for baudrate
     BRGH_bit = 1; //high baud rate
     SPBRG = value_register;

     //enable UART mode
     SYNC_bit = 0; //Asynchronous mode
     SPEN_bit = 1; //serial port enable

     //config for transmission and reception
     TXEN_bit = 1; //transmit enable
     CREN_bit = 1; //enable contunous receive
     TX9_bit = 0; //8 bits transmission
     RX9_bit = 0; //8 bits reception
}
//send 1 byte data function
void UART_SendByte(char myData)
{
     while(!TXIF_bit); //wait complete transmitting
     TXREG = myData; //load the data to TX buffer
}
//send 1 string function
void UART_Write(char *str)
{
     while(*str) //if character != NULL
     {
      UART_SendByte(*str++);
     }
}

//receive 1 byte data function
char UART_ReceiveByte(void)
{
     if(OERR_bit) //if Error flag = 1
     {        //reset CREN bit
              CREN_bit = 0;
              CREN_bit = 1;
     }
     while(!RCIF_bit); //wait complete receive
     return RCREG;
}
//receive 1 string
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
