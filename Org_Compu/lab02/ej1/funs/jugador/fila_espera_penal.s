.ifndef fila_espera_penal
.equ fila_espera_penal, 0

.include "data.s"

.include "funs/jugador/jugador.s"

.globl fila_espera_penal

/*
    Fun: fila_espera_penal
    Hace: Dibuja a 4 jugadores en fila esperando el penal

    Parametros:
        X1 -> Bool (0 == Argentina, 1 == Francia)
*/
fila_espera_penal:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #40
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X3, [SP, #16]
    STUR X4, [SP, #24]
    STUR LR, [SP, #32]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    CBNZ X1, es_fra_fila_espera_penal
        LDR X3, =CELESTE
        MOV X4, XZR
        B es_arg_fila_espera_penal
    es_fra_fila_espera_penal:
        LDR X3, =AZUL
        MOV X4, #135
    es_arg_fila_espera_penal:

	MOV X1, #265
	MOV X2, #145
	ADD X2, X2, X4
	BL jugador

	MOV X1, #267
	MOV X2, #160
	ADD X2, X2, X4
	BL jugador

	MOV X1, #270
	MOV X2, #175
	ADD X2, X2, X4
	BL jugador

	MOV X1, #267
	MOV X2, #190
	ADD X2, X2, X4
	BL jugador


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR X3, [SP, #16]
    LDUR X4, [SP, #24]
    LDUR LR, [SP, #32]
    ADD SP, SP, #40
ret

.endif
