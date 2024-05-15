#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "stack.h"

// implementation types
struct _s_stack {
    stack_elem elem;
    stack next;
};

/* static bool invrep(stack s) {
    bool inv = true;

    return inv;
} */


// Constructors
stack stack_empty() {
    stack new_stack = NULL;

    return new_stack;
}

stack stack_push(stack *s, stack_elem e) {
    stack p = NULL;

    p = (stack)malloc(sizeof(struct _s_stack));
    if (p == NULL) {
        fprintf(stderr, "Not enough memory\n");
        exit(EXIT_FAILURE);
    }

    p->elem = e;
    p->next = *s;

    *s = p;

    return *s;
}




// Operations
stack stack_pop(stack *s) {
    assert(!stack_is_empty(*s));

    stack p = *s;
    *s = p->next;
    p->next = NULL;

    free(p);

    return *s;
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
    assert(!stack_is_empty(s));

    return s->elem;
}

bool stack_is_empty(stack s) {
    return s == NULL;
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

        stack p = s;
        unsigned int i = 0u;
        while (!stack_is_empty(p)) {
            array[i] = p->elem;

            p = p->next;
            i++;
        }
    }

    return array;
}




// Destroy
stack stack_destroy(stack *s) {
    if (!stack_is_empty(*s)) {
        while (!stack_is_empty(*s)) {
            stack_pop(s);
        }
    }

    *s = NULL;

    return *s;
}