sbit led1 at PORTD.B0;
sbit led2 at PORTD.B1;
sbit led3 at PORTD.B2;
sbit led4 at PORTD.B3;
sbit SW1 at PORTD.B4;
sbit SW2 at PORTD.B5;
sbit SW3 at PORTD.B6;
sbit SW4 at PORTD.B7;


//int check_phim(int timeOut);
int Press(void);

void main() {

    TRISD = 0xF0;     //1111 0000
    led1 = 0;
    led2 = 0;
    led3 = 0;
    led4 = 0;
    while(1)
    {
        /*if(Button(&PORTD, 4, 1, 0))
        {
            int timePress = 0;
            timePress = check_phim(1000);
            if(timePress = -1)
            {
                RD0_bit = !RD0_bit;
                while(Button(&PORTD, 4, 20, 0));
            }
            
        }      */
        if(Button(&PORTD, 7, 10, 0)) PORTD ^= 0x0F;
       //if(Press()) led1 = !led1;
    }
}
/*int check_phim(int timeOut)
{
    int count = 0;
    while(Button(&PORTD, 4, 20, 0) && count < timeOut)
    {
        count++;
        Delay_ms(1);
    }
    if(count < timeOut) return count;
    else return -1;
}                  */

int Press(void)
{
    if(SW1 == 0)
    {
        Delay_ms(20);
        if(SW1 == 0)
        {
            return 1;
            while(SW1 == 0);
        }
    }
}