// Comando de compilado y ejecucion:   gcc -Wall -Wextra -std=c99 saludos.c -o saludos.out && ./saludos.out
#include <stdio.h>

void imprimeHola(void);
void imprimeChau(void);

int main(void){
    imprimeHola();
    imprimeHola();
    imprimeChau();
    imprimeChau();

    return 0;
}

void imprimeHola(){
    printf("hola\n");
}

void imprimeChau(){
    printf("chau\n");
}