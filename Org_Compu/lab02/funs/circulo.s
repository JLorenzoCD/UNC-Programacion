.ifndef circulo
.equ circulo, 0

.include "data.s"

.globl circulo

/*
    Fun: circulo
    Hace: Dado una coordenada (x, y) y un r, la funcion dibuja un circulo centrado en la coordenada dadas de radio r

    Parámetros:
        X1 -> Coordenada del pixel x
        X2 -> Coordenada del pixel y
        X3 -> Radio
        X4 -> Color
*/

circulo:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #8
	STUR LR, [SP, #0]

	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


    /*
    Maximo punto a la izquierda es  x - r
    Maximo punto a la derecha es    x + r

    Maximo punto superior es        y - r
    Maximo punto inferior es        y + r

    Tengo un cuadrado que comienza en la coordenada (x - r, y - r) y su ultimo punto es (x+r, y+r), entonces tengo que ver cuales pixeles dentro de este cuadrado estan dentro del circulo, para ello uso la formula del circulo.

    Si (x - x0)² + (y - y0)² <= r², entonces el pixel esta dentro del circulo

    Por lo tanto, debo recorrero con dos bucles todos los pixeles del cuadrado y checkear que este dentro de la formula, si lo esta pinto.
    */


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
ret

.endif
