#include "blueTooth.h"

void main() 
{
     int get_value = 0 ;
     
     TRISB3_bit = 0; //PB3 set as output
     PORTB.B3 = 0;
     TRISB4_bit = 0; //PB4 set as output
     PORTB.B4 = 0;
     BlueTooth_Init();
     
     //Send Introductory
     BlueTooth_Write("Bluetooth Initialized and Ready");
     BlueTooth_BroadCast();
     BlueTooth_Write("Press 1 to turn on LED");
     BlueTooth_BroadCast();
     BlueTooth_Write("Press 0 to turn on LED");
     BlueTooth_BroadCast();
     
     while(1)
     {
             get_value = BlueTooth_GetChar(); //read the char from BT
             if(get_value == 1)
             {
                 //if get '1', on led 1
                 PORTB.B3 = 1;
                 BlueTooth_Write("Led 1 ON");
                 BlueTooth_BroadCast();
             }
             else if(get_value == 0)
             {
                 //if get '2', off led 1
                 PORTB.B3 = 0;
                 BlueTooth_Write("Led 1 OFF ");
                 BlueTooth_BroadCast();
             }

            else if(get_value == 3)
             {
                 //if get '3', on led 2
                 PORTB.B4 = 1;
                 BlueTooth_Write("Led 2 ON ");
                 BlueTooth_BroadCast();
             }
             else if(get_value == 4)
             {
                 //if get '4', off led 2
                 PORTB.B4 = 0;
                 BlueTooth_Write("Led 2 OFF");
                 BlueTooth_BroadCast();
             }
     }
}