# include <stdio.h>
# include <limits.h>
# include <stdbool.h>

void pedir_arreglo(int n_max, int a[]);
void imprimir_arreglo(int n_max, int a[]);

bool elem_en_arreglo(int tam, int a[], int elem);

int minimo_pares(int tam, int a[]);
int minimo_impares(int tam, int a[]);

# define N 5
int main(void){
    int arr[N];

    pedir_arreglo(N, arr);

    imprimir_arreglo(N, arr);

    int min_par = minimo_pares(N, arr);
    int min_impar = minimo_impares(N, arr);

    if(min_par != INT_MAX){
        printf("El minimo par del arreglo es: %i\n", min_par);
    }

    // La validacion de elem_en_arreglo se realiza debido a que INT_MAX es impar (2147483647)
    if(min_impar != INT_MAX || elem_en_arreglo(N, arr, INT_MAX)){
        printf("El minimo impar del arreglo es: %i\n", min_impar);
    }

    printf("El elemento minimo del array es: %i\n", min_par < min_impar ? min_par : min_impar);

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

int minimo_pares(int tam, int a[]){
    int min_par = INT_MAX;

    for(int i = 0; i < tam; i++){
        if(a[i] % 2 == 0 && a[i] < min_par){
            min_par = a[i];
        }
    }

    return min_par;
}

int minimo_impares(int tam, int a[]){
    int min_impar = INT_MAX;

    for(int i = 0; i < tam; i++){
        if(a[i] % 2 == 1 && a[i] < min_impar){
            min_impar = a[i];
        }
    }

    return min_impar;
}

bool elem_en_arreglo(int tam, int a[], int elem){
    bool esta = false;

    for(int i = 0; i < tam && !esta; i++){
        esta = elem == a[i];
    }

    return esta;
}
