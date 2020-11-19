#line 1 "D:/Hoc_PIC/Code_Begin/LCD_Myself/main.c"
#line 1 "d:/hoc_pic/code_begin/lcd_myself/lcd16x2lib.h"



void Lcd_Enable(void);
void Lcd_Send4Bit(unsigned char myData);
void Lcd_Cmd(unsigned char myCommand);
void Lcd_Init(void);
void Lcd_PutChar(unsigned char myData);
void Lcd_Puts(char *s);
void Lcd_Clear(void);
void Lcd_GoToXY(unsigned char row, unsigned char col);
#line 3 "D:/Hoc_PIC/Code_Begin/LCD_Myself/main.c"
void main() {
 int hour = 5, minute = 8;
 char buffer[3];
 Lcd_Init();
 Lcd_Cmd(0x0C);
 Lcd_GoToXY(0, 0);


 sprinti(buffer, "%d", hour);
 Lcd_Puts(buffer);
 Lcd_PutChar(0x3A);
 sprinti(buffer, "%d", minute);
 Lcd_Puts(buffer);

 while(1)
 {




 }
}
