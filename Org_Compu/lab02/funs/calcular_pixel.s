.equ SCREEN_WIDTH, 	640
.equ SCREEN_HEIGH, 	480

/*
Parametros:
    X1 -> pixel x
    X2 -> pixel y

Asignacion:
    X0 -> posicion pixel en memoria(&A[y][x])
*/

calcular_pixel:
	// Reserva espacio en el stack y guarda la dir de retorno en el stack
    SUB SP, SP, #8
    STUR LR, [SP, #0]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    // (Se calcula la fila)     ==      640 * y                         == &A[y]
    MOV X0, SCREEN_WIDTH
    MULL X0, X0, x2

    // (Se calcula la posicion del pixel)   ==  ((640 * y) + x) * 4     ==      &A[y][x]
    ADD X0, X0, x1
    LSL X0, X0, #2

    // (Se coloca la direccion de memoria del pixel en X0)              ==      X0 = &A[y][x]
    MOV X0, x20



	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    // Carga la direccion de retorno y libera la memoria del stack
    LDUR LR, [SP, #0]
    ADD SP, SP, #8
ret