	.extern atol
	.extern printf
	.extern stderr
	.extern fprintf

	.local fib_recurse
	.local fib_iterative
	.text
	.globl main
main:
	// callee-saved register x19 now available
	stp x19, x30, [sp, #-16]!
	stp x20, x21, [sp, #-16]!

	// w0 contains argc
	// x1 contains argv

	// FIXME check for arguments
	cmp w0, 2
	b.lt do_usage
	
	// put argv[1] in x0
	ldr x0, [x1, #8]
	bl atol

	// number now in x0
	// stash in x19
	mov x19, x0

	bl fib_recurse

	// stash this result in x20, retrieve input
	mov x20, x0
	mov x0, x19

	bl fib_iterative
	
	mov x1, x19
	mov x2, x20
	mov x3, x0
	adr x0, format
	bl printf

	mov w0, wzr

return:	
	ldp x20, x21, [sp], #16
	ldp x19, x30, [sp], #16
	ret

do_usage:
	ldr x2, [x1]
	adr x1, usage
	
	// ldr x0, stderr // use when static linking

	// stolen from gcc
	adrp x0, :got:stderr
	ldr x0, [x0, #:got_lo12:stderr]
	ldr x0, [x0]	
	
	bl fprintf

	// return 2
	mov w0, #2
	b return
	
	.section .rodata
format:
	.asciz "fib(%ld): recursive %ld, iterative %ld\n"
usage:
	.asciz "Usage: %s n\n"

	.text
fib_recurse:
	// fib of 0 or 1 is itself
	cmp x0, #1
	b.hi not_base
	ret
not_base:
	stp x19, x30, [sp, #-16]!
	sub x0, x0, #1  	// x0 = n - 1
	sub x19, x0, #1 	// x19 = n - 2
	bl fib_recurse

	// would like to swap x19 and x0 but apparently there
	// is no register-register swap.  Not into xor games just
	// now so do it the boring way.

	mov x9, x19
	mov x19, x0
	mov x0, x9
	bl fib_recurse

	add x0, x0, x19
	ldp x19, x30, [sp], #16
	ret
	
	
fib_iterative:
	// count in x0
	// prev number in x9
	// current number in x10

	cmp x0, #1
	b.ls out

	mov x9, xzr // fib(0)
	mov x10, #1 // fib(1)

	sub x0, x0, 1 // eg if we want fib(2) the loop should execute once
	
loop:
	// set flags
	add x11, x10, x9
	mov x9, x10
	mov x10, x11

	subs x0, x0, 1
	b.ne loop

	// done now
	mov x0, x10
out:
	ret
