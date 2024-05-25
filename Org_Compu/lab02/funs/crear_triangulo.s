.ifndef crear_triangulo
.equ crear_triangulo, 0

.include "data.s"

/*
fun: crear_triangulo
hace: Crea un triangulo usando 3 puntos como parámetro y lo rellena.

Parámetros:
    X1 -> Posición del inicio de la base
    X2 -> Posición del final de la base
    X3 ->
    x3 -> Posición de la altura del triangulo
    w10 -> Color
*/

.globl crear_triangulo
crear_triangulo:
	SUB SP, SP, #32
	STUR LR, [SP, #32]
	STUR X3, [SP, #24]
	STUR X2, [SP, #16]
    STUR X1, [SP, #0]

    BL dib_linea_h


	LDR X1, [SP, #0]
	LDR X2, [SP, #8]
    LDR X3, [SP, #16]
	LDR LR, [SP, #32]
	ADD SP, SP, #32
ret

.endif
