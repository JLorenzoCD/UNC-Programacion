#include <assert.h>
#include <glib.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "command.h"
#include "builtin.h"

#include "tests/syscall_mock.h"

static void builtin_run_cd(scommand cmd);
static void builtin_run_help(void);

bool builtin_is_internal(scommand cmd) {
    assert(cmd != NULL);

    bool is_builtin = false;
    char *elem = NULL;

    elem = scommand_front(cmd);  //Selecciono el primer argumento del comando (nombre del comando).

    if (strcmp(elem, "cd") == 0 || strcmp(elem, "help") == 0 || strcmp(elem, "exit") == 0) {  //Comparo el nombre del comando con los nombres de los comandos builtins.
        is_builtin = true;
    }

    return is_builtin;
}

bool builtin_alone(pipeline p) {
    assert(p != NULL);

    //Chequeo si el pipeline tiene un solo scommand y si este es interno.
    bool is_alone = (pipeline_length(p) == 1) && builtin_is_internal(pipeline_front(p));

    assert(is_alone == (pipeline_length(p) == 1 && builtin_is_internal(pipeline_front(p))));
    return is_alone;
}

void builtin_run(scommand cmd) {
    assert(builtin_is_internal(cmd));

    char *elem = scommand_front(cmd);  //Tomo el primer argumento (Nombre del comando).

    if (strcmp(elem, "cd") == 0) {  //Chequeo si el comando es cd.
        builtin_run_cd(cmd);
    }
    else if (strcmp(elem, "help") == 0) {  //Chequeo si el comando en help.
        builtin_run_help();
    }
    else {  //Si no es ninguno de los anteriores entonces el comando es exit.
        printf("\n");
        exit(EXIT_SUCCESS);  //Termino el programa.
    }
}


static void builtin_run_cd(scommand cmd) {
    assert(cmd != NULL);

    if (scommand_length(cmd) > 2) {
        fprintf(stderr, "Uso incorrecto del comando cd.\n");
        return;
    }

    scommand_pop_front(cmd);  //Elimino el nombre del comando para dejar la ruta como primer argumento.

    if (scommand_length(cmd) == 0) {    // Si esta vacio, entonces se coloca en el cmd la ruta al home o a la raíz
        char* home_dir = getenv("HOME");

        if (home_dir != NULL) {
            scommand_push_back(cmd, strdup(home_dir));
        }
        else {
            scommand_push_back(cmd, strdup("/"));
        }
    }

    int res = chdir(scommand_front(cmd));
    if (res != 0) {  //Si result es distinto de cero significa que algo salio mal
        perror("mybash: cd");
    }
}

static void builtin_run_help() {
    printf(
        "\nMYBASH.\n"
        "Las siguientes órdenes del intérprete están definidas internamente.\n\n"
        "cd: Se utiliza para moverse entre directorios.\n"
        "help: Brinda información acerca del intérprete y de la utilidad de los comandos internos que emplea.\n"
        "exit: Finaliza la ejecución de un script o cierra la sesión activa de la shell.\n\n"
        "GRUPO: Bucle Infinito.\n"
        "INTEGRANTES: Canovas, José Lorenzo - Carrozzo Sarnago, Imanol - Pastore, Ezequiel - Robledo Godoy, Mauro Gabriel.\n\n"
    );
}