#include <stdio.h>
#include <stdlib.h>

#include <unistd.h>     // dup2, close
#include <fcntl.h>      // open, O_WRONLY, O_CREAT
#include <sys/stat.h>   // S_IWUSR, S_IRUSR

/*
*   Ejercicio
*   Pensar en cómo utilizar las llamadas a sistema open, dup y close para poder
*   redireccionar la salida estándar del proceso actual.
*/

int main() {
    char *filename = "lala.txt";
    // Abrir el archivo lala.txt con permisos de escritura, creando el archivo si no existe (con permisos de escritura "S_IWUSR", y de lectura para poder leerlo "S_IRUSR")
    int lala_file = open(filename, O_WRONLY | O_CREAT, S_IWUSR | S_IRUSR);

    dup2(lala_file, STDOUT_FILENO);
    close(lala_file);

    // Desde aquí, cualquier salida estándar se escribirá en el archivo lala.txt
    printf("Esta salida será redirigida al archivo, lala.txt\n");

    return EXIT_SUCCESS;
}