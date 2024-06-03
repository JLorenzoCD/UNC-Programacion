.ifndef jugador
.equ jugador, 0

.include "data.s"

.include "core/circulo.s"
.include "core/circulo_vacio.s"

.globl jugador

/*
    Fun: jugador
    Hace: Dibuja los jugadores en la cancha

    Parametros:
        X1 -> Coordenada eje X
        X2 -> Coordenada eje Y
        X3 -> Color
*/
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

.endif
