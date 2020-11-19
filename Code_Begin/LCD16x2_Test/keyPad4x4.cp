#line 1 "D:/Hoc_PIC/Code_Begin/LCD16x2_Test/keyPad4x4.c"

sbit row1 at PORTD.B7;
sbit row2 at PORTD.B6;
sbit row3 at PORTD.B5;
sbit row4 at PORTD.B4;

sbit col1 at PORTC.B3;
sbit col2 at PORTC.B2;
sbit col3 at PORTC.B1;
sbit col4 at PORTC.B0;

unsigned char keyPress(void)
{
 unsigned char key = 0;

 TRISD = 0xF0;

 col1 = 0;
#line 23 "D:/Hoc_PIC/Code_Begin/LCD16x2_Test/keyPad4x4.c"
 if(row1 == 0) key = 10;
 if(row2 == 0) key = 7;
 if(row3 == 0) key = 4;
 if(row4 == 0) key = 1;
 col1 = 1;

 col2 = 0;
#line 34 "D:/Hoc_PIC/Code_Begin/LCD16x2_Test/keyPad4x4.c"
 if(row1 == 0) key = 0;
 if(row2 == 0) key = 8;
 if(row3 == 0) key = 5;
 if(row4 == 0) key = 2;
 col2 = 1;

 col3 = 0;
#line 45 "D:/Hoc_PIC/Code_Begin/LCD16x2_Test/keyPad4x4.c"
 if(row1 == 0) key = 11;
 if(row2 == 0) key = 9;
 if(row3 == 0) key = 6;
 if(row4 == 0) key = 3;
 col3 = 1;

 col4 = 0;
#line 56 "D:/Hoc_PIC/Code_Begin/LCD16x2_Test/keyPad4x4.c"
 if(row1 == 0) key = 12;
 if(row2 == 0) key = 13;
 if(row3 == 0) key = 14;
 if(row4 == 0) key = 15;
 col4 = 1;
 return key;
}
