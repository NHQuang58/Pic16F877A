#line 1 "D:/Hoc_PIC/Code_Begin/I2C_Test/main.c"


void I2C_Init(const unsigned long freq_KHz)
{
 int SSPADD_value = (8000000 / (4*freq_KHz)) - 1;
 TRISC.B3 = 1;
 TRISC.B4 = 1;
#line 15 "D:/Hoc_PIC/Code_Begin/I2C_Test/main.c"
 SSPCON = 0x28;
 SSPCON2 = 0x00;

 SSPADD = SSPADD_value;
 SSPSTAT = 0x00;
}


void I2C_Hold(void)
{
 while( (SSPCON2 & 0x1F) || (SSPSTAT & 0x04) );
}

void I2C_Start(void)
{
 I2C_Hold();
 SEN_bit = 1;
}
void I2C_RepeatStart(void)
{
 I2C_Hold();
 RSEN_bit = 1;
}
void I2C_End(void)
{
 I2C_Hold();
 PEN_bit = 1;
}

void I2C_Write(unsigned char dataSend)
{
 I2C_Hold();
 SSPBUF = dataSend;
}
#line 54 "D:/Hoc_PIC/Code_Begin/I2C_Test/main.c"
unsigned char I2C_Read(unsigned char ack)
{
 unsigned char inComing;
 I2C_Hold();
 RCEN_bit = 1;

 I2C_Hold();
 inComing = SSPBUF;

 I2C_Hold();
 ACKDT_bit = (ack) ? 0 : 1;
 ACKEN_bit = 1;

 return inComing;
}





void main()
{
 unsigned char data_Recv = 0;
 I2C_Init(100000);

 while(1)
 {
 I2C_Start();
 I2C_Write(0xA0);
 I2C_Write(0x01);
 I2C_Write('y');
 I2C_End();
 Delay_ms(1000);

 I2C_Start();
 I2C_Write(0xA0|0x01);

 data_Recv = I2C_Read(0);
 I2C_End();
 Delay_ms(3000);
 }

}
