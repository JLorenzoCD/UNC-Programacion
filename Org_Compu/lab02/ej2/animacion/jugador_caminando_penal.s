.ifndef animacion_jugador_caminando_penal
.equ animacion_jugador_caminando_penal, 0

.include "data.s"

//.include "core/repintado/camino_penal.s"
.include "core/repintando_cancha.s"
.include "core/delay.s"

.include "funs/jugador/fila_espera_penal_arg.s"
.include "funs/jugador/fila_espera_penal_fra.s"

.globl animacion_jugador_caminando_penal

/*
    Fun: animacion_jugador_caminando_penal
    Hace: Jugador "camina" a patear penal

    Parametros:
        X1 -> Bool (0 == Argentina, 1 == Francia)
*/
animacion_jugador_caminando_penal:
    	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #56
	STUR X1, [SP, #0]
	STUR X2, [SP, #8]
	STUR X3, [SP, #16]
	STUR X4, [SP, #24]
	STUR X9, [SP, #32]
	STUR X10, [SP, #40]
	STUR LR, [SP, #48]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    MOV X9, X1              // Guardo si es Arg o Fra

    CBNZ X9, es_fra_jcp     // Coloco el color del jugador y el valor a sumar si el jugador es Arg o Fra
        MOV X1, #265
	    MOV X2, #205
        LDR X3, =CELESTE
        B es_arg_jcp
    es_fra_jcp:
        MOV X1, #265
	    MOV X2, #280
        LDR X3, =AZUL
    es_arg_jcp:

    // Loop que lleva a el jugador a la mitad de la altura
    MOV X10, #240   // Mitad del alto
    loop_renderizado_my:
        CMP X2, X10
        B.EQ end_renderizado_my

        //BL repintado_camino_penal
        BL repintando_cancha
        BL jugador
        BL fast_delay

        // Sumo o resto en la coordenada y para que el jugador se mueva a la mitad de la cancha
        CBNZ X9, es_fra_jcp_lp_my
            ADD X2, X2, #1
            BL jugador_fila_espera_penal_arg
            B es_arg_jcp_lp_my
        es_fra_jcp_lp_my:
            BL jugador_fila_espera_penal_fra
            SUB X2, X2, #1
        es_arg_jcp_lp_my:
        // A medida que el jugador camina a la mitad de la cancha, este también camina hacia el arco
        SUB X1, X1, #1
        B loop_renderizado_my
    end_renderizado_my:

    // Loop que lleva a el jugador a la posición de penal
    MOV X10, #105   // Posición de penal
    loop_renderizado_pp:
        CMP X1, X10
        B.EQ end_renderizado_pp

        //BL repintado_camino_penal
        BL repintando_cancha
        BL jugador
        BL fast_delay

        // Sumo o resto en la coordenada y para que el jugador se mueva a la mitad de la cancha
        CBNZ X9, es_fra_jcp_lp_pp
            BL jugador_fila_espera_penal_arg
            B es_arg_jcp_lp_pp
        es_fra_jcp_lp_pp:
            BL jugador_fila_espera_penal_fra
        es_arg_jcp_lp_pp:
        // A medida que el jugador camina a la mitad de la cancha, este también camina hacia el arco
        SUB X1, X1, #1
        B loop_renderizado_pp
    end_renderizado_pp:


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X1, [SP, #0]
	LDUR X2, [SP, #8]
	LDUR X3, [SP, #16]
	LDUR X4, [SP, #24]
	LDUR X9, [SP, #32]
	LDUR X10, [SP, #40]
	LDUR LR, [SP, #48]
    ADD SP, SP, #56
ret

.endif
