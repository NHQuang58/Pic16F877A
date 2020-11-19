
_keyPress:

;keyPad.c,12 :: 		unsigned char keyPress(void)
;keyPad.c,14 :: 		unsigned char key = 0;
	CLRF       keyPress_key_L0+0
;keyPad.c,16 :: 		col1 = 0;
	BCF        PORTC+0, 3
;keyPad.c,17 :: 		if(row1 == 0) key = 1;
	BTFSC      PORTB+0, 7
	GOTO       L_keyPress0
	MOVLW      1
	MOVWF      keyPress_key_L0+0
L_keyPress0:
;keyPad.c,18 :: 		if(row2 == 0) key = 2;
	BTFSC      PORTB+0, 6
	GOTO       L_keyPress1
	MOVLW      2
	MOVWF      keyPress_key_L0+0
L_keyPress1:
;keyPad.c,19 :: 		if(row3 == 0) key = 3;
	BTFSC      PORTB+0, 5
	GOTO       L_keyPress2
	MOVLW      3
	MOVWF      keyPress_key_L0+0
L_keyPress2:
;keyPad.c,20 :: 		if(row4 == 0) key = 4;
	BTFSC      PORTB+0, 4
	GOTO       L_keyPress3
	MOVLW      4
	MOVWF      keyPress_key_L0+0
L_keyPress3:
;keyPad.c,21 :: 		col1 = 1;
	BSF        PORTC+0, 3
;keyPad.c,23 :: 		col2 = 0;
	BCF        PORTC+0, 2
;keyPad.c,24 :: 		if(row1 == 0) key = 5;
	BTFSC      PORTB+0, 7
	GOTO       L_keyPress4
	MOVLW      5
	MOVWF      keyPress_key_L0+0
L_keyPress4:
;keyPad.c,25 :: 		if(row2 == 0) key = 6;
	BTFSC      PORTB+0, 6
	GOTO       L_keyPress5
	MOVLW      6
	MOVWF      keyPress_key_L0+0
L_keyPress5:
;keyPad.c,26 :: 		if(row3 == 0) key = 7;
	BTFSC      PORTB+0, 5
	GOTO       L_keyPress6
	MOVLW      7
	MOVWF      keyPress_key_L0+0
L_keyPress6:
;keyPad.c,27 :: 		if(row4 == 0) key = 8;
	BTFSC      PORTB+0, 4
	GOTO       L_keyPress7
	MOVLW      8
	MOVWF      keyPress_key_L0+0
L_keyPress7:
;keyPad.c,28 :: 		col2 = 1;
	BSF        PORTC+0, 2
;keyPad.c,30 :: 		col3 = 0;
	BCF        PORTC+0, 1
;keyPad.c,31 :: 		if(row1 == 0) key = 9;
	BTFSC      PORTB+0, 7
	GOTO       L_keyPress8
	MOVLW      9
	MOVWF      keyPress_key_L0+0
L_keyPress8:
;keyPad.c,32 :: 		if(row2 == 0) key = 10;
	BTFSC      PORTB+0, 6
	GOTO       L_keyPress9
	MOVLW      10
	MOVWF      keyPress_key_L0+0
L_keyPress9:
;keyPad.c,33 :: 		if(row3 == 0) key = 11;
	BTFSC      PORTB+0, 5
	GOTO       L_keyPress10
	MOVLW      11
	MOVWF      keyPress_key_L0+0
L_keyPress10:
;keyPad.c,34 :: 		if(row4 == 0) key = 12;
	BTFSC      PORTB+0, 4
	GOTO       L_keyPress11
	MOVLW      12
	MOVWF      keyPress_key_L0+0
L_keyPress11:
;keyPad.c,35 :: 		col3 = 1;
	BSF        PORTC+0, 1
;keyPad.c,37 :: 		col4 = 0;
	BCF        PORTC+0, 0
;keyPad.c,38 :: 		if(row1 == 0) key = 13;
	BTFSC      PORTB+0, 7
	GOTO       L_keyPress12
	MOVLW      13
	MOVWF      keyPress_key_L0+0
L_keyPress12:
;keyPad.c,39 :: 		if(row2 == 0) key = 14;
	BTFSC      PORTB+0, 6
	GOTO       L_keyPress13
	MOVLW      14
	MOVWF      keyPress_key_L0+0
L_keyPress13:
;keyPad.c,40 :: 		if(row3 == 0) key = 15;
	BTFSC      PORTB+0, 5
	GOTO       L_keyPress14
	MOVLW      15
	MOVWF      keyPress_key_L0+0
L_keyPress14:
;keyPad.c,41 :: 		if(row4 == 0) key = 16;
	BTFSC      PORTB+0, 4
	GOTO       L_keyPress15
	MOVLW      16
	MOVWF      keyPress_key_L0+0
L_keyPress15:
;keyPad.c,42 :: 		col4 = 1;
	BSF        PORTC+0, 0
;keyPad.c,44 :: 		return key;
	MOVF       keyPress_key_L0+0, 0
	MOVWF      R0+0
;keyPad.c,45 :: 		}
L_end_keyPress:
	RETURN
; end of _keyPress

_keyPress_INT:

;keyPad.c,46 :: 		unsigned char keyPress_INT(void)
;keyPad.c,48 :: 		unsigned char key = 0;
	CLRF       keyPress_INT_key_L0+0
;keyPad.c,50 :: 		col1 = 0;
	BCF        PORTC+0, 3
;keyPad.c,51 :: 		if(row1 == 0) key = 1;
	BTFSC      PORTB+0, 7
	GOTO       L_keyPress_INT16
	MOVLW      1
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT16:
;keyPad.c,52 :: 		if(row2 == 0) key = 2;
	BTFSC      PORTB+0, 6
	GOTO       L_keyPress_INT17
	MOVLW      2
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT17:
;keyPad.c,53 :: 		if(row3 == 0) key = 3;
	BTFSC      PORTB+0, 5
	GOTO       L_keyPress_INT18
	MOVLW      3
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT18:
;keyPad.c,54 :: 		if(row4 == 0) key = 4;
	BTFSC      PORTB+0, 4
	GOTO       L_keyPress_INT19
	MOVLW      4
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT19:
;keyPad.c,55 :: 		col1 = 1;
	BSF        PORTC+0, 3
;keyPad.c,57 :: 		col2 = 0;
	BCF        PORTC+0, 2
;keyPad.c,58 :: 		if(row1 == 0) key = 5;
	BTFSC      PORTB+0, 7
	GOTO       L_keyPress_INT20
	MOVLW      5
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT20:
;keyPad.c,59 :: 		if(row2 == 0) key = 6;
	BTFSC      PORTB+0, 6
	GOTO       L_keyPress_INT21
	MOVLW      6
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT21:
;keyPad.c,60 :: 		if(row3 == 0) key = 7;
	BTFSC      PORTB+0, 5
	GOTO       L_keyPress_INT22
	MOVLW      7
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT22:
;keyPad.c,61 :: 		if(row4 == 0) key = 8;
	BTFSC      PORTB+0, 4
	GOTO       L_keyPress_INT23
	MOVLW      8
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT23:
;keyPad.c,62 :: 		col2 = 1;
	BSF        PORTC+0, 2
;keyPad.c,64 :: 		col3 = 0;
	BCF        PORTC+0, 1
;keyPad.c,65 :: 		if(row1 == 0) key = 9;
	BTFSC      PORTB+0, 7
	GOTO       L_keyPress_INT24
	MOVLW      9
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT24:
;keyPad.c,66 :: 		if(row2 == 0) key = 10;
	BTFSC      PORTB+0, 6
	GOTO       L_keyPress_INT25
	MOVLW      10
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT25:
;keyPad.c,67 :: 		if(row3 == 0) key = 11;
	BTFSC      PORTB+0, 5
	GOTO       L_keyPress_INT26
	MOVLW      11
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT26:
;keyPad.c,68 :: 		if(row4 == 0) key = 12;
	BTFSC      PORTB+0, 4
	GOTO       L_keyPress_INT27
	MOVLW      12
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT27:
;keyPad.c,69 :: 		col3 = 1;
	BSF        PORTC+0, 1
;keyPad.c,71 :: 		col4 = 0;
	BCF        PORTC+0, 0
;keyPad.c,72 :: 		if(row1 == 0) key = 13;
	BTFSC      PORTB+0, 7
	GOTO       L_keyPress_INT28
	MOVLW      13
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT28:
;keyPad.c,73 :: 		if(row2 == 0) key = 14;
	BTFSC      PORTB+0, 6
	GOTO       L_keyPress_INT29
	MOVLW      14
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT29:
;keyPad.c,74 :: 		if(row3 == 0) key = 15;
	BTFSC      PORTB+0, 5
	GOTO       L_keyPress_INT30
	MOVLW      15
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT30:
;keyPad.c,75 :: 		if(row4 == 0) key = 16;
	BTFSC      PORTB+0, 4
	GOTO       L_keyPress_INT31
	MOVLW      16
	MOVWF      keyPress_INT_key_L0+0
L_keyPress_INT31:
;keyPad.c,76 :: 		col4 = 1;
	BSF        PORTC+0, 0
;keyPad.c,78 :: 		return key;
	MOVF       keyPress_INT_key_L0+0, 0
	MOVWF      R0+0
;keyPad.c,79 :: 		}
L_end_keyPress_INT:
	RETURN
; end of _keyPress_INT
