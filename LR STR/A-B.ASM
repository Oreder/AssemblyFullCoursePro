;Составить подпрограмму с именем A_B типа
;   Procedure (var A: LONGWORD; const B:LONGWORD; L:LONGWORD)
;выполняющую вычитание битовых строк A:=A \ B длины L. 

.386
.model FLAT,PASCAL
PUBLIC A_B

.CODE
A_B PROC
;П\П ВЫЧИТАНИЯ БИТОВЫХ СТРОК 
;A И B ДЛИНЫ L
A EQU DWORD PTR[EBP+16]
B EQU DWORD PTR[EBP+12]
LAB EQU DWORD PTR[EBP+8]
  PUSH EBP
  MOV EBP,ESP
  PUSH ESI
  PUSH EDI
  MOV ECX,LAB
  SHR ECX,5
  MOV EDI,A
  MOV ESI,B
  INC ECX
@M1:
  MOV EAX,[ESI]
NOT EAX
AND [EDI],EAX
  ADD EDI,4
  ADD ESI,4
  LOOP @M1
  POP EDI
  POP ESI
  POP EBP
  RET 12
A_B ENDP
END