#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "stack.h"

int main(void) {
    stack s = stack_empty();

    printf("TEST #1: ¿Funciona bien stack_pop() para pilas de tamaño 1?\n");
    s = stack_push(s, 1);
    assert(stack_size(s) == 1u);
    s = stack_pop(s);
    assert(stack_size(s) == 0u);
    printf("TEST #1: OK\n\n");


    printf("TEST #2: Si la pila queda vacía, ¿puedo volver a insertar elementos?\n");
    s = stack_push(s, 5);
    s = stack_push(s, 2);
    assert(stack_size(s) == 2u);
    printf("TEST #2: OK\n\n");


    printf("TEST #3: La función stack_to_array() devuelve NULL para una pila vacía?\n");
    s = stack_destroy(s);
    s = stack_empty();
    assert(stack_size(s) == 0u);

    int *array_of_empty_stack = stack_to_array(s);
    assert(array_of_empty_stack == NULL);
    printf("TEST #3: OK\n\n");


    printf("TEST #4: ¿Devuelve los elementos en el orden correcto?\n");
    int arr[] = { 1, 2, 3, 4, 5 };
    int arr_reverse[] = { 5, 4, 3, 2, 1 };
    int *arr_of_stack = NULL;

    s = stack_destroy(s);
    s = stack_empty();
    assert(stack_size(s) == 0u);

    size_t len_arr = sizeof(arr) / sizeof(*arr);
    for (size_t i = 0u; i < len_arr; i++) {
        s = stack_push(s, arr[i]);
    }

    arr_of_stack = stack_to_array(s);

    for (size_t i = 0; i < len_arr; i++) {
        assert(arr_of_stack[i] == arr_reverse[i]);
    }
    printf("TEST #4: OK\n\n");


    s = stack_destroy(s);
    free(arr_of_stack);

    printf("Pasaron todos los tests.\n");

    return EXIT_SUCCESS;
}