;��������� ������������ � ������ A_B ����
;   Procedure (var A: LONGWORD; const B:LONGWORD; L:LONGWORD)
;����������� ��������� ������� ����� A:=A \ B ����� L. 

.386
.model FLAT,C
PUBLIC A_B

.CODE
A_B PROC
;�\� ��������� ������� ����� 
;A � B ����� L
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