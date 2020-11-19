#line 1 "D:/Hoc_PIC/Code_Begin/IC74595/main.c"
#line 1 "d:/hoc_pic/code_begin/ic74595/ic74595_lib.h"




void IC74595_SeConds0_7(unsigned char myData);
void IC74595_SeConds8_15(unsigned char myData);
void IC74595_SeConds16_23(unsigned char myData);
void IC74595_SeConds24_31(unsigned char myData);
void IC74595_SeConds32_39(unsigned char myData);
void IC74595_SeConds40_47(unsigned char myData);
void IC74595_SeConds48_55(unsigned char myData);
void IC74595_SeConds56_59(unsigned char myData);


void IC74595_Minute0_7(unsigned char myData);
void IC74595_Minute8_15(unsigned char myData);
void IC74595_Minute16_23(unsigned char myData);
void IC74595_Minute24_31(unsigned char myData);
void IC74595_Minute32_39(unsigned char myData);
void IC74595_Minute40_47(unsigned char myData);
void IC74595_Minute48_55(unsigned char myData);
void IC74595_Minute56_59(unsigned char myData);


void IC74595_Hour0_7(unsigned char myData);
void IC74595_Hour8_11(unsigned char myData);
#line 1 "d:/hoc_pic/code_begin/ic74595/seconds.h"
#line 1 "d:/hoc_pic/code_begin/ic74595/ic74595_lib.h"
#line 9 "d:/hoc_pic/code_begin/ic74595/seconds.h"
void Seconds_Run(void)
{
 int i = 0;

 for(i = 0; i < 8; i++)
 {
 IC74595_Seconds0_7(0x80 >> i);
 Delay_ms( 100 );
 }
 IC74595_Seconds0_7(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Seconds8_15(0x80 >> i);
 Delay_ms( 100 );
 }
 IC74595_Seconds8_15(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Seconds16_23(0x80 >> i);
 Delay_ms( 100 );
 }
 IC74595_Seconds16_23(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Seconds24_31(0x80 >> i);
 Delay_ms( 100 );
 }
 IC74595_Seconds24_31(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Seconds32_39(0x80 >> i);
 Delay_ms( 100 );
 }
 IC74595_Seconds32_39(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Seconds40_47(0x80 >> i);
 Delay_ms( 100 );
 }
 IC74595_Seconds40_47(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Seconds48_55(0x80 >> i);
 Delay_ms( 100 );
 }
 IC74595_Seconds48_55(0x00);


 for(i = 0; i < 5; i++)
 {
 IC74595_Seconds56_59(0x80 >> i);
 Delay_ms( 100 );
 }
 IC74595_Seconds56_59(0x00);
}
#line 1 "d:/hoc_pic/code_begin/ic74595/minute.h"
#line 1 "d:/hoc_pic/code_begin/ic74595/ic74595_lib.h"
#line 1 "d:/hoc_pic/code_begin/ic74595/seconds.h"
#line 7 "d:/hoc_pic/code_begin/ic74595/minute.h"
void Minute_Run(void)
{
 int i = 0;

 for(i = 0; i < 8; i++)
 {
 IC74595_Minute0_7(0x80 >> i);
 Seconds_Run();
 }
 IC74595_Minute0_7(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Minute8_15(0x80 >> i);
 Seconds_Run();
 }
 IC74595_Minute8_15(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Minute16_23(0x80 >> i);
 Seconds_Run();
 }
 IC74595_Seconds16_23(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Minute24_31(0x80 >> i);
 Seconds_Run();
 }
 IC74595_Minute24_31(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Minute32_39(0x80 >> i);
 Seconds_Run();
 }
 IC74595_Minute32_39(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Minute40_47(0x80 >> i);
 Seconds_Run();
 }
 IC74595_Minute40_47(0x00);


 for(i = 0; i < 8; i++)
 {
 IC74595_Minute48_55(0x80 >> i);
 Seconds_Run();
 }
 IC74595_Minute48_55(0x00);


 for(i = 0; i < 5; i++)
 {
 IC74595_Minute56_59(0x80 >> i);
 Seconds_Run();
 }
 IC74595_Minute56_59(0x00);
}
#line 1 "d:/hoc_pic/code_begin/ic74595/hour.h"
#line 1 "d:/hoc_pic/code_begin/ic74595/ic74595_lib.h"
#line 1 "d:/hoc_pic/code_begin/ic74595/seconds.h"
#line 1 "d:/hoc_pic/code_begin/ic74595/minute.h"
#line 8 "d:/hoc_pic/code_begin/ic74595/hour.h"
void Hour_Run(void)
{
 int i = 0;


 for(i = 0; i < 8; i++)
 {
 IC74595_Hour0_7(0x80>>i);
 Minute_Run();
 }


 for(i = 0; i < 4; i++)
 {
 IC74595_Hour8_11(0x80>>i);
 Minute_Run();
 }
}
#line 9 "D:/Hoc_PIC/Code_Begin/IC74595/main.c"
void main()
{
 int i = 0;
  TRISB  = 0x00;
  TRISC  = 0x00;
  TRISD  = 0x00;

 PORTB = 0x00;
 PORTC = 0x00;
 PORTD = 0x00;


 while(1)
 {


 IC74595_Minute0_7(0x80);
#line 35 "D:/Hoc_PIC/Code_Begin/IC74595/main.c"
 }

}
