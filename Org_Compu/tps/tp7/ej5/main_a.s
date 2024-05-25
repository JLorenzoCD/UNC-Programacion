	.data
	Array: .dword 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	contenido_X1: .dword 0
	contenido_X2: .dword 0

	.text
	LDR X0, =Array
	LDR X1, contenido_X1
	LDR X2, contenido_X2


	MOV X10, XZR
loop:
	LDUR X1, [X0, #0]
	ADD X2, X2, X1
	ADD X0, X0, #8
	ADD X10, X10, #1
	CMP X10, #10
	B.LT loop
done:
infloop: B infloop
