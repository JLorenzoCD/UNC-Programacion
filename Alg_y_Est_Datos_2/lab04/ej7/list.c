#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "list.h"

struct _node {
  list_elem elem;
  list next;
};




/* Constructors */
list empty_list(void) {
  list l = NULL;

  return l;
}

list addl_list(list_elem e, list l) {
  list p = NULL;

  p = (list)malloc(sizeof(struct _node));
  if (p == NULL) {
    fprintf(stderr, "Not enough memory\n");
    exit(EXIT_FAILURE);
  }

  p->elem = e;
  p->next = l;

  l = p;
  p = NULL;

  return l;
}




/* Operations */
bool is_empty_list(list l) { return l == NULL; }

list_elem head_list(list l) {
  assert(!is_empty_list(l));

  return l->elem;
}

list tail_list(list l) {
  assert(!is_empty_list(l));

  list p = l;

  l = l->next;

  free(p);
  p = NULL;

  return l;
}

list addr_list(list l, list_elem e) {
  list p, q;

  p = (list)malloc(sizeof(struct _node));
  p->elem = e;
  p->next = NULL;

  if (l == NULL) {
    l = p;
  }
  else {
    q = l;
    while (q->next != NULL) {
      q = q->next;
    }

    q->next = p;
  }

  return l;
}

unsigned int length_list(list l) {
  list p = l;
  unsigned int length = 0u;

  while (p != NULL) {
    p = p->next;

    length++;
  }

  return length;
}

list concat_list(list l1, list l2) {
  list cpy = copy_list(l2);

  if (l1 == NULL) {
    l1 = cpy;
  }
  else {
    list p = l1;

    while (p->next != NULL) {
      p = p->next;
    }

    p->next = cpy;
  }

  return l1;
}

list_elem index_list(list l, unsigned int n) {
  list p = l;
  unsigned int length = length_list(l);

  assert(n < length);

  for (unsigned int i = 0; i < n; i++) {
    p = p->next;
  }

  return p->elem;
}

list take_list(list l, unsigned int n) {
  list p = l;
  unsigned int length = length_list(l);

  assert(n < length);

  for (unsigned int i = 0; i < n - 1u; i++) {
    p = p->next;
  }

  destroy_list(p->next);
  p->next = NULL;

  return l;
}

list drop_list(list l, unsigned int n) {
  list p = l;
  unsigned int length = length_list(l);

  assert(n < length);

  for (unsigned int i = 0; i < n - 1u; i++) {
    p = p->next;
  }

  l = p->next;
  p->next = NULL;

  destroy_list(p);

  return l;
}

list copy_list(list l1) {
  list p = l1;

  list l2 = empty_list();

  while (p != NULL) {
    l2 = addr_list(l2, p->elem);
    p = p->next;
  }

  return l2;
}




/* Destroy */
list destroy_list(list l) {
  if (l != NULL) {
    list p = l;

    while (p != NULL) {
      l = p->next;

      free(p);
      p = l;
    }

    l = NULL;
  }

  return l;
}
