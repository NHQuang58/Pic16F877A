#line 1 "D:/Hoc_PIC/Code_Begin/BlueTooth_HC06/main.c"
#line 1 "d:/hoc_pic/code_begin/bluetooth_hc06/bluetooth.h"



void BlueTooth_Init(void);
void BlueTooth_SendByte(char myData);

void BlueTooth_Write(char *str);

char BlueTooth_GetChar(void);
void BlueTooth_BroadCast();
#line 3 "D:/Hoc_PIC/Code_Begin/BlueTooth_HC06/main.c"
void main()
{
 int get_value = 0 ;

 TRISB3_bit = 0;
 PORTB.B3 = 0;
 TRISB4_bit = 0;
 PORTB.B4 = 0;
 BlueTooth_Init();


 BlueTooth_Write("Bluetooth Initialized and Ready");
 BlueTooth_BroadCast();
 BlueTooth_Write("Press 1 to turn on LED");
 BlueTooth_BroadCast();
 BlueTooth_Write("Press 0 to turn on LED");
 BlueTooth_BroadCast();

 while(1)
 {
 get_value = BlueTooth_GetChar();
 if(get_value == 1)
 {

 PORTB.B3 = 1;
 BlueTooth_Write("Led 1 ON");
 BlueTooth_BroadCast();
 }
 else if(get_value == 0)
 {

 PORTB.B3 = 0;
 BlueTooth_Write("Led 1 OFF ");
 BlueTooth_BroadCast();
 }

 else if(get_value == 3)
 {

 PORTB.B4 = 1;
 BlueTooth_Write("Led 2 ON ");
 BlueTooth_BroadCast();
 }
 else if(get_value == 4)
 {

 PORTB.B4 = 0;
 BlueTooth_Write("Led 2 OFF");
 BlueTooth_BroadCast();
 }
 }
}
