.ifndef borde_circulo
.equ borde_circulo, 0

.include "data.s"
.include "core/circulo_vacio.s"

.globl borde_circulo

/*
    Fun: borde_circulo
    Hace: Dado una coordenada (x, y), un radio y un grosor, la función dibuja el perimetro de un circulo centrado en la coordenada dadas de radio r

    Parámetros:
        X1 -> Coordenada del pixel x
        X2 -> Coordenada del pixel y
        X3 -> Radio
        X4 -> Grosor del perimetro
        X5 -> Color
*/

borde_circulo:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #32
	STUR X9, [SP, #0]
	STUR X10, [SP, #8]
	STUR X11, [SP, #16]
	STUR LR, [SP, #24]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X9, X3              // Radio
    MOV X10, X4             // Grosor
    MOV X11, #0             // Cotador

    MOV X4, X5              // Color

    loop_borde_circulo:         // for (uint i = 0; i != grosor; i++)
        CMP X10, X11
        B.EQ end_borde_circulo

        SUB X3, X9, X11
        BL circulo_vacio        // pintar_circulo_vacio(x, y, radio - i, color)

        ADD X11, X11, #1
        B loop_borde_circulo
    end_borde_circulo:

    MOV X3, X9
    MOV X4, X10

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X9, [SP, #0]
	LDUR X10, [SP, #8]
	LDUR X11, [SP, #16]
	LDUR LR, [SP, #24]
	ADD SP, SP, #32
ret

.endif
