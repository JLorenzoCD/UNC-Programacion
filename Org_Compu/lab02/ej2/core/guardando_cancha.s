.ifndef guardando_cancha
.equ guardando_cancha, 0

.include "data.s"

.globl guardando_cancha

guardando_cancha:

	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #56
    STUR X9, [SP, #0]
    STUR X10, [SP, #8]
    STUR X11, [SP, #16]
    STUR X12, [SP, #24]
    STUR X13, [SP, #32]
    STUR X14, [SP, #40]
    STUR LR, [SP, #48]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



	MOV X9, X20     // Copia de la direccion base del framebuffer
	MOV X10, X21    // Copia de la direccion base del mapa de pixeles de la cancha

	LDR X11, =SCREEN_WIDTH
	LDR X12, =SCREEN_HEIGH

	// X13 el al dirección final del framebuffer ( X11 = &A[0][0] + (680*480*8) )
	MUL X13, X11, X12
	LSL X13, X13, #3
	ADD X13, X13, X9

	MOV X14, XZR

	loop_guardando_cancha:
		CMP X9, X13
		B.EQ end_guardando_cancha

        LDUR w14, [X9, #0]
		STUR w14, [X10, #0]

		ADD X9, X9, #4    // Siguiente pixel
		ADD X10, X10, #4    // Siguiente pixel

		B loop_guardando_cancha
	end_guardando_cancha:



    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X9, [SP, #0]
    LDUR X10, [SP, #8]
    LDUR X11, [SP, #16]
    LDUR X12, [SP, #24]
    LDUR X13, [SP, #32]
    LDUR X14, [SP, #40]
    LDUR LR, [SP, #48]
    ADD SP, SP, #56
ret

.endif
