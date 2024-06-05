.ifndef puntos_base_penales
.equ puntos_base_penales, 0

.include "data.s"
.include "core/rectangulo.s"
.include "core/circulo.s"

.globl puntos_base_penales

/*
Fun: puntos_base_penales
Hace: La función dibuja un rectángulo con círculos que representa los goles en los penales

Parámetros:
    X1 -> Coordenada x
    X2 -> Coordenada y
	X3 -> Dirección base de los penales
*/

puntos_base_penales:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #80
    STUR X3, [SP, #0]
    STUR X4, [SP, #8]
    STUR X5, [SP, #16]
    STUR X9, [SP, #24]
    STUR X10, [SP, #32]
    STUR X11, [SP, #40]
    STUR X12, [SP, #48]
    STUR X13, [SP, #56]
    STUR X14, [SP, #64]
    STUR LR, [SP, #72]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	MOV X9, X1
	MOV X10, X2
	MOV X13, X3

	MOV X14, XZR

	// Fondo negro
	MOV X3, #112
	MOV X4, #35
	LDR X5, =NEGRO
	BL rectangulo

	ADD X2, X10, #17       // Altura para los puntos
	MOV X3, #10            // Radio para los puntos

	// Puntos
	MOV X11, #15
	MOV X12, #115

	loop_pbp:
		CMP X11, X12
		B.EQ end_pbp

		LDUR X14, [X13, #0]

		// Calcula el color para el circulo (X4)
		CBZ X14, estado_0
		SUB X14, X14, #1
		CBZ X14, estado_1
		CBNZ X14, estado_2
		fin_seleccion_color:

		ADD X1, X9, X11
		BL circulo

		ADD X13, X13, #8
		ADD X11, X11, #20
		B loop_pbp
	end_pbp:


	MOV X1, X9
	MOV X2, X10

 	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X3, [SP, #0]
    LDUR X4, [SP, #8]
    LDUR X5, [SP, #16]
    LDUR X9, [SP, #24]
    LDUR X10, [SP, #32]
    LDUR X11, [SP, #40]
    LDUR X12, [SP, #48]
    LDUR X13, [SP, #56]
    LDUR X14, [SP, #64]
    LDUR LR, [SP, #72]
	ADD SP, SP, #80
ret

estado_0:
	LDR X4, =BLANCO
	B fin_seleccion_color

estado_1:
	LDR X4, =COLOR_CESPED_CLARO
	B fin_seleccion_color

estado_2:
	LDR X4, =ROJO
	B fin_seleccion_color


.endif
