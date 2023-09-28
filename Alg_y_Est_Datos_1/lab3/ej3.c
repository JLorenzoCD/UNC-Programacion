// Comando de compilado y ejecucion:   gcc -Wall -Wextra -std=c99 ej3.c -o ej3.out && ./ej3.out
#include <stdio.h>
#include <stdbool.h>

void programa_a(void);
void programa_b(void);
void programa_c(void);

int main(void)
{
    programa_a();
    printf("\n\n");
    programa_b();
    printf("\n\n");
    programa_c();
}

void programa_a(void)
{
    printf("~~~~~~~~~~~~~~~~~~ Programa a ~~~~~~~~~~~~~~~~~~\n\n");

    int x;

    printf("############### Estado σ0 ###############\n");
    printf("-- Asignacion de variables\n");
    printf("Valor de x: \n");
    scanf("%i", &x);

    x = 5;

    printf("############### Estado σ1 ###############\n");
    printf("x: %i \n", x);
}

void programa_b(void)
{
    printf("~~~~~~~~~~~~~~~~~~ Programa b ~~~~~~~~~~~~~~~~~~\n\n");

    int x, y;

    printf("############### Estado σ0 ###############\n");
    printf("-- Asignacion de variables\n");
    printf("Valor de x: ");
    scanf("%i", &x);

    printf("Valor de y: ");
    scanf("%i", &y);

    x += y;

    printf("############### Estado σ1 ###############\n");
    printf("x: %i \n", x);
    printf("y: %i \n", y);

    y *= 2;

    printf("############### Estado σ2 ###############\n");
    printf("x: %i \n", x);
    printf("y: %i \n", y);
}

void programa_c(void)
{
    printf("~~~~~~~~~~~~~~~~~~ Programa c ~~~~~~~~~~~~~~~~~~\n\n");

    int x, y;

    printf("############### Estado σ0 ###############\n");
    printf("-- Asignacion de variables\n");
    printf("Valor de x: ");
    scanf("%i", &x);

    printf("Valor de y: ");
    scanf("%i", &y);

    y *= 2;

    printf("############### Estado σ1 ###############\n");
    printf("x: %i \n", x);
    printf("y: %i \n", y);

    x += y;

    printf("############### Estado σ2 ###############\n");
    printf("x: %i \n", x);
    printf("y: %i \n", y);
}