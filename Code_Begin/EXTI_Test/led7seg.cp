#line 1 "D:/Hoc_PIC/Code_Begin/EXTI_Test/led7seg.c"
sbit led1 at PORTC.B4;
sbit led2 at PORTC.B5;
sbit led3 at PORTC.B6;
sbit led4 at PORTC.B7;

const unsigned char arr_number[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};


void Hien_Thi_ChuSo(int number)
{
 PORTD = arr_number[number];
}

void Led7_Double(int number)
{
 int hangChuc = number / 10;
 int hangDonVi = number % 10;

 Hien_Thi_ChuSo(hangChuc);
 led1 = 1;
 Delay_ms(10);
 led1 = 0;

 Hien_Thi_ChuSo(hangDonVi);
 led2 = 1;
 Delay_ms(10);
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
 Delay_ms(1);
 led1 = 0;

 Hien_Thi_ChuSo(hangTram);
 led2 = 1;
 Delay_ms(1);
 led2 = 0;

 Hien_Thi_ChuSo(hangChuc);
 led3 = 1;
 Delay_ms(1);
 led3 = 0;

 Hien_Thi_ChuSo(hangDonVi);
 led4 = 1;
 Delay_ms(1);
 led4 = 0;
}
