.ifndef datos_s
.equ datos_s, 0

    // --------------------- CONFIGURACION BASICA ---------------------
    .equ SCREEN_WIDTH,   640
    .equ SCREEN_HEIGH,   480
    .equ BITS_PER_PIXEL, 32
    .equ BYTES_PER_PIXEL, 4
    .equ SCREEN_PIXELS, (SCREEN_WIDTH * SCREEN_HEIGH)
    .equ BYTES_FRAMEBUFFER, (SCREEN_PIXELS * BYTES_PER_PIXEL)

    .equ GPIO_BASE,    0x3f200000
    .equ GPIO_GPFSEL0, 0x00
    .equ GPIO_GPLEV0,  0x34

    .data
        FRAMEBUFFER_COPY: .skip BYTES_FRAMEBUFFER
    .text
    // --------------------- CONFIGURACION COLORES ---------------------
    // Colores basicos
    .equ BLANCO, 0xFFFFFF
    .equ NEGRO, 0x000000

    // Colores del cesped
    .equ COLOR_CESPED_CLARO, 0x64DA20
    .equ COLOR_CESPED_OSCURO, 0x52C112

    // Colores bandera Argentina
	.equ CELESTE, 0x74ACDF
	.equ AMARILLO, 0xF6B40E

    // Colores bandera francia
	.equ ROJO, 0xEF4135
	.equ AZUL, 0x0050A4
	
	// Colores Jugadores
	.equ PORTERO_FRA, 0xFFFE23
	.equ PORTERO_ARG, 0x00C581

.endif
