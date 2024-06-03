.ifndef animacion_pelota
.equ animacion_pelota, 0

.include "data.s"

.include "core/circulo.s"
.include "core/repintando_cancha.s"

.globl animacion_pelota

/*
Fun: animacion de pelota
Hace: simula la pelota en movimiento desde el punto de penal

Parametros:
    X0 -> Direccion de la pelota
*/

animacion_pelota:
    SUB SP, SP, #72           //Guardo los valores previos de las variables
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR X4, [SP, #32]
    STUR X5, [SP, #40]
    STUR X6, [SP, #48]
    STUR X7, [SP, #56]
    STUR LR, [SP, #64]

    MOV X1, #50                 // Inicializo x
	MOV X2, #240                // Inicializo y
	MOV X3, #4                  //Incializo el radio de la pelota
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	MOV X5, #0

	loop_penal:
		BL repintando_cancha
		BL circulo
		SUB X1, X1, #1
		SUB X2, X2, X0
        CMP X5, X1
		B.EQ fin_loop_penal
		MOV X6, XZR
		MOV X7, 0xFFFF
		LSL X7, X7, #8

        loop_tardanza:              //Loop para generar delay y de esta forma lograr una animacion en pantalla
			CMP X7, X6
			B.EQ end_loop_tardanza
			ADD X6, X6, 1
			B loop_tardanza

        end_loop_tardanza:
            B loop_penal

	fin_loop_penal:

    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR X4, [SP, #32]
    LDUR X5, [SP, #40]
    LDUR X6, [SP, #48]
    LDUR X7, [SP, #56]
    LDUR LR, [SP, #64]
    ADD SP, SP, #72           //Devuelvo los valores originales de las variables

.endif
