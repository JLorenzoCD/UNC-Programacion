# include <stdio.h>

typedef struct {
    int menores;
    int iguales;
    int mayores;
} comp_t;

int pedir_entero(char name);

void pedir_arreglo(int n_max, int a[]);
void imprimir_arreglo(int n_max, int a[]);

comp_t cuantos(int tam, int a[], int elem);

# define N 5
int main(void){
    int arr[N];

    pedir_arreglo(N, arr);
    imprimir_arreglo(N, arr);

    int elem;
    printf("Coloque el numero entero a comparar con los elemntos del array dado: ");
    scanf("%i", &elem);

    comp_t cuant = cuantos(N, arr, elem);

    printf("\nN° Menores: %i\nN° Iguales: %i\nN° Mayores: %i\n", cuant.menores, cuant.iguales, cuant.mayores);

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

comp_t cuantos(int tam, int a[], int elem){
    comp_t cuant = { .menores = 0, .iguales = 0, .mayores = 0};

    for(int i = 0; i < tam; i++){
        if(a[i] < elem){
            cuant.menores += 1;
        }else if (elem == a[i]){
            cuant.iguales += 1;
        }else{
            cuant.mayores += 1;
        }
    }

    return cuant;
}