#ifndef _LCD16X2LIB_H_
#define _LCD16X2LIB_H_

void Lcd_Enable(void);
void Lcd_Send4Bit(unsigned char myData);
void Lcd_Cmd(unsigned char myCommand);
void Lcd_Init(void);
void Lcd_PutChar(unsigned char myData);
void Lcd_Puts(char *s);
void Lcd_Clear(void);
void Lcd_GoToXY(unsigned char row, unsigned char col);


#endif