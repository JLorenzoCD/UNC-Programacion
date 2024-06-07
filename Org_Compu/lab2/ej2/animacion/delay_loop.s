.ifndef delay_loop
.equ delay_loop, 0

.include "data.s"
.include "core/delay.s"

.globl delay_loop

/*
Fun: delay_loop
Hace: genera mas delay [fun auxiliar p/suavizar animaciones]
Parametros: -
*/

delay_loop:
    // PUSH
    SUB SP, SP, #8
    STUR X0, [SP, #0]
    STUR LR, [SP, #8]

    // CICLO
    MOV X0, #10
    do_delay:
        CBZ X0, od_delay
        BL delay
        SUB X0, X0, #1
        B do_delay

    od_delay:

    // POP
    ldUR LR, [SP, #8]
    ldUR X0, [SP, #0]
    ADD SP, SP, #8
ret

.endif

