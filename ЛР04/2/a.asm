;             ������ 1

SD1  SEGMENT PARA PUBLIC 'DATA'
     EXTRN Y:BYTE
X    DB   'X'
SD1  ENDS

SC1  SEGMENT PARA PUBLIC 'CODE'
     ASSUME CS:SC1,DS:SD1,SS:SSEG
P1   PROC FAR
     MOV AX,SD1
     MOV DS,AX
       MOV BL,Y
       MOV CL,X
       MOV Y,CL
       MOV X,BL
     MOV AH,2
     MOV DL,Y
     INT 21H
       MOV AH,4CH
       INT 21H
P1   ENDP
SC1  ENDS

SSEG SEGMENT PARA STACK 'STACK'
     DB 64 DUP('STACK+++')
SSEG ENDS
     END P1
