
_keyPress:

;keyPad4x4.c,12 :: 		unsigned char keyPress(void)
;keyPad4x4.c,14 :: 		unsigned char key = 0;
	CLRF       keyPress_key_L0+0
;keyPad4x4.c,16 :: 		TRISD = 0xF0;    //set port D as ouput
	MOVLW      240
	MOVWF      TRISD+0
;keyPad4x4.c,18 :: 		col1 = 0;
	BCF        PORTC+0, 3
;keyPad4x4.c,23 :: 		if(row1 == 0) key = 10;
	BTFSC      PORTD+0, 7
	GOTO       L_keyPress0
	MOVLW      10
	MOVWF      keyPress_key_L0+0
L_keyPress0:
;keyPad4x4.c,24 :: 		if(row2 == 0) key = 7;
	BTFSC      PORTD+0, 6
	GOTO       L_keyPress1
	MOVLW      7
	MOVWF      keyPress_key_L0+0
L_keyPress1:
;keyPad4x4.c,25 :: 		if(row3 == 0) key = 4;
	BTFSC      PORTD+0, 5
	GOTO       L_keyPress2
	MOVLW      4
	MOVWF      keyPress_key_L0+0
L_keyPress2:
;keyPad4x4.c,26 :: 		if(row4 == 0) key = 1;
	BTFSC      PORTD+0, 4
	GOTO       L_keyPress3
	MOVLW      1
	MOVWF      keyPress_key_L0+0
L_keyPress3:
;keyPad4x4.c,27 :: 		col1 = 1;
	BSF        PORTC+0, 3
;keyPad4x4.c,29 :: 		col2 = 0;
	BCF        PORTC+0, 2
;keyPad4x4.c,34 :: 		if(row1 == 0) key = 0;
	BTFSC      PORTD+0, 7
	GOTO       L_keyPress4
	CLRF       keyPress_key_L0+0
L_keyPress4:
;keyPad4x4.c,35 :: 		if(row2 == 0) key = 8;
	BTFSC      PORTD+0, 6
	GOTO       L_keyPress5
	MOVLW      8
	MOVWF      keyPress_key_L0+0
L_keyPress5:
;keyPad4x4.c,36 :: 		if(row3 == 0) key = 5;
	BTFSC      PORTD+0, 5
	GOTO       L_keyPress6
	MOVLW      5
	MOVWF      keyPress_key_L0+0
L_keyPress6:
;keyPad4x4.c,37 :: 		if(row4 == 0) key = 2;
	BTFSC      PORTD+0, 4
	GOTO       L_keyPress7
	MOVLW      2
	MOVWF      keyPress_key_L0+0
L_keyPress7:
;keyPad4x4.c,38 :: 		col2 = 1;
	BSF        PORTC+0, 2
;keyPad4x4.c,40 :: 		col3 = 0;
	BCF        PORTC+0, 1
;keyPad4x4.c,45 :: 		if(row1 == 0) key = 11;
	BTFSC      PORTD+0, 7
	GOTO       L_keyPress8
	MOVLW      11
	MOVWF      keyPress_key_L0+0
L_keyPress8:
;keyPad4x4.c,46 :: 		if(row2 == 0) key = 9;
	BTFSC      PORTD+0, 6
	GOTO       L_keyPress9
	MOVLW      9
	MOVWF      keyPress_key_L0+0
L_keyPress9:
;keyPad4x4.c,47 :: 		if(row3 == 0) key = 6;
	BTFSC      PORTD+0, 5
	GOTO       L_keyPress10
	MOVLW      6
	MOVWF      keyPress_key_L0+0
L_keyPress10:
;keyPad4x4.c,48 :: 		if(row4 == 0) key = 3;
	BTFSC      PORTD+0, 4
	GOTO       L_keyPress11
	MOVLW      3
	MOVWF      keyPress_key_L0+0
L_keyPress11:
;keyPad4x4.c,49 :: 		col3 = 1;
	BSF        PORTC+0, 1
;keyPad4x4.c,51 :: 		col4 = 0;
	BCF        PORTC+0, 0
;keyPad4x4.c,56 :: 		if(row1 == 0) key = 12;
	BTFSC      PORTD+0, 7
	GOTO       L_keyPress12
	MOVLW      12
	MOVWF      keyPress_key_L0+0
L_keyPress12:
;keyPad4x4.c,57 :: 		if(row2 == 0) key = 13;
	BTFSC      PORTD+0, 6
	GOTO       L_keyPress13
	MOVLW      13
	MOVWF      keyPress_key_L0+0
L_keyPress13:
;keyPad4x4.c,58 :: 		if(row3 == 0) key = 14;
	BTFSC      PORTD+0, 5
	GOTO       L_keyPress14
	MOVLW      14
	MOVWF      keyPress_key_L0+0
L_keyPress14:
;keyPad4x4.c,59 :: 		if(row4 == 0) key = 15;
	BTFSC      PORTD+0, 4
	GOTO       L_keyPress15
	MOVLW      15
	MOVWF      keyPress_key_L0+0
L_keyPress15:
;keyPad4x4.c,60 :: 		col4 = 1;
	BSF        PORTC+0, 0
;keyPad4x4.c,61 :: 		return key;
	MOVF       keyPress_key_L0+0, 0
	MOVWF      R0+0
;keyPad4x4.c,62 :: 		}
L_end_keyPress:
	RETURN
; end of _keyPress
