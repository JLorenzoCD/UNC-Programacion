// "CONSTANTES"
.equ SCREEN_WIDTH,   640
.equ SCREEN_HEIGH,   480
.equ BITS_PER_PIXEL, 32

.equ GPIO_BASE,    0x3f200000
.equ GPIO_GPFSEL0, 0x00
.equ GPIO_GPLEV0,  0x34

/*
Parámetros:
    X1 -> Posicion del pixel X
    X2 -> Posicion del pixel Y
    X3 -> Color
*/

pintar_pixel:
	// Reserva espacio en el stack y guarda la dir de retorno en el stack
	SUB SP, SP, #8
	STUR LR, [SP, #0]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    // Chequeamos que las coordenadas esten dentro de la pantalla, si no lo estan, no pintamos
    CMP X1, SCREEN_WIDTH
    b.ge skip_pintar_pixel					 	// 640 <= X1 => skip

    CMP X2, SCREEN_HEIGH
    b.ge skip_pintar_pixel						// 480 <= X2 => skip

    mov x3, X1                          // x3 -> Pixel X
    mov x4, X2                          // x4 -> Pixel Y

    BL calcular_pixel 					// Calculamos la direccion del pixel a pintar

    stur w10, [x0]                      // Pintamos el Pixel

    skip_pintar_pixel:



	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Carga la dirección de retorno y libera la memoria del stack
	LDUR LR, [SP, #0]
	ADD SP, SP, #8
ret
