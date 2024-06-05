.ifndef gol_penal
.equ gol_penal, 0

.include "data.s"

.globl gol_penal

/*
Fun: gol_penal
Hace: La función modifica el array con la información de los penales para marcar un gol en el numero de penal pasado por parámetro y a el equipo pasado por parámetro

Parámetros:
    X0 -> Equipo que mete gol           (0 Argentina, 1 Francia)
    X1 -> Nro penal donde se mete gol   (Va en el rango de [1-5] inclusive)
*/

gol_penal:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #40
    STUR X1, [SP, #0]
    STUR X9, [SP, #8]
    STUR X10, [SP, #16]
    STUR X11, [SP, #24]
    STUR LR, [SP, #32]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X9, X22

    // Calcula el comienzo de la dirreccion de memoria de los penales del equiop X0
    MOV X10, #5
    LSL X10, X10, #3
    MUL X10, X10, X0

    // Se le resta 1 ya que el array va de [0-4]
    SUB X1, X1, #1

    LSL X1, X1, #3
    ADD X9, X9, X1
    ADD X9, X9, X10

    MOV X11, #1
    STUR W11, [X9, #0]

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
