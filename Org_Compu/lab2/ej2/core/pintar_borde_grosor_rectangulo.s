.ifndef pintar_borde_grosor_rectangulo
.equ pintar_borde_grosor_rectangulo, 0

.include "data.s"
.include "core/rectangulo.s"

/*
    Fun: pintar_borde_grosor_rectangulo
    Hace:  Dibuja un rectangulo sin relleno tomando la coordenada (x, y), un ancho, un largo y un grosor para el borde

    Parámetros:
        X1 -> Coordenada x del rectángulo
        X2 -> Coordenada y del rectángulo
        X3 -> Ancho del rectángulo
        X4 -> Alto del rectángulo
        X5 -> Grosor
        X6 -> Color
*/

.globl pintar_borde_grosor_rectangulo
pintar_borde_grosor_rectangulo:
    // Reserva espacio en el stack
    SUB SP, SP, #48
    STUR X9, [SP, #0]
    STUR X10, [SP, #8]
    STUR X11, [SP, #16]
    STUR X12, [SP, #24]
    STUR X13, [SP, #32]
    STUR LR, [SP, #40]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        MOV X9, X1  // x
        MOV X10, X2 // y
        MOV X11, X3 // Ancho
        MOV X12, X4 // Alto
        MOV X13, X5 // Grososr

        MOV X5, X6  // Color en X5 para las funciones pintar rectangulo


        // pintar_rectangulo(x, y, ancho, grosor, color) // Rectángulo superior
        MOV X1, X9
        MOV X2, X10
        MOV X3, X11
        MOV X4, X13
        BL rectangulo


        // pintar_rectangulo(x, y + alto - grosor, ancho, grosor, color) // Rectángulo Inferior
        MOV X1, X9
        ADD X2, X10, X12
        //SUB X2, X2, X13
        MOV X3, X11
        MOV X4, X13
        BL rectangulo


        // pintar_rectangulo(x, y, grosor, alto, color) // Rectángulo Derecho
        MOV X1, X9
        MOV X2, X10
        MOV X3, X13
        MOV X4, X12
        BL rectangulo


        //pintar_rectangulo(x + ancho - grosor, y, grosor, alto, color) // Rectángulo Izquierdo
        ADD X1, X9, X11
        SUB X1, X1, X13
        MOV X2, X10
        MOV X3, X13
        MOV X4, X12
        BL rectangulo


        // Reseteando Registros
        MOV X1, X9
        MOV X2, X10
        MOV X3, X11
        MOV X4, X12
        MOV X5, X13

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X9, [SP, #0]
    LDUR X10, [SP, #8]
    LDUR X11, [SP, #16]
    LDUR X12, [SP, #24]
    LDUR X13, [SP, #32]
    LDUR LR, [SP, #40]
    ADD SP, SP, #48
ret
.endif

