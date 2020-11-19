#line 1 "D:/Hoc_PIC/Code_Begin/Led7_Seg_TIM0/main.c"
#line 1 "d:/hoc_pic/code_begin/led7_seg_tim0/led7_timer0.h"




void Config_TIM0();
void Delay_Timer0(unsigned int time);
void Hien_Thi_ChuSo(int number);
void Led7_Double(int number);
void Led7_Quartet(int number);
#line 3 "D:/Hoc_PIC/Code_Begin/Led7_Seg_TIM0/main.c"
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
