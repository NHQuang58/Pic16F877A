#include "led7_timer0.h"

void main()
{
    int count = 0, i = 0;
    Config_TIM0();
    
    while(1)
    {
        for(count = 0; count <= 9999; count++)
        {
            for(i = 0; i <= 10; i++)
            {
                Led7_Quartet(count);
            }
        }
    }
}