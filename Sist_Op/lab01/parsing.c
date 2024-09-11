#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>

#include <glib.h>

#include "command.h"
/*
Lo que hace el módulo Parser es darme las herramientas que necesito para procesar cadenas de texto y luego poder
analizar comandos de los cuales conozco su gramática en el TAD de Parsing:
*/
#include "parser.h"
#include "parsing.h"

//         --- Imanol Carrozzo ---

static scommand parse_scommand(Parser p) {
    assert(p != NULL);

    scommand cmd = scommand_new();
    arg_kind_t type; char* arg = NULL;

    while (!parser_at_eof(p)) {         // Si aún no terminé de leer input...
        parser_skip_blanks(p);
        arg = parser_next_argument(p, &type);

        // Voy capturando cada uno de los argumentos, incluido el nombre del comando y los agrego a scommand.
        if (arg != NULL) {
            switch (type) {  // Hago un análisis por casos, tengo tres posibilidades:
            case ARG_NORMAL:
                scommand_push_back(cmd, arg);
                break;

            case ARG_INPUT:
                scommand_set_redir_in(cmd, arg);
                break;

            case ARG_OUTPUT:
                scommand_set_redir_out(cmd, arg);
                break;

            default:
                cmd = scommand_destroy(cmd);
                return NULL;
            }
        }
        else if ((type == ARG_INPUT && scommand_get_redir_in(cmd) == NULL) || (type == ARG_OUTPUT && scommand_get_redir_out(cmd) == NULL)) {
            // Alguna redireccion incorrecta
            cmd = scommand_destroy(cmd);
            break;
        }
        else if (scommand_is_empty(cmd)) {
            // No hay argumento y el cmd esta vacio
            cmd = scommand_destroy(cmd);
            break;
        }
        else {
            // Si se elimina este if, se cuelgan los test. Me parece que es porque llega al end of file y no corta porque no lee nada.
            break;
        }
    }

    return cmd;
}



pipeline parse_pipeline(Parser p) {
    assert(p != NULL);

    bool eof = parser_at_eof(p);
    if (eof) {
        return NULL;
    }

    scommand cmd = parse_scommand(p);   // Veo si hay por lo menos algún comando
    if (cmd == NULL) {
        return NULL;
    }

    pipeline result = pipeline_new();
    pipeline_push_back(result, cmd);

    if (parser_at_eof(p)) {
        return result;
    }

    bool another_pipe = true;
    parser_op_pipe(p, &another_pipe);
    while (!parser_at_eof(p) && another_pipe) { //No se llego a final de archivo, y hay un posible comando o hay un pipe
        cmd = parse_scommand(p);

        if (cmd == NULL) { // Si hay error en algún comando, se invalida el pipeline.
            result = pipeline_destroy(result);
            return result;
        }
        parser_skip_blanks(p);
        parser_op_pipe(p, &another_pipe);

        pipeline_push_back(result, cmd);
    }

    // Opcionalmente un OP_BACKGROUND al final
    if (!parser_at_eof(p)) {
        bool hay_back_op = true;
        parser_op_background(p, &hay_back_op); // Verifico si hay operador de background
        pipeline_set_wait(result, !hay_back_op); // Seteo si es necesario esperar o no al proceso hijo
    }


    bool garbage = false;
    parser_garbage(p, &garbage);
    if (garbage) {
        result = pipeline_destroy(result);
    }
    return result;
}