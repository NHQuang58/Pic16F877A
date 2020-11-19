#line 1 "D:/Hoc_PIC/Code_Begin/BlueTooth_HC06/blueTooth.c"

void BlueTooth_Init(void)
{

 TRISC.B6 = 0;
 TRISC.B7 = 1;


 BRGH_bit = 1;
 SPBRG = 51;


 SYNC_bit = 0;
 SPEN_bit = 1;


 TXEN_bit = 1;
 CREN_bit = 1;
 TX9_bit = 0;
 RX9_bit = 0;


 GIE_bit = 1;
 PEIE_bit = 1;
 RCIE_bit = 1;
 TXIE_bit = 1;
}

void BlueTooth_SendByte(char myData)
{
 TXREG = myData;
 while(!TXIF_bit);
 while(!TRMT_bit);

}

void BlueTooth_Write(char *str)
{
 while(*str)
 {
 BlueTooth_SendByte(*str++);
 }
}


char BlueTooth_GetChar(void)
{
 if(OERR_bit)
 {
 CREN_bit = 0;
 CREN_bit = 1;
 }
#line 60 "D:/Hoc_PIC/Code_Begin/BlueTooth_HC06/blueTooth.c"
 while(!RCIF_bit);
 return RCREG;
}
void BlueTooth_BroadCast(void)
{
 TXREG = 13;
 Delay_ms(300);
}
