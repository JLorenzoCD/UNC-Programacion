#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "stack.h"

// implementation types
struct _s_stack {
    stack_elem elem;
    stack next;
};

static bool invrep(stack s) {
    return s != NULL;
}


// Constructors
stack stack_empty() {
    stack new_stack = NULL;

    return new_stack;
}

stack stack_push(stack s, stack_elem e) {
    stack p = NULL;

    p = (stack)malloc(sizeof(struct _s_stack));
    if (p == NULL) {
        fprintf(stderr, "Not enough memory\n");
        exit(EXIT_FAILURE);
    }

    p->elem = e;
    p->next = s;

    s = p;

    assert(invrep(s));

    return s;
}




// Operations
stack stack_pop(stack s) {
    assert(invrep(s));

    stack p = s;
    s = p->next;
    p->next = NULL;

    free(p);

    return s;
}

unsigned int stack_size(stack s) {
    unsigned int len = 0u;
    stack p = s;

    while (!stack_is_empty(p)) {
        p = p->next;
        len++;
    }

    return len;
}

stack_elem stack_top(stack s) {
    assert(invrep(s) && !stack_is_empty(s));

    return s->elem;
}

bool stack_is_empty(stack s) {
    return s == NULL;
}

stack stack_copy(stack s) {
    stack s_cp = stack_empty();
    stack s_aux = stack_empty();

    stack p = s;
    while (!stack_is_empty(p)) {
        s_aux = stack_push(s_aux, p->elem);

        p = p->next;
    }

    while (!stack_is_empty(s_aux)) {
        s_cp = stack_push(s_cp, stack_top(s_aux));
        s_aux = stack_pop(s_aux);
    }

    return s_cp;
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

        stack s_cp = stack_copy(s);
        unsigned int i = 0u;
        while (!stack_is_empty(s_cp)) {
            array[i] = stack_top(s_cp);
            s_cp = stack_pop(s_cp);
            i++;
        }

        s_cp = stack_destroy(s_cp);
    }

    return array;
}




// Destroy
stack stack_destroy(stack s) {
    while (!stack_is_empty(s)) {
        s = stack_pop(s);
    }

    s = NULL;

    return s;
}