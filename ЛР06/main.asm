SSEG SEGMENT PARA STACK 'STACK'
     DB 64 DUP('STACK+++')
SSEG ENDS

PUBLIC X

EXTRN P1:NEAR, P2:NEAR

SD0  SEGMENT PARA PUBLIC 'DATA'

MSG0	DB	13, 10, '  -= Menu =-', 13, 10
MSG1	DB	'1. Output X as unsigned binary', 13, 10
MSG2	DB	'2. Output X as signed binary', 13, 10
MSG3	DB	'3. Output X as unsigned binary', 13, 10
MSG4	DB	'4. Output X as signed binary', 13, 10
MSG5	DB	'5. Output X as unsigned hex', 13, 10
MSG6	DB	'6. Output X as signed hex', 13, 10, '$'

PARR	DW	P1
		DW	P2

X    DW   ?

SD0  ENDS


SC0  SEGMENT PARA PUBLIC 'CODE'
     ASSUME CS:SC0, DS:SD0, SS:SSEG
     
P0   PROC FAR

	PUSH  DS
    MOV  AX, 0
    PUSH  AX

    MOV AX, SD0
    MOV DS, AX
     
M0:	MOV  AH, 9
    MOV  DX, OFFSET MSG0
    INT  21H
    
    MOV AH, 1
    INT 21H
    
    MOV BX, 0
    MOV BL, AL
    
    CMP BL, '0'
    JZ ME
    
    SUB BL, '1'
    MOV SI, BX
    SHL SI, 1
    
    CALL WORD PTR PARR[SI]
    
    JMP M0
    
ME:	RET
     
P0   ENDP

SC0  ENDS

     END P0
