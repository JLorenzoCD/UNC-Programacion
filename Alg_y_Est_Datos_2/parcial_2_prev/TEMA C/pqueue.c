#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>

#include "pqueue.h"

typedef struct s_node* node;

struct s_node {
    pqueue_elem elem;
    node next;
};

struct s_pqueue {
    priority_t min_priority;
    node *array;
    size_t size;
};


static node create_node(pqueue_elem e) {
    node new_node = NULL;

    new_node = (node)malloc(sizeof(struct s_node));
    assert(new_node != NULL);

    new_node->elem = e;
    new_node->next = NULL;

    assert(new_node != NULL);
    return new_node;
}

static node destroy_node(node n) {
    free(n);
    n = NULL;

    return n;
}


static bool invrep(pqueue q) {
    return q != NULL && q->array != NULL;
}

pqueue pqueue_empty(priority_t min_priority) {
    pqueue q = NULL;

    q = (pqueue)malloc(sizeof(struct s_pqueue));
    assert(q != NULL);

    q->array = (node*)malloc(sizeof(struct s_node) * (min_priority + 1u));
    assert(q->array != NULL);

    for (size_t i = 0; i <= min_priority; i++) {
        q->array[i] = NULL;
    }

    q->min_priority = min_priority;
    q->size = 0u;

    assert(invrep(q) && pqueue_is_empty(q));
    return q;
}

pqueue pqueue_enqueue(pqueue q, pqueue_elem e, priority_t priority) {
    assert(invrep(q) && priority <= q->min_priority);

    node temp = NULL;

    if (q->array[priority] == NULL) {
        temp = create_node(e);

        q->array[priority] = temp;
    }
    else {
        temp = create_node(e);

        temp->next = q->array[priority];
        q->array[priority] = temp;
    }

    q->size++;

    assert(invrep(q) && !pqueue_is_empty(q));
    return q;
}

bool pqueue_is_empty(pqueue q) {
    assert(invrep(q));

    return q->size == 0u;
}

pqueue_elem pqueue_peek(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));

    node temp = NULL;
    pqueue_elem elem;

    for (size_t i = 0u; i <= q->min_priority && temp == NULL; i++) {
        if (q->array[i] != NULL) {
            temp = q->array[i];

            while (temp->next != NULL) {
                temp = temp->next;
            }

            elem = temp->elem;
        }
    }

    return elem;
}

priority_t pqueue_peek_priority(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));

    priority_t priority;

    for (size_t i = 0u; i <= q->min_priority; i++) {
        if (q->array[i] != NULL) {
            priority = i;
            break;
        }
    }

    return priority;
}

size_t pqueue_size(pqueue q) {
    assert(invrep(q));

    return q->size;
}

pqueue pqueue_dequeue(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));

    node temp1 = NULL;

    for (size_t i = 0u; i <= q->min_priority && temp1 == NULL; i++) {
        if (q->array[i] != NULL) {
            temp1 = q->array[i];

            if (temp1->next == NULL) {
                destroy_node(temp1);
                q->array[i] = NULL;
            }
            else {
                while (temp1->next->next != NULL) {
                    temp1 = temp1->next;
                }

                destroy_node(temp1->next);
                temp1->next = NULL;
            }
        }
    }

    q->size--;

    assert(invrep(q));
    return q;
}

pqueue pqueue_destroy(pqueue q) {
    assert(invrep(q));

    while (!pqueue_is_empty(q)) {
        q = pqueue_dequeue(q);
    }

    free(q->array);
    q->array = NULL;

    free(q);
    q = NULL;

    return q;
}
