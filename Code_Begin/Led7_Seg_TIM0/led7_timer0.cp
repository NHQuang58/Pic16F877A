#line 1 "D:/Hoc_PIC/Code_Begin/Led7_Seg_TIM0/led7_timer0.c"



sbit led1 at PORTB.B4;
sbit led2 at PORTB.B5;
sbit led3 at PORTB.B6;
sbit led4 at PORTB.B7;

const unsigned char arr_number[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};



void Config_TIM0()
{

  TRISD  = 0x00;

 TRISB.B4 = 0;
 TRISB.B5 = 0;
 TRISB.B6 = 0;
 TRISB.B7 = 0;


 OPTION_REG.T0CS = 0;
 OPTION_REG.PSA = 0;


 OPTION_REG.PS2 = 1;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS0 = 0;

}
void Delay_Timer0(unsigned int time)
{

 while(time--)
 {

 TMR0 = 100;
 INTCON.TMR0IF = 0;
 while(!INTCON.TMR0IF);

 }
}
void Hien_Thi_ChuSo(int number)
{
  PORTD  = arr_number[number];
}

void Led7_Double(int number)
{
 int hangChuc = number / 10;
 int hangDonVi = number % 10;

 Hien_Thi_ChuSo(hangChuc);
 led1 = 1;
 Delay_Timer0(10);
 led1 = 0;

 Hien_Thi_ChuSo(hangDonVi);
 led2 = 1;
 Delay_Timer0(10);
 led2 = 0;
}

void Led7_Quartet(int number)
{
 int hangNghin = number / 1000;
 int hangTram = (number % 1000) / 100;
 int hangChuc = ((number % 1000) % 100) / 10;
 int hangDonVi = ((number % 1000) % 100) % 10;

 Hien_Thi_ChuSo(hangNghin);
 led1 = 1;
 Delay_Timer0(1);
 led1 = 0;

 Hien_Thi_ChuSo(hangTram);
 led2 = 1;
 Delay_Timer0(1);
 led2 = 0;

 Hien_Thi_ChuSo(hangChuc);
 led3 = 1;
 Delay_Timer0(1);
 led3 = 0;

 Hien_Thi_ChuSo(hangDonVi);
 led4 = 1;
 Delay_Timer0(1);
 led4 = 0;
}
