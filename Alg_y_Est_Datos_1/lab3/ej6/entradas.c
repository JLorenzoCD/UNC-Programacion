// Comando de compilado y ejecucion:   gcc -Wall -Wextra -std=c99 entradas.c -o entradas.out && ./entradas.out
#include <stdio.h>

int pedirEntero(char name);
void imprimeEntero(char name, int x);

int main(void){
    int x;

    x = pedirEntero('n');

    imprimeEntero('n', x);

    return 0;
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