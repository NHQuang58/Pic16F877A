#include "myGLCD.h"
#include "uart.h"

void main() 
{
     char getValue = 'a', i = 0;
     unsigned char receive_string[15];
     GLCD_Init();
     GLCD_Clear();
     UART_Init(9600);
     //GLCD_Print57(0,0, "hello");
     //UART_SendByte(getValue - 32);
     //UART_Write("abcd");
     
     while(1)
     {
             /*getValue = UART_ReceiveByte();
             col += 5;
             GLCD_PutChar57(0, col, getvalue);
             getValue -= 32;*/
             UART_ReceiveString(receive_string);
             GLCD_Print57(0, 0, receive_string);
             for(i = 0; i < strlen(receive_string); i++)
             {
                   receive_string[i] = toupper(receive_string[i]);
             }
             UART_Write(receive_string);
             

     }


}