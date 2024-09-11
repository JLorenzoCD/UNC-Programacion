#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#include "command.h"
#include "execute.h"
#include "parser.h"
#include "parsing.h"
#include "builtin.h"
#include "prompt.h"

#include "obfuscated.h"

static Parser parse_clear(Parser parser);

int main(int argc, char *argv[]) {
    pipeline pipe;
    Parser input;
    bool quit = false;

    input = parser_new(stdin);
    if (input == NULL) {
        fprintf(stderr, "Ocurrió un error inesperado al iniciar 'mybash'.\n");
        exit(EXIT_FAILURE);
    }

    while (!quit) {
        // ping_pong_loop("AmberSloth");
        show_prompt();
        pipe = parse_pipeline(input);

        quit = parser_at_eof(input);

        if (pipe != NULL) {
            execute_pipeline(pipe);
            pipe = pipeline_destroy(pipe);
        }
        else if (pipe == NULL && !quit) {
            fprintf(stderr, "Se ha ingresado un comando invalido.\n");
            input = parse_clear(input);
        }
        else { // pipe == NULL && quit
            // Se coloca para que me haga el salto de linea al terminar el programa y que no me quede raro la bash
            printf("\n");

            // printf("Hasta la vista, baby!!\n"); // ¿Damos un mensaje de despedida?
        }
    }
    input = parser_destroy(input);

    return EXIT_SUCCESS;
}

static Parser parse_clear(Parser parser) {
    // TODO: Preguntar al profe que onda.

    /*
    En caso de no escribir nada o poner puros espacios/tabs y dar enter, se
    crea un bucle infinito, se intento limpiar el stdin y el parser, pero se
    quedaba clavado el mybash, por lo que se destruye y crea de nuevo el parser.
    */
    parser = parser_destroy(parser);
    parser = parser_new(stdin);
    if (parser == NULL) {
        fprintf(stderr, "Ocurrió un error inesperado al iniciar 'mybash'.\n");
        exit(EXIT_FAILURE);
    }

    return parser;
}