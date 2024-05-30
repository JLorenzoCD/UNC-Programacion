.ifndef linea_recta_h
.equ linea_recta_h, 0

.include "data.s"
.include "funs/pintar_pixel.s"


/*
    Fun: linea_recta_h
    Hace: Dadas una par de coordenadas (x, y) y un punto largo, dibuja una linea horizontal hasta x2

    Parámetros:
        X1 -> coordenada x		=>		x
        X2 -> coordenada y		=>		y
        X3 -> largo     		=>		largo
        X4 -> color
*/

.globl linea_recta_h
linea_recta_h:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #32
	STUR X1, [SP, #0]
	STUR X3, [SP, #8]
	STUR X4, [SP, #16]
	STUR LR, [SP, #24]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    // swap(X3, X4)
    MOV X1, X3              // xn
    MOV X3, X4              // color
    LDUR X4, [SP, #0]       // x

    loop_linea_recta_h:
        // Si coordenada x != xn continua el loop
        CMP X4, X1
        B.EQ end_linea_recta_h

        BL pintar_pixel

        SUB X1, X1, #1
        B loop_linea_recta_h
    end_linea_recta_h:


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X1, [SP, #0]
	LDUR X3, [SP, #8]
	LDUR X4, [SP, #16]
	LDUR LR, [SP, #24]
	ADD SP, SP, #32
ret


.endif
