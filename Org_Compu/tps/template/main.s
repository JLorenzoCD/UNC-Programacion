.data
	f: .dword 1


.text

main:
	LDR X0, f


infloop: B infloop
