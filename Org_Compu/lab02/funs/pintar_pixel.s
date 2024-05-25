// "CONSTANTES"
.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480
.equ BITS_PER_PIXEL, 32

/*
Fun: pintar_pixel
Hace: Dado una coordenada (x, y) de una matriz de pixeles y color, pinta dicho pixel

Parámetros:
    X1 -> Posición del pixel X
    X2 -> Posición del pixel Y
    X3 -> Color
*/

pintar_pixel:
	// Reserva espacio en el stack y guarda la dir de retorno en el stack
	SUB SP, SP, #8
	STUR LR, [SP, #0]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    // Chequeamos que las coordenadas estén dentro de la pantalla, si no lo están, no pintamos
    CMP X1, SCREEN_WIDTH
    B.GE skip_pintar_pixel					 	// 640 <= X1 entonces skip

    CMP X2, SCREEN_HEIGH
    B.GE skip_pintar_pixel						// 480 <= X2 entonces skip

    MOV x3, X1                          // x3 -> Pixel X
    MOV x4, X2                          // x4 -> Pixel Y

    BL calcular_pixel 					// Calculamos la dirección del pixel a pintar

    STUR w10, [x0]                      // Pintamos el Pixel

    skip_pintar_pixel:



	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Carga la dirección de retorno y libera la memoria del stack
	LDUR LR, [SP, #0]
	ADD SP, SP, #8
ret
