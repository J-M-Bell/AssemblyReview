// Memory alocation example
	.syntax unified
	.text
	.global main
main: 				// Register contents after instruction:
					// My prediction      Actual value
	mov	r0,#10		// r0 =0x2000000A     0xa
	ldr	r1,=pp		// r1 =0x08000028     0x20000000
	ldr	r2,[r1]		// r2 =0x12345678     0x12345678
	mov	r1,r0		// r1 =0x0000000A     0xa
	add	r3,r2,r0	// r3 =0x12345682     0x12345682
	ldr	r1,=fr		// r1 =0x08000034     0x2000000C
	ldr	r2,=ir		// r2 =0x0800002C     0x20000004
	ldr	r3,[r1]		// r3 =0x00000041     0x41
	ldr	r4,=tmp		// r4 =0x08000050     0x20000028
	ldr	r5,[r2]		// r5 =0x08070605     0x70605
	ldr	r1,=512		// r1 =0x00000200     0x200
	add	r2,r1,r5	// r2 =0x08070805     0x70805
	sub r0,r6,r6	// r0 =0x00000000     0x0
	b	.			// Equivalent to Here b Here

// Data allocated and initialized in SRAM
		.data
pp:		.word	0x12345678
ir:		.byte	5,6,7
		.align
ts:		.word	0x0805
fr:		.byte	'A'
		.align
reg:	.word	18,-20,15,-10
mem:	.space 	8
tmp:	.word	0x1234,0x5678

	.end
