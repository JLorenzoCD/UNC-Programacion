# include <stdio.h>
# include <assert.h>

int pedir_entero(char name);
int min(int x, int y);

int main(void){
    int x = pedir_entero('x');
    int y = pedir_entero('y');

    int minimo = min(x, y);

    assert( minimo <= x);
    assert( minimo <= y);

    printf("x = %i \ny = %i \n", x, y);
    printf("El minimo es: %i\n", minimo);

    return 0;
}

int pedir_entero(char name){
    int x;

    printf("Asignar valor de %c: ", name);
    scanf("%i", &x);

    return x;
}

int min(int x, int y){
    if(x < y){
        return x;
    }

    return y;
}