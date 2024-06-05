.ifndef jugador
.equ jugador, 0

.include "data.s"

.include "core/circulo.s"
.include "core/circulo_vacio.s"


/*
    Fun: jugador
    Hace: Dibuja los jugadores en la cancha

    Parametros:
        X1 -> Coordenada eje X
        X2 -> Coordenada eje Y
        X3 -> Color
*/
.globl jugador
jugador:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #24
    STUR LR, [SP, #0]
    STUR X3, [SP, #8]
    STUR X4, [SP, #16]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    MOV X4, X3
    MOV X3, #7
    BL circulo

    //  Pintando el borde al jugador
	LDR X4, =NEGRO
    BL circulo_vacio


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR LR, [SP, #0]
    LDUR X3, [SP, #8]
    LDUR X4, [SP, #16]
    ADD SP, SP, #24
ret


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                                  Argentina
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/*
    Fun: jugador_arg_arq
    Hace: Dibuja al arquero de Argentina, en la coordenada (x, y)

    Parametros:
        X1 -> Coordenada eje X
        X2 -> Coordenada eje Y
*/
.globl jugador_arg_arq
jugador_arg_arq:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #32
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X3, [SP, #16]
    STUR LR, [SP, #24]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	LDR X3, =PORTERO_ARG
	BL jugador


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR X3, [SP, #16]
    LDUR LR, [SP, #24]
    ADD SP, SP, #32
ret


/*
    Fun: jugador_arg
    Hace: Dibuja al jugador de Argentina, en la coordenada (x, y)

    Parametros:
        X1 -> Coordenada eje X
        X2 -> Coordenada eje Y
*/
.globl jugador_arg
jugador_arg:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #32
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X3, [SP, #16]
    STUR LR, [SP, #24]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	LDR X3, =CELESTE
	BL jugador


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR X3, [SP, #16]
    LDUR LR, [SP, #24]
    ADD SP, SP, #32
ret


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                                  Francia
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/*
    Fun: jugador_fra_arq
    Hace: Dibuja al arquero de Francia, en la coordenada (x, y)

    Parametros:
        X1 -> Coordenada eje X
        X2 -> Coordenada eje Y
*/
.globl jugador_fra_arq
jugador_fra_arq:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #32
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X3, [SP, #16]
    STUR LR, [SP, #24]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	LDR X3, =PORTERO_FRA
	BL jugador


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR X3, [SP, #16]
    LDUR LR, [SP, #24]
    ADD SP, SP, #32
ret



/*
    Fun: jugador_fra
    Hace: Dibuja al jugador de Francia, en la coordenada (x, y)

    Parametros:
        X1 -> Coordenada eje X
        X2 -> Coordenada eje Y
*/
.globl jugador_fra
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
