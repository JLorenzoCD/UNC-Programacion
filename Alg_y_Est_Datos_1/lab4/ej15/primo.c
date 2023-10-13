# include <stdio.h>
# include <stdbool.h>

bool es_primo(int n);
int nesimo_primo(int n);

int main(void){
    int x;

    do
    {
        printf("Ingrese un entero positivo: ");
        scanf("%i", &x);
    } while (x < 0);

    if( x < 0){
        printf("Error: Se esperaba un entero positivo\n");
    }else{
        int primo = nesimo_primo(x);

        printf("El primo N° %d es: %i\n", x, primo);
    }

    return 0;
}

bool es_primo(int n){
    bool lo_es = true;
    int aux = 2;

    while (aux < n && lo_es)
    {
        lo_es = n % aux != 0;
        aux += 1;
    }

    return lo_es;
}

int nesimo_primo(int n){
    int contador = 0;

    int x = 2;

    while (contador <= n)
    {
        if(es_primo(x)){
            contador += 1;
        }

        x += 1;
    }

    x -= 1;

    return x;
}

