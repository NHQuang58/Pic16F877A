sbit SH_CP1 at PORTB.B6;
sbit ST_CP1 at PORTB.B7;
/*init DSS pin for second pins*/
sbit DSS0 at PORTC.B0;
sbit DSS1 at PORTC.B1;
sbit DSS2 at PORTC.B2;
sbit DSS3 at PORTC.B3;
sbit DSS4 at PORTC.B4;
sbit DSS5 at PORTC.B5;
sbit DSS6 at PORTC.B6;
sbit DSS7 at PORTC.B7;

/*init DSM pin for minute pins*/
sbit DSM0 at PORTD.B0;
sbit DSM1 at PORTD.B1;
sbit DSM2 at PORTD.B2;
sbit DSM3 at PORTD.B3;
sbit DSM4 at PORTD.B4;
sbit DSM5 at PORTD.B5;
sbit DSM6 at PORTD.B6;
sbit DSM7 at PORTD.B7;

/*init DSH pin for hour pins*/
sbit DSH0 at PORTB.B4;
sbit DSH1 at PORTB.B5;


/*Functions for seconds*/

void IC74595_SeConds0_7(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSS0 = 1;
        else DSS0 = 0;
        myData <<= 1;
        
        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_SeConds8_15(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSS1 = 1;
        else DSS1 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_SeConds16_23(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSS2 = 1;
        else DSS2 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_SeConds24_31(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSS3 = 1;
        else DSS3 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_SeConds32_39(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSS4 = 1;
        else DSS4 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_SeConds40_47(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSS5 = 1;
        else DSS5 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_SeConds48_55(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSS6 = 1;
        else DSS6 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_Seconds56_59(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSS7 = 1;
        else DSS7 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}


/*Functions for minute*/

void IC74595_Minute0_7(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSM0 = 1;
        else DSM0 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_Minute8_15(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSM1 = 1;
        else DSM1 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_Minute16_23(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSM2 = 1;
        else DSM2 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_Minute24_31(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSM3 = 1;
        else DSM3 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_Minute32_39(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSM4 = 1;
        else DSM4 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_Minute40_47(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSM5 = 1;
        else DSM5 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_Minute48_55(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSM6 = 1;
        else DSM6 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}
void IC74595_Minute56_59(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSM7 = 1;
        else DSM7 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}

/*Functions for hour*/
void IC74595_Hour0_7(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSH0 = 1;
        else DSH0 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}

void IC74595_Hour8_11(unsigned char myData)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        //DS1 = myData & (0x80 >> i);
        if(myData & 0x80) DSH1 = 1;
        else DSH1 = 0;
        myData <<= 1;

        //tao xung dich du lieu
        SH_CP1 = 0;
        SH_CP1 = 1;
    }
    //tao xung xuat du lieu
    ST_CP1 = 0;
    ST_CP1 = 1;
}








