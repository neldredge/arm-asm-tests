	.section .rodata
message:
	.asciz "Hello world!"
	.text
	.globl main
main:
	// push link register
	// stack must be aligned to 16 bytes
	str x30, [sp, #-16]!

	.extern puts
	// add pc to offset of message and store in x0
	adr x0, message
	bl puts

	// zero w0 for return value
	mov w0, wzr
	ldr x30, [sp], #16
	ret
	
