# include <stdio.h>
# include <stdbool.h>

void pedir_arreglo(int n_max, int a[]);
void imprimir_arreglo(int n_max, int a[]);
bool todos_pares(int tam, int a[]);
bool existe_multiplo(int m, int tam, int a[]);

# define N 5
int main(void){
    int arr[N];

    pedir_arreglo(N, arr);

    int op = -1;
    do
    {
        printf("\nSeleccione una de las siguientes opciones a realizar sobre 'arr':\n");
        printf("(1) Comprobar que todos los elementos son pares.\n");
        printf("(2) Comprobar si un número es múltiplo de algún elemento en el arreglo.\n");
        printf("Opcion a seleccionar: ");
        scanf("%d", &op);
    } while (!(1 <= op && op <= 2));

    switch (op){
        case 1:
            printf("\n############# Ha elegido la opción 1 #############\n");
            bool son_pares = todos_pares(N, arr);

            imprimir_arreglo(N, arr);

            printf("%sTODOS SON PARES!!\n", son_pares ? "" : "NO ");
            break;


        case 2:
            int m;

            printf("\n############# Ha elegido la opción 2 #############\n");
            printf("\nIngrese el número que desea verificar si es múltiplo de algún elemento en el arreglo: ");
            scanf("%i", &m);

            bool hay_multiplo = existe_multiplo(m, N, arr);

            imprimir_arreglo(N, arr);

            printf("%sHAY MULTIPLO DE %i!!\n", hay_multiplo ? "" : "NO ", m);
            break;


        default:
            printf("\nOcurrio un error >:|\n");
            break;
    }

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

bool todos_pares(int tam, int a[]){
    bool son_pares = true;

    for(int i = 0; i < tam && son_pares; i++){
        if(a[i] % 2 != 0){
            son_pares = false;
        }
    }

    return son_pares;
}

bool existe_multiplo(int m, int tam, int a[]){
    bool hay_multiplo = false;

    for(int i = 0; i < tam && !hay_multiplo; i++){
        if(a[i] % m == 0){
            hay_multiplo = true;
        }
    }

    return hay_multiplo;
}