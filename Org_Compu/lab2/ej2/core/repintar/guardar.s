.ifndef guardar
.equ guardar, 0

.include "data.s"

.globl guardar_pantalla_completa
guardar_pantalla_completa:

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



	MOV X9, X20     // Copia de la direccion base del framebuffer
	MOV X10, X21    // Copia de la direccion base del mapa de pixeles de la cancha

	LDR X11, =SCREEN_WIDTH
	LDR X12, =SCREEN_HEIGH

	// X13 el al dirección final del framebuffer ( X11 = &A[0][0] + (680*480*8) )
	MUL X13, X11, X12
	LSL X13, X13, #3
	ADD X13, X13, X9

	MOV X14, XZR

	loop_pantalla_completa:
		CMP X9, X13
		B.EQ end_pantalla_completa

        LDUR w14, [X9, #0]
		STUR w14, [X10, #0]

		ADD X9, X9, #4    // Siguiente pixel
		ADD X10, X10, #4    // Siguiente pixel

		B loop_pantalla_completa
	end_pantalla_completa:



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
    Fun: guardar
    Hace: Dado una coordenada (x, y), un ancho y alto, guarda el area del rectangulo formado en la copia del framebuffer

    Parámetros:
        X0 -> Posición del pixel x
        X1 -> Posición del pixel y
        X2 -> Ancho
        X3 -> Alto
*/
.globl guardar
guardar:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #72
    STUR X13, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR X9, [SP, #32]
    STUR X10, [SP, #40]
    STUR X11, [SP, #48]
    STUR X12, [SP, #56]
    STUR LR, [SP, #64]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    LDR X9, =SCREEN_WIDTH
    MOV X10, XZR
    MOV X13, X0


    ADD X2, X2, X0
    ADD X3, X3, X1

    loop_y_g:
        // y != (y + alto), continua el bucle
        CMP X1, X3
        B.EQ end_y_g

        // x = xi
        MOV X0, X13
        loop_x_g:
            // x != (x + ancho), continua el bucle
            CMP X0, X2
            B.EQ end_x_g

                // X11 = ((yi*640) + xi) * 4
                MUL X11, X1, X9
                ADD X11, X11, X0
                LSL X11, X11, #2

                // W10 = framebuffer_copy[yi][xi]
                ADD X12, X20, X11
                LDUR W10, [X12, #0]

                // framebuffer[yi][xi] = W10
                ADD X12, X21, X11
                STUR W10, [X12, #0]

            // ++x
            ADD X0, X0, #1
            B loop_x_g
        end_x_g:
        // ++y
        ADD X1, X1, #1
        B loop_y_g
    end_y_g:


    // Reseteando valor
    MOV X0, X13
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
    LDUR X13, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR X9, [SP, #32]
    LDUR X10, [SP, #40]
    LDUR X11, [SP, #48]
    LDUR X12, [SP, #56]
    LDUR LR, [SP, #64]
    ADD SP, SP, #72
.endif
