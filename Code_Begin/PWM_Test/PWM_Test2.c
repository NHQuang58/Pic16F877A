unsigned int dutyPWM = 0;
float PR2_Value(float frequency)
{
      float value =  (8000000/(16*4*frequency))-1;
      return value;
}
void PWM_Initialaze(void)
{
  PR2 = PR2_Value(5000); //(8000000/(16*4*5000))-1;
  CCP1CON.CCP1M3 = 1; // PWM mode
  CCP1CON.CCP1M2 = 1; // PWM mode
  T2CON.TMR2ON = 1;   // TIMER2 ON
  T2CON.T2CKPS1 = 1;
  T2CON.T2CKPS0 = 0; // Prescaler is 16

}
void PWM_Duty(unsigned int duty)
{
     CCP1CON.CCP1X = duty & 2; //Store the 1st bit
     CCP1CON.CCP1Y = duty & 1; //Store the 0th bit
     CCPR1L = duty>>2;// Store the remining 8 bit
}


void main()
{
 int i = 0, change_duty = 5;
 TRISC = 0x00;
 TRISD = 0xFF;
 PWM_Initialaze();

 while(1)
 {
         if(PORTD.B4 == 0)
         {
           Delay_ms(20);
           i += change_duty;
           if(i>100) i = 100;
         }
         if(PORTD.B5 == 0)
         {
           Delay_ms(20);
           i -= change_duty;
           if(i<0) i = 0;
         }
         PWM_duty(i);
         Delay_ms(50);
 }
}

