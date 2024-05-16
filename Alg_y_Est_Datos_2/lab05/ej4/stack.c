#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "stack.h"

struct _s_stack {
    stack_elem *elems;      // Arreglo de elementos
    unsigned int size;      // Cantidad de elementos en la pila
    unsigned int capacity;  // Capacidad actual del arreglo elems
};

//* Para crear la pila con el arreglo, voy a utilizar el comienzo de la pila o top, como el ultimo elemento del array. Ya que es mas simple de implementar que colocar el comienzo de la pila en el principio del arreglo.


static bool invrep(stack s) {
    return s != NULL;
}

// Constructors
stack stack_empty() {
    stack new_stack = NULL;

    new_stack = (stack)malloc(sizeof(struct _s_stack));
    if (new_stack == NULL) {
        perror("Not enough memory.\n");
        exit(EXIT_FAILURE);
    }

    new_stack->elems = NULL;
    new_stack->capacity = 0u;
    new_stack->size = 0u;

    return new_stack;
}

stack stack_push(stack s, stack_elem e) {
    assert(invrep(s));

    if (s->capacity <= s->size) {
        size_t len = s->size == 0u ? 1u : s->size;

        s->elems = (stack_elem*)realloc(s->elems, sizeof(stack_elem) * (len * 2));
        if (s->elems == NULL) {
            perror("Not enough memory.\n");
            exit(EXIT_FAILURE);
        }


        s->capacity = len * 2;
    }

    s->elems[s->size] = e;
    s->size++;

    assert(invrep(s));

    return s;
}




// Operations
stack stack_pop(stack s) {
    assert(invrep(s) && !stack_is_empty(s));

    s->size--;

    assert(invrep(s));

    return s;
}

unsigned int stack_size(stack s) {
    return s->size;
}

stack_elem stack_top(stack s) {
    assert(invrep(s) && !stack_is_empty(s));

    return s->elems[s->size - 1u];
}

bool stack_is_empty(stack s) {
    assert(invrep(s));

    return s->size == 0u;
}

stack_elem *stack_to_array(stack s) {
    assert(invrep(s));

    unsigned int len = stack_size(s);

    stack_elem *array = NULL;

    if (len != 0u) {
        array = (stack_elem*)malloc(sizeof(stack_elem) * len);
        if (array == NULL) {
            fprintf(stderr, "Not enough memory\n");
            exit(EXIT_FAILURE);
        }

        for (unsigned int i = 0; i < len; i++) {
            array[i] = s->elems[len - 1u - i];
        }
    }

    assert(invrep(s));

    return array;
}




// Destroy
stack stack_destroy(stack s) {
    assert(invrep(s));

    if (s->elems != NULL) {
        free(s->elems);
        s->elems = NULL;
    }

    free(s);
    s = NULL;

    return s;
}
