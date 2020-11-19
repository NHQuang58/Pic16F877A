sbit led1 at PORTD.B0;
sbit led2 at PORTD.B1;
sbit led3 at PORTD.B2;
sbit led4 at PORTD.B3;

const unsigned char arr_number[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
const unsigned char arr_number_dp[] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78, 0x00, 0x10};

void Hien_Thi_ChuSo(int number);
void Hien_Thi_DP(int number);
void Led7_Quartet(int number);
void ADC_Init(void);
unsigned int  ADC_ReadChannel(unsigned int channel);

void main() {
     unsigned int adc_value, voltage_display, i;
     unsigned int adc_input;
     float volt, temp, temp_display;
     /*setting led 7seg*/
     TRISC = 0x00; //port C set as output
     TRISD = 0xF0; //pin 0, 1, 2, 3 of port D set as output
     PORTC = 0xFF; // off led 7seg
   
     ADC_Init();   //adc intilaze
     
    /* while(1)
     {
       adc_value = ADC_ReadChannel(0);
       voltage_display = adc_value * 10000.0f / 1023;  //(mV)
       for(i = 0; i <= 125; i++)
       Led7_Quartet(voltage_display);
     }    */
     while(1)
     {
       adc_input = ADC_ReadChannel(0);
       volt = adc_input * 10000.0f / 1023;
       temp = volt/ 10.0f;
       temp_display = temp * 100;
       for(i = 0; i <= 125; i++)
       Led7_Quartet(temp_display);
     }
}

void ADC_Init(void)
{
     ADCON0 = 0x41;  // config ADCON0: ADC mode: ON, with Fosc/16
     ADCON1 = 0xCB;  // 1100 1011, AN3(+), AN2(-) set to Vref, Fosc/16
}
unsigned int ADC_ReadChannel(unsigned int channel)
{
     ADCON0 &= 0xC5; // 1100 0101, clear bit 5-3(analog channel select bit)
     ADCON0 |= channel << 3; //setting bit bit 5-3(analog channel select bit)
     Delay_ms(2); //time hold capacitor
     GO_DONE_bit  = 1; // Go/DONE bit high(1), A/D conversion in progress
     while(GO_DONE_bit); //wait A/D conversion complete, after completed GO/DONE bit will low(0)

     return ((ADRESH<<8)+ADRESL); //Returns Result
}
void Hien_Thi_ChuSo(int number)
{
     PORTC =  arr_number[number];
}
void Hien_Thi_DP(int number)
{
     PORTC =  arr_number_dp[number];
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

     Hien_Thi_DP(hangTram);
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