.ifndef animacion_penal_efec
.equ animacion_penal_efec, 0

.include "data.s"

.include "core/circulo.s"
.include "core/repintar/penal.s"
.include "core/delay.s"
.include "funs/pelota.s"

.globl animacion_penal_efec

/*
Fun: animacion de pelota
Hace: simula la pelota en movimiento desde el punto de penal

Parametros:
    X0 -> Direccion de la pelota
*/

animacion_penal_efec:
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
	MOV X5, #40                 //El primer ciclo se va a hacer hasta este valor del eje X

	first_trayec:               //Primer loop que representa la primer trayectoria de la pelota
		BL repintar_penal
		BL pelota
		SUB X1, X1, #1
		SUB X2, X2, X0          //Direccion que tomara la pelota
        CMP X5, X1
		B.EQ second_trayec
	    BL delay                        //Delay para poder realizar una animacion
        B first_trayec

	second_trayec:               //Segundo ciclo que representa la segunda trayectoria de la pelota
        MOV X5, #0               //Asigno a X5 el valor del eje X hasta donde se realizara la segunda trayectoria
        BL repintar_penal
		BL pelota
		SUB X1, X1, #1
		SUB X2, X2, #0         //Direccion que tomara la pelota
        CMP X5, X1
		B.EQ final_trayecs
        BL delay                //Delay para poder recrear la animacion
        B second_trayec

    final_trayecs:

    BL repintar_penal


    LDUR X0, [SP, #0]           //Devuelvo los valores anteriormente guardados
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR X4, [SP, #32]
    LDUR X5, [SP, #40]
    LDUR X6, [SP, #48]
    LDUR X7, [SP, #56]
    LDUR LR, [SP, #64]
    ADD SP, SP, #72

ret

.endif
