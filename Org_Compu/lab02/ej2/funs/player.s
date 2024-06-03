.ifndef jugador
.equ jugador, 0

.include "data.s"
.include "core/linea_recta_h.s"
.include "core/linea_recta_v.s"
.include "core/pintar_pixel.s"
.include "core/rectangulo.s"
.include "core/cuadrado.s"

// COLORES
.equ COLOR_PIEL, 0xFFCC99
.equ COLOR_CAMISETA, 0x20A4F7
.equ COLOR_PANTALON, 0x0C002A

/*
Fun: dibujar_jugador
Hace: Dibuja un jugador de fútbol argentino
Parametros: X0 -> Coordenada x inicial del jugador, X1 -> Coordenada y inicial del jugador
*/

.globl dibujar_jugador

dibujar_jugador:
    // Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
    SUB SP, SP, #48
    STUR X0, [SP, #0]
    STUR X1, [SP, #8]
    STUR X2, [SP, #16]
    STUR X3, [SP, #24]
    STUR X4, [SP, #32]
    STUR LR, [SP, #40]
    
    // Recupera las coordenadas iniciales
    LDUR X0, [SP, #0]  // x inicial
    LDUR X1, [SP, #8]  // y inicial
    
    // CABEZA
    MOV X2, X0         // x
    MOV X3, X1         // y
    MOV X4, #20        // Ancho cabeza
    MOV X5, #20        // Alto cabeza
    LDR X6, =COLOR_PIEL
    BL rectangulo

    // TORSO
    ADD X2, X0, #5     // x inicial + 5
    ADD X3, X1, #20    // y inicial + 20
    MOV X4, #10        // Ancho torso
    MOV X5, #20        // Alto torso
    LDR X6, =COLOR_CAMISETA
    BL rectangulo

    // BRAZO IZQ.
    SUB X2, X0, #5     // x inicial - 5
    ADD X3, X1, #20    // y inicial + 20
    MOV X4, #5         // Ancho brazo
    MOV X5, #10        // Alto brazo
    LDR X6, =COLOR_CAMISETA
    BL rectangulo

    // BRAZO DER.
    ADD X2, X0, #15    // x inicial + 15
    ADD X3, X1, #20    // y inicial + 20
    MOV X4, #5         // Ancho brazo
    MOV X5, #10        // Alto brazo
    LDR X6, =COLOR_CAMISETA
    BL rectangulo

    // PIERNA IZQ.
    ADD X2, X0, #5     // x inicial + 5
    ADD X3, X1, #40    // y inicial + 40
    MOV X4, #5         // Ancho pierna
    MOV X5, #10        // Alto pierna
    LDR X6, =COLOR_PANTALON
    BL rectangulo

    // PIERNA DER.
    ADD X2, X0, #10    // x inicial + 10
    ADD X3, X1, #40    // y inicial + 40
    MOV X4, #5         // Ancho pierna
    MOV X5, #10        // Alto pierna
    LDR X6, =COLOR_PANTALON
    BL rectangulo
    
    // POP
    LDUR X0, [SP, #0]       // Recupera X0
    LDUR X1, [SP, #8]       // Recupera X1
    LDUR X2, [SP, #16]      // Recupera X2
    LDUR X3, [SP, #24]      // Recupera X3
    LDUR X4, [SP, #32]      // Recupera X4
    LDUR LR, [SP, #40]      // Recupera LR
    ADD SP, SP, #48         // Restaura el stack
    RET

.endif

