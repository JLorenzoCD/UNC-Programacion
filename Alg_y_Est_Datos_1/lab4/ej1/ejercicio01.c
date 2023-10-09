# include <stdio.h>
# include <assert.h>

void hola_hasta(int n);
int pedir_entero(char name);

int main(void){
    int n = pedir_entero('n');

    hola_hasta(n);

    return 0;
}

int pedir_entero(char name){
    int x;

    printf("Asignar valor de %c: ", name);
    scanf("%i", &x);

    return x;
}

void hola_hasta(int n){
    assert(n > 0);

    int i = 0;

    while (i < n)
    {
        printf("hola\n");
        i++;
    }

}


