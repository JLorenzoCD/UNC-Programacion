.ifndef pintar_borde_rectangulo
.equ pintar_borde_rectangulo, 0

.include "data.s"
.include "core/pintar_pixel.s"
.include "core/linea_recta_h.s"
.include "core/linea_recta_v.s"

/*
    Fun: pintar_borde_rectangulo
    Hace:  Dibuja un rectangulo sin relleno tomando la coordenada (x, y), un ancho y un largo

    Parámetros:
        X1 -> Coordenada x del rectángulo
        X2 -> Coordenada y del rectángulo
        X3 -> Ancho del rectángulo
        X4 -> Alto del rectángulo
        X5 -> Color
*/

.globl pintar_borde_rectangulo
pintar_borde_rectangulo:
    // Reserva espacio en el stack
    SUB SP, SP, #56
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X3, [SP, #16]
    STUR X4, [SP, #24]
    STUR X9, [SP, #32]
    STUR X10, [SP, #40]
    STUR LR, [SP, #48]

    MOV X9, X3  // Ancho
    MOV X10, X4 // Alto
    MOV X4, X5  // Color

    // Dibuja LINEA SUP. DEL REC.
    BL linea_recta_h    // (x, y), ancho

    // DIBUJA LINEA IZQ. DEL REC.
    MOV X3, X10
    BL linea_recta_v    // (x, y), alto

    // Dibuja LINEA INF. DEL REC.
    ADD X2, X2, X10
    SUB X2, X2, #1
    MOV X3, X9
    BL linea_recta_h    // (x, y + alto - 1), ancho

    // Dibuja LINEA DER. DEL REC.
    ADD X1, X1, X9
    SUB X1, X1, #1
    LDUR X2, [SP, #8]
    MOV X3, X10
    BL linea_recta_v    // (x + ancho - 1, y), alto

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

