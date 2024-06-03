.ifndef jugador_fila_equipo_fra
.equ jugador_fila_equipo_fra, 0

.include "data.s"

.include "funs/jugador/fila_equipo.s"

.globl jugador_fila_equipo_fra

/*
    Fun: jugador_fila_equipo_fra
    Hace: Dibuja a los jugadores Franceses en fila
*/
jugador_fila_equipo_fra:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #24
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR LR, [SP, #16]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	MOV X1, #1
	BL jugador_fila_equipo


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR LR, [SP, #16]
    ADD SP, SP, #24
ret

.endif
