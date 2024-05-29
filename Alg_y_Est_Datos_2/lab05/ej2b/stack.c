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


static bool invrep(stack s) {
    return s != NULL;
}


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

    assert(invrep(new_stack));

    return new_stack;
}

stack stack_push(stack s, stack_elem e) {
    assert(invrep(s));

    node p = NULL;

    p = (node)malloc(sizeof(struct _s_node));
    if (p == NULL) {
        fprintf(stderr, "Not enough memory\n");
        exit(EXIT_FAILURE);
    }

    p->elem = e;
    p->next = s->elems;

    s->elems = p;
    s->size++;

    assert(invrep(s));

    return s;
}




// Operations
stack stack_pop(stack s) {
    assert(invrep(s) && !stack_is_empty(s));

    node p = s->elems;
    s->elems = p->next;
    p->next = NULL;

    free(p);

    s->size--;

    assert(invrep(s));

    return s;
}

unsigned int stack_size(stack s) {
    assert(invrep(s));

    return s->size;
}

stack_elem stack_top(stack s) {
    assert(invrep(s) && !stack_is_empty(s));

    return s->elems->elem;
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

        unsigned int i = 0u;
        while (!stack_is_empty(s)) {
            array[i] = stack_top(s);
            s = stack_pop(s);

            i++;
        }
    }

    return array;
}




// Destroy
stack stack_destroy(stack s) {
    assert(invrep(s));

    while (!stack_is_empty(s)) {
        stack_pop(s);
    }

    free(s);
    s = NULL;

    assert(s == NULL);

    return s;
}