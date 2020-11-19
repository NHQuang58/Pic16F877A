#line 1 "D:/Hoc_PIC/Code_Begin/I2C_Ds3231_LCD/my_I2C.c"


void I2C_Init(const unsigned long freq_KHz)
{
 int SSPADD_value = (8000000 / (4*freq_KHz)) - 1;
 TRISC.B3 = 1;
 TRISC.B4 = 1;
#line 15 "D:/Hoc_PIC/Code_Begin/I2C_Ds3231_LCD/my_I2C.c"
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
#line 54 "D:/Hoc_PIC/Code_Begin/I2C_Ds3231_LCD/my_I2C.c"
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
