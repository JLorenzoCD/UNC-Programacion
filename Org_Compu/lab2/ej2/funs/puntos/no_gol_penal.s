.ifndef no_gol_penal
.equ no_gol_penal, 0

.include "data.s"

.globl no_gol_penal

/*
Fun: no_gol_penal
Hace: La función modifica el array con la información de los penales para marcar que no se metió gol en el numero de penal pasado por parámetro y a el equipo pasado por parámetro

Parámetros:
    X0 -> Equipo que mete gol               (0 Argentina, 1 Francia)
    X1 -> Nro penal donde no se mete gol    (Va en el rango de [1-5] inclusive)
*/

no_gol_penal:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #40
    STUR X1, [SP, #0]
    STUR X9, [SP, #8]
    STUR X10, [SP, #16]
    STUR X11, [SP, #24]
    STUR LR, [SP, #32]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X9, X22
    MOV X10, #5
    LSL X10, X10, #3
    MUL X0, X0, X10

    SUB X1, X1, #1

    LSL X1, X1, #3
    ADD X9, X9, X1
    ADD X9, X9, X10

    MOV X11, #2
    STUR X11, [X9, #0]

 	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X9, [SP, #8]
    LDUR X10, [SP, #16]
    LDUR X11, [SP, #24]
    LDUR LR, [SP, #32]
    ADD SP, SP, #40
ret

.endif
