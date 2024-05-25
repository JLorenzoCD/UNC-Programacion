.data
	N: .dword 3
	A: .dword 1, 7, 2, 44, 3, 21, 1, 2, 3

.text

main:
	// x0 =&A[0][0]
	LDR X0, =A

	MOV X1, XZR

	// X9 = &A[0][0] + (N*N*8)
	LDR X9, N
	MUL X9, X9, X9
	LSL x9, x9, 3
	ADD X9, x9, X0

Loop:
	CMP X0,X9
	B.EQ End

	LDUR X11, [X0,#0]
	ADD X1, X1, X11

	ADD X0, X0, #8
	B Loop
End:

infloop: B infloop
