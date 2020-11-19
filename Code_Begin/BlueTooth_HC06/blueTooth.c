
void BlueTooth_Init(void)
{   
     //config pins for RX, TX
     TRISC.B6 = 0; //TX pin set as output
     TRISC.B7 = 1; //RX pin set as input

     //initialize SPBRB register for baudrate
     BRGH_bit = 1; //high baud rate
     SPBRG = 51;
     
     //enable UART mode
     SYNC_bit = 0; //Asynchronous mode
     SPEN_bit = 1; //serial port enable
     
     //config for transmission and reception
     TXEN_bit = 1; //transmit enable
     CREN_bit = 1; //enable continous receive
     TX9_bit = 0; //8 bits transmission
     RX9_bit = 0; //8 bits reception
     
     //enable interrupt for RX TX
     GIE_bit = 1; //enable global interrupt
     PEIE_bit = 1; //enable peripharal interrupt
     RCIE_bit = 1; //enable RX interrupt
     TXIE_bit = 1; //enable TX interrupt
}
//send 1 byte data function
void BlueTooth_SendByte(char myData)
{
     TXREG = myData; //load the data to TX buffer
     while(!TXIF_bit); //wait complete transmitting
     while(!TRMT_bit);

}
//send 1 string function
void BlueTooth_Write(char *str)
{
     while(*str) //if character != NULL
     {
      BlueTooth_SendByte(*str++);
     }
}

//receive 1 byte data function
char BlueTooth_GetChar(void)
{
     if(OERR_bit) //if Error flag = 1
     {        //reset CREN bit
              CREN_bit = 0;
              CREN_bit = 1;
     }
    /* if(RCIF_bit == 1)
     {
                 while(!RCIF_bit);
                 return RCREG;

     }
     else return 0;   */
     while(!RCIF_bit); //wait complete receive
     return RCREG;
}
void BlueTooth_BroadCast(void)
{
    TXREG = 13;
    Delay_ms(300);
}