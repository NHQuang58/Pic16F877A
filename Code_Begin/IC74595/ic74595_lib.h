#ifndef _IC74595_LIB_H_
#define _IC74595_LIB_H_

/*functions for seconds*/
void IC74595_SeConds0_7(unsigned char myData);
void IC74595_SeConds8_15(unsigned char myData);
void IC74595_SeConds16_23(unsigned char myData);
void IC74595_SeConds24_31(unsigned char myData);
void IC74595_SeConds32_39(unsigned char myData);
void IC74595_SeConds40_47(unsigned char myData);
void IC74595_SeConds48_55(unsigned char myData);
void IC74595_SeConds56_59(unsigned char myData);

/*functions for minute*/
void IC74595_Minute0_7(unsigned char myData);
void IC74595_Minute8_15(unsigned char myData);
void IC74595_Minute16_23(unsigned char myData);
void IC74595_Minute24_31(unsigned char myData);
void IC74595_Minute32_39(unsigned char myData);
void IC74595_Minute40_47(unsigned char myData);
void IC74595_Minute48_55(unsigned char myData);
void IC74595_Minute56_59(unsigned char myData);

/*functions for hour*/
void IC74595_Hour0_7(unsigned char myData);
void IC74595_Hour8_11(unsigned char myData);



//void IC74595_Out(unsigned char *p, unsigned char number);

#endif