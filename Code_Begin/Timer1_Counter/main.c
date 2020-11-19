#include "led7Seg.h"

void main() {
     unsigned int count;
     
     TRISC = 0x0F;
     TRISD = 0x00;
     
     //config timer 1
     T1CON.B1 = 1; //counter mode
     T1CON.B4 = T1CON.B5 = 0; //prescale 1:1
     
     TMR1H = TMR1L = 0;
     T1CON.B0 = 1; //enable timer 1

     while(1)
     {
      count = TMR1H;
      count <<= 8;
      count |= TMR1L;
      
      Led7_Quartet(count);
     }

}