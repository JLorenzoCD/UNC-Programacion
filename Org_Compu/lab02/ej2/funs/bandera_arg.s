.ifndef bandera_arg
.equ bandera_arg, 0

.include "data.s"
.include "core/rectangulo.s"
.include "core/circulo.s"

.globl bandera_arg

/*
Fun: bandera_arg
Hace: La función dibuja una bandera Argentina
*/

bandera_arg:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #8
    STUR LR, [SP, #0]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Dando un borde negro al rededor de la bandera
	MOV X1, #99
	MOV X2, #29
	MOV X3, #152
	MOV X4, #92
	LDR X5, =NEGRO

	BL rectangulo

	// Franjas celestes
    MOV X1, #100
	MOV X2, #30
	MOV X3, #150
	MOV X4, #90
	LDR X5, =CELESTE

	BL rectangulo

	// Franja blanca
    MOV X1, #100
	MOV X2, #60
	MOV X3, #150
	MOV X4, #30
	LDR X5, =BLANCO

	BL rectangulo

	// Borde del sol
	MOV X1, #175
	MOV X2, #75
	MOV X3, #13
	LDR X4, =NEGRO
	BL circulo

	// Solcito
	MOV X1, #175
	MOV X2, #75
	MOV X3, #12
	LDR X4, =AMARILLO
	BL circulo


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR LR, [SP, #0]
	ADD SP, SP, #8
ret

.endif


