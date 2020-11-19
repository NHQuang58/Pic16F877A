#define DATA_PORT PORTD
#define DATA_TRIS TRISD

sbit led1 at PORTB.B4;
sbit led2 at PORTB.B5;
sbit led3 at PORTB.B6;
sbit led4 at PORTB.B7;


const unsigned char arr_number[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
void Hien_Thi_ChuSo(int number);
void Led7_Double(int number);
void Led7_Quartet(int number);

void main() {
  int i, count = 0;

  DATA_TRIS = 0X00; //port D set as output

  /*pin 4, 5, 6, 7 of port B set as output*/
  TRISB.B4 = 0; 
  TRISB.B5 = 0;
  TRISB.B6 = 0;
  TRISB.B7 = 0;
  DATA_PORT = 0XFF;

  while(1)
  {
      /*for(count = 90; count <= 9999; count++)
      {
          for(i = 0; i <= 10; i++)
          {
              Led7_Quartet(count);
          }
      }    */
      DATA_PORT = 0xFF;
      Delay_ms(1000);
      DATA_PORT = 0x00;
      Delay_ms(1000);
  }
  
}

void Hien_Thi_ChuSo(int number)
{
     DATA_PORT =  arr_number[number];
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