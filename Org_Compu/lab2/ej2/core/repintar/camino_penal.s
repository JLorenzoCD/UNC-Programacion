.ifndef rep_camino_penal
.equ rep_camino_penal, 0

.include "data.s"

.include "core/rectangulo.s"

.include "core/repintar/repintar.s"
.include "core/repintar/guardar.s"

.globl rep_camino_penal_2
rep_camino_penal_2:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #40
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR LR, [SP, #32]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X0, #190    // x
	MOV X1, #195    // y
	MOV X2, #90     // Ancho
	MOV X3, #100    // Alto
    BL repintar

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR LR, [SP, #32]
    ADD SP, SP, #40
ret

.globl rep_camino_penal_1
rep_camino_penal_1:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #40
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR LR, [SP, #32]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X0, #80     // x
	MOV X1, #220    // y
	MOV X2, #160    // Ancho
	MOV X3, #50    // Alto
    // Rango x  (80 - 275)
    // Rango y  (195 - 295)
    BL repintar

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR LR, [SP, #32]
    ADD SP, SP, #40
ret

.globl guardar_jugador_penal
guardar_jugador_penal:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #40
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR LR, [SP, #32]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    MOV X0, #230   // x
	MOV X1, #198   // y
	MOV X2, #50    // Ancho
	MOV X3, #100    // Alto

    BL guardar

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR LR, [SP, #32]
    ADD SP, SP, #40
ret

.endif
