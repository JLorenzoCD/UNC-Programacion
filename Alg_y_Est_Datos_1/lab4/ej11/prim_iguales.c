# include <stdio.h>

void pedir_arreglo(int n_max, int a[]);
void imprimir_arreglo(int n_max, int a[]);

int prim_iguales(int tam, int a[]);

# define N 5
int main(void){
    int arr[N];

    pedir_arreglo(N, arr);
    imprimir_arreglo(N, arr);

    int primeros_iguales = prim_iguales(N, arr);
    printf("Primeros iguales: %i\n",primeros_iguales);
    imprimir_arreglo(primeros_iguales + 1, arr);

    return 0;
}

void pedir_arreglo(int n_max, int a[]){
    printf("\n############# Coloque los valores para 'arr' #############\n");
    for(int i = 0; i < n_max; i++){
        printf("Coloque el entero N°%i: ", i + 1);
        scanf("%d", &a[i]);
    }
}

void imprimir_arreglo(int n_max, int a[]){
    printf("\n");
    printf("arr = [");
    for(int i = 0; i < n_max; i++){
        printf("%d", a[i]);

        if(i + 1 < n_max){
            printf(", ");
        }
    }
    printf("]\n\n");
}

int prim_iguales(int tam, int a[]){
    int x = 0;

    for(int i = 0; i + 1 < tam && a[i] == a[i+1]; i++){
        x += 1;
    }

    return x;
}
