.ifndef bandera_fra
.equ bandera_fra, 0

.include "data.s"
.include "core/rectangulo.s"

.globl bandera_fra

/*
Fun: bandera_fra
Hace: La función dibuja una bandera Francesa
*/

bandera_fra:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #8
    STUR LR, [SP, #0]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Dando un borde negro al rededor de la bandera
	MOV X1, #389         // x0 - 1 para el borde
	MOV X2, #29          // y
	MOV X3, #152         // ancho total + 2 para el borde (150 + 2)
	MOV X4, #92          // alto total + 2 para el borde (90 + 2)
	LDR X5, =NEGRO

	BL rectangulo

	// Franja azul
    MOV X1, #390         // x0
	MOV X2, #30          // y
	MOV X3, #50          // ancho de la franja azul
	MOV X4, #90          // alto de la franja azul
	LDR X5, =AZUL

	BL rectangulo

	// Franja blanca
    ADD X1, X1, #50      // x0 + 50
	MOV X2, #30          // y
	MOV X3, #50          // ancho de la franja blanca
	MOV X4, #90          // alto de la franja blanca
	LDR X5, =BLANCO

	BL rectangulo

	// Franja roja
    ADD X1, X1, #50      // x0 + 100
	MOV X2, #30          // y
	MOV X3, #50          // ancho de la franja roja
	MOV X4, #90          // alto de la franja roja
	LDR X5, =ROJO

	BL rectangulo

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR LR, [SP, #0]
	ADD SP, SP, #8
ret

.endif

