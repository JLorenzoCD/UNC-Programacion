#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

// #define stdin  0
// #define stdout 1
#define stderr 2

#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

static void
ping_pong(int n)
{
  int semaforo_padre, semaforo_hijo, result;

  do {
    if ((semaforo_padre = sem_get()) == -1) {
      fprintf(stderr, "ERROR: Semaphore is not available.\n");
      exit(EXIT_FAILURE);
    }
    result = sem_open(semaforo_padre, 1);
  } while (result == 0); // 0 indica un error

  do {
    if ((semaforo_hijo = sem_get()) == -1) {
      sem_close(semaforo_padre);
      fprintf(stderr, "ERROR: Semaphore is not available.\n");
      exit(EXIT_FAILURE);
    }
    result = sem_open(semaforo_hijo, 0);
  } while (result == 0); // 0 indica un error

  int res = fork();
  if (res == 0){
    for(uint i = 1; i <= n; i++){
      sem_down(semaforo_hijo);
      printf("      pong\n");
      sem_up(semaforo_padre);
    }

    exit(EXIT_SUCCESS);
  }
  else if(res > 0){
    for(uint i = 1; i <= n; i++){
      sem_down(semaforo_padre);
      printf("ping\n");
      sem_up(semaforo_hijo);
    }
  }
  else{
    sem_close(semaforo_padre);
    sem_close(semaforo_hijo);
    fprintf(stderr, "ERROR: Something is wrong. Try again.\n");
    exit(EXIT_FAILURE);
  }

  wait(0);
  sem_close(semaforo_padre);
  sem_close(semaforo_hijo);
}

int
main(int argc, char const *argv[])
{
  if(argc != 2){
    fprintf(stderr, "ERROR: The argument must be only one.\n");
      exit(EXIT_FAILURE);
    }

  /*
    Vamos a asumir que los caracteres ingresados serán efectivamente numéricos, o por
    lo menos los primeros. Sino, debemos usar otra función que no asuma que si o si
    se le pasarán números.
  */
  int num = atoi(argv[1]); // Atoi devuelve 0 si hay algún error en la llamada.
  if(num <= 0){
    fprintf(stderr, "ERROR: The argument isn't a positive integer. \n");
    exit(EXIT_FAILURE);
  }

  ping_pong(num);

  return EXIT_SUCCESS;
}

