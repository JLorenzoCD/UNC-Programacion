.ifndef animacion_globo
.equ animacion_globo, 0

.include "funs/globo.s"
.include "core/delay.s"

.globl animacion_globo

/*
Fun: animacion_globo
Hace: simula la caida de un globo, desplazandoce a der.
Parametros: -
*/

animacion_globo:
    SUB SP, SP, #32
    STUR X1, [SP, #0]   
    STUR X2, [SP, #8]   
    STUR X3, [SP, #16]  
    STUR X5, [SP, #24]  

    MOV X5, #0

loop_globo:

    // GLOBO <-- [pos. actual]
    BL estadio
    BL globo

    // VISUALIZACION
    BL delay

    // ACTUALIZAR <-- [coordenadas del globo]
    ADD X1, X1, #1
    SUB X2, X2, #1

    // VERIFICACION; [si el globo ha llegado al límite inf. de la pantalla]
    CMP X2, #0
    B.GT loop_globo 

end_loop_globo:
    // Restaurar registros
    LDUR X1, [SP, #0]   
    LDUR X2, [SP, #8]  
    LDUR X3, [SP, #16]  
    LDUR X5, [SP, #24]
    ADD SP, SP, #32

ret

.endif
