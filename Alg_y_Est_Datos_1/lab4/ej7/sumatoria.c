# include <stdio.h>

void pedir_arreglo(int n_max, int a[]);
void imprimir_arreglo(int n_max, int a[]);
int sumatoria(int tam, int a[]);

# define N 5
int main(void){
    int arr[N];

    pedir_arreglo(N, arr);

    int sum = sumatoria(N, arr);

    imprimir_arreglo(N, arr);

    printf("La sumatoria de 'arr' es %d\n", sum);

    return 0;
}

void pedir_arreglo(int n_max, int a[]){
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

int sumatoria(int tam, int a[]){
    int sum = 0;

    for(int i = 0; i < tam; i++){
        sum += a[i];
    }

    return sum;
}
