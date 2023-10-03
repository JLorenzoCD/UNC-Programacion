// Comando de compilado y ejecucion:   gcc -Wall -Wextra -std=c99 ej4.c -o ej4.out && ./ej4.out
#include <stdio.h>
#include <stdbool.h>

void apartado_a(void);
void apartado_b(void);

int main(void)
{
    apartado_a();
    printf("\n\n");
    apartado_b();
}

void apartado_a(void)
{
    printf("~~~~~~~~~~~~~~~~~~ Apartado a ~~~~~~~~~~~~~~~~~~\n\n");
    int x, y;

    printf("############### Estado σ0 ###############\n");
    printf("-- Asignacion de variables\n");
    printf("Valor de x: ");
    scanf("%i", &x);

    printf("Valor de y: ");
    scanf("%i", &y);

    if(x >= y){
        printf("Modificacion por: x >= y\n");
        x = 0;
    }else{
        printf("Modificacion por: x < y\n");
        x = 2;
    }

    printf("############### Estado σ2 ###############\n");
    printf("x: %i \n", x);
    printf("y: %i \n", y);

}

void apartado_b(void)
{
    printf("~~~~~~~~~~~~~~~~~~ Apartado b ~~~~~~~~~~~~~~~~~~\n\n");
    int x, y, z, m;

    printf("############### Estado σ0 ###############\n");
    printf("-- Asignacion de variables\n");
    printf("Valor de x: ");
    scanf("%i", &x);

    printf("Valor de y: ");
    scanf("%i", &y);

    printf("Valor de z: ");
    scanf("%i", &z);

    printf("Valor de m: ");
    scanf("%i", &m);

    if (x < y){
        printf("Modificacion por: x < y\n");
        m = x;
    }else {
        printf("Modificacion por: x >= y\n");
        m = y;
    }

    printf("############### Estado σ1 ###############\n");
    printf("x: %i \n", x);
    printf("y: %i \n", y);
    printf("z: %i \n", z);
    printf("m: %i \n", m);

    if (m < z){
        printf("Modificacion por: m < z\n");
    }else{
        printf("Modificacion por: m >= z\n");
        m = z;
    }

    printf("############### Estado σ2 ###############\n");
    printf("x: %i \n", x);
    printf("y: %i \n", y);
    printf("z: %i \n", z);
    printf("m: %i \n", m);
}

/*
Ejecucion del ejercicio
-- a
Ejecucion 1         |[σ0 : (x => 1,   y => 2)]|   =>   |[σ : (x => 2,   y => 2)]|
Ejecucion 2         |[σ0 : (x => 15,  y => 7)]|   =>   |[σ : (x => 0,   y => 7)]|

-- b
Ejecucion 1         |[σ0 : (x => 5,   y => 4,  z => 8,  m => 0)]|   =>   |[σ0 : (x => 5,   y => 4,  z => 8,  m => 4)]|
Ejecucion 2         |[σ0 : (x => 1,   y => 2,  z => 3,  m => 4)]|   =>   |[σ0 : (x => 1,   y => 2,  z => 3,  m => 1)]|
Ejecucion 3         |[σ0 : (x => 4,   y => 3,  z => 2,  m => 1)]|   =>   |[σ0 : (x => 4,   y => 3,  z => 2,  m => 2)]|
*/