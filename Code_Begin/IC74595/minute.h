#ifndef _MINUTE_H_
#define _MINUTE_H_

#include "ic74595_lib.h"
#include "seconds.h"

void Minute_Run(void)
{
    int i = 0;
    //0 - 7m
    for(i = 0; i < 8; i++)
    {
        IC74595_Minute0_7(0x80 >> i);
        Seconds_Run();
    }
    IC74595_Minute0_7(0x00);

    //8 - 15m
    for(i = 0; i < 8; i++)
    {
        IC74595_Minute8_15(0x80 >> i);
        Seconds_Run();
    }
    IC74595_Minute8_15(0x00);

    //16 - 23m
    for(i = 0; i < 8; i++)
    {
        IC74595_Minute16_23(0x80 >> i);
        Seconds_Run();
    }
    IC74595_Seconds16_23(0x00);

    //24 - 31m
    for(i = 0; i < 8; i++)
    {
        IC74595_Minute24_31(0x80 >> i);
        Seconds_Run();
    }
    IC74595_Minute24_31(0x00);

    //32 - 39m
    for(i = 0; i < 8; i++)
    {
        IC74595_Minute32_39(0x80 >> i);
        Seconds_Run();
    }
    IC74595_Minute32_39(0x00);

    //40 - 47m
    for(i = 0; i < 8; i++)
    {
        IC74595_Minute40_47(0x80 >> i);
        Seconds_Run();
    }
    IC74595_Minute40_47(0x00);

    //48 - 55m
    for(i = 0; i < 8; i++)
    {
        IC74595_Minute48_55(0x80 >> i);
        Seconds_Run();
    }
    IC74595_Minute48_55(0x00);

    //56 - 59m
    for(i = 0; i < 5; i++)
    {
        IC74595_Minute56_59(0x80 >> i);
        Seconds_Run();
    }
    IC74595_Minute56_59(0x00);
}

#endif