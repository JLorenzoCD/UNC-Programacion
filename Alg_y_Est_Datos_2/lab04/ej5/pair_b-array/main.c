#include <stdlib.h>  /* EXIT_SUCCESS... */
#include <stdio.h>   /* printf()...     */

#include "pair.h"    /* TAD Par         */

/*
I.      ¿Por qué falla?
Porque la funcion show_pair rompia la abstraccion desde el ejercicio anterior
*/

static void show_pair(pair_t p) {
    // II.     Hacer las modificaciones necesarias en main.c para que compile.
    printf("(%d, %d)\n", pair_first(p), pair_second(p));

    /*
    III.    ¿El diseño del TAD logra encapsulamiento? ¿Por qué sí? ¿Por qué no?

    Si, ya que todo funciona correctamente, quitando el problema de esta funcion show_pair
     */
}


int main(void) {
    pair_t p, q;

    // Nuevo par p
    p = pair_new(3, 4);

    // Se muestra el par por pantalla
    printf("p = ");
    show_pair(p);

    // Nuevo para q con elementos de p intercambiados
    q = pair_swapped(p);

    // Se muestra q
    printf("q = ");
    show_pair(q);

    // Se destruyen p y q
    p = pair_destroy(p);
    q = pair_destroy(q);

    return EXIT_SUCCESS;
}
