# include <stdio.h>
# include <assert.h>

int pedir_entero(char name);
int abs(int x);

int main(void){
    int x = pedir_entero('x');

    x = abs(x);

    assert( x > 0);

    printf("x = %i\n", x);

    return 0;
}

int pedir_entero(char name){
    int x;

    printf("Asignar valor de %c: ", name);
    scanf("%i", &x);

    return x;
}

int abs(int x){
    if(x < 0){
        return (-1) *x;
    }

    return x;
}