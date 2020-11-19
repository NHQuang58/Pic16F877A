
/*Initialize I2C Mode Master*/
void I2C_Init(const unsigned long freq_KHz) //freq_KHz = 100KHz ~ 1MHz
{
     int SSPADD_value = (8000000 / (4*freq_KHz)) - 1;
     TRISC.B3 = 1;    //set SDA and SCL pins as input
     TRISC.B4 = 1;

     /*
       SSPCON = 0010 1000
       Enables the serial port
       Configures the SDA and SCL pins as the serial port pins
       Select I2C Master mode
     */
     SSPCON = 0x28;
     SSPCON2 = 0x00;

     SSPADD = SSPADD_value;
     SSPSTAT = 0x00;       //clear SSPSTAT register
}

/*wait I2C operation is completed*/
void I2C_Hold(void)
{
     while( (SSPCON2 & 0x1F) || (SSPSTAT & 0x04) );  //check I2C is not in progress
}

void I2C_Start(void)
{
     I2C_Hold();
     SEN_bit = 1;  //Initiate Start condition on SDA and SCL pins
}
void I2C_RepeatStart(void)
{
     I2C_Hold();
     RSEN_bit = 1;
}
void I2C_End(void)
{
     I2C_Hold();
     PEN_bit = 1;   //Initiate Stop condition on SDA and SCL pins
}

void I2C_Write(unsigned char dataSend)
{
     I2C_Hold();
     SSPBUF = dataSend;
}

/*
  ack = 0 => Not Acknowledge
  ack = 1 => Acknowledge
*/
unsigned char I2C_Read(unsigned char ack)
{
         unsigned char inComing;
         I2C_Hold();
         RCEN_bit = 1; //enable receive mode for I2C

         I2C_Hold();
         inComing = SSPBUF; //load data saved in SSPBUF to inComing

         I2C_Hold();
         ACKDT_bit = (ack) ? 0 : 1; //check if ack bit received
         ACKEN_bit = 1; //Initiate Acknowledge sequence on SDA and SCL pins and transmit ACKDT data bit

         return inComing;
}