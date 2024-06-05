.ifndef borrar_jugador_penal
.equ borrar_jugador_penal, 0

.include "data.s"

.include "core/rectangulo.s"
.include "core/circulo.s"


/*
    Fun: borrar_jugador_penal
    Hace: Borra al jugador que tiene que patear el penal

    Parametros:
        X0 -> Identificador del equipo (0 Arg - fra 1)
*/
.globl borrar_jugador_penal
borrar_jugador_penal:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #48
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X3, [SP, #16]
    STUR X4, [SP, #24]
    STUR X5, [SP, #32]
    STUR LR, [SP, #40]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    CBNZ X0, es_fra_bjp
        MOV X2, #198
        B es_arg_bjp
    es_fra_bjp:
        MOV X2, #272
    es_arg_bjp:

    MOV X1, #238
    MOV X3, #22
    MOv X4, #16
    LDR X5, =COLOR_CESPED_CLARO
    BL rectangulo


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR X3, [SP, #16]
    LDUR X4, [SP, #24]
    LDUR X5, [SP, #32]
    LDUR LR, [SP, #40]
    ADD SP, SP, #48
ret

.globl borrar_jugador_penal_arg
borrar_jugador_penal_arg:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #16
    STUR X0, [SP, #0]
    STUR LR, [SP, #8]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	MOV X0, #0
	BL borrar_jugador_penal

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR LR, [SP, #8]
    ADD SP, SP, #16
ret

.globl borrar_jugador_penal_fra
borrar_jugador_penal_fra:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #16
    STUR X0, [SP, #0]
    STUR LR, [SP, #8]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	MOV X0, #1
	BL borrar_jugador_penal

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR LR, [SP, #8]
    ADD SP, SP, #16
ret

.globl borrar_jugador_penal_y_pelota
borrar_jugador_penal_y_pelota:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #48
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X3, [SP, #16]
    STUR X4, [SP, #24]
    STUR X5, [SP, #32]
    STUR LR, [SP, #40]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X1, #60
	MOV X2, #230
    MOv X3, #25
    MOv X4, #25
    LDR X5, =COLOR_CESPED_CLARO
    BL rectangulo

    MOV X1, #70
	MOV X2, #230
    MOv X3, #25
    MOv X4, #25
    LDR X5, =COLOR_CESPED_OSCURO
    BL rectangulo

    MOV X1, #70
	MOV X2, #240
	MOV X3, #4
	LDR X4, =BLANCO
	BL circulo

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR X3, [SP, #16]
    LDUR X4, [SP, #24]
    LDUR X5, [SP, #32]
    LDUR LR, [SP, #40]
    ADD SP, SP, #48
ret

.endif
