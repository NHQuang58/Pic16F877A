#include "my_I2C.h"

#ifndef _DS3231_PIC_H_
#define _DS3231_PIC_H_

/*Set the current value of date and time below*/
int sec = 0;
int min = 58;
int hour = 12;
int date = 27;
int month = 8;
int year = 20;
int day = 5;

//Setting charecters to display: format 1_0
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

//array of temperatue value
char temp[2];
unsigned char temp_0 = 0;    //Format temp = 01.23
unsigned char temp_1 = 0;
unsigned char temp_2 = 0;
unsigned char temp_3 = 0;


/****** Functions for RTC module *******/

int  BCD_2_DEC(int to_convert)
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
   I2C_Write(0xD0);    //address of Ds3231 (PIC -> RTC)
   I2C_Write(0);  
   I2C_Write(DEC_2_BCD(sec)); //update sec
   I2C_Write(DEC_2_BCD(min)); //update min
   I2C_Write(DEC_2_BCD(hour)); //update hour
   I2C_Write(DEC_2_BCD(day));  //update day of week
   I2C_Write(DEC_2_BCD(date)); //update date
   I2C_Write(DEC_2_BCD(month)); //update month
   I2C_Write(DEC_2_BCD(year)); //update year

   I2C_End();
}

void Update_Current_Date_Time()
{
   //START to Read
   I2C_Start();
   I2C_Write(0xD0);  	
   I2C_Write(0);    
   I2C_End(); 
   
  //READ
   I2C_Start();
   I2C_Write(0xD1);            //address of DS3231 (RTC -> PIC)
   sec = BCD_2_DEC(I2C_Read(1));    
   min = BCD_2_DEC(I2C_Read(1));
   hour = BCD_2_DEC(I2C_Read(1));

   day = BCD_2_DEC(I2C_Read(1));
   date = BCD_2_DEC(I2C_Read(1));  
   month = BCD_2_DEC(I2C_Read(1));  
   year = BCD_2_DEC(I2C_Read(1));  
   I2C_End(); 
    
   //END Reading
   I2C_Start();
   I2C_Write(0xD1);                // Initialize data read
   I2C_Read(1);
   I2C_End();

}

void I2C_Conv_Temp(void)
{
   //value variable of status register & control register
   char status = 0, control = 0;
   
   I2C_Start();
   I2C_Write(0xD0);
   I2C_Write(0x0F);  //address of Status Register
   I2C_End();
   
   //Read Status register
   I2C_Start();
   I2C_Write(0xD1);
   status = I2C_Read(1);
   I2C_End();
   
   if(!(status & 0x04))     //if BSY bit == 0 (not busy)
   {
       //read to Control register
       I2C_Start();
       I2C_Write(0xD0);
       I2C_Write(0x0E); //address of Control Register
       I2C_End();
       
       I2C_Start();
       I2C_Write(0xD1);
       control = I2C_Read(1);
       I2C_End();
       
       //write to Control Register
       I2C_Start();
       I2C_Write(0xD0);
       I2C_Write(0x0E);     //address of Control Register
       I2C_Write(control | 0x20); //set CONV bit as '1'
       I2C_End();

   }
}

void Get_Temp(void)
{
   //go to Temp register
   I2C_Start();
   I2C_Write(0xD0);
   I2C_Write(0x11); //Address of MSB of Temp
   I2C_End();
   
   I2C_Start();
   I2C_Write(0xD1);//rtc->pic
   temp[0] = I2C_Read(1);
   temp[1] = I2C_Read(0);
   
}

#endif