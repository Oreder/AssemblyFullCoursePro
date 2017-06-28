;использовать прямую адресацию с базированием и индексированием.
DSEG	SEGMENT
NMAX	DW	5
N	DW	5
Y	DW	25,43,54,72,61
DSEG	ENDS

CSEG	SEGMENT
ASSUME	CS:CSEG, DS:DSEG, SS:SSEG
START:
	MOV	AX,DSEG
	MOV	DS,AX
	MOV	BX,1 
	MOV	CX,NMAX

;выбор нового значения из неотсортированной части  	
M1:	
	MOV 	BX, NMAX
	SUB 	BX, CX
	PUSH	CX
	MOV 	SI, Y

;поиск места
M2:
	MOV 	CX, GT SI[BX], SI[NMAX-CX]
	JZ	M3
	LOOP	M2

;сдвиг значений вправо
M3: 	
	MOV 	DX, CX
	MOV 	CX, BX 
	MOV 	DL, SI[BX]

M4:
	XCHG 	SI[CX], SI[CX-1]
	;MOV 	AL, EQ CX, DX
	EQ 	CX, DX
	JZ 	M5
	LOOP 	M4

;вставка значения на нужное место
M5:	
	XCHG 	DL, SI[DX]
	POP	CX
	LOOP	M1	


STOP:
	MOV	AH,4Ch
	INT	21h
CSEG	ENDS
SSEG	SEGMENT
	DW	64 DUP(0)
SSEG	ENDS
	END	START
