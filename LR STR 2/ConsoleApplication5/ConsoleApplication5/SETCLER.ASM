;—оставить подпрограмму с именем Set1 типа
;   Procedure (var A: LONGWORD; N:LONGWORD; P:LONGWORD)
;выполн€ющую установку разр€да N битовой строки S 
;в ноль, если P=0, в единицу,если P не равен 0.
.386
.model FLAT,C
PUBLIC SetCler 


.CODE
SetCler PROC
A EQU DWORD PTR[EBP+16]
N EQU DWORD PTR[EBP+12]
P EQU DWORD PTR[EBP+8]
  PUSH EBP
  MOV EBP,ESP
  PUSH EBX
  PUSH EDI
  MOV EDI,N
  SHR EDI,5
  MOV ECX,N
  AND ECX,11111B
  MOV EAX,1
  SHL EAX,CL
  MOV EBX,A
  CMP P,0
  JE M1
    OR [EBX+EDI*4],EAX
  JMP M2
M1:
  NOT EAX
  AND [EBX+EDI*4],EAX
M2:
  POP EDI
  POP EBX
  POP EBP
  RET 12
SetCler ENDP
END