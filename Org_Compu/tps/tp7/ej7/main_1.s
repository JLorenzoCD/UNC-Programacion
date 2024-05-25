.data
	N: .dword 3
	A: .dword 1, 7, 2, 44, 3, 21, 1, 2, 3

.text


main:
	LDR X0, =A
	LDR X9, N
	MOV X1, XZR
	MOV X2, XZR

	// N = N*N
	MUL X9, X9, X9

Loop:
	// i != N, continua el bucle
	CMP X2,X9
	B.EQ End

	// temp = A[i]
	ADD X12, XZR, X2
	LSL x12, x12, #3
	ADD X12, X12, X0
	LDUR X11, [X12,#0]

	// acum += temp
	ADD X1, X1, X11

	// ++i
	ADD X2, X2, #1
	B Loop
End:

infloop: B infloop
