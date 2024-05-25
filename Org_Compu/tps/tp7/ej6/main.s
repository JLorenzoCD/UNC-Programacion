.data
	str: .dword 0x754d30616c6f4830, 0x00000000306f646e
	N: .dword 16
.text
main:
	LDR X0, =str
	LDR X9, N
	MOV X1, XZR
	MOV X2, XZR

loop:
	CMP X2, X9
	B.EQ end
	ADD X11, X0, X2
	LDURB W12, [X11, #0]
	CMP W12, #48
	B.NE skip
	ADD X1, X1, #1
skip:
	ADD X2, X2, #1
	B loop
end:

infloop: B infloop
