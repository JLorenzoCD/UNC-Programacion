#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "counter.h"

struct _counter {
    unsigned int count;
};

counter counter_init(void) {
    counter c;

    c = (counter)malloc(sizeof(struct _counter));
    if (c == NULL) {
        fprintf(stderr, "Not enough memory\n");
        exit(EXIT_FAILURE);
    }

    c->count = 0;

    return c;
}

void counter_inc(counter c) {
    assert(c != NULL);

    c->count++;
}

bool counter_is_init(counter c) {
    assert(c != NULL);

    return c->count == 0u;
}

void counter_dec(counter c) {
    assert(!counter_is_init(c));

    c->count--;
}

counter counter_copy(counter c) {
    assert(c != NULL);

    counter copy_c = counter_init();

    copy_c->count = c->count;

    return copy_c;
}

void counter_destroy(counter c) {
    if (c != NULL) {
        free(c);
        c = NULL;
    }
}
