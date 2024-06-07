.ifndef globo
.equ globo, 0

.include "data.s"
.include "core/rectangulo.s"

.globl globo

/*
Fun: globo
Hace: Dibuja un globo en la pantalla en la pos (x1, x2)
Parametros: (X1, X2) -> centro
*/

globo:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #64
	STUR X9, [SP, #0]
	STUR X10, [SP, #8]
	STUR X3, [SP, #16]
	STUR X4, [SP, #24]
	STUR X5, [SP, #32]
	STUR X11, [SP, #40]
	STUR X12, [SP, #48]
    STUR LR, [SP, #56]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Vars aux. p/guardar (Xi, Yi)
	MOV X9 , X1     	// X1 <-- Xi [pos x origen]
	MOV X10, X2     	// X2 <-- Yi [pos y origen]

	// GLOBO
	MOV X3, #15
	MOV X4, #20
	LDR X5, =ROJO
	BL rectangulo

	// AJUSTE; [dando a la cuerda una pos. mas centrada]
	ADD X11, X9, #8

	// AJUSTE; [dando a la cuerda una altura acorde]
	ADD X12, X10, #16

	// CUERDA
	MOV X1, X11			// cpy x inicial
	MOV X2, X12        	// cpy y inicial
	MOV X3, #1         	// ancho de la cuerda
	MOV X11, #15        // altura de la cuerda
	LDR X5, =GRIS       // color
	BL rectangulo


	MOV X1, X9
	MOV X2, X10
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X9, [SP, #0]
	LDUR X10, [SP, #8]
	LDUR X3, [SP, #16]
	LDUR X4, [SP, #24]
	LDUR X5, [SP, #32]
	LDUR X11, [SP, #40]
	LDUR X12, [SP, #48]
    LDUR LR, [SP, #56]
	ADD SP, SP, #64
ret

.endif

