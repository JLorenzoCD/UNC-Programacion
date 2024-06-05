.ifndef animacion_penal_lineal
.equ animacion_penal_lineal, 0

.include "data.s"

.include "core/circulo.s"
.include "core/repintar/penal.s"
.include "core/delay.s"
.include "funs/pelota.s"

.globl animacion_penal_lineal

/*
Fun: animacion de pelota
Hace: simula la pelota en movimiento desde el punto de penal

Parametros:
    X0 -> Direccion de la pelota
*/

animacion_penal_lineal:
    //Guardo los valores previos de las variables
    SUB SP, SP, #32
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X5, [SP, #16]
    STUR LR, [SP, #24]


    MOV X1, #70                 // Inicializo x
	MOV X2, #240                // Inicializo y
	MOV X5, #0                  //Punto hasta el que se va a trayectar la pelota.


    //Loop para la trayectoria de la pelota
	loop_penal:
        CMP X5, X1              //Chequeo que la trayectoria no termina
		B.EQ fin_loop_penal

		BL repintar_penal
		BL pelota

		BL delay                //Delay para poder recrear una animacion

		SUB X2, X2, X0          //Direccion que toma la pelota
		SUB X1, X1, #1          //Decremento el eje X
        B loop_penal
	fin_loop_penal:


    BL repintar_penal


    //Devuelvo los valores originales de las variables
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR X5, [SP, #16]
    LDUR LR, [SP, #24]
    ADD SP, SP, #32
ret

.endif
