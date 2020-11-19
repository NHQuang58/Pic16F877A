
_BCD_2_DEC:

;ds3231_pic.h,39 :: 		int  BCD_2_DEC(int to_convert)
;ds3231_pic.h,41 :: 		return (to_convert >> 4) * 10 + (to_convert & 0x0F);
	MOVLW      4
	MOVWF      R2+0
	MOVF       FARG_BCD_2_DEC_to_convert+0, 0
	MOVWF      R0+0
	MOVF       FARG_BCD_2_DEC_to_convert+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__BCD_2_DEC24:
	BTFSC      STATUS+0, 2
	GOTO       L__BCD_2_DEC25
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	ADDLW      255
	GOTO       L__BCD_2_DEC24
L__BCD_2_DEC25:
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      15
	ANDWF      FARG_BCD_2_DEC_to_convert+0, 0
	MOVWF      R2+0
	MOVF       FARG_BCD_2_DEC_to_convert+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 1
	MOVF       R2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
;ds3231_pic.h,42 :: 		}
L_end_BCD_2_DEC:
	RETURN
; end of _BCD_2_DEC

_DEC_2_BCD:

;ds3231_pic.h,44 :: 		int DEC_2_BCD (int to_convert)
;ds3231_pic.h,46 :: 		return ((to_convert / 10) << 4) + (to_convert % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_DEC_2_BCD_to_convert+0, 0
	MOVWF      R0+0
	MOVF       FARG_DEC_2_BCD_to_convert+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      FLOC__DEC_2_BCD+0
	MOVF       R0+1, 0
	MOVWF      FLOC__DEC_2_BCD+1
	MOVF       R2+0, 0
L__DEC_2_BCD27:
	BTFSC      STATUS+0, 2
	GOTO       L__DEC_2_BCD28
	RLF        FLOC__DEC_2_BCD+0, 1
	RLF        FLOC__DEC_2_BCD+1, 1
	BCF        FLOC__DEC_2_BCD+0, 0
	ADDLW      255
	GOTO       L__DEC_2_BCD27
L__DEC_2_BCD28:
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_DEC_2_BCD_to_convert+0, 0
	MOVWF      R0+0
	MOVF       FARG_DEC_2_BCD_to_convert+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       FLOC__DEC_2_BCD+0, 0
	ADDWF      R0+0, 1
	MOVF       FLOC__DEC_2_BCD+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
;ds3231_pic.h,47 :: 		}
L_end_DEC_2_BCD:
	RETURN
; end of _DEC_2_BCD

_Set_Time_Date:

;ds3231_pic.h,49 :: 		void Set_Time_Date()
;ds3231_pic.h,51 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,52 :: 		I2C_Write(0xD0);    //address of Ds3231 (PIC -> RTC)
	MOVLW      208
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,53 :: 		I2C_Write(0);
	CLRF       FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,54 :: 		I2C_Write(DEC_2_BCD(sec)); //update sec
	MOVF       _sec+0, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+0
	MOVF       _sec+1, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+1
	CALL       _DEC_2_BCD+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,55 :: 		I2C_Write(DEC_2_BCD(min)); //update min
	MOVF       _min+0, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+0
	MOVF       _min+1, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+1
	CALL       _DEC_2_BCD+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,56 :: 		I2C_Write(DEC_2_BCD(hour)); //update hour
	MOVF       _hour+0, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+0
	MOVF       _hour+1, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+1
	CALL       _DEC_2_BCD+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,57 :: 		I2C_Write(DEC_2_BCD(day));  //update day of week
	MOVF       _day+0, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+0
	MOVF       _day+1, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+1
	CALL       _DEC_2_BCD+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,58 :: 		I2C_Write(DEC_2_BCD(date)); //update date
	MOVF       _date+0, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+0
	MOVF       _date+1, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+1
	CALL       _DEC_2_BCD+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,59 :: 		I2C_Write(DEC_2_BCD(month)); //update month
	MOVF       _month+0, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+0
	MOVF       _month+1, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+1
	CALL       _DEC_2_BCD+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,60 :: 		I2C_Write(DEC_2_BCD(year)); //update year
	MOVF       _year+0, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+0
	MOVF       _year+1, 0
	MOVWF      FARG_DEC_2_BCD_to_convert+1
	CALL       _DEC_2_BCD+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,62 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,63 :: 		}
L_end_Set_Time_Date:
	RETURN
; end of _Set_Time_Date

_Update_Current_Date_Time:

;ds3231_pic.h,65 :: 		void Update_Current_Date_Time()
;ds3231_pic.h,68 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,69 :: 		I2C_Write(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,70 :: 		I2C_Write(0);
	CLRF       FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,71 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,74 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,75 :: 		I2C_Write(0xD1);            //address of DS3231 (RTC -> PIC)
	MOVLW      209
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,76 :: 		sec = BCD_2_DEC(I2C_Read(1));
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      FARG_BCD_2_DEC_to_convert+0
	CLRF       FARG_BCD_2_DEC_to_convert+1
	CALL       _BCD_2_DEC+0
	MOVF       R0+0, 0
	MOVWF      _sec+0
	MOVF       R0+1, 0
	MOVWF      _sec+1
;ds3231_pic.h,77 :: 		min = BCD_2_DEC(I2C_Read(1));
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      FARG_BCD_2_DEC_to_convert+0
	CLRF       FARG_BCD_2_DEC_to_convert+1
	CALL       _BCD_2_DEC+0
	MOVF       R0+0, 0
	MOVWF      _min+0
	MOVF       R0+1, 0
	MOVWF      _min+1
;ds3231_pic.h,78 :: 		hour = BCD_2_DEC(I2C_Read(1));
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      FARG_BCD_2_DEC_to_convert+0
	CLRF       FARG_BCD_2_DEC_to_convert+1
	CALL       _BCD_2_DEC+0
	MOVF       R0+0, 0
	MOVWF      _hour+0
	MOVF       R0+1, 0
	MOVWF      _hour+1
;ds3231_pic.h,80 :: 		day = BCD_2_DEC(I2C_Read(1));
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      FARG_BCD_2_DEC_to_convert+0
	CLRF       FARG_BCD_2_DEC_to_convert+1
	CALL       _BCD_2_DEC+0
	MOVF       R0+0, 0
	MOVWF      _day+0
	MOVF       R0+1, 0
	MOVWF      _day+1
;ds3231_pic.h,81 :: 		date = BCD_2_DEC(I2C_Read(1));
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      FARG_BCD_2_DEC_to_convert+0
	CLRF       FARG_BCD_2_DEC_to_convert+1
	CALL       _BCD_2_DEC+0
	MOVF       R0+0, 0
	MOVWF      _date+0
	MOVF       R0+1, 0
	MOVWF      _date+1
;ds3231_pic.h,82 :: 		month = BCD_2_DEC(I2C_Read(1));
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      FARG_BCD_2_DEC_to_convert+0
	CLRF       FARG_BCD_2_DEC_to_convert+1
	CALL       _BCD_2_DEC+0
	MOVF       R0+0, 0
	MOVWF      _month+0
	MOVF       R0+1, 0
	MOVWF      _month+1
;ds3231_pic.h,83 :: 		year = BCD_2_DEC(I2C_Read(1));
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      FARG_BCD_2_DEC_to_convert+0
	CLRF       FARG_BCD_2_DEC_to_convert+1
	CALL       _BCD_2_DEC+0
	MOVF       R0+0, 0
	MOVWF      _year+0
	MOVF       R0+1, 0
	MOVWF      _year+1
;ds3231_pic.h,84 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,87 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,88 :: 		I2C_Write(0xD1);                // Initialize data read
	MOVLW      209
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,89 :: 		I2C_Read(1);
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
;ds3231_pic.h,90 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,92 :: 		}
L_end_Update_Current_Date_Time:
	RETURN
; end of _Update_Current_Date_Time

_I2C_Conv_Temp:

;ds3231_pic.h,94 :: 		void I2C_Conv_Temp(void)
;ds3231_pic.h,97 :: 		char status = 0, control = 0;
	CLRF       I2C_Conv_Temp_status_L0+0
	CLRF       I2C_Conv_Temp_control_L0+0
;ds3231_pic.h,99 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,100 :: 		I2C_Write(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,101 :: 		I2C_Write(0x0F);  //address of Status Register
	MOVLW      15
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,102 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,105 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,106 :: 		I2C_Write(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,107 :: 		status = I2C_Read(1);
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      I2C_Conv_Temp_status_L0+0
;ds3231_pic.h,108 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,110 :: 		if(!(status & 0x04))     //if BSY bit == 0 (not busy)
	BTFSC      I2C_Conv_Temp_status_L0+0, 2
	GOTO       L_I2C_Conv_Temp0
;ds3231_pic.h,113 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,114 :: 		I2C_Write(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,115 :: 		I2C_Write(0x0E); //address of Control Register
	MOVLW      14
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,116 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,118 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,119 :: 		I2C_Write(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,120 :: 		control = I2C_Read(1);
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      I2C_Conv_Temp_control_L0+0
;ds3231_pic.h,121 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,124 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,125 :: 		I2C_Write(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,126 :: 		I2C_Write(0xE0);     //address of Control Register
	MOVLW      224
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,127 :: 		I2C_Write(control | 0x20); //set CONV bit as '1'
	MOVLW      32
	IORWF      I2C_Conv_Temp_control_L0+0, 0
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,128 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,130 :: 		}
L_I2C_Conv_Temp0:
;ds3231_pic.h,131 :: 		}
L_end_I2C_Conv_Temp:
	RETURN
; end of _I2C_Conv_Temp

_Get_Temp:

;ds3231_pic.h,133 :: 		void Get_Temp(void)
;ds3231_pic.h,136 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,137 :: 		I2C_Write(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,138 :: 		I2C_Write(0x11); //Address of MSB of Temp
	MOVLW      17
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,139 :: 		I2C_End();
	CALL       _I2C_End+0
;ds3231_pic.h,141 :: 		I2C_Start();
	CALL       _I2C_Start+0
;ds3231_pic.h,142 :: 		I2C_Write(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C_Write_dataSend+0
	CALL       _I2C_Write+0
;ds3231_pic.h,143 :: 		temp[0] = I2C_Read(1);
	MOVLW      1
	MOVWF      FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
;ds3231_pic.h,144 :: 		temp[1] = I2C_Read(0);
	CLRF       FARG_I2C_Read_ack+0
	CALL       _I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+1
;ds3231_pic.h,146 :: 		}
L_end_Get_Temp:
	RETURN
; end of _Get_Temp

_main:

;main.c,7 :: 		void main()
;main.c,10 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;main.c,12 :: 		I2C_Init(100000);
	MOVLW      160
	MOVWF      FARG_I2C_Init_freq_KHz+0
	MOVLW      134
	MOVWF      FARG_I2C_Init_freq_KHz+1
	MOVLW      1
	MOVWF      FARG_I2C_Init_freq_KHz+2
	MOVLW      0
	MOVWF      FARG_I2C_Init_freq_KHz+3
	CALL       _I2C_Init+0
;main.c,14 :: 		Set_Time_Date();
	CALL       _Set_Time_Date+0
;main.c,17 :: 		Lcd_Clear();
	CALL       _Lcd_Clear+0
;main.c,18 :: 		Lcd_GoToXY(0, 1);
	CLRF       FARG_Lcd_GoToXY_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_GoToXY_col+0
	CALL       _Lcd_GoToXY+0
;main.c,19 :: 		Lcd_Puts("DS3231 with PIC");
	MOVLW      ?lstr1_main+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
;main.c,20 :: 		Lcd_GoToXY(1, 1);
	MOVLW      1
	MOVWF      FARG_Lcd_GoToXY_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_GoToXY_col+0
	CALL       _Lcd_GoToXY+0
;main.c,21 :: 		Lcd_Puts("DevZone 2020");
	MOVLW      ?lstr2_main+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
;main.c,22 :: 		Delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;main.c,23 :: 		Lcd_Clear();
	CALL       _Lcd_Clear+0
;main.c,25 :: 		while(1)
L_main2:
;main.c,28 :: 		Update_Current_Date_Time();
	CALL       _Update_Current_Date_Time+0
;main.c,31 :: 		sec_0 = sec%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sec+0, 0
	MOVWF      R0+0
	MOVF       _sec+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _sec_0+0
;main.c,32 :: 		sec_1 = (sec/10);
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sec+0, 0
	MOVWF      R0+0
	MOVF       _sec+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _sec_1+0
;main.c,33 :: 		min_0 = min%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _min+0, 0
	MOVWF      R0+0
	MOVF       _min+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _min_0+0
;main.c,34 :: 		min_1 = min/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _min+0, 0
	MOVWF      R0+0
	MOVF       _min+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _min_1+0
;main.c,35 :: 		hour_0 = hour%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _hour+0, 0
	MOVWF      R0+0
	MOVF       _hour+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _hour_0+0
;main.c,36 :: 		hour_1 = hour/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _hour+0, 0
	MOVWF      R0+0
	MOVF       _hour+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _hour_1+0
;main.c,37 :: 		date_0 = date%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _date+0, 0
	MOVWF      R0+0
	MOVF       _date+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _date_0+0
;main.c,38 :: 		date_1 = date/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _date+0, 0
	MOVWF      R0+0
	MOVF       _date+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _date_1+0
;main.c,39 :: 		month_0 = month%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _month+0, 0
	MOVWF      R0+0
	MOVF       _month+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _month_0+0
;main.c,40 :: 		month_1 = month/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _month+0, 0
	MOVWF      R0+0
	MOVF       _month+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _month_1+0
;main.c,41 :: 		year_0 = year%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _year_0+0
;main.c,42 :: 		year_1 = year/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _year_1+0
;main.c,46 :: 		LCD_GotoXY(0, 0);
	CLRF       FARG_Lcd_GoToXY_row+0
	CLRF       FARG_Lcd_GoToXY_col+0
	CALL       _Lcd_GoToXY+0
;main.c,48 :: 		LCD_PutChar(hour_1 +'0');
	MOVLW      48
	ADDWF      _hour_1+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,49 :: 		LCD_PutChar(hour_0 +'0');
	MOVLW      48
	ADDWF      _hour_0+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,50 :: 		LCD_PutChar(':');
	MOVLW      58
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,51 :: 		LCD_PutChar(min_1 +'0');
	MOVLW      48
	ADDWF      _min_1+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,52 :: 		LCD_PutChar(min_0 +'0');
	MOVLW      48
	ADDWF      _min_0+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,53 :: 		LCD_PutChar(':');
	MOVLW      58
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,54 :: 		LCD_PutChar(sec_1 +'0');
	MOVLW      48
	ADDWF      _sec_1+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,55 :: 		LCD_PutChar(sec_0 +'0');
	MOVLW      48
	ADDWF      _sec_0+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,58 :: 		I2C_Conv_Temp();
	CALL       _I2C_Conv_Temp+0
;main.c,59 :: 		Get_Temp();
	CALL       _Get_Temp+0
;main.c,60 :: 		temp_0 = temp[0] / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _temp+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _temp_0+0
;main.c,61 :: 		temp_1 = temp[0] % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _temp+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _temp_1+0
;main.c,62 :: 		temp[1] >>= 6;
	MOVLW      6
	MOVWF      R0+0
	MOVF       _temp+1, 0
	MOVWF      R1+0
	MOVF       R0+0, 0
L__main34:
	BTFSC      STATUS+0, 2
	GOTO       L__main35
	RRF        R1+0, 1
	BCF        R1+0, 7
	ADDLW      255
	GOTO       L__main34
L__main35:
	MOVF       R1+0, 0
	MOVWF      _temp+1
;main.c,63 :: 		if(temp[1] == 0)
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;main.c,65 :: 		temp_2 = 0;
	CLRF       _temp_2+0
;main.c,66 :: 		temp_3 = 0;
	CLRF       _temp_3+0
;main.c,67 :: 		}
	GOTO       L_main5
L_main4:
;main.c,68 :: 		else if(temp[1] == 1)
	MOVF       _temp+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;main.c,70 :: 		temp_2 = 2;
	MOVLW      2
	MOVWF      _temp_2+0
;main.c,71 :: 		temp_3 = 5;
	MOVLW      5
	MOVWF      _temp_3+0
;main.c,72 :: 		}
	GOTO       L_main7
L_main6:
;main.c,73 :: 		else if(temp[1] == 2)
	MOVF       _temp+1, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;main.c,75 :: 		temp_2 = 5;
	MOVLW      5
	MOVWF      _temp_2+0
;main.c,76 :: 		temp_3 = 0;
	CLRF       _temp_3+0
;main.c,77 :: 		}
	GOTO       L_main9
L_main8:
;main.c,80 :: 		temp_2 = 7;
	MOVLW      7
	MOVWF      _temp_2+0
;main.c,81 :: 		temp_3 = 5;
	MOVLW      5
	MOVWF      _temp_3+0
;main.c,82 :: 		}
L_main9:
L_main7:
L_main5:
;main.c,84 :: 		LCD_GotoXY(0, 9);
	CLRF       FARG_Lcd_GoToXY_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_GoToXY_col+0
	CALL       _Lcd_GoToXY+0
;main.c,85 :: 		LCD_PutChar(temp_0 +'0');
	MOVLW      48
	ADDWF      _temp_0+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,86 :: 		LCD_PutChar(temp_1 +'0');
	MOVLW      48
	ADDWF      _temp_1+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,87 :: 		LCD_PutChar('.');
	MOVLW      46
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,88 :: 		LCD_PutChar(temp_2 +'0');
	MOVLW      48
	ADDWF      _temp_2+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,89 :: 		LCD_PutChar(temp_3 +'0');
	MOVLW      48
	ADDWF      _temp_3+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,90 :: 		LCD_PutChar(0xDF);
	MOVLW      223
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,91 :: 		LCD_PutChar('C');
	MOVLW      67
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,96 :: 		LCD_GotoXY(1, 0);
	MOVLW      1
	MOVWF      FARG_Lcd_GoToXY_row+0
	CLRF       FARG_Lcd_GoToXY_col+0
	CALL       _Lcd_GoToXY+0
;main.c,98 :: 		LCD_PutChar(date_1 + '0');
	MOVLW      48
	ADDWF      _date_1+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,99 :: 		LCD_PutChar(date_0 + '0');
	MOVLW      48
	ADDWF      _date_0+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,100 :: 		LCD_PutChar('-');
	MOVLW      45
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,101 :: 		LCD_PutChar(month_1 + '0');
	MOVLW      48
	ADDWF      _month_1+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,102 :: 		LCD_PutChar(month_0 + '0');
	MOVLW      48
	ADDWF      _month_0+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,103 :: 		LCD_PutChar('-');
	MOVLW      45
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,104 :: 		LCD_PutChar(year_1 + '0');
	MOVLW      48
	ADDWF      _year_1+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,105 :: 		LCD_PutChar(year_0 + '0');
	MOVLW      48
	ADDWF      _year_0+0, 0
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,107 :: 		LCD_PutChar(' ');
	MOVLW      32
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,108 :: 		LCD_PutChar('-');
	MOVLW      45
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,109 :: 		LCD_PutChar(' ');
	MOVLW      32
	MOVWF      FARG_Lcd_PutChar_myData+0
	CALL       _Lcd_PutChar+0
;main.c,111 :: 		if(day == 1) LCD_Puts("SUN");
	MOVLW      0
	XORWF      _day+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      1
	XORWF      _day+0, 0
L__main36:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	MOVLW      ?lstr3_main+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
	GOTO       L_main11
L_main10:
;main.c,112 :: 		else if(day == 2) LCD_Puts("MON");
	MOVLW      0
	XORWF      _day+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVLW      2
	XORWF      _day+0, 0
L__main37:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
	MOVLW      ?lstr4_main+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
	GOTO       L_main13
L_main12:
;main.c,113 :: 		else if(day == 3) LCD_Puts("TUE");
	MOVLW      0
	XORWF      _day+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVLW      3
	XORWF      _day+0, 0
L__main38:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	MOVLW      ?lstr5_main+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
	GOTO       L_main15
L_main14:
;main.c,114 :: 		else if(day == 4) LCD_Puts("WED");
	MOVLW      0
	XORWF      _day+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVLW      4
	XORWF      _day+0, 0
L__main39:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
	MOVLW      ?lstr6_main+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
	GOTO       L_main17
L_main16:
;main.c,115 :: 		else if(day == 5) LCD_Puts("THU");
	MOVLW      0
	XORWF      _day+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVLW      5
	XORWF      _day+0, 0
L__main40:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
	MOVLW      ?lstr7_main+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
	GOTO       L_main19
L_main18:
;main.c,116 :: 		else if(day == 6) LCD_Puts("FRI");
	MOVLW      0
	XORWF      _day+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      6
	XORWF      _day+0, 0
L__main41:
	BTFSS      STATUS+0, 2
	GOTO       L_main20
	MOVLW      ?lstr8_main+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
	GOTO       L_main21
L_main20:
;main.c,117 :: 		else LCD_Puts("SAT");
	MOVLW      ?lstr9_main+0
	MOVWF      FARG_Lcd_Puts_s+0
	CALL       _Lcd_Puts+0
L_main21:
L_main19:
L_main17:
L_main15:
L_main13:
L_main11:
;main.c,119 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;main.c,121 :: 		}
	GOTO       L_main2
;main.c,123 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
