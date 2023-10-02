// Comando de compilado y ejecucion:   gcc -Wall -Wextra -std=c99 ej5.c -o ej5.out && ./ej5.out
#include <stdio.h>
#include <stdbool.h>

void apartado_a(void);

void apartado_b(void);
void punto_1(void);
void punto_2(void);

int main(void)
{
    // printf("-------------------- Apartado A --------------------\n");
    // apartado_a();

    printf("\n\n-------------------- Apartado B --------------------\n");
    apartado_b();

    return 0;
}

void apartado_a(void){
    int i;

    printf("############### Estado σ0 ###############\n");
    printf("-- Asignacion de variables\n");
    printf("Valor de i: ");
    scanf("%i", &i);

    while (i != 0)
    {
        printf("Valor de i previo a la resta: %i\n", i);
        i -= 1;
        printf("Valor de i posterior a la resta: %i\n\n", i);
    }
    
    printf("Termina el programa con i = %i\n", i);
}


void apartado_b(void){
    // printf("========= Punto 1 =========\n");
    // punto_1();
    printf("\n\n========= Punto 2 =========\n");
    punto_2();
}

void punto_1(void){
    int x, y, i;

    printf("############### Estado σ0 ###############\n");
    printf("-- Asignacion de variables\n");
    printf("Valor de x: ");
    scanf("%i", &x);

    printf("Valor de y: ");
    scanf("%i", &y);

    i = 0;
    while (x >= y)
    {
        printf("Iteracion Nª %d\n", i + 1);
        printf("Previo a las operaciones: x = %d, y = %d, i = %d\n", x, y, i);
        x -= y;
        i += 1;
        printf("Posteriores a las operaciones: x = %d, y = %d, i = %d\n\n", x, y, i);

    }
}

void punto_2(void){
    int x, i;
    bool res;

    printf("############### Estado σ0 ###############\n");
    printf("-- Asignacion de variables\n");
    printf("Valor de x: ");
    scanf("%i", &x);

    res = true;
    i = 2;
    while (i < x && res){
        printf("\nIteracion Nª %d\n", i - 1);
        printf("Previo a las operaciones: x = %d, res = %s, i = %d\n", x, res ? "True": "False", i);

        res = res && (x % i != 0);

        printf("Posteriores a las operaciones: x = %d, res = %s, i = %d\n", x, res ? "True": "False", i);
        i += 1;
    }
}