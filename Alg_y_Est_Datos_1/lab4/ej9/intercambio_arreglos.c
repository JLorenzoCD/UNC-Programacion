# include <stdio.h>
# include <assert.h>

int pedir_entero(char name);
void pedir_arreglo(int n_max, int a[]);
void imprimir_arreglo(int n_max, int a[]);
void intercambiar(int tam, int a[], int i, int j);

# define N 5
int main(void){
    int arr[N];

    pedir_arreglo(N, arr);

    imprimir_arreglo(N, arr);

    printf("Ingrese las posiciones i, j en los cuales los elementos de van a intercambiar: \n");
    int i = pedir_entero('i');
    int j = pedir_entero('j');

    if(0 <= i && i < N  && 0 <= j && j <N){
        intercambiar(N, arr, i, j);

        imprimir_arreglo(N, arr);
    }else{
        printf("Error: Los valores i y/o j no se encuentran dentro del rango 0 <= i,j < %i. (i=%i, j=%i)\n", N, i, j);
    }

    return 0;
}

int pedir_entero(char name){
    int x;

    printf("Asignar valor de %c: ", name);
    scanf("%i", &x);

    return x;
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

void intercambiar(int tam, int a[], int i, int j){
    assert(0 <= i && i < tam);
    assert(0 <= j && j <tam);
    int aux = a[i];

    a[i] = a[j];
    a[j] = aux;
}
