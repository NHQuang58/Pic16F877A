#include "myGLCD.h"
#include "adc_lib.h"

void main() {
     float temp = 0,  volt = 0;
     
     unsigned int temp_display1 = 0, temp_display2 = 0, adc_input = 0;
     char buffer[6];
     GLCD_Init();
     GLCD_Clear();
     ADC_Init();
     TRISD = 0x00; //Port D as output to use LCD
     TRISA.B0 = 1; //Pin PA0 as input to use LM35
     
     while(1)
     {
             adc_input = ADC_ReadChannel(0); //read adc value from ADC_Channel 0
             volt = adc_input * 10000.0f / 1023;
             temp = volt/ 10.0f;
             temp_display1 = temp ;
             temp_display2 = (temp - temp_display1) * 100;
             sprinti(buffer, "%d", temp_display1);
             GLCD_GotoXY(0, 1);
             GLCD_Print57(0, 1, buffer);
             GLCD_PutChar57(0, 11, '.');
             sprinti(buffer, "%d", temp_display2);
             GLCD_Print57(0, 16, buffer);
     }

}