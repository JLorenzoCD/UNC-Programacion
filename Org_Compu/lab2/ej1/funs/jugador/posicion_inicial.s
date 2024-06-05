.ifndef jugador_posicion_inicial
.equ jugador_posicion_inicial, 0

.include "data.s"

.include "funs/jugador/arg_arq.s"
.include "funs/jugador/fra_arq.s"
.include "funs/jugador/fila_espera_penal_arg.s"
.include "funs/jugador/fila_espera_penal_fra.s"

.globl jugador_posicion_inicial

/*
    Fun: jugador_posicion_inicial
    Hace: Dibuja a todos los jugadores en la posicion inicial de penal
*/
jugador_posicion_inicial:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #24
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR LR, [SP, #16]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	MOV X1, #65
	MOV X2, #400
	BL jugador_arg_arq

	MOV X1, #15
	MOV X2, #240
	BL jugador_fra_arq

	BL jugador_fila_espera_penal_arg
	BL jugador_fila_espera_penal_fra


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR LR, [SP, #16]
    ADD SP, SP, #24
ret

.endif
