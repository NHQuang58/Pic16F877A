#line 1 "D:/Hoc_PIC/Code_Begin/GLCD_TestLibMikroC/main.c"
char GLCD_DataPort at PORTB;

sbit GLCD_CS1 at RD3_bit;
sbit GLCD_CS2 at RD4_bit;
sbit GLCD_RS at RD5_bit;
sbit GLCD_RW at RD6_bit;
sbit GLCD_EN at RD7_bit;
sbit GLCD_RST at RD0_bit;

sbit GLCD_CS1_Direction at TRISD3_bit;
sbit GLCD_CS2_Direction at TRISD4_bit;
sbit GLCD_RS_Direction at TRISD5_bit;
sbit GLCD_RW_Direction at TRISD6_bit;
sbit GLCD_EN_Direction at TRISD7_bit;
sbit GLCD_RST_Direction at TRISD0_bit;


void main() {


 Glcd_Init();



 Glcd_Write_Text("haha", 0, 2, 0);


 while(1)
 {


 }
}
