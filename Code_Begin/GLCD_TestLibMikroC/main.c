char GLCD_DataPort at PORTB;

sbit GLCD_CS1 at RD3_bit;
sbit GLCD_CS2 at RD4_bit;
sbit GLCD_RS  at RD5_bit;
sbit GLCD_RW  at RD6_bit;
sbit GLCD_EN at RD7_bit;
sbit GLCD_RST at RD0_bit;

sbit GLCD_CS1_Direction at TRISD3_bit;
sbit GLCD_CS2_Direction at TRISD4_bit;
sbit GLCD_RS_Direction at TRISD5_bit;
sbit GLCD_RW_Direction at TRISD6_bit;
sbit GLCD_EN_Direction at TRISD7_bit;
sbit GLCD_RST_Direction at TRISD0_bit;


void main() {
     //

     Glcd_Init();
     //Glcd_Fill(1);
     //Glcd_H_Line(10, 50, 20, 1);
     //Delay_ms(1000);
     Glcd_Write_Text("haha", 0, 2, 0);
    // Delay_ms(5000);
     //GLCD_Fill(0);
     while(1)
     {


     }
}
