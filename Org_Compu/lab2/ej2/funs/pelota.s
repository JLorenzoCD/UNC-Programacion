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
	SUB SP, SP, #40
	STUR X3, [SP, #0]
	STUR X4, [SP, #8]
	STUR X9, [SP, #16]
	STUR X10, [SP, #24]
    STUR LR, [SP, #32]
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
	LDUR X3, [SP, #0]
	LDUR X4, [SP, #8]
	LDUR X9, [SP, #16]
	LDUR X10, [SP, #24]
    LDUR LR, [SP, #32]
	ADD SP, SP, #40
ret


/*
Fun: pelota_posicion_penal
Hace: Dibuja una pequeña en la posición del penal
*/
.globl pelota_posicion_penal
pelota_posicion_penal:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #32
	STUR X1, [SP, #0]
	STUR X2, [SP, #8]
	STUR X3, [SP, #16]
    STUR LR, [SP, #24]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X1, #70
	MOV X2, #240
	MOV X3, #10
	BL pelota

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X1, [SP, #0]
	LDUR X2, [SP, #8]
	LDUR X3, [SP, #16]
    LDUR LR, [SP, #24]
	ADD SP, SP, #32
ret

.endif
