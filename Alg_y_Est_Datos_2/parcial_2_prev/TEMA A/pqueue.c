#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>

#include "pqueue.h"

typedef struct s_node* list;

struct s_pqueue {
    list front;
    size_t size;
};

struct s_node {
    pqueue_elem elem;
    unsigned int priority;
    list next;
};

static list create_node(pqueue_elem e, unsigned int priority) {
    list new_node = NULL;

    new_node = (list)malloc(sizeof(struct s_node));
    assert(new_node != NULL);

    new_node->priority = priority;
    new_node->elem = e;
    new_node->next = NULL;

    return new_node;
}

static list destroy_node(list node) {
    assert(node != NULL);

    free(node);
    node = NULL;

    assert(node == NULL);
    return node;
}


static bool invrep(pqueue q) {
    bool inv = q != NULL;

    if (inv && q->size != 0u) {
        inv = q->front != NULL;

        unsigned int len = 0u;
        list temp = q->front;
        while (temp != NULL && inv) {
            temp = temp->next;
            len++;
        }

        inv = inv && len == q->size;
    }

    return inv;
}

pqueue pqueue_empty(void) {
    pqueue q = NULL;

    q = (pqueue)malloc(sizeof(struct s_pqueue));
    assert(q != NULL);

    q->size = 0u;
    q->front = NULL;

    return q;
}

pqueue pqueue_enqueue(pqueue q, pqueue_elem e, unsigned int priority) {
    assert(invrep(q));
    list new_node = create_node(e, priority);

    if (q->front == NULL) {
        q->front = new_node;
    }
    else {
        list temp = q->front;

        while (temp->priority <= new_node->priority && temp->next != NULL) {
            temp = temp->next;
        }

        if (temp->next != NULL) {
            new_node->next = temp->next;
        }

        temp->next = new_node;
    }

    q->size++;

    return q;
}

bool pqueue_is_empty(pqueue q) {
    return q->size == 0u;
}

pqueue_elem pqueue_peek(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));

    return q->front->elem;
}

unsigned int pqueue_peek_priority(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));

    return q->front->priority;
}

unsigned int pqueue_size(pqueue q) {
    assert(invrep(q));
    unsigned int size = 0;

    size = q->size;

    return size;
}

pqueue pqueue_dequeue(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));

    list temp = q->front;
    q->front = temp->next;

    temp->next = NULL;
    temp = destroy_node(temp);

    q->size--;

    assert(invrep(q));

    return q;
}

pqueue pqueue_destroy(pqueue q) {
    assert(invrep(q));

    while (!pqueue_is_empty(q)) {
        q = pqueue_dequeue(q);
    }

    free(q);
    q = NULL;

    assert(q == NULL);
    return q;
}
