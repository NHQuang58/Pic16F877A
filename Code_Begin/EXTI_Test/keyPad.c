
sbit row1 at PORTB.B7;
sbit row2 at PORTB.B6;
sbit row3 at PORTB.B5;
sbit row4 at PORTB.B4;

sbit col1 at PORTC.B3;
sbit col2 at PORTC.B2;
sbit col3 at PORTC.B1;
sbit col4 at PORTC.B0;

unsigned char keyPress(void)
{
         unsigned char key = 0;

         col1 = 0;
           if(row1 == 0) key = 1;
           if(row2 == 0) key = 2;
           if(row3 == 0) key = 3;
           if(row4 == 0) key = 4;
         col1 = 1;

         col2 = 0;
           if(row1 == 0) key = 5;
           if(row2 == 0) key = 6;
           if(row3 == 0) key = 7;
           if(row4 == 0) key = 8;
         col2 = 1;

         col3 = 0;
           if(row1 == 0) key = 9;
           if(row2 == 0) key = 10;
           if(row3 == 0) key = 11;
           if(row4 == 0) key = 12;
         col3 = 1;

         col4 = 0;
           if(row1 == 0) key = 13;
           if(row2 == 0) key = 14;
           if(row3 == 0) key = 15;
           if(row4 == 0) key = 16;
         col4 = 1;
         
         return key;
}
unsigned char keyPress_INT(void)
{
         unsigned char key = 0;

         col1 = 0;
           if(row1 == 0) key = 1;
           if(row2 == 0) key = 2;
           if(row3 == 0) key = 3;
           if(row4 == 0) key = 4;
         col1 = 1;

         col2 = 0;
           if(row1 == 0) key = 5;
           if(row2 == 0) key = 6;
           if(row3 == 0) key = 7;
           if(row4 == 0) key = 8;
         col2 = 1;

         col3 = 0;
           if(row1 == 0) key = 9;
           if(row2 == 0) key = 10;
           if(row3 == 0) key = 11;
           if(row4 == 0) key = 12;
         col3 = 1;

         col4 = 0;
           if(row1 == 0) key = 13;
           if(row2 == 0) key = 14;
           if(row3 == 0) key = 15;
           if(row4 == 0) key = 16;
         col4 = 1;

         return key;
}