	.data
	contenido_X0: .dword 0
	contenido_X1: .dword 10
	.text
	LDR X0, contenido_X0
	LDR X1, contenido_X1
    	

loop:
	SUBS X1, X1, #0
	B.MI done
	
	SUB X1, X1, #1
	ADD X0, X0, #2

	B loop
done:
infloop: B infloop