#include "lcd16x2lib.h"

void main() {
     int hour = 5, minute = 8;
     char buffer[3];
     Lcd_Init();
     Lcd_Cmd(0x0C);    //on display and turn off cursor
     Lcd_GoToXY(0, 0);
   //  Lcd_PutChar('0xE2');
   //  Lcd_PutChar(0xE2);  //xuat ky tu beta
     sprinti(buffer, "%d", hour);
     Lcd_Puts(buffer);
     Lcd_PutChar(0x3A);
     sprinti(buffer, "%d", minute);
     Lcd_Puts(buffer);
      
     while(1)
     {

             


     }
}