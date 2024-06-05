.ifndef puntos_tablero
.equ puntos_tablero, 0

.include "data.s"
.include "core/rectangulo.s"

.include "funs/puntos/puntos_base.s"

.include "funs/puntos/cero.s"
.include "funs/puntos/uno.s"
.include "funs/puntos/dos.s"
.include "funs/puntos/tres.s"
.include "funs/puntos/cuatro.s"


.globl puntos_tablero

/*
Fun: puntos_tablero
Hace: La función dibuja un tablero para mostrar los goles del partido

Parámetros:
    X1 -> Coordenada x
    X2 -> Coordenada y
	X3 -> Puntos Argentina
	X4 -> Puntos Francia
*/

puntos_tablero:
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
    STUR LR, [SP, #72]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	MOV X9, X1
	MOV X10, X2
	MOV X11, X3		// Puntos ARG
	MOV X12, X4		// Puntos FRA
	MOV X13, X11	// aux = puntos ARG

	MOV X3, #100
	MOV X4, #50
	LDR X5, =NEGRO
	BL rectangulo


	// Puntos de Argentina
	ADD X1, X9, #5
	ADD X2, X10, #5
	BL puntos_base

	CBZ X13, pt_arg_cero
	SUB X13, X13, #1
	CBZ X13, pt_arg_uno
	SUB X13, X13, #1
	CBZ X13, pt_arg_dos
	SUB X13, X13, #1
	CBZ X13, pt_arg_tres
	SUB X13, X13, #1
	B pt_arg_cuatro
	fin_arg_pt:


	// Puntos de Francia
	ADD X1, X9, #65
	ADD X2, X10, #5
	BL puntos_base

	MOV X13, X12	// // aux = puntos FRA

	CBZ X13, pt_fra_cero
	SUB X13, X13, #1
	CBZ X13, pt_fra_uno
	SUB X13, X13, #1
	CBZ X13, pt_fra_dos
	SUB X13, X13, #1
	CBZ X13, pt_fra_tres
	SUB X13, X13, #1
	B pt_fra_cuatro
	fin_fra_pt:


	// Regresando lso valores de los parámetros
	MOV X1, X9
    MOV X2, X10
    MOV X3, X11
    MOV X4, X12


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
    LDUR LR, [SP, #72]
	ADD SP, SP, #80
ret

pt_arg_cero:
	BL punto_cero
	B fin_arg_pt

pt_arg_uno:
	BL punto_uno
	B fin_arg_pt

pt_arg_dos:
	BL punto_dos
	B fin_arg_pt

pt_arg_tres:
	BL punto_tres
	B fin_arg_pt

pt_arg_cuatro:
	BL punto_cuatro
	B fin_arg_pt


// FRANCIA
pt_fra_cero:
	BL punto_cero
	B fin_fra_pt

pt_fra_uno:
	BL punto_uno
	B fin_fra_pt

pt_fra_dos:
	BL punto_dos
	B fin_fra_pt

pt_fra_tres:
	BL punto_tres
	B fin_fra_pt

pt_fra_cuatro:
	BL punto_cuatro
	B fin_fra_pt

.endif
