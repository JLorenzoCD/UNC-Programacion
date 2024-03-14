#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#define ARRAY_SIZE 4

struct bound_data {
    bool is_upperbound;
    bool is_lowerbound;
    bool exists;
    unsigned int where;
};

struct bound_data check_bound(int value, int arr[], unsigned int length) {
    struct bound_data res;
    res.is_lowerbound = true;
    res.is_upperbound = true;
    res.exists = false;

    for (unsigned int i = 0; i < length; i++) {
        if (value == arr[i]) {
            res.exists = true;
            res.where = i;
        }
        else if (value < arr[i]) {
            res.is_upperbound = false;
        }
        else if (arr[i] < value) {
            res.is_lowerbound = false;
        }
    }

    return res;
}

void get_values_for_array(int arr[], unsigned int length) {
    printf("\n############# Coloque los valores para 'arr' #############\n");
    for (unsigned int i = 0; i < length; i++) {
        printf("arr[%i]: ", i + 1);
        scanf("%d", &arr[i]);
    }
}

int main(void) {
    int a[ARRAY_SIZE] = { 0, -1, 9, 4 };
    int value = 9;

    // Pedir datos.
    get_values_for_array(a, ARRAY_SIZE);
    printf("\nIngrese el valor a comparar:\n"); scanf("%i", &value);

    struct bound_data result = check_bound(value, a, ARRAY_SIZE);

    // Mostrar datos.
    printf("\n");
    if (result.is_upperbound) {
        printf("El valor '%i' es cota superior.\n", value);
    }
    if (result.is_lowerbound) {
        printf("El valor '%i' es cota inferior.\n", value);

    }
    if (result.exists) {
        printf("El valor '%i' existe en el arreglo en la posicion %i.\n", value, result.where);

    }

    return EXIT_SUCCESS;
}

