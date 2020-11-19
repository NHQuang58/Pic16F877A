#include "led7seg.h"
#include "keyPad.h"

/*
  4    8     12    16     ==>>   1 2 3 A
  3    7     11    15            4 5 6 B
  2    6     10    14            7 8 9 C
  1    5     9     13            * 0 # D
*/

unsigned int Number[17] = {10, 7, 4, 1, 0, 8, 5, 2, 11, 9, 6, 3, 12, 13, 14, 15};
                             
volatile unsigned char count = 1;
volatile unsigned char key = 0;
void interrupt(void);

void main() {
     volatile unsigned char temp = 0, key = 0;
     
     TRISB = 0xF0; //set PB7-4 as input
     TRISD = 0x00; //set port D as output
     TRISC = 0x00; //set port C as output

     
     //setting interrupt
     OPTION_REG.INTEDG = 1;   //rising trigger
     GIE_bit = 1;  //enable global interrupt
    // INTE_bit = 1; //enable EXTI

     RBIE_bit = 1; //enable interrupt on port B

     while(1)
     {
              //EXTI_PB0();
             //for(i = 0; i <= 125; i++)

            //EXTI_PB0();
            //interrupt();
            //key = keyPress();
            keyPress();
            if(count != 0)
            {
             temp = count;
            }
            Led7_Quartet(Number[temp-1]);
            

     }
}
void interrupt(void)
{
     if(RBIF_bit == 1)
     {
      count = keyPress_INT();
      PORTB.F0 = !PORTB.F0;

      RBIF_bit = 0;
     }
}