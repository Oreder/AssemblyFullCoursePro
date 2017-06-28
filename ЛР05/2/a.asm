DSEG SEGMENT BYTE PUBLIC 'DATA'
x	db	9,3,7,26,5,8
dseg	ends

CSEG SEGMENT BYTE PUBLIC 'CODE'
assume	cs:cseg, ds:dseg, ss:sseg
main:
	mov	ax,dseg
	mov	ds,ax
	mov	cx,5
	mov	bx,offset x
m0:
	push	cx
	mov	si,5
m1:
	mov	ah,[bx][si]
	cmp	[bx][si-1],ah
	jb	m2
	mov	al,x[si]
	xchg	al,x[si-1]
	mov	x[si],al
m2:
	dec	si
	loop	m1
	pop	cx
	loop	m0

		

	mov	ah,4ch
	int	21h
cseg	ends

SSEG SEGMENT BYTE STACK 'STACK'
	dw	64 dup(0)
sseg	ends
	end main