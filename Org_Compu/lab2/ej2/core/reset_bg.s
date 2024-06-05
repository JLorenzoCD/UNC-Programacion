.ifndef reset_bg
.equ reset_bg, 0

.include "data.s"

/*
	Fun: reset_bg
	Hace: Pinta toda la pantalla de un color

	Parametro:
		X0 -> Color
*/
.globl reset_bg
reset_bg:
	// Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #56
    STUR X9, [SP, #0]
    STUR X10, [SP, #8]
    STUR X11, [SP, #16]
    STUR X12, [SP, #24]
    STUR X13, [SP, #32]
    STUR LR, [SP, #40]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	// Se copia la base del framebuffer en el X9
    MOV X9, X20

	LDR X11, =SCREEN_WIDTH
	LDR X12, =SCREEN_HEIGH

	// X10 el al dirección final del framebuffer ( X11 = &A[0][0] + (680*480*8) )
	MUL X10, X11, X12
	LSL X10, X10, #3
	ADD X10, X10, X9

	loop_reset_bg:
		CMP X9,X10
		B.EQ end_reset_bg

		STUR W0, [X9, #0]  // Colorear el pixel N
		ADD X9, X9, #4    // Siguiente pixel

		B loop_reset_bg
	end_reset_bg:


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR X9, [SP, #0]
    LDUR X10, [SP, #8]
    LDUR X11, [SP, #16]
    LDUR X12, [SP, #24]
    LDUR X13, [SP, #32]
    LDUR LR, [SP, #40]
	ADD SP, SP, #56
ret



.globl pintar_cancha
pintar_cancha:
	// Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #16
    STUR X0, [SP, #0]
    STUR LR, [SP, #8]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	LDR X0, =COLOR_CESPED_CLARO
	BL reset_bg

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR LR, [SP, #8]
    ADD SP, SP, #16
ret

.endif
