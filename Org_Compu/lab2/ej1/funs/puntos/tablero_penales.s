.ifndef puntos_tablero_penales
.equ puntos_tablero_penales, 0

.include "data.s"

.include "funs/puntos/puntos_base_penales.s"


.globl puntos_tablero_penales

/*
Fun: puntos_tablero_penales
Hace: La función dibuja un tablero para mostrar los goles del partido

Parámetros:
    X1 -> Coordenada x
    X2 -> Coordenada y
	X3 -> Puntos Argentina
	X4 -> Puntos Francia
*/

puntos_tablero_penales:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #80
    STUR X3, [SP, #0]
    STUR X4, [SP, #8]
    STUR X5, [SP, #16]
    STUR X9, [SP, #24]
    STUR X10, [SP, #32]
    STUR X11, [SP, #40]
    STUR X12, [SP, #48]
    STUR X13, [SP, #56]
    STUR LR, [SP, #72]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	MOV X9, X1
	MOV X10, X2
	MOV X11, X3		// Puntos ARG
	MOV X12, X4		// Puntos FRA


    // Puntos por penales
	MOV X3, X11			// Puntos ARG
	MOV X4, X12 		// Puntos FRA
	BL puntos_tablero


    // Tablero de puntos de ARG
	SUB X1, X9, #120
	ADD X2, X10, #5
    MOV X3, X22
	BL puntos_base_penales


    // Tablero de puntos de FRA
    ADD X1, X9, #110
	ADD X2, X10, #5
    ADD X3, X22, #40        // 8 * 5
	BL puntos_base_penales



	// Regresando lso valores de los parámetros
	MOV X1, X9
    MOV X2, X10
    MOV X3, X11
    MOV X4, X12


 	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X3, [SP, #0]
    LDUR X4, [SP, #8]
    LDUR X5, [SP, #16]
    LDUR X9, [SP, #24]
    LDUR X10, [SP, #32]
    LDUR X11, [SP, #40]
    LDUR X12, [SP, #48]
    LDUR X13, [SP, #56]
    LDUR LR, [SP, #72]
	ADD SP, SP, #80
ret

.endif
