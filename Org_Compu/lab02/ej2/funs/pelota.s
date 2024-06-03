.ifndef pelota
.equ pelota, 0

.include "data.s"
.include "core/circulo.s"
.include "core/cuadrado.s"

// ya ta

.globl pelota

/*
Fun: pelota
Hace: Dibuja una pequeña pelota de fútbol en la pantalla en la pos (x1, x2)
Parametros: (X1, X2) -> centro
*/

pelota:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #24
	STUR X9, [SP, #0]
	STUR X10, [SP, #8]
    STUR LR, [SP, #16]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Var aux para guardar los parametro
	MOV X9 , X1     	// x centro
	MOV X10, X2     	// y centro


	// Dibujar PELOTA BLANCA
	MOV X3, #6     		// radio
	LDR X4, =BLANCO
	BL circulo




	// Valor para todos los detalle que siguen
	MOV X3, #2           // Radio
	LDR X4, =NEGRO


	// Dibujar círculo negro (punto en el centro)
	BL circulo

	// DETALLE IZQ. (x desplazado hacia la izquierda)
	SUB X1, X1, #4
	BL circulo

	// DETALLE DER. (x desplazado hacia la derecha)
	ADD X1, X9, #4
	BL circulo

	// DETALLE ARRIBA (y desplazado hacia arriba)
	MOV X1, X9
	SUB X2, X10, #4
	BL circulo

	// DETALLE ABAJO (y desplazado hacia abajo)
	ADD X2, X10, #4
	BL circulo


	// Reseteando parametros
	MOV X1, X9
	MOV X2, X10

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LdUR X9, [SP, #0]
	LdUR X10, [SP, #8]
    LdUR LR, [SP, #16]
	ADD SP, SP, #24
ret
.endif
