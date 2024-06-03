.ifndef jugador_fra
.equ jugador_fra, 0

.include "data.s"
.include "funs/jugador/jugador.s"

.globl jugador_fra

/*
    Fun: jugador_fra
    Hace: Dibuja al jugador de Francia, en la coordenada (x, y)

    Parametros:
        X1 -> Coordenada eje X
        X2 -> Coordenada eje Y
*/
jugador_fra:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #32
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X3, [SP, #16]
    STUR LR, [SP, #24]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	LDR X3, =AZUL
	BL jugador


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR X3, [SP, #16]
    LDUR LR, [SP, #24]
    ADD SP, SP, #32
ret

.endif
