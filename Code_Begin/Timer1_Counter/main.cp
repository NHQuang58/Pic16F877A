#line 1 "D:/Hoc_PIC/Code_Begin/Timer1_Counter/main.c"
#line 1 "d:/hoc_pic/code_begin/timer1_counter/led7seg.h"



void Hien_Thi_ChuSo(int number);
void Led7_Double(int number);
void Led7_Quartet(int number);
#line 3 "D:/Hoc_PIC/Code_Begin/Timer1_Counter/main.c"
void main() {
 unsigned int count;

 TRISC = 0x0F;
 TRISD = 0x00;


 T1CON.B1 = 1;
 T1CON.B4 = T1CON.B5 = 0;

 TMR1H = TMR1L = 0;
 T1CON.B0 = 1;

 while(1)
 {
 count = TMR1H;
 count <<= 8;
 count |= TMR1L;

 Led7_Quartet(count);
 }

}
