#line 1 "D:/Hoc_PIC/Code_Begin/I2C_Ds3231_LCD/main.c"
#line 1 "d:/hoc_pic/code_begin/i2c_ds3231_lcd/ds3231_pic.h"
#line 1 "d:/hoc_pic/code_begin/i2c_ds3231_lcd/my_i2c.h"




void I2C_Init(const unsigned long freq_KHz);

void I2C_Hold(void);
void I2C_Start(void);
void I2C_RepeatStart(void);
void I2C_End(void);
void I2C_Write(unsigned char dataSend);
#line 16 "d:/hoc_pic/code_begin/i2c_ds3231_lcd/my_i2c.h"
unsigned char I2C_Read(unsigned char ack);
#line 7 "d:/hoc_pic/code_begin/i2c_ds3231_lcd/ds3231_pic.h"
int sec = 0;
int min = 58;
int hour = 12;
int date = 27;
int month = 8;
int year = 20;
int day = 5;


unsigned char sec_0 = 0;
unsigned char sec_1 = 0;
unsigned char min_0 = 0;
unsigned char min_1 = 0;
unsigned char hour_0 = 0;
unsigned char hour_1 = 0;
unsigned char date_0 = 0;
unsigned char date_1 = 0;
unsigned char month_0 = 0;
unsigned char month_1 = 0;
unsigned char year_0 = 0;
unsigned char year_1 = 0;


char temp[2];
unsigned char temp_0 = 0;
unsigned char temp_1 = 0;
unsigned char temp_2 = 0;
unsigned char temp_3 = 0;




int BCD_2_DEC(int to_convert)
{
 return (to_convert >> 4) * 10 + (to_convert & 0x0F);
}

int DEC_2_BCD (int to_convert)
{
 return ((to_convert / 10) << 4) + (to_convert % 10);
}

void Set_Time_Date()
{
 I2C_Start();
 I2C_Write(0xD0);
 I2C_Write(0);
 I2C_Write(DEC_2_BCD(sec));
 I2C_Write(DEC_2_BCD(min));
 I2C_Write(DEC_2_BCD(hour));
 I2C_Write(DEC_2_BCD(day));
 I2C_Write(DEC_2_BCD(date));
 I2C_Write(DEC_2_BCD(month));
 I2C_Write(DEC_2_BCD(year));

 I2C_End();
}

void Update_Current_Date_Time()
{

 I2C_Start();
 I2C_Write(0xD0);
 I2C_Write(0);
 I2C_End();


 I2C_Start();
 I2C_Write(0xD1);
 sec = BCD_2_DEC(I2C_Read(1));
 min = BCD_2_DEC(I2C_Read(1));
 hour = BCD_2_DEC(I2C_Read(1));

 day = BCD_2_DEC(I2C_Read(1));
 date = BCD_2_DEC(I2C_Read(1));
 month = BCD_2_DEC(I2C_Read(1));
 year = BCD_2_DEC(I2C_Read(1));
 I2C_End();


 I2C_Start();
 I2C_Write(0xD1);
 I2C_Read(1);
 I2C_End();

}

void I2C_Conv_Temp(void)
{

 char status = 0, control = 0;

 I2C_Start();
 I2C_Write(0xD0);
 I2C_Write(0x0F);
 I2C_End();


 I2C_Start();
 I2C_Write(0xD1);
 status = I2C_Read(1);
 I2C_End();

 if(!(status & 0x04))
 {

 I2C_Start();
 I2C_Write(0xD0);
 I2C_Write(0x0E);
 I2C_End();

 I2C_Start();
 I2C_Write(0xD1);
 control = I2C_Read(1);
 I2C_End();


 I2C_Start();
 I2C_Write(0xD0);
 I2C_Write(0xE0);
 I2C_Write(control | 0x20);
 I2C_End();

 }
}

void Get_Temp(void)
{

 I2C_Start();
 I2C_Write(0xD0);
 I2C_Write(0x11);
 I2C_End();

 I2C_Start();
 I2C_Write(0xD1);
 temp[0] = I2C_Read(1);
 temp[1] = I2C_Read(0);

}
#line 1 "d:/hoc_pic/code_begin/i2c_ds3231_lcd/my_i2c.h"
#line 1 "d:/hoc_pic/code_begin/i2c_ds3231_lcd/lcd16x2lib.h"



void Lcd_Enable(void);
void Lcd_Send4Bit(unsigned char myData);
void Lcd_Cmd(unsigned char myCommand);
void Lcd_Init(void);
void Lcd_PutChar(unsigned char myData);
void Lcd_Puts(char *s);
void Lcd_Clear(void);
void Lcd_GoToXY(unsigned char row, unsigned char col);
#line 7 "D:/Hoc_PIC/Code_Begin/I2C_Ds3231_LCD/main.c"
void main()
{

 Lcd_Init();

 I2C_Init(100000);

 Set_Time_Date();


 Lcd_Clear();
 Lcd_GoToXY(0, 1);
 Lcd_Puts("DS3231 with PIC");
 Lcd_GoToXY(1, 1);
 Lcd_Puts("DevZone 2020");
 Delay_ms(1500);
 Lcd_Clear();

 while(1)
 {

 Update_Current_Date_Time();


 sec_0 = sec%10;
 sec_1 = (sec/10);
 min_0 = min%10;
 min_1 = min/10;
 hour_0 = hour%10;
 hour_1 = hour/10;
 date_0 = date%10;
 date_1 = date/10;
 month_0 = month%10;
 month_1 = month/10;
 year_0 = year%10;
 year_1 = year/10;



 LCD_GotoXY(0, 0);

 LCD_PutChar(hour_1 +'0');
 LCD_PutChar(hour_0 +'0');
 LCD_PutChar(':');
 LCD_PutChar(min_1 +'0');
 LCD_PutChar(min_0 +'0');
 LCD_PutChar(':');
 LCD_PutChar(sec_1 +'0');
 LCD_PutChar(sec_0 +'0');


 I2C_Conv_Temp();
 Get_Temp();
 temp_0 = temp[0] / 10;
 temp_1 = temp[0] % 10;
 temp[1] >>= 6;
 if(temp[1] == 0)
 {
 temp_2 = 0;
 temp_3 = 0;
 }
 else if(temp[1] == 1)
 {
 temp_2 = 2;
 temp_3 = 5;
 }
 else if(temp[1] == 2)
 {
 temp_2 = 5;
 temp_3 = 0;
 }
 else
 {
 temp_2 = 7;
 temp_3 = 5;
 }

 LCD_GotoXY(0, 9);
 LCD_PutChar(temp_0 +'0');
 LCD_PutChar(temp_1 +'0');
 LCD_PutChar('.');
 LCD_PutChar(temp_2 +'0');
 LCD_PutChar(temp_3 +'0');
 LCD_PutChar(0xDF);
 LCD_PutChar('C');




 LCD_GotoXY(1, 0);

 LCD_PutChar(date_1 + '0');
 LCD_PutChar(date_0 + '0');
 LCD_PutChar('-');
 LCD_PutChar(month_1 + '0');
 LCD_PutChar(month_0 + '0');
 LCD_PutChar('-');
 LCD_PutChar(year_1 + '0');
 LCD_PutChar(year_0 + '0');

 LCD_PutChar(' ');
 LCD_PutChar('-');
 LCD_PutChar(' ');

 if(day == 1) LCD_Puts("SUN");
 else if(day == 2) LCD_Puts("MON");
 else if(day == 3) LCD_Puts("TUE");
 else if(day == 4) LCD_Puts("WED");
 else if(day == 5) LCD_Puts("THU");
 else if(day == 6) LCD_Puts("FRI");
 else LCD_Puts("SAT");

 Delay_ms(500);

 }

}
