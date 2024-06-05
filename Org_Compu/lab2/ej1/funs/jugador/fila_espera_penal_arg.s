.ifndef jugador_fila_espera_penal_arg
.equ jugador_fila_espera_penal_arg, 0

.include "data.s"

.include "funs/jugador/fila_espera_penal.s"

.globl jugador_fila_espera_penal_arg

/*
    Fun: jugador_fila_espera_penal_arg
    Hace: Dibuja a 4 jugadores Argentinos en fila esperando el penal
*/
jugador_fila_espera_penal_arg:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #24
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR LR, [SP, #16]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	MOV X1, XZR
	BL fila_espera_penal


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR LR, [SP, #16]
    ADD SP, SP, #24
ret

.endif
