#include "ic74595_lib.h"
#include "seconds.h"
#include "minute.h"
#include "hour.h"

#define CLOCK_TRIS    TRISB
#define SECONDS_TRIS  TRISC
#define MINUTE_TRIS   TRISD
void main() 
{
    int i = 0;
    CLOCK_TRIS = 0x00;
    SECONDS_TRIS = 0x00;
    MINUTE_TRIS = 0x00;
    
    PORTB = 0x00;
    PORTC = 0x00;
    PORTD = 0x00;
    
    //infinity loop
    while(1)
    {
        //Seconds_Run();
        //Hour_Run();
        IC74595_Minute0_7(0x80);
        //Seconds_Run();
        //IC74595_Minute0_7(0x80 >> 1);
        /*
        for(i = 0; i < 8; i++)
        {
              IC74595_Minute0_7(0x80 >> i);
              Seconds_Run();
        } */
        
    }

}