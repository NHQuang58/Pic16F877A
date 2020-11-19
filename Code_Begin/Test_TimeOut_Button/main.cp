#line 1 "D:/Hoc_PIC/Code_Begin/Test_TimeOut_Button/main.c"
sbit led1 at PORTD.B0;
sbit led2 at PORTD.B1;
sbit led3 at PORTD.B2;
sbit led4 at PORTD.B3;
sbit SW1 at PORTD.B4;
sbit SW2 at PORTD.B5;
sbit SW3 at PORTD.B6;
sbit SW4 at PORTD.B7;



int Press(void);

void main() {

 TRISD = 0xF0;
 led1 = 0;
 led2 = 0;
 led3 = 0;
 led4 = 0;
 while(1)
 {
#line 34 "D:/Hoc_PIC/Code_Begin/Test_TimeOut_Button/main.c"
 if(Button(&PORTD, 7, 10, 0)) PORTD ^= 0x0F;

 }
}
#line 50 "D:/Hoc_PIC/Code_Begin/Test_TimeOut_Button/main.c"
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
