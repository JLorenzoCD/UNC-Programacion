# include <stdio.h>
# include <assert.h>

int pedir_entero(char name);
int suma_hasta(int n);

int main(void) {
    int n = pedir_entero('n');

    if (n < 0){
        printf("Error: n tiene que ser un numero natural\n");
    }else{
        int sum = suma_hasta(n);
        printf("La suma de los primeros naturales hasta %i es %i\n", n, sum);
    }

    return 0;
}

int suma_hasta(int n){
    int sum = n*(n + 1)/2;
    return sum;
}

int pedir_entero(char name){
    int x;

    printf("Asignar valor de %c: ", name);
    scanf("%i", &x);

    return x;
}