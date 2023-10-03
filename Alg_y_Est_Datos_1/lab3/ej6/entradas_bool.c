// Comando de compilado y ejecucion:   gcc -Wall -Wextra -std=c99 entradas_bool.c -o entradas_bool.out && ./entradas_bool.out
#include <stdio.h>
#include <stdbool.h>

bool pedirBooleano(char name);
void imprimeBooleano(char name, bool x);

int main(void){
    bool x;

    x = pedirBooleano('p');

    imprimeBooleano('p', x);

    return 0;
}

bool pedirBooleano(char name){
    bool x;
    int temp;

    printf("Digite un numero entero (el cual sera convertido a Booleano) para %c: ", name);
    scanf("%d", &temp);

    x = temp;

    return x;
}

void imprimeBooleano(char name, bool x){
    printf("%c = %s\n", name, x ? "verdadero" : "falso");
}