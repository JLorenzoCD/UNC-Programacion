#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "strfuncs.h"

#define MAX_LENGTH 255

#define SIZEOF_ARRAY(s) (sizeof(s) / sizeof(*s))

/*
El problema de utilizar scanf es que en el momento en el cual se encuentra con un espacio, este termina de leer el string, en cambio, fgets me lee hasta que se llega a un \n o haste que se obtuvieron una cantidad max de caracteres.

Se modifica el MAX_LENGTH (20 a 255) para que pueda pasar todas las palabras que son palíndromo.
*/

int main(void) {
    char user_input[MAX_LENGTH];
    char ignore_chars[] = { ' ', '?', '!', ',', '-', '.' };
    char *filtered = NULL;

    printf("Ingrese un texto (no más de %d símbolos) para verificar palíndromo: ", MAX_LENGTH);
    fgets(user_input, MAX_LENGTH, stdin);

    // Quitando el \n si es que esta a final del user_input
    size_t len = string_length(user_input);
    if (len != 0u && user_input[len - 1u] == '\n') {
        user_input[len - 1u] = '\0';
        len--;
    }

    char *temp = NULL;
    filtered = string_filter(user_input, ignore_chars[0u]);

    for (unsigned int i = 0; i < SIZEOF_ARRAY(ignore_chars); i++) {
        temp = string_filter(filtered, ignore_chars[i]);

        free(filtered);
        filtered = temp;
    }

    printf(
        "El texto:\n\n"
        "\"%s\" \n\n"
        "%s un palíndromo.\n\n",
        user_input, string_is_symmetric(filtered) ? "Es" : "NO es"
    );

    free(filtered);
    filtered = NULL;

    return EXIT_SUCCESS;
}

