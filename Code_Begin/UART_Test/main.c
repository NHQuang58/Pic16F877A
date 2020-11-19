void UART_Init(unsigned int baudRate);
void UART_SendByte(char myData);
//send 1 string function
void UART_Write(char *str);
//receive 1 byte data function
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
               if(getValue == '1')//if user send '1'
               {
                           PORTB.B3 = 1;

                           UART_Write("LED ON");
                           UART_SendByte(13); // \n

               }
               if(getValue == '0')//if user send '0'
               {
                           PORTB.B3 = 0;
                           
                           UART_Write("LED OFF");
                           UART_SendByte(13); // \n
               }

               /*getValue = UART_ReceiveByte();

               getValue -= 32;

               UART_Write(" => ");
               UART_Write("\r\n");
               UART_Write("Nhap ky tu in thuong: ");
               */
             
     }
}

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
     CREN_bit = 1; //enable continous receive
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



