#include <stdio.h>
#include <stdlib.h>

#include "pair.h"

pair_t pair_new(int x, int y) {
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

int pair_first(pair_t p) {
    return p->fst;
}

int pair_second(pair_t p) {
    return p->snd;
}

pair_t pair_swapped(pair_t p) {
    return pair_new(p->snd, p->fst);
}

pair_t pair_destroy(pair_t p) {
    free(p);
    p = NULL;

    return p;
}
