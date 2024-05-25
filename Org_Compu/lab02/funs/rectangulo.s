// "CONSTANTES"
.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480



/*
Fun: rectangulo
Hace: Dada dos coordenada (x1, y1) y (x2, y2), pinta un rectángulo que comienza en la coordenada (x1, y1) y finaliza en (x2, y2)

Parámetros:
    X1 -> Posición del pixel x1
    X2 -> Posición del pixel y1
    X3 -> Posición del pixel x2
    X4 -> Posición del pixel y2
    X5 -> Color
*/

rectangulo:
	// Reserva espacio en el stack y guarda la dir de retorno en el stack
	SUB SP, SP, #8
	STUR LR, [SP, #0]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



	/*
	Variables auxiliares:
	X9 = coordenada x1
	X10 = coordenada y1
	X11 = coordenada x2
	X12 = coordenada y2

	*/
	MOV X9, X1
	MOV X10, X2
	MOV X11, X3
	MOV X12, X4

	rectangulo_loop:
		// Si y1 <= y2 entonces continuo, si y2 < y1 corto el bucle
		CMP X10, X12
		B.HI rectangulo_end

		/*
		Parámetros de linea_recta_horizontal
		X1 = coordenada x1		=>		x1
		X2 = coordenada y1		=>		y1
		X3 = coordenada x2		=>		x2
		X4 = coordenada y2		=>		y1
		X5 = color
		*/
		MOV X1, X9
		MOV X2, X10
		MOV X3, X11
		MOV X4, X10

		BL linea_recta_horizontal

		// Muevo el y1 para la linea recta en la siguiente fila de la matriz de pixeles
		ADD X10, X10, #4

		B rectangulo_loop
	rectangulo_end:



	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Carga la dirección de retorno y libera la memoria del stack
	LDUR LR, [SP, #0]
	ADD SP, SP, #8
ret
