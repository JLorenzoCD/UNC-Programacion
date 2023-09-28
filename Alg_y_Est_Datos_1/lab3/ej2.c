// Comando de compilado y ejecucion:   gcc -Wall -Wextra -std=c99 ej2.c -o ej2.out && ./ej2.out
#include <stdio.h>
#include <stdbool.h>

int main(void){
    // Variables
    int x, y, z;
    bool b, w;

    // Expresiones
    bool e1, e2, e3;

    // Variable auxiliar para x,y,z
    int a = 1; // Cumple para cualquier valor de a

    // Asignacion
    x = 4*a;
    y = -x;
    z = 8*a;
    b = false;
    w = false;
    /*
    -- Otras posibles convinaciones
    b = true;
    w = false;

    b = true;
    w = true;
    */

    e1 = x % 4 == 0;
    e2 = x + y == 0 && y - x == (-1) * z;
    e3 = !b && w;


    printf("El resultado de la expresion N°1 es: %s\n", e1 ? "True" : "False");
    printf("El resultado de la expresion N°2 es: %s\n", e2 ? "True" : "False");
    printf("El resultado de la expresion N°3 es: %s\n", e3 ? "True" : "False");

    return 0;
}