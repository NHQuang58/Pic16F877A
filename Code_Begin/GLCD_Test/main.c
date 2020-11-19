#include "myGLCD.h"
//#include "font5x7.h"

void main() {

   int i = 0;
   GLCD_Init();
   GLCD_Clear();

   GLCD_Print57(1, 0, "DevZone 2020");
   Delay_ms(1000);
   
   GLCD_PutBMP(cat);

   Delay_ms(1000);
   /*for(i = 1; i <= 63; i++)
   {
         GLCD_Scroll_Up(i);
         Delay_ms(10);
   }
   GLCD_Scroll_Up(0); */
   //while(1){};
   
   
}