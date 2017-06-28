SSEG SEGMENT PARA STACK 'STACK'
     DB 64 DUP('STACK+++')
SSEG ENDS

SD1  SEGMENT PARA PUBLIC 'DATA'
S1    DB   'A'
DB 0FFFDh DUP(0)
SD1  ENDS

SD2  SEGMENT PARA PUBLIC 'DATA'
S2    DB   'B'
DB 0FFFDh DUP(0)
SD2  ENDS

SD3  SEGMENT PARA PUBLIC 'DATA'
S3    DB   'C'
DB 0FFFDh DUP(0)
SD3  ENDS

SC1  SEGMENT PARA PUBLIC 'CODE'
     ASSUME CS:SC1,DS:SD1,SS:SSEG
P1   PROC FAR
	PUSH  DS
	MOV  AX,0
    PUSH  AX

     MOV AX,SD1
     MOV DS,AX
     MOV BL,S1
     MOV  AH,2
     MOV  DX,BX
     INT  21H
     
     MOV BL,13
     MOV  AH,2
     MOV  DX,BX
     INT  21H
     
     MOV BL,10
     MOV  AH,2
     MOV  DX,BX
     INT  21H
     
     
     ASSUME DS:SD2
     
     
     MOV AX,SD2
     MOV DS,AX
     MOV BL,S2
     MOV  AH,2
     MOV  DX,BX
     INT  21H
     
     MOV BL,13
     MOV  AH,2
     MOV  DX,BX
     INT  21H
     
     MOV BL,10
     MOV  AH,2
     MOV  DX,BX
     INT  21H
     
     
     
     
     ASSUME DS:SD3
     
     
     MOV AX,SD3
     MOV DS,AX
     MOV BL,S3
     MOV  AH,2
     MOV  DX,BX
     INT  21H
     
     MOV BL,13
     MOV  AH,2
     MOV  DX,BX
     INT  21H
     
     MOV BL,10
     MOV  AH,2
     MOV  DX,BX
     INT  21H
     
     
     
     
     
     
     
     RET
P1   ENDP
SC1  ENDS

     END P1