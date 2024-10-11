#include "types.h"      // uint
#include "riscv.h" //para que no tire error
#include "defs.h"       // initlock
#include "param.h"
#include "spinlock.h"   // struct spinlock


#define MAX_SEM 128u

#define RES_ERROR 0
#define RES_SUCCESS 1

// Valor imposible, ya que por enunciado debe ser mayor a cero, por lo que sirve para indicar que el semáforo no esta en uso
#define SEM_CLOSED_VALUE -1

struct semaphore {
  int val;                    // val >= 0
  struct spinlock lck;
};


// Variable global del modulo para manejar los semáforos
static struct semaphore sem_arr[MAX_SEM];


/*
*   Fun encargada de validar si el sem_id pasado por el usuario es valido.
*   Si lo es retorna RES_SUCCESS (1), caso contrario, pinta un mensaje de
*   error por pantalla y retorna RES_ERROR (0)
*/
static int sem_id_is_valid(int sem_id);


//* Fun encargada de inicializar la variable global 'sem_arr' al iniciar el kernel
void
seminit(void)
{
  for (uint i = 0u; i < MAX_SEM; i++){
    sem_arr[i].val = SEM_CLOSED_VALUE;

    initlock(&(sem_arr[i].lck), "__sem__");
  }
}

/*
*   Fun encargada de buscar algún semáforo libre y retornar su ID. En caso de no
*   encontrar algún semáforo libre o de algún error, esta retorna (-1).
*/
int
sem_get(void)
{
  ushort was_selected = 0;

  int sem_index = 0;
  while (!was_selected && sem_index < MAX_SEM)
  {
    acquire(&(sem_arr[sem_index].lck));     // Inicio de Zona critica
    if(sem_arr[sem_index].val == SEM_CLOSED_VALUE){
      was_selected = 1;
    }
    release(&(sem_arr[sem_index].lck));     // Fin de Zona critica

    ++sem_index;
  }
  sem_index--; // Se resta 1, ya que si selecciono algún semáforo se le sumo 1 en el ultimo ciclo

  // Si was_selected es 1, entonces se encontró algún semáforo libre y se retorna su indice (ID del semáforo)
  return was_selected ? sem_index : (-1);
}

int
sem_open(int sem, int value)
{
  int res = RES_ERROR;

  if (!sem_id_is_valid(sem)) return res;

  if(value < 0){
    //printf("ERROR: the semaphore's value must be positive.\n");
    return res;
  }

  acquire(&(sem_arr[sem].lck));

  if (sem_arr[sem].val == SEM_CLOSED_VALUE) {
    sem_arr[sem].val = value;

    res = RES_SUCCESS;
  }
  else{
    //printf("Error: semaphore with ID '%d' is already open.\n", sem);
  }

  release(&(sem_arr[sem].lck));

  return res;
}


int
sem_close(int sem)
{
  int res = RES_ERROR;

  if (!sem_id_is_valid(sem)) return res;

  acquire(&(sem_arr[sem].lck));

  if (sem_arr[sem].val == SEM_CLOSED_VALUE) {
    //printf("Error: semaphore with ID %d is already closed.\n", sem);
  }
  else{
    sem_arr[sem].val = SEM_CLOSED_VALUE;
    res = RES_SUCCESS;
  }

  release(&(sem_arr[sem].lck));

  return res;
}

int
sem_up(int sem)
{        // --- Imanol ---
  if (!sem_id_is_valid(sem)) return RES_ERROR;

  acquire (&sem_arr[sem].lck); // Adquiero el lock para entrar a la zona critica.

  if (sem_arr[sem].val == SEM_CLOSED_VALUE) {  // Chequeo que el semaforo no este cerrado previamente.
    //printf("Error: semaphore with ID %d is closed.\n", sem);
    return RES_ERROR;
    }

  if (sem_arr[sem].val == 0 ) {
    wakeup(&sem_arr[sem]);
  }

  sem_arr[sem].val++;

  release(&sem_arr[sem].lck); // Libero el lock saliendo de la zona critica.

  return RES_SUCCESS;
}


int
sem_down(int sem)
{
  if (!sem_id_is_valid(sem)) return RES_ERROR; // Chequeo que el id del semáforo sea valido.

  if (sem_arr[sem].val == SEM_CLOSED_VALUE) {  // Chequeo que el semáforo no este cerrado previamente.
    //printf("Error: semaphore with ID %d is closed.\n", sem);
    return RES_ERROR;
    }

  acquire(&(sem_arr[sem].lck));  // Tomo el lock, ya que entro a una sección critica.

  while(sem_arr[sem].val == 0){
    sleep(&(sem_arr[sem]), &(sem_arr[sem].lck));  // Se pone a dormir el proceso que quizo decrementar el semáforo teniendo valor igual a 0.
  }

  sem_arr[sem].val--;  // Decremento el valor del semáforo en 1.

  release(&sem_arr[sem].lck);  // Libero el lock, ya que salí de la sección critica.

  return RES_SUCCESS;
}


static int
sem_id_is_valid(int sem_id)
{
  if (sem_id < 0 || sem_id >= MAX_SEM) { // Se implemento los semáforos como un arreglo, donde sem_id es un indice de un semáforo.
    //printf("Error: the semaphore ID is invalid.\n");
    return RES_ERROR;
  }

  return RES_SUCCESS;
}
