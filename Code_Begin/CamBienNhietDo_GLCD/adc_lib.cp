#line 1 "D:/Hoc_PIC/Code_Begin/CamBienNhietDo_GLCD/adc_lib.c"
void ADC_Init(void)
{
 ADCON0 = 0x41;
 ADCON1 = 0xCB;
}
unsigned int ADC_ReadChannel(unsigned int channel)
{
 ADCON0 &= 0xC5;
 ADCON0 |= channel << 3;
 Delay_ms(2);
 GO_DONE_bit = 1;
 while(GO_DONE_bit);

 return ((ADRESH<<8)+ADRESL);
}
