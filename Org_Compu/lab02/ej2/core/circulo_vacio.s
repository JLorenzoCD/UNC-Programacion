.ifndef circulo_vacio
.equ circulo_vacio, 0

.include "data.s"
.include "core/linea_recta_h.s"
.include "core/cuadrado.s"

.globl circulo_vacio

/*
    Fun: circulo_vacio
    Hace: Dado una coordenada (x, y) y un r, la función dibuja el perimetro de un circulo centrado en la coordenada dadas de radio r

    Parámetros:
        X1 -> Coordenada del pixel x
        X2 -> Coordenada del pixel y
        X3 -> Radio
        X4 -> Color
*/

circulo_vacio:
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
    MOV X9 , X1     // x
    MOV X10 , X2    // y
    MOV X11, X3     // radio
    MOV X12, X4     // color

    MOV X13, X11     // di = radio
    MOV X14, XZR    // k


    loop_czs_circulo_vacio:   //     for (uint k = 0 ; k != radio; k++)
        CMP X14, X11
        B.EQ end_czs_circulo_vacio

        // calcular_nuevo_di(uint *di, uint yi, uint radio)
        MOV X1, X13
        MOV X2, X14     // yi = k
        MOV X3, X11
        BL calc_nueva_distancia_i_circulo_vacio
        MOV X13, X1    // Guarda di


        MOV X3, #2
        MOV X4, X12         // color para la fun cuadrado


        // Contorno superior
        // Pintando el contorno derecho inferior del circulo
        ADD X1, X9, X13     // x + di
        SUB X2, X10, X14    // y - k
        BL cuadrado

        SUB X1, X9, X14     // x - k
        ADD X2, X10, X13    // y + di
        BL cuadrado

        // Pintando el contorno derecho inferior del circulo
        SUB X1, X9, X13     // x - di
        SUB X2, X10, X14    // y - k
        BL cuadrado

        SUB X1, X9, X14     // x - k
        SUB X2, X10, X13    // y - di
        BL cuadrado



        // Contorno inferior
        // Pintando el contorno derecho inferior del circulo
        ADD X1, X9, X13     // x + di
        ADD X2, X10, X14    // y + k
        BL cuadrado

        ADD X1, X9, X14     // x + k
        ADD X2, X10, X13    // y + di
        BL cuadrado

        // Pintando el contorno derecho inferior del circulo
        SUB X1, X9, X13     // x - di
        ADD X2, X10, X14    // y + k
        BL cuadrado

        ADD X1, X9, X14     // x + k
        SUB X2, X10, X13    // y - di
        BL cuadrado



        ADD X14, X14, #1
        B loop_czs_circulo_vacio
    end_czs_circulo_vacio:


    // Reseteando parametros de la funcion
    MOV X1, X9
    MOV X2, X10
    MOV X3, X11
    MOV X4, X12

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

/*
    Fun: calc_nueva_distancia_i_circulo_vacio
    Hace: Dados una coordenada (xi, y) y r, obtiene el siguiente punto xi que se encuentra en el circulo formado por el centro en cero y el radio r

    Parámetros:
        X1 -> Coordenada del pixel xi
        X2 -> Coordenada del pixel y
        X3 -> Radio

    Argumentos:
        X3 -> Nueva coordenada del pixel xi dentro del circulo
*/

calc_nueva_distancia_i_circulo_vacio:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #16
	STUR X0, [SP, #0]
	STUR LR, [SP, #8]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    loop_calc_nueva_distancia_i_circulo_vacio:
        BL validar_ecuacion_con_di_circulo_vacio

        CMP X0, #1
        B.EQ end_calc_nueva_distancia_i_circulo_vacio

        SUB X1, X1, #1
        B loop_calc_nueva_distancia_i_circulo_vacio
    end_calc_nueva_distancia_i_circulo_vacio:

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X0, [SP, #0]
	LDUR LR, [SP, #8]
	ADD SP, SP, #16
ret

/*
    Fun: validar_ecuacion_con_di_circulo_vacio
    Hace: Dados una coordenada (x, y) y un r, verifica que dicha coordenada se encuentra dentro de un circulo de radio r y centro cero, es decir que se cumpla que (x)² + (y)² <= r²

    Parámetros:
        X1 -> Coordenada del pixel x
        X2 -> Coordenada del pixel y
        X3 -> Radio

    Argumentos:
        X0 -> Bool (0 == False, otro valor == True)
*/

validar_ecuacion_con_di_circulo_vacio:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #32
	STUR X1, [SP, #0]
	STUR X2, [SP, #8]
	STUR X3, [SP, #16]
	STUR LR, [SP, #24]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X0, #1

    // (x)²
    MUL X1, X1, X1

    // (y)²
    MUL X2, X2, X2

    // (x)² + (y)²
    ADD X1, X1, X2

    // r²
    MUL X3, X3, X3

    // (x)² + (y)² <= r²
    CMP X1, X3
    B.LS true_validar_ecuacion_con_di_circulo_vacio

    MOV X0, XZR

    true_validar_ecuacion_con_di_circulo_vacio:

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X1, [SP, #0]
	LDUR X2, [SP, #8]
	LDUR X3, [SP, #16]
	LDUR LR, [SP, #24]
    ADD SP, SP, #32
ret

.endif
