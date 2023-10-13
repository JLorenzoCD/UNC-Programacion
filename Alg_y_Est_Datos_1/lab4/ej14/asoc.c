# include <stdio.h>
# include <stdbool.h>

typedef char clave_t;
typedef int valor_t;

typedef struct {
    clave_t clave;
    valor_t valor;
} asoc;

void pedir_arreglo_asoc(int n_max, asoc a[]);
void imprimir_arreglo(int n_max, asoc a[]);

bool asoc_existe(int tam, asoc a[], clave_t c);

# define N 5
int main(void){
    asoc arr[N];

    pedir_arreglo_asoc(N, arr);
    imprimir_arreglo(N, arr);

    char c;
    printf("Ingrese la clave a buscar: ");
    scanf(" %c", &c);

    bool existe = asoc_existe(N, arr, c);

    printf("LA CLAVE %sEXISTE EN EL ARREGLO\n", existe ? "" : "NO ");

    return 0;
}

void pedir_arreglo_asoc(int n_max, asoc a[]){
    printf("\n############# Coloque los valores para 'arr' #############\n");

    for(int i = 0; i < n_max; i++){
        printf("-- Elemnto N°%i --\n", i + 1);
        printf("Ingrese la clave: ");
        scanf(" %c", &a[i].clave);

        printf("Ingrese el valor: ");
        scanf("%d", &a[i].valor);

        printf("\n");
    }
}

void imprimir_arreglo(int n_max, asoc a[]){
    printf("\n");
    printf("arr = [");
    for(int i = 0; i < n_max; i++){
        printf("{ %c :", a[i].clave);
        printf(" %d }", a[i].valor);

        if(i + 1 < n_max){
            printf(", ");
        }
    }
    printf("]\n\n");
}

bool asoc_existe(int tam, asoc a[], clave_t c){
    bool existe = false;

    for(int i = 0; i < tam && !existe; i++){
        existe = a[i].clave == c;
    }

    return existe;
}
