# include <stdio.h>
# include <limits.h>

typedef struct {
float maximo;
float minimo;
float promedio;
} datos_t;

void pedir_arreglo(int n_max, float a[]);
void imprimir_arreglo(int n_max, float a[]);

datos_t stats(int tam, float a[]);

# define N 5
int main(void){
    float arr[N];

    pedir_arreglo(N, arr);
    imprimir_arreglo(N, arr);

    datos_t dato = stats(N, arr);

    printf("\nPromedio: %f\nMinimo: %f\nMaximo: %f\n", dato.promedio, dato.minimo, dato.maximo);

    return 0;
}

void pedir_arreglo(int tam, float a[]){
    printf("\n############# Coloque los valores para 'arr' #############\n");
    for(int i = 0; i < tam; i++){
        printf("Coloque el decimal N°%i: ", i + 1);
        scanf("%f", &a[i]);
    }
}

void imprimir_arreglo(int tam, float a[]){
    printf("\n");
    printf("arr = [");
    for(int i = 0; i < tam; i++){
        printf("%f", a[i]);

        if(i + 1 < tam){
            printf(", ");
        }
    }
    printf("]\n\n");
}

datos_t stats(int tam, float a[]){
    datos_t datos;
    datos.minimo = a[0];
    datos.maximo = a[0];

    float sum = 0;

    for(int i = 0; i < tam; i++){
        sum += a[i];
        if(a[i] < datos.minimo){
            datos.minimo = a[i];
        }else if (datos.maximo < a[i]){
            datos.maximo = a[i];
        }
    }

    datos.promedio = sum / tam;

    return datos;
}