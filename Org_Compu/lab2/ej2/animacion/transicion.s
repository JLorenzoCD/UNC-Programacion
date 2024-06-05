.ifndef transicion
.equ transicion, 0

.include "data.s"

.include "core/delay.s"
.include "core/repintar/guardar.s"

.include "funs/jugador/borrar_jugador_penal.s"
.include "funs/pelota.s"


/*
    Fun: transicion
    Hace: Crea una trancicion pantalla en negro
*/
.globl transicion
transicion:
  // Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #56
    STUR X9, [SP, #0]
    STUR X10, [SP, #8]
    STUR X11, [SP, #16]
    STUR X12, [SP, #24]
    STUR X13, [SP, #32]
    STUR X14, [SP, #40]
    STUR LR, [SP, #48]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Pintando la pantalla en negro con deley
	// Se copia la base del framebuffer en el X9
    MOV X9, X20

	LDR X11, =SCREEN_WIDTH
	LDR X12, =SCREEN_HEIGH

	// (680*480*8)
	MUL X13, X11, X12
	LSL X13, X13, #3

	// X10 el al dirección final del framebuffer ( X11 = &A[0][0] + (680*480*8) )
	ADD X10, X9, X13

	LDR X3, =NEGRO

	loop_tn:
		CMP X9, X10
		B.EQ end_tn

		STUR W3, [X9, #0]  // Colorear el pixel N

		BL delay_transicion

		ADD X9, X9, #4    // Siguiente pixel
		B loop_tn
	end_tn:


	// Repintando la cancha con deley
	MOV X9, X20     // Copia de la direccion base del framebuffer
	MOV X10, X21    // Copia de la direccion base del mapa de pixeles de la cancha

	ADD X10, X10, X13
	ADD X13, X9, X13

	MOV X14, XZR

	loop_tp:
		CMP X9, X13
		B.EQ end_tp

		LDUR w14, [X10, #0]
		STUR w14, [X13, #0]

		BL delay_transicion

		SUB X13, X13, #4    // Siguiente pixel
		SUB X10, X10, #4    // Siguiente pixel
		B loop_tp
	end_tp:


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR X9, [SP, #0]
    LDUR X10, [SP, #8]
    LDUR X11, [SP, #16]
    LDUR X12, [SP, #24]
    LDUR X13, [SP, #32]
    LDUR X14, [SP, #40]
    LDUR LR, [SP, #48]
    ADD SP, SP, #56
ret

// El arquero que va a atajar es frances
.globl transicion_penal_para_arg
transicion_penal_para_arg:
  // Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #8
    STUR LR, [SP, #0]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	BL jugador_posicion_inicial
	BL borrar_jugador_penal_y_pelota

	BL guardar_pantalla_completa

	BL borrar_jugador_penal_fra

	MOV X1, #83
	MOV X2, #240
	BL jugador_fra

	MOV X1, #52
	MOV X2, #400
	BL jugador_fra_arq

	MOV X1, #15
	MOV X2, #240
	BL jugador_arg_arq


	BL delay_lento

	BL transicion

	BL pelota_posicion_penal


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR LR, [SP, #0]
	ADD SP, SP, #8
ret

// El arquero que va a atajar es argentino
.globl transicion_penal_para_fra
transicion_penal_para_fra:
  	// Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #8
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR LR, [SP, #16]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	BL jugador_posicion_inicial
	BL borrar_jugador_penal_y_pelota

	MOV X1, #15
	MOV X2, #240
	BL jugador_arg_arq

	MOV X1, #52
	MOV X2, #400
	BL jugador_fra_arq

	BL guardar_pantalla_completa

	BL borrar_jugador_penal_arg

	MOV X1, #83
	MOV X2, #240
	BL jugador_arg

	MOV X1, #52
	MOV X2, #400
	BL jugador_arg_arq

	MOV X1, #15
	MOV X2, #240
	BL jugador_fra_arq


	BL delay_lento


	BL transicion

	BL pelota_posicion_penal


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR LR, [SP, #16]
    ADD SP, SP, #8
ret

.endif
