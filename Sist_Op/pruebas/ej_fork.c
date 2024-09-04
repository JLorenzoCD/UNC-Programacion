#include <stdio.h>
#include <stdlib.h>

#include <unistd.h>     // fork, close, dup2, getpid
#include <fcntl.h>      // open, O_WRONLY, O_CREAT
#include <sys/stat.h>   // S_IWUSR, S_IRUSR

/*
*   Ejercicio
*   Utilizar fork, open, close y dup para crear dos procesos y redireccionar la
*   salida estándar de cada uno a un archivo lala.txt, donde cada uno imprima
*   un mensaje conteniendo su PID.
*
*   Pensar en qué orden realizar las llamadas, y asegurarse de cerrar todos los
*   file descriptors abiertos.
*/

int main(void) {
    char *filename = "lala.txt";

    int lala_file = open(filename, O_WRONLY | O_CREAT, S_IWUSR | S_IRUSR);
    // Desde aquí, cualquier salida estándar se escribirá en el archivo lala.txt
    dup2(lala_file, STDOUT_FILENO);
    close(lala_file);

    int fork_res = fork();
    int pid = getpid();

    if (fork_res < 0) {
        printf("Ocurrio un error al hacer fork!!");
        exit(EXIT_FAILURE);
    }
    else if (fork_res == 0) {
        printf("El el proceso hijo esta redireccionando a lala.txt con el PID = '%d'\n", pid);
    }
    else {
        printf("El el proceso padre esta redireccionando a lala.txt con el PID = %d, y el pid del proceso hijo es CHILD_PID = '%d'\n", pid, fork_res);
    }

    printf("Esta salida será redirigida al archivo lala.txt '2 VECES'\n");

    return EXIT_SUCCESS;
}