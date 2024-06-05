.ifndef cancha
.equ cancha, 0

.include "data.s"
.include "core/reset_bg.s"
.include "core/cuadrado.s"
.include "core/circulo.s"
.include "core/circulo_vacio.s"

.globl cancha

/*
Fun: cancha
Hace: La función dibuja la vista aera de una cancha de futbol
*/


cancha:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #48
	STUR X1, [SP, #0]
	STUR X2, [SP, #8]
	STUR X3, [SP, #16]
	STUR X4, [SP, #24]
	STUR X5, [SP, #32]
    STUR LR, [SP, #40]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	//Pone en verde claro toda la pantalla
	BL pintar_cancha


	//Pinto franjas verde oscuras en la pantalla para simular el pasto de una cancha de futbol
	MOV X1, #70
	MOV X2, #0
	MOV X3, #100
	MOV X4, #480
	MOV X5, X4
	LDR X5, =COLOR_CESPED_OSCURO
	BL rectangulo

	MOV X1, #270
	MOV X2, #0
	MOV X3, #100
	MOV X4, #480
	MOV X5, X4
	LDR X5, =COLOR_CESPED_OSCURO
	BL rectangulo

	MOV X1, #470
	MOV X2, #0
	MOV X3, #100
	MOV X4, #480
	MOV X5, X4
	LDR X5, =COLOR_CESPED_OSCURO
	BL rectangulo


	//Circulo de mitad de cancha
	MOV X1, #320
	MOV X2, #240
	MOV X3, #50
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	BL circulo

	MOV X1, #320
	MOV X2, #240
	MOV X3, #47
	LDR X4, =COLOR_CESPED_OSCURO
	BL circulo


	//Trazo la linea de la mitad de cancha
	MOV X1, #320
	MOV X2, #0
	MOV X3, #3
	MOV X4, #480
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo


	//Puntos de la cancha
	MOV X1, #570
	MOV X2, #240
	MOV X3, #4
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	BL circulo

	MOV X1, #70
	MOV X2, #240
	MOV X3, #4
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	BL circulo

	MOV X1, #321
	MOV X2, #240
	MOV X3, #4
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	BL circulo


	//Area chica de la izquierda
	MOV X1, #0
	MOV X2, #175
	MOV X3, #50
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #0
	MOV X2, #295
	MOV X3, #50
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #50
	MOV X2, #175
	MOV X3, #3
	MOV X4, #123
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo


    //Area grande de la izquierda
	MOV X1, #0
	MOV X2, #140
	MOV X3, #95
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #0
	MOV X2, #330
	MOV X3, #95
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #95
	MOV X2, #140
	MOV X3, #3
	MOV X4, #193
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo


	//Area chica de la derecha
	MOV X1, #590
	MOV X2, #175
	MOV X3, #50
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #590
	MOV X2, #295
	MOV X3, #50
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #590
	MOV X2, #175
	MOV X3, #3
	MOV X4, #123
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo


    //Area grande de la derecha
	MOV X1, #550
	MOV X2, #140
	MOV X3, #85
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #550
	MOV X2, #330
	MOV X3, #85
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #550
	MOV X2, #140
	MOV X3, #3
	MOV X4, #193
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo


	//Corner izq arriba
	MOV X1, #0
	MOV X2, #0
	MOV X3, #18
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	BL circulo

	MOV X1, #0
	MOV X2, #0
	MOV X3, #15
	LDR X4, =COLOR_CESPED_CLARO
	BL circulo


	//Corner izq abajo
	MOV X1, #0
	MOV X2, #480
	MOV X3, #18
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	BL circulo

	MOV X1, #0
	MOV X2, #480
	MOV X3, #15
	LDR X4, =COLOR_CESPED_CLARO
	BL circulo


	//Corner der arriba
	MOV X1, #639
	MOV X2, #0
	MOV X3, #18
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	BL circulo

	MOV X1, #639
	MOV X2, #0
	MOV X3, #15
	LDR X4, =COLOR_CESPED_CLARO
	BL circulo


	//Corner der abajo
	MOV X1, #639
	MOV X2, #480
	MOV X3, #18
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0
	BL circulo

	MOV X1, #639
	MOV X2, #480
	MOV X3, #15
	LDR X4, =COLOR_CESPED_CLARO
	BL circulo


	//Contorno de la cancha
	MOV X1, #0
	MOV X2, #0
	MOV X3, #639
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #0
	MOV X2, #477
	MOV X3, #639
	MOV X4, #3
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #0
	MOV X2, #0
	MOV X3, #3
	MOV X4, #480
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo

	MOV X1, #637
	MOV X2, #0
	MOV X3, #3
	MOV X4, #480
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo


	//Arco izq
	MOV X1, #0
	MOV X2, #190
	MOV X3, #6
	MOV X4, #90
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo


	//Arco der
	MOV X1, #634
	MOV X2, #190
	MOV X3, #6
	MOV X4, #90
	MOV X5, X4
	MOVZ X5, 0xFF, LSL #16
	MOVK X5, 0xFFFF, LSL #0
	BL rectangulo


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X1, [SP, #0]
	LDUR X2, [SP, #8]
	LDUR X3, [SP, #16]
	LDUR X4, [SP, #24]
	LDUR X5, [SP, #32]
    LDUR LR, [SP, #40]
    ADD SP, SP, #48

ret

.endif
