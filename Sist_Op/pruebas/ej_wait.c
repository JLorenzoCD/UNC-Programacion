#include <stdio.h>
#include <stdlib.h>

#include <unistd.h>     // fork, execvp
#include <sys/wait.h>   // wait

/*
*   Ejercicio:
*   Usar todas las syscalls anteriores para ejecutar 10 programas que esperen durante 5 segundos de manera
*   concurrente (todos al mismo tiempo), y que imprima “listo” después de que todos los procesos hijos terminan de
*   ejecutarse.
*   En la vida real, reemplazaríamos el programa sleep por algo interesante como descargar archivos o renderizar
*   video.
*/
#define N_CHILDS 10
typedef unsigned int uint;

static void child_process(void);

int main(void) {
    int fork_res;

    for (uint i = 0u; i < N_CHILDS; i++) {
        fork_res = fork();

        if (fork_res < 0) {
            perror("Ocurrio un error al hacer fork!!\n");
            exit(EXIT_FAILURE);
        }
        else if (fork_res == 0) {
            child_process();

            perror("Error: la función 'execvp' ejecuto de la forma esperada.\n");
            exit(EXIT_FAILURE);
        }
        else {
            continue;
        }
    }

    int child_pid, state;
    for (uint i = 0u; i < N_CHILDS; i++) {
        child_pid = wait(&state);

        printf("El proceso hijo con PID=%d, termino su tarea con un estado '%s'.\n", child_pid, state == 0u ? "EXITOSO" : "FALLIDO");
    }


    return EXIT_SUCCESS;
}

static void child_process(void) {
    char* args[] = { "sleep", "5", NULL };

    execvp(args[0u], args);
}
