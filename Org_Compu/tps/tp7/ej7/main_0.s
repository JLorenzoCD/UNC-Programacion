.data
	N: .dword 3
	A: .dword 1, 7, 2, 44, 3, 21, 1, 2, 3

.text

main:
	LDR X0, =A
	LDR X9, N
	MOV X1, XZR
	MOV X2, XZR
	MOV X3, XZR

i_Loop:
	// i != N, continua el bucle
	CMP X2,X9
	B.EQ i_End

	// j = 0
	MOV X3, XZR
j_Loop:
	// j != N, continua el bucle
	CMP X3,X9
	B.EQ j_End

	// temp = A[i][j]
	MUL X12, X2, X9
	ADD X12, X12, X3
	LSL x12, x12, #3
	ADD X12, X12, X0
	LDUR X11, [X12,#0]

	// acum += temp
	ADD X1, X1, X11

	// ++j
	ADD X3, X3, #1
	b j_Loop
j_End:
	// ++i
	ADD X2, X2, #1
	B i_Loop
i_End:

infloop: B infloop
