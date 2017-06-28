.386
.model FLAT,C

PUBLIC DlinaStroki


.CODE


DlinaStroki:
	s equ dword ptr[ebp + 8]

	push ebp
	mov ebp, esp
	push edi

	mov edi, s
	mov ecx, -1
	mov al, 0

	cld
	repne scasb

	neg	ecx
	dec	ecx
	dec	ecx

	mov eax, ecx

	pop edi
	pop ebp
ret

DlinaStroki_:
	s equ dword ptr[ebp + 8]

	push ebp
	mov ebp, esp
	push edi

	mov edi, s
	mov eax, 0

M1:	mov bl, [edi]
	cmp bl, 0
	je M2

	inc eax
	inc edi
	jmp M1

M2:	pop edi
	pop ebp
ret

CopyStr:
	s1 equ dword ptr[ebp + 8]
	s2 equ dword ptr[ebp + 12]
	len equ dword ptr[ebp + 16]

	push ebp
	mov ebp, esp
	push esi
	push edi

	mov edi, s1
	mov esi, s2
	mov ecx, len

C1:	mov bl, [edi]
	cmp bl, 0
	je C2

C2:

	inc eax
	inc edi
	jmp M1


	pop edi
	pop esi
	pop ebp
ret

END