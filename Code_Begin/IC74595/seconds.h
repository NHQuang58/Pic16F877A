#ifndef _SECONDS_H_
#define _SECONDS_H_

#include "ic74595_lib.h"

#define time 100

/*funcions run about 1minute*/
void Seconds_Run(void)
{
        int i = 0;
         //0 - 7s
        for(i = 0; i < 8; i++)
        {
            IC74595_Seconds0_7(0x80 >> i);
            Delay_ms(time);
        }
        IC74595_Seconds0_7(0x00);

        //8 - 15s
        for(i = 0; i < 8; i++)
        {
            IC74595_Seconds8_15(0x80 >> i);
            Delay_ms(time);
        }
        IC74595_Seconds8_15(0x00);

        //16 - 23s
        for(i = 0; i < 8; i++)
        {
            IC74595_Seconds16_23(0x80 >> i);
            Delay_ms(time);
        }
        IC74595_Seconds16_23(0x00);

        //24 - 31s
        for(i = 0; i < 8; i++)
        {
            IC74595_Seconds24_31(0x80 >> i);
            Delay_ms(time);
        }
        IC74595_Seconds24_31(0x00);

        //32 - 39s
        for(i = 0; i < 8; i++)
        {
            IC74595_Seconds32_39(0x80 >> i);
            Delay_ms(time);
        }
        IC74595_Seconds32_39(0x00);

        //40 - 47s
        for(i = 0; i < 8; i++)
        {
            IC74595_Seconds40_47(0x80 >> i);
            Delay_ms(time);
        }
        IC74595_Seconds40_47(0x00);

        //48 - 55s
        for(i = 0; i < 8; i++)
        {
            IC74595_Seconds48_55(0x80 >> i);
            Delay_ms(time);
        }
        IC74595_Seconds48_55(0x00);

        //56 - 59s
        for(i = 0; i < 5; i++)
        {
            IC74595_Seconds56_59(0x80 >> i);
            Delay_ms(time);
        }
        IC74595_Seconds56_59(0x00);
}


#endif