	.include "data.s"
	.include "funs/reset_bg.s"
	.include "funs/cuadrado.s"
	.include "funs/circulo.s"
	.include "funs/isla.s"

	.globl main

/*
Convención de los registros en LEGv8:
	X0 - X7 	: 		Argumentos y Resultados
	X8		 	: 		No se
	X9 - X15 	: 		Temporales
	X16 - X17 	: 		No se x2
	X18		 	: 		No se x3
	X19 - X27 	: 		Constantes del programa
	X28(SP) 	: 		Stack pointer
	X29(FP) 	: 		Frame pointer
	X30(LR) 	: 		Dirección de retorno
	X31(XZR) 	: 		Constante con valor en cero




Uso de los registros en el proyecto:
	X20 		: Dirección base del framebuffer


*/


// Nuestro programa
main:
	// Configuración inicial
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	MOV X20, X0 // La dirección base del framebuffer comienza en X0

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	BL reset_bg


	// BL draw_island

	MOV X1, -30
	MOV X2, 40
	MOV X3, 70
	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0xFFFF, LSL #0

	BL cuadrado

	MOV X1, #20
	MOV X2, #50
	MOV X5, X4
	MOVK X5, 0x00, LSL #0
	MOV X3, #50
	MOV X4, #200

	BL rectangulo

	MOV X1, #450		// x
	MOV X2, #200		// y
	MOV X3, #100		// r

	MOVZ X4, 0xFF, LSL #16
	MOVK X4, 0x00FF, LSL #0

	BL circulo


	// Ejemplo de uso de gpios
	MOV X9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	STR WZR, [X9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	LDR W10, [X9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en W10 (notar 0b... es binario)
	// al inmediato se lo refiere como "máscara" en este caso:
	// - Al hacer AND revela el estado del bit 2
	// - Al hacer OR "setea" el bit 2 en 1
	// - Al hacer AND con el complemento "limpia" el bit 2 (setea el bit 2 en 0)
	AND W11, W10, 0b00000010

	// si w11 es 0 entonces el GPIO 1 estaba liberado
	// de lo contrario será distinto de 0, (en este caso particular 2)
	// significando que el GPIO 1 fue presionado





// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Infinite Loop
InfLoop:
	B InfLoop
