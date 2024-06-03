.ifndef animacion_pelota_efec
.equ animacion_pelota_efec, 0

.include "data.s"

.include "core/circulo.s"
.include "core/repintando_cancha.s"
.include "core/delay.s"

.globl animacion_pelota_efec

/*
Fun: animacion de pelota
Hace: simula la pelota en movimiento desde el punto de penal

Parametros:
    X0 -> Direccion de la pelota
*/

animacion_pelota_efec:
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

    MOV X1, #70                 // Inicializo x
	MOV X2, #240                // Inicializo y
	MOV X3, #4                  //Incializo el radio de la pelota
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	MOV X5, #20

	loop_penal_efec:
		BL repintando_cancha
		BL circulo
		SUB X1, X1, #1
		SUB X2, X2, X0
        CMP X5, X1
		B.EQ fin_loop_penal_efec
	    BL delay
        B loop_penal_efec

	fin_loop_penal_efec:
        MOV X5, #0
        BL repintando_cancha
		BL circulo
		SUB X1, X1, #1
		SUB X2, X2, #0
        CMP X5, X1
		B.EQ final_finalazo_efec
        BL delay            
        B fin_loop_penal_efec

        final_finalazo_efec:

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
