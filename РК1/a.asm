TITLE         ASM MOD 1 LAB 4 

     SSTACK     SEGMENT PARA STACK  'STACK'
                DB   64 DUP('—“≈ ____')
     SSTACK     ENDS

     DSEG          SEGMENT  PARA PUBLIC 'DATA'
     X         DB      101B, 111B, 10B, 100B, 101B, 1010B, 10B, 01B
     B         DB      100B
     K         DB      3
     DSEG          ENDS

SUBTTL         Œ—ÕŒ¬Õ¿ﬂ œ–Œ√–¿ÃÃ¿
PAGE
     CSEG      SEGMENT PARA PUBLIC 'CODE'
               ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

     START     PROC FAR
               MOV  AX,DSEG
               MOV  DS,AX

     M1:       MOV CX, 8
               MOV SI, 7
               MOV AL, B

     M2:       TEST X[SI], AL
               JZ  M4

     M3:       DEC K
               JZ  M5

     M4:       DEC SI
               LOOP M2

     M5:       MOV DL, X[SI]
               ADD DX, 'A' 
  
     M6:       MOV  AH,2
     M7:       INT  21H
     M8:       MOV  AH,4CH
               MOV  AL,0
               INT 21H   

     START     ENDP

     CSEG      ENDS
               END  START
