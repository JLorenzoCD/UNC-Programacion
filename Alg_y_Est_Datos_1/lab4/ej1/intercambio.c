# include <stdio.h>
# include <assert.h>

int pedir_entero(char name);

int main(void){
    int x = pedir_entero('x');
    int y = pedir_entero('y');

    int aux = x;

    assert(aux == x);

    x = y;
    y = aux;

    assert(aux == y);

    return 0;
}

int pedir_entero(char name){
    int x;

    printf("Asignar valor de %c: ", name);
    scanf("%i", &x);

    return x;
}