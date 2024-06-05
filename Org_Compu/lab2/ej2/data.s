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
        /*
        Arreglo que guarda el resultado de los 5 penales para los 2 equipos, el resultado del penal
        se encuentra en 3 posibles estados:
            #0 - No se pateo el penal              (Se pinta de blanco)
            #1 - Se pateo el penal y es gol        (Se pinta de verde)
            #2 - Se pateo el penal y no es gol     (Se pinta de rojo)

        Los primeros 5 son para Argentina y los siguientes 5 son para Francia

        EJ:
        (Resultado de los penales en el mundial - Arg [gol, gol, gol, gol, no se pateo] , Fra [gol, no gol, no gol, gol, no se pateo])
        */
        ARR_PENALES: ARR_PENALES: .dword 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        FRAMEBUFFER_COPY: .skip BYTES_FRAMEBUFFER
    .text
    // --------------------- CONFIGURACION COLORES ---------------------
    // Colores basicos
    .equ BLANCO, 0xFFFFFF
    .equ NEGRO, 0x000000
    .equ GRIS, 0xDADADA
    .equ METAL, 0xC0C0C0
    .equ PURPURA, 0x800080
    .equ MARRON, 0x800000

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
