#line 1 "D:/Hoc_PIC/Code_Begin/EXTI_Test/main.c"
#line 1 "d:/hoc_pic/code_begin/exti_test/led7seg.h"



void Hien_Thi_ChuSo(int number);
void Led7_Double(int number);
void Led7_Quartet(int number);
#line 1 "d:/hoc_pic/code_begin/exti_test/keypad.h"



unsigned char keyPress(void);
unsigned char keyPress_INT(void);
#line 4 "D:/Hoc_PIC/Code_Begin/EXTI_Test/main.c"
unsigned int Number[17] = {10, 7, 4, 1, 0, 8, 5, 2, 11, 9, 6, 3, 12, 13, 14, 15};

volatile unsigned char count = 1;
volatile unsigned char key = 0;

void interrupt(void);

void main() {
 volatile unsigned char temp = 0, key = 0;

 TRISB = 0xF0;
 TRISD = 0x00;
 TRISC = 0x00;



 OPTION_REG.INTEDG = 1;
 GIE_bit = 1;


 RBIE_bit = 1;

 while(1)
 {






 keyPress() ;
 if(count != 0)
 {
 temp = count;
 }
 Led7_Quartet(Number[temp-1]);


 }
}
#line 53 "D:/Hoc_PIC/Code_Begin/EXTI_Test/main.c"
void interrupt(void)
{
 if(RBIF_bit == 1)
 {
 count = keyPress_INT();
 PORTB.F0 = !PORTB.F0;

 RBIF_bit = 0;
 }
}
