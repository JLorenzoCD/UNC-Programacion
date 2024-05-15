#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "stack.h"

// implementation types
struct _s_node {
    stack_elem elem;
    struct _s_node* next;
};

typedef struct _s_node* node;

struct _s_stack {
    unsigned int size;
    node elems;
};


/* static bool invrep(stack s) {
    //! Si s == NULL, me tira error en todos lados, entonces tengo que realizar el invariante teniendo en cuenta esto
    bool inv = true;

    return inv;
} */


// Constructors
stack stack_empty() {
    stack new_stack = NULL;

    new_stack = (stack)malloc(sizeof(struct _s_stack));
    if (new_stack == NULL) {
        fprintf(stderr, "Not enough memory\n");
        exit(EXIT_FAILURE);
    }

    new_stack->elems = NULL;
    new_stack->size = 0u;

    return new_stack;
}

stack stack_push(stack *s, stack_elem e) {
    if (*s == NULL) {
        *s = stack_empty();
    }

    node p = NULL;

    p = (node)malloc(sizeof(struct _s_node));
    if (p == NULL) {
        fprintf(stderr, "Not enough memory\n");
        exit(EXIT_FAILURE);
    }

    p->elem = e;
    p->next = (*s)->elems;

    (*s)->elems = p;
    (*s)->size++;

    return *s;
}




// Operations
stack stack_pop(stack *s) {
    assert(!stack_is_empty(*s));

    node p = (*s)->elems;
    (*s)->elems = p->next;
    p->next = NULL;

    free(p);

    (*s)->size--;

    return *s;
}

unsigned int stack_size(stack s) {
    return s == NULL ? 0u : s->size;
}

stack_elem stack_top(stack s) {
    assert(!stack_is_empty(s));

    return s->elems->elem;
}

bool stack_is_empty(stack s) {
    return s == NULL || s->size == 0u;
}

stack_elem *stack_to_array(stack s) {
    unsigned int len = stack_size(s);

    stack_elem *array = NULL;

    if (len != 0u) {
        array = (stack_elem*)malloc(sizeof(stack_elem) * len);
        if (array == NULL) {
            fprintf(stderr, "Not enough memory\n");
            exit(EXIT_FAILURE);
        }

        node p = s->elems;
        unsigned int i = 0u;
        while (p != NULL) {
            array[i] = p->elem;

            p = p->next;
            i++;
        }
    }

    return array;
}




// Destroy
stack stack_destroy(stack *s) {
    if (*s != NULL) {
        while (!stack_is_empty(*s)) {
            stack_pop(s);
        }

        free(*s);
        *s = NULL;
    }

    return *s;
}