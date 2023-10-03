// Comando de compilado y ejecucion:   gcc -Wall -Wextra -std=c99 apartado_c.c -o apartado_c.out && ./apartado_c.out
#include <stdio.h>

int pedirEntero(char name);
void imprimeEntero(char name, int x);
void imprimeEstado(int estado_numero ,int x, int y, int z, int m);

int main(void){
    int x, y, z, m;

    printf("############### Estado σ0 ###############\n");
    printf("-- Asignacion de variables\n");

    x = pedirEntero('x');
    y = pedirEntero('y');
    z = pedirEntero('z');
    m = pedirEntero('m');

    if (x < y){
        printf("Modificacion por: x < y\n");
        m = x;
    }else {
        printf("Modificacion por: x >= y\n");
        m = y;
    }

    imprimeEstado(1, x, y, z, m);

    if (m < z){
        printf("Modificacion por: m < z\n");
    }else{
        printf("Modificacion por: m >= z\n");
        m = z;
    }

    imprimeEstado(2, x, y, z, m);

}

int pedirEntero(char name){
    int x;

    printf("Digite un numero entero para %c: ", name);
    scanf("%d", &x);

    return x;
}

void imprimeEntero(char name, int x){
    printf("%c = %i\n", name, x);
}

void imprimeEstado(int estado_numero ,int x, int y, int z, int m){
    printf("############### Estado σ%i ###############\n", estado_numero);
    imprimeEntero('x', x);
    imprimeEntero('y', y);
    imprimeEntero('z', z);
    imprimeEntero('m', m);
}

/*
¿Qué ventajas encontras en esta nueva versión?.
El codigo se lee mas facil y se escribe menos.

¿Podrı́as escribir alguna otra función en ese ejercicio, cual?.
Podria crer una funcion que me imprema los estados de las variables en el programa. (imprimeEstado)

¿En qué otros ejercicios de ese Proyecto lo podrı́as utilizar?.
Las funciones pedirEntero e imprimeEntero las podria utilizar en casi todos los ejercicios.
 */