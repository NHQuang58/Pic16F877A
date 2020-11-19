#ifndef _BLUETOOTH_C_
#define _BLUETOOTH_C_

void BlueTooth_Init(void);
void BlueTooth_SendByte(char myData);
//send 1 string function
void BlueTooth_Write(char *str);
//receive 1 byte data function
char BlueTooth_GetChar(void);
void BlueTooth_BroadCast();


#endif