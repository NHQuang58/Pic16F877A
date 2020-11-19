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