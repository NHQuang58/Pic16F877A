#ifndef _HOUR_H_
#define _HOUR_H_

#include "ic74595_lib.h"
#include "seconds.h"
#include "minute.h"

void Hour_Run(void)
{
    int i = 0;
    
    //0 - 7h
    for(i = 0; i < 8; i++)
    {
        IC74595_Hour0_7(0x80>>i);
        Minute_Run();
    }
    
    //8 - 11h
    for(i = 0; i < 4; i++)
    {
        IC74595_Hour8_11(0x80>>i);
        Minute_Run();
    }
}

#endif