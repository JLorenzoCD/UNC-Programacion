#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <glib.h>
#include <assert.h>


#include "command.h"
#include "strextra.h"
#include "tests/syscall_mock.h"

static void s_command_GDestroyNotify(gpointer data);



/* ######################################################## Scommand ######################################################## */
// By Imanol

typedef struct  scommand_s {
    /*
        Aquí se encontrara el comando seguido de los argumentos. Args es una secuencia de cadenas (char *)
        Se usa puntero porque GQueue es estructura de datos de tamaño variable
     */
    GQueue *args;

    // Uso puntero para poder trabajar con cadenas de distinta longitud y no tener problemas al asignar memoria
    char *input_redir;      //Almacena las rutas de archivo a donde dirigir la entrada
    char *output_redir;     //Almacena las rutas de archivo a donde dirigir la salida
}scommand_s;


scommand scommand_new(void) {
    scommand_s *new_Command = malloc(sizeof(scommand_s));

    new_Command->args = g_queue_new();
    new_Command->input_redir = NULL;
    new_Command->output_redir = NULL;

    assert(new_Command != NULL && scommand_is_empty(new_Command) && scommand_get_redir_in(new_Command) == NULL && scommand_get_redir_out(new_Command) == NULL);
    return new_Command;
}

scommand scommand_destroy(scommand self) {
    assert(self != NULL);

    while (!g_queue_is_empty(self->args)) {
        char *arg = g_queue_pop_head(self->args);
        free(arg);
    }
    g_queue_free(self->args);

    if (self->input_redir != NULL) {
        free(self->input_redir);
        self->input_redir = NULL;
    }

    if (self->output_redir != NULL) {
        free(self->output_redir);
        self->output_redir = NULL;
    }

    free(self); self = NULL;

    assert(self == NULL);
    return self;
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Modificadores ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
// By Imanol


void scommand_push_back(scommand self, char *argument) {
    assert(self != NULL && argument != NULL);

    g_queue_push_tail(self->args, argument);

    assert(!scommand_is_empty(self));
}

void scommand_pop_front(scommand self) {
    assert(self != NULL && !scommand_is_empty(self));

    char *arg = g_queue_pop_head(self->args);
    free(arg); arg = NULL;
}

void scommand_set_redir_in(scommand self, char *filename) {
    assert(self != NULL);

    if (self->input_redir != NULL) {
        free(self->input_redir);
    }

    self->input_redir = filename;
}

/*Que un TAD "se apropia de la referencia",significa que el TAD asume la responsabilidad de gestionar la memoria asociada a esos punteros.*/
void scommand_set_redir_out(scommand self, char *filename) {
    assert(self != NULL);

    if (self->output_redir != NULL) {
        free(self->output_redir);
    }

    self->output_redir = filename;
}


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Proyectores ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
// By Ezequiel



bool scommand_is_empty(const scommand self) {
    assert(self != NULL);

    return g_queue_is_empty(self->args);  //Devuelve True en caso de que la secuencia sea vacia y False en caso contrario.

}

unsigned int scommand_length(const scommand self) {
    assert(self != NULL);

    unsigned int length;
    length = (unsigned int)g_queue_get_length(self->args);  //Devuelve el tamaño de la secuencia expresado en un unsigned int.

    assert((length == 0) == scommand_is_empty(self));       //Verifico que en caso de que el tamaño sea 0 coincida con scommand_is_empty.
    return length;
}

char *scommand_front(const scommand self) {
    assert(self != NULL && !scommand_is_empty(self));

    char *arg_init = (char*)g_queue_peek_head(self->args);  //Tomo el primer argumento de la secuencia dada.

    assert(arg_init != NULL);
    return arg_init;
}

char *scommand_get_redir_in(const scommand self) {
    assert(self != NULL);

    char* filename = self->input_redir;

    return filename;
}

char *scommand_get_redir_out(const scommand self) {
    assert(self != NULL);

    char *filename = self->output_redir;

    return filename;
}

char *scommand_to_string(const scommand self) {
    assert(self != NULL);

    GString *g_result = g_string_new("");

    if (!scommand_is_empty(self)) {
        GQueue *args_clone = g_queue_copy(self->args);  // Se clona la cola. El clon comparte puntes con la cola original, por lo que no se libera memoria

        char* arg = (char*)g_queue_pop_head(args_clone);
        g_string_append(g_result, arg);

        while (!g_queue_is_empty(args_clone)) {
            arg = (char*)g_queue_pop_head(args_clone);

            g_string_append_printf(g_result, " %s", arg);
        }


        if (self->input_redir != NULL) {     // Si hay input_redir se lo concatena con un ' < ' entre medio
            g_string_append_printf(g_result, " < %s", self->input_redir);
        }
        if (self->output_redir != NULL) {    // Si hay output_redir se lo concatena con un ' > ' entre medio
            g_string_append_printf(g_result, " > %s", self->output_redir);
        }

        // Se libera la estructura GQueue
        g_queue_free(args_clone);
        args_clone = NULL;
    }

    // Se mueve el valor de g_result a result y se libera el TAD GString
    //char* result = (char*)g_string_free_and_steal(g_result);
    char* result = strdup((char*)g_result->str);
    g_string_free(g_result, TRUE);

    assert(scommand_is_empty(self) || scommand_get_redir_in(self) == NULL || scommand_get_redir_out(self) == NULL || strlen(result) > 0);
    return result;
}



/* ######################################################## Pipeline ######################################################## */
// By Mauro

struct pipeline_s {
    /*
        La cola de comandos utilizando el TAD GQueue de la librería GLib.
        Para manejar este, debemos usar las funciones provistas por la librería.
    */
    GQueue *commands;

    bool wait;
};

pipeline pipeline_new(void) {
    pipeline result = NULL;

    result = malloc(sizeof(struct pipeline_s));
    if (result == NULL) {
        //TODO: ver como manejamos los errores
        fprintf(stderr, "Error in pipeline_new: not enough memory.\n");
    }
    else {
        result->commands = g_queue_new();
        result->wait = true;
    }

    assert(result != NULL && pipeline_is_empty(result) && pipeline_get_wait(result));
    return result;
}

/*
 *  Función auxiliar para liberar todos los objetos scommand en
 *  el GQueue antes de destruir el pipeline.
 */
static void s_command_GDestroyNotify(gpointer data) {
    data = scommand_destroy((scommand)data);
    return;
}

pipeline pipeline_destroy(pipeline self) {
    assert(self != NULL);

    // Se libera el TAD GQueue de scomannds
    g_queue_free_full(self->commands, s_command_GDestroyNotify);

    // Se libera el struct pipeline_s
    free(self); self = NULL;


    assert(self == NULL);
    return self;
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Modificadores ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
// By Mauro

void pipeline_push_back(pipeline self, scommand sc) {
    assert(self != NULL && sc != NULL);

    g_queue_push_tail(self->commands, (gpointer)sc);

    assert(!pipeline_is_empty(self));
}

void pipeline_pop_front(pipeline self) {
    assert(self != NULL && !pipeline_is_empty(self));
    scommand sc = NULL;

    sc = (scommand)g_queue_pop_head(self->commands);
    sc = scommand_destroy(sc);
}

void pipeline_set_wait(pipeline self, const bool w) {
    assert(self != NULL);

    self->wait = w;
}


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Proyectores ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
// By Lorenzo

bool pipeline_is_empty(const pipeline self) {
    assert(self != NULL);

    // Da problemas haciendo el casting
    if (g_queue_is_empty(self->commands)) {
        return true;
    }

    return false;
}

unsigned int pipeline_length(const pipeline self) {
    assert(self != NULL);

    return (unsigned int)g_queue_get_length(self->commands);
}

scommand pipeline_front(const pipeline self) {
    assert(self != NULL && !pipeline_is_empty(self));

    scommand curr_cmd = (scommand)g_queue_peek_head(self->commands);

    assert(curr_cmd != NULL);
    return curr_cmd;
}

bool pipeline_get_wait(const pipeline self) {
    assert(self != NULL);

    return self->wait;
}

char* pipeline_to_string(const pipeline self) {
    assert(self != NULL);

    GString *g_result = g_string_new("");

    if (!pipeline_is_empty(self)) {
        char* cmd_str;

        GQueue *cmds_clone = g_queue_copy(self->commands); //Se clona la cola. El clon comparte puntes con la cola original, por lo que no se libera memoria

        scommand curr_cmd = (scommand)g_queue_pop_head(cmds_clone);     // Obteniendo el primer scommand
        cmd_str = scommand_to_string(curr_cmd);                         // Obteniendo el string del scommand

        g_string_append(g_result, cmd_str);
        free(cmd_str); cmd_str = NULL;

        // En caso de que haya mas scommand, estos se concatenan con un ' | ' entre medio
        while (!g_queue_is_empty(cmds_clone)) {
            curr_cmd = (scommand)g_queue_pop_head(cmds_clone);
            cmd_str = scommand_to_string(curr_cmd);

            g_string_append(g_result, " | ");

            g_string_append(g_result, cmd_str);
            free(cmd_str); cmd_str = NULL;
        }

        // Si no se tiene que esperar, significa que al final del pipeline va un ' &', por lo que se debe concatenar
        if (!self->wait) {
            g_string_append(g_result, " &");
        }

        // Se libera la estructura GQueue
        g_queue_free(cmds_clone);
        cmds_clone = NULL;
    }

    // Se mueve el valor de g_result a result y se libera el TAD GString
    //char* result = (char*)g_string_free_and_steal(g_result);
    char* result = strdup((char*)g_result->str);
    g_string_free(g_result, TRUE);

    assert(result == NULL || pipeline_is_empty(self) || pipeline_get_wait(self) || strlen(result) > 0);
    return result;
}
