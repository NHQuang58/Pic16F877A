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
 TRISC = 0x00;
 PWM_Initialaze();
 PWM_Duty(84);
}