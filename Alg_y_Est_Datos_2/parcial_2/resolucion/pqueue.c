#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>

#include "character/character.h"
#include "pqueue.h"

/* ============================================================================
STRUCTS!
============================================================================ */
typedef struct s_node* node;

struct s_pqueue {
  unsigned int size;
  node front;
};

struct s_node {
  float priority;
  Character character;

  node next;
};

/* ============================================================================
INVREP
============================================================================ */

static bool invrep(pqueue q) {
  bool inv = q != NULL;

  if (inv) {
    /*
      Si mi size es 0 entonces el fornt es NULL, caso contrario no es NULL
    */
    inv = (q->front == NULL && q->size == 0u) || (q->front != NULL && q->size != 0u);

    /*
      Variables temporales para recorrer los nodos, revisar la propiedad de la cola de prioridad y revisar el tamaño
    */
    node curr = q->front, prev = NULL;
    unsigned int len = 0u;
    while (inv && curr != NULL) {
      prev = curr;
      curr = prev->next;

      if (curr != NULL) {
        inv = prev->priority >= curr->priority; // Propiedad de cola de prioridades
      }

      len++;
    }

    inv = inv && len == q->size; // Que el size sea correcto
  }

  return inv;
}

/* ============================================================================
NEW
============================================================================ */

pqueue pqueue_empty(void) {
  pqueue q = NULL;

  q = (pqueue)malloc(sizeof(struct s_pqueue));
  assert(q != NULL);

  q->front = NULL;
  q->size = 0u;

  return q;
}

/* ============================================================================
ENQUEUE
============================================================================ */

static float calculate_priority(Character character) {
  // Initiative = baseInitiative  * isAlive
  float priority = character_agility(character) * (int)character_is_alive(character);

  // Veo si es es necesario añadir el modificador
  switch (character_ctype(character)) {
  case agile:
    priority *= 1.5;
    break;

  case tank:
    priority *= 0.8;
    break;

  default:
    break;
  }

  return priority;
}

static node create_node(Character character) {
  node new_node = NULL;
  float priority = calculate_priority(character);

  new_node = (node)malloc(sizeof(struct s_node));
  assert(new_node != NULL);

  new_node->next = NULL;
  new_node->priority = priority;
  new_node->character = character;

  return new_node;
}

pqueue pqueue_enqueue(pqueue q, Character character) {
  assert(invrep(q));
  node new_node = create_node(character);

  // Variables temporales para los nodos
  node prev = NULL, curr = NULL;
  curr = q->front;

  while (curr != NULL && curr->priority >= new_node->priority) {
    prev = curr;
    curr = prev->next;
  }

  if (prev != NULL) {
    /*
      Si prev es != NULL entonces entro en el bucle y por lo tanto hay elemento previo
    */
    prev->next = new_node;
    new_node->next = curr;
  }
  else {
    /*
      Si prev es NULL, entonces no se entro al bucle, ya sea porque la cola esta vacía o porque el nuevo nodo tiene mayor prioridad
    */
    new_node->next = curr;
    q->front = new_node;
  }

  q->size++;

  return q;
}

/* ============================================================================
IS EMPTY?
============================================================================ */

bool pqueue_is_empty(pqueue q) {
  assert(invrep(q));

  return q->size == 0u;
}

/* ============================================================================
PEEKS
============================================================================ */

Character pqueue_peek(pqueue q) {
  assert(invrep(q) && !pqueue_is_empty(q));

  // Si me hacen un delete_character (?), si no lo comento tengo problemas de leeks
  // return character_copy(q->front->character);

  return q->front->character;
}

float pqueue_peek_priority(pqueue q) {
  assert(invrep(q) && !pqueue_is_empty(q));

  return q->front->priority;
}

/* ============================================================================
SIZE
============================================================================ */

unsigned int pqueue_size(pqueue q) {
  assert(invrep(q));

  return q->size;
}

/* ============================================================================
COPY
============================================================================ */

pqueue pqueue_copy(pqueue q) {
  assert(invrep(q));
  pqueue q_cp = pqueue_empty();

  node temp = q->front;
  while (temp != NULL) {
    Character c_cp = character_copy(temp->character);
    pqueue_enqueue(q_cp, c_cp);

    temp = temp->next;
  }

  return q_cp;
}

/* ============================================================================
DESTROY!
============================================================================ */
static node destroy_node(node node_to_delete) {
  assert(node_to_delete != NULL);

  node_to_delete->character = character_destroy(node_to_delete->character);
  free(node_to_delete);
  node_to_delete = NULL;

  assert(node_to_delete == NULL);
  return node_to_delete;
}

pqueue pqueue_dequeue(pqueue q) {
  assert(invrep(q) && !pqueue_is_empty(q));

  node temp = q->front;

  q->front = temp->next;
  temp = destroy_node(temp);

  q->size--;

  return q;
}

pqueue pqueue_destroy(pqueue q) {
  while (!pqueue_is_empty(q)) {
    q = pqueue_dequeue(q);
  }

  free(q);
  q = NULL;

  assert(q == NULL);
  return q;
}
