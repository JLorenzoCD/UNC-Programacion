#include "prompt.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>

// Colores para la terminal (Se podría extraer en un modulo separado con la fun show_prompt)
#define COLOR_GREEN "\033[1;32m"  // Texto verde y negrita
#define COLOR_BLUE "\033[1;34m"   // Texto azul y negrita
#define COLOR_RESET "\033[0m"     // Reset a los colores predeterminados

static char* get_username(void);

void show_prompt(void) {
    // Obteniendo el nombre del usuario
    char *username = get_username();

    // Se obtiene el directorio actual
    char *cwd = getcwd(NULL, 0u);

    if (cwd == NULL || username == NULL) {
        printf(COLOR_BLUE "my_bash> " COLOR_RESET);
        fflush(stdout);
        return;
    }

    char *home_dir = getenv("HOME");

    if (home_dir == NULL) {
        // Se tiene el nombre de usuario, el directorio actual, pero no el home del usuario. Se pinta el nombre de 'usuario:~directorio_actual$'
        printf(COLOR_GREEN "%s:" COLOR_RESET COLOR_BLUE "~%s" COLOR_RESET "$ ", username, cwd);
        free(cwd); cwd = NULL;
        fflush(stdout);

        return;
    }

    // Verifica si el directorio actual comienza con $HOME
    size_t home_len = strlen(home_dir);
    if (strncmp(cwd, home_dir, home_len) == 0) { // Si coincide, elimina $HOME del inicio de la ruta
        printf(COLOR_GREEN "%s:" COLOR_RESET COLOR_BLUE "~%s" COLOR_RESET "$ ", username, cwd + home_len);
    }
    else {
        // Si no coincide, devuelve una copia de la ruta completa
        printf(COLOR_GREEN "%s:" COLOR_RESET COLOR_BLUE "~%s" COLOR_RESET "$ ", username, cwd);
    }

    free(cwd); cwd = NULL;
    fflush(stdout);
}


static char* get_username(void) {
    char *username = getenv("USER"); // Linux/MacOS
    if (username == NULL) {
        username = getenv("USERNAME"); // Windows
    }

    return username;
}
