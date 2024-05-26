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


    void circle(int x, int y, int r, int color) {
        // Parte de arriba
        int currXi = x - r;
        int currYi = y;
        int currR = r;

        while (y - r <= currYi) {
            currXi = calcular_nuevo_xi(x, y, r, currXi, currYi);
            currR = x - currXi;
            linea_recta_horizontal(currXi, currYi, x + currR, color);

            currYi--;
        }

        // Parte de abajo
        currXi = x - r;
        currYi = y + 1u;
        currR = r;

        while (currYi <= y + r) {
            currXi = calcular_nuevo_xi(x, y, r, currXi, currYi);
            currR = x - currXi;
            linea_recta_horizontal(currXi, currYi, x + currR, color);

            currYi++;
        }
    }


    int calcular_nuevo_xi(int x, int y, int r, int xi, int yi) {
        int new_curr_xi = xi;

        while (!cumple_ecuacion(x, y, r, new_curr_xi, yi)) {
            new_curr_xi--;
        }

        return new_curr_xi;
    }


    bool cumple_ecuacion(int x, int  y, int r, int xi, int yi) {
        int temp1 = (x - xi) * (x - xi);
        int temp2 = (y - yi) * (y - yi);

        return (temp1 + temp2) <= r * r;
    }
    */


	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
ret

.endif
