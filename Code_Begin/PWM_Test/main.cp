#line 1 "D:/Hoc_PIC/Code_Begin/PWM_Test/main.c"
float PR2_Value(float frequency)
{
 float value = (8000000/(16*4*frequency))-1;
 return value;
}
void PWM_Initialaze(void)
{
 PR2 = PR2_Value(5000);
 CCP1CON.CCP1M3 = 1;
 CCP1CON.CCP1M2 = 1;
 T2CON.TMR2ON = 1;
 T2CON.T2CKPS1 = 1;
 T2CON.T2CKPS0 = 0;

}
void PWM_Duty(unsigned int duty)
{
 CCP1CON.CCP1X = duty & 2;
 CCP1CON.CCP1Y = duty & 1;
 CCPR1L = duty>>2;
}
void main()
{
 TRISC = 0x00;
 PWM_Initialaze();
 PWM_Duty(84);
}
