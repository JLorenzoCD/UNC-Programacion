	.equ SCREEN_WIDTH,   640
	.equ SCREEN_HEIGH,   480
	.equ BITS_PER_PIXEL, 32

	.equ GPIO_BASE,    0x3f200000
	.equ GPIO_GPFSEL0, 0x00
	.equ GPIO_GPLEV0,  0x34

	.include "funs/reset_bg.s"
	.include "funs/pintar_pixel.s"
	.include "funs/dib_linea_h.s"

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
	X31(ZXR) 	: 		Constante con valor en cero




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


	// x11=x_0, x12=y, x13=c, x14=color, x15=pintar_pixel, reset_bg=16


	MOV X11, #5				// x
	MOV X12, #5				// y
	MOV X13, #100			// distancia de x0 y x1

	MOVZ X14, 0xFF, LSL #16
	MOVK X14, 0xFFFF, LSL #0

	BL dib_linea_h





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
