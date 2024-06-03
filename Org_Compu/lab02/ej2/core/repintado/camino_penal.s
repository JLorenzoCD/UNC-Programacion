.ifndef repintado_camino_penal
.equ repintado_camino_penal, 0

.include "data.s"

.globl repintado_camino_penal

repintado_camino_penal:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #72
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR X9, [SP, #32]
    STUR X10, [SP, #40]
    STUR X11, [SP, #48]
    STUR X12, [SP, #56]
    STUR LR, [SP, #64]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X9, X20     // Copia de la direccion base del framebuffer
	MOV X10, X21    // Copia de la direccion base del mapa de pixeles de la cancha

    // Rango y  (190 - 410)
    // Rango x  (100 - 280)

    // Inicializando
	MOV X0, #190
	MOV X1, #100
	MOV X2, #410
	MOV X3, #280

    loop_y_cp:
        // y != 410, continua el bucle
        CMP X0, X2
        B.EQ end_y_cp

        // x = 0
        MOV X1, #100
        loop_x_cp:
            // x != 280, continua el bucle
            CMP X1, X3
            B.EQ end_x_cp

            // X11 = framebuffer_copy[y][x]
            MUL X12, X0, X2
            ADD X12, X12, X1
            LSL X12, X12, #3
            ADD X12, X12, X10   // X12 = &framebuffer_copy[0][0] + ((y * N ) + x) * 8
            LDUR X11, [X12, #0]

            // framebuffer[y][x] = X11
            MUL X12, X0, X2
            ADD X12, X12, X1
            LSL X12, X12, #3
            ADD X12, X12, X9
            STUR X11, [X12, #0]

            // ++x
            ADD X1, X1, #1
            B loop_x_cp
        end_x_cp:
        // ++y
        ADD X0, X0, #1
        B loop_y_cp
    end_y_cp:



    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR X9, [SP, #32]
    LDUR X10, [SP, #40]
    LDUR X11, [SP, #48]
    LDUR X12, [SP, #56]
    LDUR LR, [SP, #64]
    ADD SP, SP, #72
ret

.endif
