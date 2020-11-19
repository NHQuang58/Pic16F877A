#ifndef _MY_I2C_H_
#define _MY_I2C_H_

/*Initialize I2C Mode Master*/
void I2C_Init(const unsigned long freq_KHz); //freq_KHz = 100KHz ~ 1MHz
/*wait I2C operation is completed*/
void I2C_Hold(void);
void I2C_Start(void);
void I2C_RepeatStart(void);
void I2C_End(void);
void I2C_Write(unsigned char dataSend);
/*
  ack = 0 => Not Acknowledge
  ack = 1 => Acknowledge
*/
unsigned char I2C_Read(unsigned char ack);
#endif