.ifndef circulo
.equ circulo, 0

.include "data.s"
.include "funs/linea_recta_h.s"

.globl circulo

/*
    Fun: circulo
    Hace: Dado una coordenada (x, y) y un r, la función dibuja un circulo centrado en la coordenada dadas de radio r

    Parámetros:
        X1 -> Coordenada del pixel x
        X2 -> Coordenada del pixel y
        X3 -> Radio
        X4 -> Color
*/

circulo:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #72
	STUR X9, [SP, #0]
	STUR X10, [SP, #8]
	STUR X11, [SP, #16]
	STUR X12, [SP, #24]
	STUR X13, [SP, #32]
	STUR X14, [SP, #40]
	STUR X15, [SP, #48]
	STUR X16, [SP, #56]
	STUR LR, [SP, #64]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    MOV X9 , X1     // x
    MOV X10 , X2    // y
    MOV X11, X3     // r
    MOV X12, X4     // color

    // Parte de arriba del circulo
    ADD X13, X9, X11 // xi
    MOV X14, X10     // yi
    MOV X15, X11     // ri

    SUB X16, X2, X3 // limite_superior (y - r)


    loop_czs_circulo:   // while (limite_superior <= yi)
        CMP X16, X14
        B.HI end_czs_circulo

        // void calc_nuevo_xi(x, y, &xi, yi, r)     => Modifica xi
        MOV X1, X9
        MOV X2, X10
        MOV X3, X13
        MOV X4, X14
        MOV X5, X11
        BL calc_nuevo_xi
        MOV X13, X3

        SUB X15, X13, X1

        SUB X1, X9, X15
        MOV X2, X14
        MOV X3, X13
        MOV X4, X12
        BL linea_recta_h

        SUB X14, X14, #1
        B loop_czs_circulo
    end_czs_circulo:



    // Parte de abajo del circulo
    ADD X13, X9, X11     // xi
    MOV X14, X10         // yi
    MOV X15, X11         // ri

    ADD X16, X10, X11     // limite_inferior (y + r)

    loop_czi_circulo:   // while (yi <= limite_inferior)
        CMP X14, X16
        B.HI end_czi_circulo

        // void calc_nuevo_xi(x, y, &xi, yi, r)     => Modifica xi
        MOV X1, X9
        MOV X2, X10
        MOV X3, X13
        MOV X4, X14
        MOV X5, X11
        BL calc_nuevo_xi
        MOV X13, X3

        SUB X15, X13, X1

        SUB X1, X9, X15
        MOV X2, X14
        MOV X3, X13
        MOV X4, X12
        BL linea_recta_h

        ADD X14, X14, #1
        B loop_czi_circulo
    end_czi_circulo:


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X9, [SP, #0]
	LDUR X10, [SP, #8]
	LDUR X11, [SP, #16]
	LDUR X12, [SP, #24]
	LDUR X13, [SP, #32]
	LDUR X14, [SP, #40]
	LDUR X15, [SP, #48]
	LDUR X16, [SP, #56]
	LDUR LR, [SP, #64]
	ADD SP, SP, #72
ret

/*
    Fun: calc_nuevo_xi
    Hace: Dados dos coordenadas (x, y) y (xi, yi) y un radio, obtiene el siguiente punto xi que se encuentra en el circulo formado por la primer coordenada y el radio r

    Parámetros:
        X1 -> Coordenada del pixel x
        X2 -> Coordenada del pixel y
        X3 -> Coordenada del pixel xi
        X4 -> Coordenada del pixel yi
        X5 -> Radio

    Argumentos:
        X3 -> Nueva coordenada del pixel xi dentro del circulo
*/

calc_nuevo_xi:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #16
	STUR X0, [SP, #0]
	STUR LR, [SP, #8]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    loop_calc_nuevo_xi:
        BL validar_ecuacion_con_xi

        CMP X0, #1
        B.EQ end_calc_nuevo_xi

        SUB X3, X3, #1
        B loop_calc_nuevo_xi
    end_calc_nuevo_xi:

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X0, [SP, #0]
	LDUR LR, [SP, #8]
    ADD SP, SP, #16
ret

/*
    Fun: validar_ecuacion_con_xi
    Hace: Dados dos coordenadas (x, y), (xi, yi) y un r, verifica que (xi, yi) se encuentra en el circulo formado por la primera condenada de radio r, es decir que se cumpla que (x - xi)² + (y - yi)² <= r²

    Parámetros:
        X1 -> Coordenada del pixel x
        X2 -> Coordenada del pixel y
        X3 -> Coordenada del pixel xi
        X4 -> Coordenada del pixel yi
        X5 -> Radio

    Argumentos:
        X0 -> Bool (0 == False, otro valor == True)
*/

validar_ecuacion_con_xi:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #32
	STUR X1, [SP, #0]
	STUR X2, [SP, #8]
	STUR X5, [SP, #16]
	STUR LR, [SP, #24]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X0, #1

    // (x - xi)²
    SUB X1, X1, X3
    MUL X1, X1, X1

    // (y - yi)²
    SUB X2, X2, X4
    MUL X2, X2, X2

    // (x - xi)² + (y - yi)²
    ADD X1, X1, X2

    // r²
    MUL X5, X5, X5

    // (x - xi)² + (y - yi)² <= r²
    CMP X1, X5
    B.LS true_validar_ecuacion_con_xi

    MOV X0, XZR

    true_validar_ecuacion_con_xi:

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X1, [SP, #0]
	LDUR X2, [SP, #8]
	LDUR X5, [SP, #16]
	LDUR LR, [SP, #24]
    ADD SP, SP, #32
ret

.endif
