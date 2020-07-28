	.globl add4i_asm
	.globl add4f_asm
	.text
add4i_asm:
	ldr q0, [x0]
	addv s0, v0.4s
	mov w0, v0.s[0]
	ret

add4f_asm:
	// The floating-point version is an extension not available on all CPUS
	
	//ldr q0, [x0]
	//ptrue p0.s
	//faddv s0, p0, v0.4s
	fmov s0, wzr
	ret

