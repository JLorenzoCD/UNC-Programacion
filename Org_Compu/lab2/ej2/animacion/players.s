.ifndef players
.equ players, 0

.include "data.s"
.include "core/circulo.s"   
.include "core/circulo_vacio.s"

.globl players

/*
    Fun: jugadores
    Hace: dibuja los jugadores en la cancha 

    Parametros:
        X1 -> Coordenada eje X
        X2 -> Coordenada eje Y
        X3 -> Color 
*/
players:
    SUB SP, SP, #24
    STUR LR, [SP, #0]
    STUR X3, [SP, #8]
    STUR X4, [SP, #16]


    MOV X4, X3
    MOV X3, #7
    BL circulo
	LDR X4, =NEGRO
    BL circulo_vacio


    LDUR LR, [SP, #0]
    LDUR X3, [SP, #8]
    LDUR X4, [SP, #16]
    ADD SP, SP, #24
ret

.endif
