	.globl push
	.globl pop
	.globl traverse
	.globl clear
	
	.extern malloc
	.extern free
	.extern abort
push:
	stp x19, x30, [sp, -16]!
	stp x20, x21, [sp, -16]!

	// stash registers
	mov x20, x0 	// x20 = head
	mov x21, x1	// x21 = contents

	// allocate space for new node
	mov x0, 16
	bl malloc
	cbz x0, die

	ldr x2, [x20] // x2 = *head
	str x2, [x0, 0] // new->next = *head
	str x21, [x0, 8] // new->contents = contents

	str x0, [x20] // *head = new

	ldp x20, x21, [sp], 16
	ldp x19, x30, [sp], 16
	ret

die:
	bl abort


pop:
	stp x19, x30, [sp, -16]!

	ldr x1, [x0] // x1 = *head

	ldr x2, [x1, 0] // x2 = (*head)->next
	ldr x19, [x1, 8] // x19 = (*head)->contents
	str x2, [x0] // *head = x2

	mov x0, x1
	bl free

	mov x0, x19
	ldp x19, x30, [sp], 16
	ret


traverse:
	stp x19, x30, [sp, -16]!
	stp x20, x21, [sp, -16]!

	ldr x20, [x0] // x20 = *head
	cbz x20, done // if (!*head) list is empty

	mov x21, x1 // op
loop:
	ldr x0, [x20, 8] // x0 = x20->contents
	blr x21 // op(x0)
	ldr x20, [x20, 0] // x0 = x0->next
	cbnz x20, loop

done:
	ldp x20, x21, [sp], 16
	ldp x19, x30, [sp], 16
	ret


clear:
	stp x19, x30, [sp, -16]!

	ldr x19, [x0] // x19 = *head
	cbz x19, 2f
	
	str xzr, [x0] // *head = NULL

1:
	mov x0, x19
	ldr x19, [x19, 0]
	bl free
	cbnz x19, 1b

2:	ldp x19, x30, [sp], 16
	ret
	
