#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "pair.h"

struct s_pair_t {
    elem fst;
    elem snd;
};

pair_t pair_new(elem x, elem y) {
    pair_t p = NULL;

    p = (pair_t)malloc(sizeof(struct s_pair_t));
    if (p == NULL) {
        fprintf(stderr, "Not enough memory\n");
        exit(EXIT_FAILURE);
    }

    p->fst = x;
    p->snd = y;

    return p;
}

elem pair_first(pair_t p) {
    assert(p != NULL && "p is a pointer to NULL");

    return p->fst;
}

elem pair_second(pair_t p) {
    assert(p != NULL && "p is a pointer to NULL");

    return p->snd;
}

pair_t pair_swapped(pair_t p) {
    assert(p != NULL && "p is a pointer to NULL");

    return pair_new(p->snd, p->fst);
}

pair_t pair_destroy(pair_t p) {
    if (p != NULL) {
        free(p);
        p = NULL;
    }

    return p;
}
