
_main:

;main.c,3 :: 		void main()
;main.c,5 :: 		int get_value = 0 ;
	CLRF       main_get_value_L0+0
	CLRF       main_get_value_L0+1
;main.c,7 :: 		TRISB3_bit = 0; //PB3 set as output
	BCF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;main.c,8 :: 		PORTB.B3 = 0;
	BCF        PORTB+0, 3
;main.c,9 :: 		TRISB4_bit = 0; //PB4 set as output
	BCF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;main.c,10 :: 		PORTB.B4 = 0;
	BCF        PORTB+0, 4
;main.c,11 :: 		BlueTooth_Init();
	CALL       _BlueTooth_Init+0
;main.c,14 :: 		BlueTooth_Write("Bluetooth Initialized and Ready");
	MOVLW      ?lstr1_main+0
	MOVWF      FARG_BlueTooth_Write_str+0
	CALL       _BlueTooth_Write+0
;main.c,15 :: 		BlueTooth_BroadCast();
	CALL       _BlueTooth_BroadCast+0
;main.c,16 :: 		BlueTooth_Write("Press 1 to turn on LED");
	MOVLW      ?lstr2_main+0
	MOVWF      FARG_BlueTooth_Write_str+0
	CALL       _BlueTooth_Write+0
;main.c,17 :: 		BlueTooth_BroadCast();
	CALL       _BlueTooth_BroadCast+0
;main.c,18 :: 		BlueTooth_Write("Press 0 to turn on LED");
	MOVLW      ?lstr3_main+0
	MOVWF      FARG_BlueTooth_Write_str+0
	CALL       _BlueTooth_Write+0
;main.c,19 :: 		BlueTooth_BroadCast();
	CALL       _BlueTooth_BroadCast+0
;main.c,21 :: 		while(1)
L_main0:
;main.c,23 :: 		get_value = BlueTooth_GetChar(); //read the char from BT
	CALL       _BlueTooth_GetChar+0
	MOVF       R0+0, 0
	MOVWF      main_get_value_L0+0
	CLRF       main_get_value_L0+1
;main.c,24 :: 		if(get_value == 1)
	MOVLW      0
	XORWF      main_get_value_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      1
	XORWF      main_get_value_L0+0, 0
L__main10:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;main.c,27 :: 		PORTB.B3 = 1;
	BSF        PORTB+0, 3
;main.c,28 :: 		BlueTooth_Write("Led 1 ON");
	MOVLW      ?lstr4_main+0
	MOVWF      FARG_BlueTooth_Write_str+0
	CALL       _BlueTooth_Write+0
;main.c,29 :: 		BlueTooth_BroadCast();
	CALL       _BlueTooth_BroadCast+0
;main.c,30 :: 		}
	GOTO       L_main3
L_main2:
;main.c,31 :: 		else if(get_value == 0)
	MOVLW      0
	XORWF      main_get_value_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      0
	XORWF      main_get_value_L0+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;main.c,34 :: 		PORTB.B3 = 0;
	BCF        PORTB+0, 3
;main.c,35 :: 		BlueTooth_Write("Led 1 OFF ");
	MOVLW      ?lstr5_main+0
	MOVWF      FARG_BlueTooth_Write_str+0
	CALL       _BlueTooth_Write+0
;main.c,36 :: 		BlueTooth_BroadCast();
	CALL       _BlueTooth_BroadCast+0
;main.c,37 :: 		}
	GOTO       L_main5
L_main4:
;main.c,39 :: 		else if(get_value == 3)
	MOVLW      0
	XORWF      main_get_value_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      3
	XORWF      main_get_value_L0+0, 0
L__main12:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;main.c,42 :: 		PORTB.B4 = 1;
	BSF        PORTB+0, 4
;main.c,43 :: 		BlueTooth_Write("Led 2 ON ");
	MOVLW      ?lstr6_main+0
	MOVWF      FARG_BlueTooth_Write_str+0
	CALL       _BlueTooth_Write+0
;main.c,44 :: 		BlueTooth_BroadCast();
	CALL       _BlueTooth_BroadCast+0
;main.c,45 :: 		}
	GOTO       L_main7
L_main6:
;main.c,46 :: 		else if(get_value == 4)
	MOVLW      0
	XORWF      main_get_value_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      4
	XORWF      main_get_value_L0+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;main.c,49 :: 		PORTB.B4 = 0;
	BCF        PORTB+0, 4
;main.c,50 :: 		BlueTooth_Write("Led 2 OFF");
	MOVLW      ?lstr7_main+0
	MOVWF      FARG_BlueTooth_Write_str+0
	CALL       _BlueTooth_Write+0
;main.c,51 :: 		BlueTooth_BroadCast();
	CALL       _BlueTooth_BroadCast+0
;main.c,52 :: 		}
L_main8:
L_main7:
L_main5:
L_main3:
;main.c,53 :: 		}
	GOTO       L_main0
;main.c,54 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
