.ifndef delay
.equ delay, 0

.include "data.s"

.globl delay
delay:
    SUB SP, SP, #24
    STUR X8, [SP, #0]
    STUR X9, [SP, #8]
    STUR LR, [SP, #16]

    // * 2^~10 (slow = 1s) // * 2^~9 (medium = ~0,3s)
	MOV X8, 0xFFF
    LSL X8, X8, #8

    delayloop:
        CBZ X8, delayEnd

        LDUR X9, [SP, #0]
        STUR X9, [SP, #0]
        SUB X8, X8, #1

        B delayloop

    delayEnd:

    LDUR X8, [SP, #0]
    LDUR X9, [SP, #8]
    LDUR LR, [SP, #16]
    ADD SP, SP, #24
ret

.globl fast_delay
fast_delay:
    SUB SP, SP, #24
    STUR X8, [SP, #0]
    STUR X9, [SP, #8]
    STUR LR, [SP, #16]

    // * 2^~10 (slow = 1s) // * 2^~9 (medium = ~0,3s)
	MOV X8, 0xFFF
    LSL X8, X8, #8

    fast_delay_loop:
        CBZ X8, fast_delay_end

        LDUR X9, [sp, #0]
        STUR X9, [sp, #0]

        SUB X8, X8, #1
        B fast_delay_loop
    fast_delay_end:

    LDUR X8, [SP, #0]
    LDUR X9, [SP, #8]
    LDUR LR, [SP, #16]
    ADD SP, SP, #24
ret

.globl delay_transicion
delay_transicion:
    SUB SP, SP, #24
    STUR X8, [SP, #0]
    STUR X9, [SP, #8]
    STUR LR, [SP, #16]

    // * 2^~10 (slow = 1s) // * 2^~9 (medium = ~0,3s)
	MOV X8, 0xFF
    LSL X8, X8, #0

    loop_td:
        CBZ X8, end_td

        LDUR X9, [sp, #0]
        STUR X9, [sp, #0]

        SUB X8, X8, #1
        B loop_td
    end_td:

    LDUR X8, [SP, #0]
    LDUR X9, [SP, #8]
    LDUR LR, [SP, #16]
    ADD SP, SP, #24
ret

.globl delay_lento
delay_lento:
    SUB SP, SP, #24
    STUR X8, [SP, #0]
    STUR X9, [SP, #8]
    STUR LR, [SP, #16]

    // * 2^~10 (slow = 1s) // * 2^~9 (medium = ~0,3s)
	MOV X8, 0xFFF
    LSL X8, X8, #15

    loop_lt:
        CBZ X8, end_lt

        LDUR X9, [sp, #0]
        STUR X9, [sp, #0]

        SUB X8, X8, #1
        B loop_lt
    end_lt:

    LDUR X8, [SP, #0]
    LDUR X9, [SP, #8]
    LDUR LR, [SP, #16]
    ADD SP, SP, #24
ret

.globl delay_revote_pelota
delay_revote_pelota:
    SUB SP, SP, #24
    STUR X8, [SP, #0]
    STUR X9, [SP, #8]
    STUR LR, [SP, #16]

    // * 2^~10 (slow = 1s) // * 2^~9 (medium = ~0,3s)
	MOV X8, 0xFFF
    LSL X8, X8, #12

    loop_drp:
        CBZ X8, end_drp

        LDUR X9, [sp, #0]
        STUR X9, [sp, #0]

        SUB X8, X8, #1
        B loop_drp
    end_drp:

    LDUR X8, [SP, #0]
    LDUR X9, [SP, #8]
    LDUR LR, [SP, #16]
    ADD SP, SP, #24
ret

.endif
