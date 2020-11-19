#include "Ds3231_Pic.h"
#include "my_I2C.h"
#include "lcd16x2lib.h"



void main() 
{
     //Initialize LCD16x2
     Lcd_Init();
     //Initialize I2C with 100KHz
     I2C_Init(100000);
     //Set real time for RTC modlue
     Set_Time_Date();
     
     //Send intro to LCD
     Lcd_Clear();
     Lcd_GoToXY(0, 1);
     Lcd_Puts("DS3231 with PIC");
     Lcd_GoToXY(1, 1);
     Lcd_Puts("DevZone 2020");
     Delay_ms(1500);  
     Lcd_Clear();
     
     while(1)
     {
          //Update real time from RTC
          Update_Current_Date_Time();
          
          /*setting parameter to display */
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
          
          //Display time on LCD screen
          //LCD_Clear();
          LCD_GotoXY(0, 0);
          //LCD_Puts("TIME: ");
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
          {    //.00
               temp_2 = 0;
               temp_3 = 0;
          }
          else if(temp[1] == 1)
          {    //.25
               temp_2 = 2;
               temp_3 = 5;
          }
          else if(temp[1] == 2)
          {    //.50
               temp_2 = 5;
               temp_3 = 0;
          }
          else
          {    //.75
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
          
          
          
          //Display date on LCD screen
          LCD_GotoXY(1, 0);
          //LCD_Puts("DATE: ");
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