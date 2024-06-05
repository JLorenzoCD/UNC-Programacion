.ifndef animacion_penales
.equ animacion_penales, 0

.include "data.s"

.include "funs/puntos/tablero_penales.s"
.include "funs/puntos/gol_penal.s"
.include "funs/puntos/no_gol_penal.s"


.include "animacion/penal_lineal.s"
.include "animacion/penal_efec.s"
.include "animacion/penal_palo.s"
.include "animacion/jugador_caminando_penal.s"
.include "animacion/transicion.s"


.globl animacion_penales
animacion_penales:
    SUB SP, SP, #8
    STUR LR, [SP, #0]

    BL penal_1
    BL penal_2
    BL penal_3
    BL penal_4

    LDUR LR, [SP, #0]
    ADD SP, SP, #8
ret

penal_1:
  	// Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #48
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR X4, [SP, #32]
    STUR LR, [SP, #40]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// ----------------------------  Patea Francia
	MOV X1, #1
	BL animacion_jugador_caminando_penal

	MOV X0, #-1
	BL animacion_penal_efec

    // Puntos penal
    // Modificando el array de penales para marcar como gol
	MOV X0, #1		// Equipo
	MOV X1, #1		// Penal Nro
	BL gol_penal

    // Repintando tabla de puntos con los nuevos valores
	MOV X1, #270
	MOV X2, #420
	MOV X3, #0			// Puntos ARG
	MOV X4, #1			// Puntos FRA
	BL puntos_tablero_penales


	// ----------------------------  Patea Argentina
	BL transicion_penal_para_arg

	MOV X1, #0
	BL animacion_jugador_caminando_penal

	MOV X0, #0
	BL animacion_penal_lineal

	// Puntos penal
    // Modificando el array de penales para marcar como gol
	MOV X0, #0		// Equipo
	MOV X1, #1		// Penal Nro
	BL gol_penal

    // Repintando tabla de puntos con los nuevos valores
	MOV X1, #270
	MOV X2, #420
	MOV X3, #1			// Puntos ARG
	MOV X4, #1			// Puntos FRA
	BL puntos_tablero_penales

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR X4, [SP, #32]
    LDUR LR, [SP, #40]
    ADD SP, SP, #48
ret

penal_2:
  	// Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #48
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR X4, [SP, #32]
    STUR LR, [SP, #40]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    //  ----------------------------   Patea Francia
	BL transicion_penal_para_fra
	MOV X1, #1
	BL animacion_jugador_caminando_penal
	MOV X0, #-1

	BL animacion_penal_lineal

	// Puntos penal
    // Modificando el array de penales para marcar como no gol
	MOV X0, #1		// Equipo
	MOV X1, #2		// Penal Nro
	BL no_gol_penal

    // Repintando tabla de puntos con los nuevos valores
	MOV X1, #270
	MOV X2, #420
	MOV X3, #1			// Puntos ARG
	MOV X4, #1			// Puntos FRA
	BL puntos_tablero_penales


	//  ----------------------------   Patea Argentina
	BL transicion_penal_para_arg
	MOV X1, #0
	BL animacion_jugador_caminando_penal
	MOV X0, #0

	BL animacion_penal_lineal

    // Puntos penal
    // Modificando el array de penales para marcar como gol
	MOV X0, #0		// Equipo
	MOV X1, #2		// Penal Nro
	BL gol_penal

    // Repintando tabla de puntos con los nuevos valores
	MOV X1, #270
	MOV X2, #420
	MOV X3, #2			// Puntos ARG
	MOV X4, #1			// Puntos FRA
	BL puntos_tablero_penales

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR X4, [SP, #32]
    LDUR LR, [SP, #40]
    ADD SP, SP, #48
ret

penal_3:
  	// Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #48
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR X4, [SP, #32]
    STUR LR, [SP, #40]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//  ----------------------------   Patea Francia
	BL transicion_penal_para_fra

	MOV X1, #1
	BL animacion_jugador_caminando_penal

	MOV X0, #-1
	BL animacion_penal_palo

    // Puntos penal
    // Modificando el array de penales para marcar como no gol
	MOV X0, #1		// Equipo
	MOV X1, #3		// Penal Nro
	BL no_gol_penal

    // Repintando tabla de puntos con los nuevos valores
	MOV X1, #270
	MOV X2, #420
	MOV X3, #2			// Puntos ARG
	MOV X4, #1			// Puntos FRA
	BL puntos_tablero_penales


	//  ----------------------------   Patea Argentina
	BL transicion_penal_para_arg

	MOV X1, #0
	BL animacion_jugador_caminando_penal

	MOV X0, #-1
	BL animacion_penal_efec

	// Puntos penal
    // Modificando el array de penales para marcar como gol
	MOV X0, #0		// Equipo
	MOV X1, #3		// Penal Nro
	BL gol_penal

    // Repintando tabla de puntos con los nuevos valores
	MOV X1, #270
	MOV X2, #420
	MOV X3, #3			// Puntos ARG
	MOV X4, #1			// Puntos FRA
	BL puntos_tablero_penales

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR X4, [SP, #32]
    LDUR LR, [SP, #40]
    ADD SP, SP, #48
ret

penal_4:
  	// Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #48
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR X4, [SP, #32]
    STUR LR, [SP, #40]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	//  ----------------------------   Patea Francia
	BL transicion_penal_para_fra

	MOV X1, #1
	BL animacion_jugador_caminando_penal

	MOV X0, #0
	BL animacion_penal_lineal

    // Puntos penal
    // Modificando el array de penales para marcar como gol
	MOV X0, #1		// Equipo
	MOV X1, #4		// Penal Nro
	BL gol_penal

    // Repintando tabla de puntos con los nuevos valores
	MOV X1, #270
	MOV X2, #420
	MOV X3, #3			// Puntos ARG
	MOV X4, #2			// Puntos FRA
	BL puntos_tablero_penales



	//  ----------------------------   Patea Argentina
	BL transicion_penal_para_arg

	MOV X1, #0
	BL animacion_jugador_caminando_penal

	MOV X0, #1
	BL animacion_penal_efec

	// Puntos penal
    // Modificando el array de penales para marcar como gol
	MOV X0, #0		// Equipo
	MOV X1, #4		// Penal Nro
	BL gol_penal

    // Repintando tabla de puntos con los nuevos valores
	MOV X1, #270
	MOV X2, #420
	MOV X3, #4			// Puntos ARG
	MOV X4, #2			// Puntos FRA
	BL puntos_tablero_penales

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la direccion de retorno y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR X4, [SP, #32]
    LDUR LR, [SP, #40]
    ADD SP, SP, #48
ret

.endif
