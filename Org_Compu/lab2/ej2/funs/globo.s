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
	SUB SP, SP, #24
	STUR X9, [SP, #0]
	STUR X10, [SP, #8]
    STUR LR, [SP, #16]
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
	ADD X22, X9, #8 

	// AJUSTE; [dando a la cuerda una altura acorde]
	ADD X23, X10, #16

	// CUERDA
	MOV X1, X22			// cpy x inicial
	MOV X2, X23        	// cpy y inicial
	MOV X3, #1         	// ancho de la cuerda
	MOV X22, #15        // altura de la cuerda
	LDR X5, =GRIS       // color
	BL rectangulo

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X9, [SP, #0]
	LDUR X10, [SP, #8]
    LDUR LR, [SP, #16]
	ADD SP, SP, #24
ret

.endif

