.ifndef reset_celeste
.equ reset_celeste, 0

.include "data.s"

/*
Fun: reset_celeste
Hace: Pinta toda la pantalla de celeste

*/

.globl reset_celeste
reset_celeste:
	// Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #8
    STUR LR, [SP, #0]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



	// Se copia la base del framebuffer en el X9
    MOV X9, X20

	//Color del fondo
	LDR X10, =CELESTE 

	LDR X11, =SCREEN_WIDTH
	LDR X12, =SCREEN_HEIGH

	// X13 el al dirección final del framebuffer ( X11 = &A[0][0] + (680*480*8) )
	MUL X13, X11, X12
	LSL X13, X13, #3
	ADD X13, X13, X9

	loop_reset_celeste:
		CMP X9,X13
		B.EQ end_reset_celeste

		STUR W10, [X9, #0]  // Colorear el pixel N
		ADD X9, X9, #4    // Siguiente pixel

		B loop_reset_celeste
	end_reset_celeste:



	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR LR, [SP, #0]
    ADD SP, SP, #8
ret

.endif
