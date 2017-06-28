;             лндскэ 2

PUBLIC P2

SD2  SEGMENT PARA PUBLIC 'DATA'
Y    DB   'Y'
SD2  ENDS

     EXTRN X:BYTE

SC2  SEGMENT PARA PUBLIC 'CODE'
     ASSUME CS:SC2,DS:SD2
P2   PROC FAR
     MOV ES,AX
       MOV BL,Y
       MOV CL,ES:X
       MOV Y,CL
       MOV ES:X,BL
     MOV AH,2
     MOV DL,Y
     INT 21H
       MOV AH,4CH    ; ? RET
       INT 21H
P2   ENDP
SC2  ENDS
     END 
