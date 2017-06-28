.386
.model FLAT,C


push_regs macro regs
	irp reg, <regs>
		ifdifi <reg>, <F>
			push reg
		else
			pushf
		endif
	endm
endm

pop_regs macro regs
	irp reg, <regs>
		ifdifi <reg>, <F>
			pop reg
		else
			popf
		endif
	endm
endm

call_func macro func, args
	irp arg, <args>
		push arg
	endm


endm


PUBLIC START

.CODE
START:
   push_regs <eax, ebx, f, ecx>
   pop_regs <ecx, f, ebx, eax>
RET
END