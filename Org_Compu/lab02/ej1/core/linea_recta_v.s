.ifndef linea_recta_v
.equ linea_recta_v, 0

.include "data.s"
.include "core/pintar_pixel.s"

/*
    Fun: linea_recta_v
    Hace: Dadas una par de coordenadas (x, y) y un ancho, dibuja una linea vertical hasta y2

    Parámetros:
        X1 -> coordenada x        =>      x
        X2 -> coordenada y        =>      y
        X3 -> ancho               =>      ancho
        X4 -> color
*/

.globl linea_recta_v
linea_recta_v:
    // Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #32
    STUR X2, [SP, #0]
    STUR X3, [SP, #8]
    STUR X4, [SP, #16]
    STUR LR, [SP, #24]

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X3, X4              // color
    LDUR X4, [SP, #8]       // ancho
    ADD X4, X2, X4

    loop_linea_recta_v:
        // Si coordenada y != yn continua el loop
        CMP X2, X4
        B.EQ end_linea_recta_v

        BL pintar_pixel

        ADD X2, X2, #1
        B loop_linea_recta_v
    end_linea_recta_v:


    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    // Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X2, [SP, #0]
    LDUR X3, [SP, #8]
    LDUR X4, [SP, #16]
    LDUR LR, [SP, #24]
    ADD SP, SP, #32
ret

.endif

