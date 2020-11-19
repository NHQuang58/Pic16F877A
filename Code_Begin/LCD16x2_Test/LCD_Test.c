#include "keyPad4x4.h"

const unsigned char Code7Seg[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
void Lcd_Out_Number(unsigned int number);

// Lcd pinout settings
sbit LCD_RS at PORTB.B0;
sbit LCD_EN at PORTB.B1;
sbit LCD_D7 at PORTB.B7;
sbit LCD_D6 at PORTB.B6;
sbit LCD_D5 at PORTB.B5;
sbit LCD_D4 at PORTB.B4;

// Pin direction
sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;


void main() {

     unsigned int intNumber = 28;
     unsigned char temp = 0;
     float floatNumber = -3.12345;
     char intStr[7], floatStr[15];

     //initialize LCD
     Lcd_Init();
     
     /*Lcd_Out(1, 2, "Hi Everybody");
     Lcd_Out(2, 1, "This is test LCD lib");
     Delay_ms(1000);
     //Lcd_Cmd(_LCD_CLEAR);
     
     IntToStr(intNumber, intStr);
     Lcd_Out(3, 2, intStr);
     
     //FloatToStr_FixLen(floatNumber, floatStr, 6);
     //Lcd_Out(4, 2, floatStr);      */
     
     while(1)
     {
        temp = keyPress();
        if(temp)
        {
          if(temp == 10) Lcd_Cmd(0x01);
         //IntToStr(temp, intStr);
         //Lcd_Out(4, 1,' ' );
          Lcd_Out_Number(temp);
          Delay_ms(100);
          LCD_Cmd(0x06);
          Delay_ms(1);
        }
     }

}
void Lcd_Out_Number(unsigned int number)
{
      Lcd_Chr_CP(number + 0x30);
}