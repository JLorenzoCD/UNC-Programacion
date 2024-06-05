	.include "data.s"

	.include "core/repintar/guardar.s"

	.include "funs/bandera_arg.s"
	.include "funs/bandera_fra.s"
	.include "funs/cancha.s"
	.include "funs/pelota.s"

	.include "funs/jugador/posicion_inicial.s"
	.include "funs/jugador/jugador.s"

	.include "funs/puntos/tablero.s"
	.include "funs/puntos/tablero_penales.s"

	.include "animacion/penales.s"

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
	X21 		: Dirección base de la copia del frambuffer
	X22 		: Dirección base del arreglo con el resultado de los penales
*/


// Nuestro programa
.globl main
main:
	// Configuración inicial
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	MOV X20, X0 // La dirección base del framebuffer comienza en X0
	LDR X21, =FRAMEBUFFER_COPY	// Memoria para la copia del framebuffer
	LDR X22, =ARR_PENALES		// La dirección base del array con el resultado de los penales
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


	BL cancha

	BL bandera_arg
	BL bandera_fra





	BL jugador_posicion_inicial
	MOV X1, #15
	MOV X2, #240
	BL jugador_arg_arq

	MOV X1, #52
	MOV X2, #400
	BL jugador_fra_arq





	// Puntos por goles
	MOV X1, #270
	MOV X2, #20
	MOV X3, #3			// Puntos ARG
	MOV X4, #3			// Puntos FRA
	BL puntos_tablero


	// Puntos por penales
	MOV X1, #270
	MOV X2, #420
	MOV X3, #0			// Puntos ARG
	MOV X4, #0			// Puntos FRA
	BL puntos_tablero_penales





	BL guardar_pantalla_completa



	// Pelota en punto de penal
	BL pelota_posicion_penal



	//La direccion de los penales es una simulacion de los penales de la final del mundo del 2022
	// -------------------------------------------------------------------------------------------------------
	BL animacion_penales
	// -------------------------------------------------------------------------------------------------------





// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Infinite Loop
InfLoop:
	B InfLoop
