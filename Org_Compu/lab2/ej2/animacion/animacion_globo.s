.ifndef animacion_globo
.equ animacion_globo, 0

.include "data.s"

.include "core/delay.s"
.include "core/repintar/repintar.s"

.include "funs/globo.s"
.include "funs/estadio.s"

.include "animacion/delay_loop.s"

.globl animacion_globo

/*
    Fun: animacion_globo
    Hace: simula la caida de un globo, de fondo la imagen de un estadio
    Parametros: (xi, xi)  [pos. Inicial del globo]
*/

animacion_globo:
    // PUSH
    SUB SP, SP, #32
    STUR X1, [SP, #0]
    STUR X2, [SP, #8]
    STUR X3, [SP, #16]
    STUR LR, [SP, #24]

    // GLOBO [posicion (xi,yi)]
    MOV X1, #111
    MOV X2, #420

    MOV X3, XZR

    // ANIMACION
    loop_caida:
        CMP X2, X3
        B.EQ fin_animacion

        BL repintar_pantalla_completa
        BL globo
        BL delay_loop

        // CAIDA [simula un efecto desplazamiento para la der.]
        SUB X2, X2, #4
        ADD X1, X1, #5
        B loop_caida

    fin_animacion:

    BL repintar_pantalla_completa

    // POP
    LDUR X1, [SP, #0]
    LDUR X2, [SP, #8]
    LDUR X3, [SP, #16]
    LDUR LR, [SP, #24]
    ADD SP, SP, #32
ret

.endif
