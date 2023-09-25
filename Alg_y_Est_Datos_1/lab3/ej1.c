// Comando de compilado y ejecucion:   gcc -Wall -Wextra -std=c99 ej1.c -o ej1.out && ./ej1.out
#include <stdio.h>
#include <stdbool.h>

int main(void){
    int x, y, z;
    int e1, e2, e4;
    bool e3, e5;

    printf("Ingrese el valor de X: \n");
    scanf("%i", &x);
    printf("Ingrese el valor de Y: \n");
    scanf("%i", &y);
    printf("Ingrese el valor de Z: \n");
    scanf("%i", &z);

    e1 = x + y + 1;
    e2 = z * z + y * 45 - 15 * x;
    e3 = y - 2 == (x * 3 + 1) % 5;
    e4 = y / 2 * x;
    e5 = y < x * z;

    printf("El resultado de la expresion N°1 es: %i\n", e1);
    printf("El resultado de la expresion N°2 es: %i\n", e2);
    printf("El resultado de la expresion N°3 es: %s\n", e3 ? "True" : "False");
    printf("El resultado de la expresion N°4 es: %i\n", e4);
    printf("El resultado de la expresion N°5 es: %s\n", e5 ? "True" : "False");

    return 0;
}

/*
Ejecucion
-- a        =>      (x => 7, y => 3, z => 5)
El resultado de la expresion N°1 es: 11
El resultado de la expresion N°2 es: 55
El resultado de la expresion N°3 es: 0      (Bool => False)
El resultado de la expresion N°4 es: 7
El resultado de la expresion N°5 es: 1      (Bool => True)

-- b        =>      (x => 1, y => 10, z => 8)
El resultado de la expresion N°1 es: 12
El resultado de la expresion N°2 es: 499
El resultado de la expresion N°3 es: 0      (Bool => False)
El resultado de la expresion N°4 es: 5
El resultado de la expresion N°5 es: 0      (Bool => False)
 */