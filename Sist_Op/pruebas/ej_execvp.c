#include <stdio.h>
#include <stdlib.h>

#include <unistd.h>     // execvp, dup2, close
#include <fcntl.h>      // open, O_WRONLY, O_CREAT
#include <sys/stat.h>   // S_IWUSR, S_IRUSR

static void ej_1(void);
static void ej_2(void);

static void ejemplo_de_execvp(void) {
    char *cmd = "ls";
    char *argv[3];

    argv[0] = "ls";
    argv[1] = "-la";
    argv[2] = NULL;

    // Esto corre "ls -la" como si lo ejecutáramos desde el bash
    execvp(cmd, argv);

    printf("There has been an error\n");
    exit(EXIT_FAILURE);
}

/*
*   EJERCICIO:
*   1. Implementar un programa que ejecute el comando cat /proc/cpuinfo.
*   2. Implementar un programa que ejecute el mismo comando y redirija la
*      salida estándar al archivo cpuinfo.txt
*/
int main(void) {
    // ejemplo_de_execvp();

    // ej_1();
    ej_2();

    return EXIT_SUCCESS;
}

static void ej_1(void) {
    char* args[] = { "cat", "/proc/cpuinfo", NULL };

    execvp(args[0u], args);
    perror("Error: no se pudo ejecutar el comando execvp.\n");
    exit(EXIT_FAILURE);
}

static void ej_2(void) {
    char* filename = "cpuinfo.txt";
    char* args[] = { "cat", "/proc/cpuinfo", NULL };

    int file_info = open(filename, O_WRONLY | O_CREAT, S_IWUSR | S_IRUSR);

    dup2(file_info, STDOUT_FILENO);
    close(file_info);

    execvp(args[0u], args);
    perror("Error: no se pudo ejecutar el comando execvp.\n");
    exit(EXIT_FAILURE);
}