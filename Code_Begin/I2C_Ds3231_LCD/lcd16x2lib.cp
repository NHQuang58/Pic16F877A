#line 1 "D:/Hoc_PIC/Code_Begin/I2C_Ds3231_LCD/lcd16x2lib.c"
sbit RS at PORTD.B5;
sbit RW at PORTD.B6;
sbit EN at PORTD.B7;
sbit D4 at PORTB.B4;
sbit D5 at PORTB.B5;
sbit D6 at PORTB.B6;
sbit D7 at PORTB.B7;


void Lcd_Enable(void)
{
 EN = 1;
 Delay_ms(3);
 EN = 0;
 Delay_ms(50);
}
void Lcd_Send4Bit(unsigned char myData)
{
 D4 = myData & 0x01;
 D5 = (myData>>1) & 0x01;
 D6 = (myData>>2) & 0x01;
 D7 = (myData>>3) & 0x01;
}
void Lcd_Cmd(unsigned char myCommand)
{
 Lcd_Send4Bit(myCommand >> 4);
 Lcd_Enable();
 Lcd_Send4Bit(myCommand);
 Lcd_Enable();
}
void Lcd_Init(void)
{
 TRISB = 0x00;
 TRISD.B5 = 0;
 TRISD.B6 = 0;
 TRISD.B7 = 0;
 RS = 0;
 RW = 0;
 Delay_ms(20);
 Lcd_Send4Bit(0x03);
 Lcd_Enable();
 Delay_ms(10);
 Lcd_Send4Bit(0x03);
 Lcd_Enable();
 Delay_ms(10);
 Lcd_Send4Bit(0x03);
 Lcd_Enable();
 Delay_ms(10);
 Lcd_Send4Bit(0x02);
 Lcd_Enable();
 Delay_ms(10);
 Lcd_Cmd( 0x28 );




 Lcd_Cmd( 0x0C);


 Lcd_Cmd( 0x06 );
 Lcd_Cmd( 0x01 );
}

void Lcd_PutChar(unsigned char myData)
{
 RS = 1;
 Lcd_Cmd(myData);
 RS = 0;
}
void Lcd_Puts(char *s)
{
 while(*s)
 {
 Lcd_PutChar(*s);
 s++;
 }
}
void Lcd_Clear(void)
{
 Lcd_Cmd(0x01);
 Delay_ms(10);
}
void Lcd_GoToXY(unsigned char row, unsigned char col)
{
 unsigned char address;
 if(!row)
 address = (0x80 + col);
 else
 address = (0xC0 + col);
 Delay_ms(1);
 Lcd_Cmd(address);
 Delay_ms(1);
}
