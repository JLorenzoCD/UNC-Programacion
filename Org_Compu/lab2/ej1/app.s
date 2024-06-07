	.include "data.s"

	.include "funs/bandera_arg.s"
	.include "funs/bandera_fra.s"
	.include "funs/cancha.s"
	.include "funs/pelota.s"

	.include "funs/jugador/posicion_inicial.s"
	.include "funs/jugador/arg.s"
	.include "funs/jugador/fra.s"

	.include "funs/puntos/tablero.s"
	.include "funs/puntos/tablero_penales.s"

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
	X22 		: Dirección base del arreglo con el resultado de los penales
*/


// Nuestro programa
main:
	// Configuración inicial
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	MOV X20, X0 				// La dirección base del framebuffer comienza en X0
	LDR X22, =ARR_PENALES		// La dirección base del array con el resultado de los penales
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	BL cancha

	BL bandera_arg
	BL bandera_fra


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Infinite Loop
InfLoop:
	B InfLoop
