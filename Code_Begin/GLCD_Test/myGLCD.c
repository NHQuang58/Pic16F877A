//define Port and Tris
#define  Data_Port    PORTB
#define  Data_Tris    TRISB
#define  Control_Port PORTD
#define  Control_Tris TRISD

//instruction code
#define GLCD_OFF      0x3E   //0011 1110
#define GLCD_ON       0x3F   //0011 1111
#define GLCD_Colum    0x40   //01xx xxxx (Y value - Colum: 0~63)
#define GLCD_Page     0xB8   //1011 1xxx (X value - Page : 0~7)
#define GLCD_Line     0xC0   //11xx xxxx (Z value - Line : 0~63)
#define GLCD_BusyBit  PORTB.B7 //bit DB7(busy bit)

//config control pins
sbit CS1 at PORTD.B3;
sbit CS2 at PORTD.B4;
sbit RS  at PORTD.B5;
sbit RW  at PORTD.B6;
sbit E   at PORTD.B7;

#include "font5x7.h"

 //GLCD send command function
void GLCD_Cmd(char command)
{
     Data_Tris = 0x00; //set data port as output
     Data_Port = command;
     RS = 0; //RS pin LOW to select instruction mode
     RW = 0; //RW pin LOW to select Write mode
     E = 1;
     Delay_ms(2);
     E = 0;
     Delay_ms(2);

}

//set side for GLCD function
void GLCD_SetSide(char side)  //side = 0: right / 1: left
{
    // Control_Tris = 0x00; //set port control as output
     if(side == 0)   //right
     {
      CS2 = 1;
      CS1 = 0;
     }
     else if(side == 1)//left
     {
      CS2 = 0;
      CS1 = 1;
     }
     Delay_ms(2);
}
//wait GLCD
void Wait_GLCD(void)
{
    // Control_Tris = 0x00; //set port control as output
     Data_Tris    = 0xFF; //set port data as input
     RS = 0; RW = 1; //read RLCD -> PIC
     E = 1;
     Delay_ms(2);
     E = 0;
     
     while(GLCD_BusyBit == 1) //GLCD in operatin
     {
      E = 1;
      Delay_ms(2);
      E = 0;
     }
}
//set colum (Y) for GLCD
void GLCD_SetColum(char col) //col: 0~63
{
     Wait_GLCD();
     Data_Tris = 0x00; //set data port as output
     RS = RW = 0; //write instruction PIC -> GLCD
     
     GLCD_Cmd(GLCD_Colum + col);
     E = 1;
     Delay_ms(2);
     E = 0;
}
//set page (X) for GLCD
void GLCD_SetPage(char page) //page: 0~7
{
     Wait_GLCD();
     Data_Tris = 0x00; //set data port as output
     RS = RW = 0; //write instruction PIC -> GLCD

     GLCD_Cmd(GLCD_Page + page);
     E = 1;
     Delay_ms(2);
     E = 0;
}
//scroll display up to "lineValue" lines
void GLCD_ScrollUp(char lineValue) //lineValue: 0~63
{
     Wait_GLCD();
     Data_Tris = 0x00; //set data port as output
     RS = RW = 0; //write instruction PIC -> GLCD

     GLCD_Cmd(GLCD_Line + lineValue);
     E = 1;
     Delay_ms(2);
     E = 0;
}


//initialize GLCD function
void GLCD_Init(void)
{
     Control_Tris = 0x00; //config port control as output
     CS1 = CS2 = 1; //select left & right display
     Delay_ms(20);
     GLCD_Cmd(GLCD_OFF); //display OFF
     GLCD_Cmd(GLCD_Page); //set X (page = 0)
     GLCD_Cmd(GLCD_Colum); //set Y (colum = 0)
     GLCD_Cmd(GLCD_Line); //set Z (line = 0)
     GLCD_Cmd(GLCD_ON); //display ON
}
//GLDC send data function
void GLCD_SendData(char myData)
{
     Data_Tris = 0x00; //set data port as output
     Data_Port = myData;
     RS = 1; //RS pin HIGH to select data mode
     RW = 0; //RW pin LOW to select Write mode
     E = 1;
     Delay_ms(2);
     E = 0;
     Delay_ms(2);
}

//move the cursor to (X,Y) position
void GLCD_GotoXY(int page, int col) //page: 0~7, col: 0~127
{
     int side = 0;
     side = col/64;     //0: right; 1:left
     GLCD_SetSide(side);
     
     col -= 64 * side; //update real colum: 0~63
     GLCD_SetPage(page);
     GLCD_SetColum(col);
}
//clear GLCD
void GLCD_Clear(void)
{
     int page, colum;
     for(page = 0; page <= 7; page++)      //clear left display
     {
      GLCD_GotoXY(page, 0); //start at colum of page
      for(colum = 0; colum <= 63; colum++) GLCD_SendData(0);
     }
     for(page = 0; page <= 7; page++)     //clear right display
     {
      GLCD_GotoXY(page, 64); //start at colum of page
      for(colum = 0; colum <= 63; colum++) GLCD_SendData(0);
     }
}
//put a charater size 5x7 to GLCD
void GLCD_PutChar57(unsigned char x, unsigned char y, unsigned char chr)
{
     unsigned char i;
     if((y>59) && (y<64))
     {
      GLCD_GotoXY(x, y);
      for(i = 0; i < 64-y; i++)
            GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
      GLCD_GotoXY(x, 64);
      for(i = 64 - y; i < 5; i++)
            GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
     }
     else
     {
      GLCD_GotoXY(x, y);
      for(i = 0; i < 5; i++)
      GLCD_SendData(my_font5x7[((chr - 32)*5) + i]);
     }
}
//print a string to GLCD
void GLCD_Print57(unsigned char page, unsigned char col, char* str)
{
     unsigned char i, j;
     j = col;
     for( i = 0; str[i] != 0; i++)
     {
          if(j>=128)
          {
           col = 0;
           j = col;
           page++;
          }
          GLCD_PutChar57(page, j, str[i]);
          j += 7;
     }
}
void GLCD_PutBMP(code unsigned char* bmp)
{
     unsigned char line, col;
     unsigned int i;
     for(line = 0; line < 8; line++)
     {
              GLCD_GotoXY(line, 0);
              for(col = 0; col < 64; col++)   //left
              {
                      i = 128 * line + col;
                      GLCD_SendData(bmp[i]);
              }
              GLCD_GotoXY(line, 64);
              for(col = 64; col < 128; col++) //right
              {
                      i = 128 * line + col;
                      GLCD_SendData(bmp[i]);
              }
     }
}