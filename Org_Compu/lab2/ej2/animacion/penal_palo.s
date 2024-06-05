.ifndef animacion_penal_palo
.equ animacion_penal_palo, 0

.include "data.s"

.include "core/circulo.s"
.include "core/repintar/penal.s"
.include "core/delay.s"

.include "funs/pelota.s"

.globl animacion_penal_palo

/*
Fun: animacion de pelota
Hace: simula la pelota en movimiento desde el punto de penal

Parametros:
    X0 -> Direccion de la pelota
*/

animacion_penal_palo:
    SUB SP, SP, #56           //Guardo los valores previos de las variables
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR X4, [SP, #32]
    STUR X5, [SP, #40]
    STUR LR, [SP, #48]

    MOV X1, #70                 // Inicializo x
	MOV X2, #240                // Inicializo y

	MOV X5, #35                 // El primer ciclo se va a hacer hasta este valor del eje X
    first_trayec2:               //Primer loop que representa la primer trayectoria de la pelota
        CMP X5, X1
		B.EQ end_first_trayec2

        BL repintar_penal
		BL pelota
	    BL delay                        //Delay para poder realizar una animacion

        SUB X1, X1, #1
		SUB X2, X2, X0          //Direccion que tomara la pelota
        B first_trayec2
    end_first_trayec2:



    MOV X5, #10                 //Asigno a X5 el valor del eje X hasta donde se realizara la segunda trayectoria
	second_trayec2:             //Segundo ciclo que representa la segunda trayectoria de la pelota
        CMP X5, X1
		B.EQ end_second_trayec2


        BL repintar_penal
		BL pelota
        BL delay                //Delay para poder recrear la animacion


		SUB X1, X1, #1
		SUB X2, X2, #0          //Direccion que tomara la pelota
        B second_trayec2
    end_second_trayec2:



    MOV X5, #300
    inicio_palo:
        CMP X5, X2
		B.EQ final

        BL repintar_penal
		BL pelota
		BL delay_revote_pelota      //Delay para recrear la animacion

		ADD X1, X1, #1
		ADD X2, X2, #1              //Aumento el eje de las Y para dar la sensacion del desvio de la pelota
        B inicio_palo
    final:

    BL repintar_penal


    LDUR X0, [SP, #0]
    LDUR X1, [SP, #8]
    LDUR X2, [SP, #16]
    LDUR X3, [SP, #24]
    LDUR X4, [SP, #32]
    LDUR X7, [SP, #40]
    LDUR LR, [SP, #48]
    ADD SP, SP, #56           //Devuelvo los valores originales de las variables

ret

.endif
