;Составить подпрограмму с именем Count типа
;      function (const S: LONGWORD; L:LONGWORD)
;возвращающую число единиц битовой строки S длины L.
.386
.model FLAT,C
PUBLIC COUNT

.CODE
COUNT:
A EQU DWORD PTR[EBP+12]
L EQU DWORD PTR[EBP+8]
  PUSH EBP
  MOV EBP,ESP
  PUSH EBX
  MOV EAX,0
  MOV EBX,A
  MOV ECX,L
M0:
  MOV EDX,0
M:
  BT [EBX],EDX
  JNC M2
  INC EAX
M2:
  DEC ECX
  JZ M4
  INC EDX
  CMP EDX, 32
  JNE M
  JMP M0
M3:
  ADD EBX,4
  JMP M0
M4:
  POP EBX
  POP EBP
  RET 8
END