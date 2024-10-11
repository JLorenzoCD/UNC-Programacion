# Lab02 - XV6 - Syscalls - Semáforos
El proyecto consiste en implementar un un sistema de Semáforos para espacio de usuario,
que sirven como mecanismo de sincronización entre procesos. Se implementarán en la
versión RISC-V de XV6 (sistema operativo con fines académicos) en espacio de kernel y
deberá proveer syscalls accesibles desde espacio de usuario.
Como los semáforos vienen en varios estilos, en este laboratorio vamos a implementar
sólo un estilo de semáforos llamado semáforos nombrados inspirándose en los
semáforos nombrados que define POSIX.

### Funcionalidades Principales:
**Semaforo:**  Implementación de 4 syscalls: *sem_open()*, *sem_up()*, *sem_down()*, *sem_close()*. También se implemento una función para la obtención de un semáforo abierto, llamada sem_get(). Sirven para sincronizar el acceso a recursos compartidos entre hilos (threads) o procesos.

**Pingpong:** Programa del Lado Usuario que sirve para testear el correcto funcionamiento de los semáforos.

### Robustez del Programa:
Las syscalls retornan mensajes de errores en caso de recibir parámetros inválidos o fuera de los rangos esperados por la función.
El programa pingpong imprime mensaje de error en caso de recibir parámetros inválidos o fuera de los rangos esperados.

### Detalles de Implementación:
- TADs Opacos: Se emplearán Tipos Abstractos de Datos (TADs) opacos (el semáforo se implementa usando un arreglo) para modularizar y encapsular la lógica del programa, promoviendo un código organizado y mantenible.
- Buenas Prácticas de Programación: El código debe respetar las convenciones de XV6, modularización, nomenclatura clara de variables y funciones, y contar con comentarios que faciliten la comprensión y mantenimiento.


<br/>

# La importancia de este proyecto para el grupo
Este proyecto nos proporcionó una excelente oportunidad para aplicar conocimientos avanzados de programación en C, manejo de procesos y diseño modular, mientras se trabajaba de manera colaborativa compartiendo ideas entre los integrantes del grupo que permitieran solucionar los desafíos e inconvenientes que el proyecto presentaba.

- Semáforos en XV6:
Aprender a implementarlos y utilizarlos en un entorno tan específico como xv6 fue importante para comprender mecanismos de sincronización, ampliamente utilizados en sistemas modernos, se implementan a bajo nivel. Esto es esencial para trabajar en entornos de sistemas operativos, kernels o programación de bajo nivel y evitar las 'condiciones de carrera' (race conditions).

- Manejo del Kernel:
El equipo aprende a integrar funcionalidades en el kernel de un SO real, lo que requiere una muy buena comprensión de cómo los procesos interactúan con el Sistema Operativo y entre sí.

- Implementación de Syscalls: El hecho de que los semáforos implementados sean accesibles desde el espacio de usuario mediante syscalls proporciona una comprensión directa de la comunicación entre el espacio de usuario y el kernel. Nos ayuda a entender cómo las aplicaciones pueden aprovechar las syscalls del sistema operativo, facilitando una programación más eficiente y controlada.


<br/>

# Dependencias

Para poder compilar y ejecutar el proyecto, es necesario tener instaladas las siguientes herramientas:

```bash
sudo apt-get install qemu-system-riscv64 gcc-riscv64-linux-gnu
```

<br/>

# Compilación

Para compilar el proyecto, simplemente ejecutar:

```bash
make
```

Una vez compilado, se puede ejecutar el S.O. XV6 con el siguiente comando:

```bash
make qemu
```

> ### Comandos y shortcuts útiles de XV6
> ● ls lista todos los programas de usuario disponibles del sistema.        <br/>
> ● **CRTL-p**: Lista todos los procesos que están corriendo en el sistema.   <br/>
> ● **CRTL-a** **x**: Sale del sistema operativo.                               <br/>

<br/>

# Testing
#### Pruebas para el programa pingpong
```bash
make grade
```


<br/>

# Información extra sobre el proyecto

## Sobre semaphores.c
```c
void            seminit(void);

// Syscalls
int             sem_open(int sem, int value);   // Canovas, José Lorenzo
int             sem_close(int sem);             // Robledo Godoy, Mauro Gabriel
int             sem_up(int sem);                // Imanol Carrozzo Sarnago
int             sem_down(int sem);              // Pastore, Ezequiel David
int             sem_get(void);
```
Para obtener información sobre cómo añadir una syscall al espacio de Kernel del SO, nos guiamos viendo el siguiente video de Youtube:
https://www.youtube.com/watch?v=21SVYiKhcwM

### Sobre la implementación
- Se decidió separar el código referido a los semáforos en un archivo aparte dentro de la carpeta kernel por un tema de organización.
- Los IDs de los semáforos son indices de un arreglo estático, en el cual se almacenan todos estos.
- Se definieron macros para manejar los valores de inicializaron de los semáforos (`SEM_CLOSED_VALUE`), las respuestas exitosas (`RES_SUCCESS`) y erróneas (`RES_ERROR`), y la cantidad maxima de semáforos disponibles (`MAX_SEM`).
- Se creo la fun `void seminit(void)`, para inicializar el valor de los semáforos ni bien se inicia el kernel tal que no sea necesario realizar validaciones referidas a si ya se inicializaron el semáforo en cada fun utilizada por el usuario.
- Se creo una fun aux `static int sem_id_is_valid(int sem_id)` el cual revisa que el ID (en este caso indice del array) sea valido, es decir, que este sea un entero dentro del rango de 0 a el MAX_SEM (cantidad de semáforos en el array).
- Se creo la fun `int sem_get(void)`, la cual retona un ID de un semáforo, el cual estaba en **ese momento estaba libre** . En caso de hacer open, puede ese semáforo ya no estar libre, es **responsabilidad del usuario validar y volver a buscar otro semáforo libre si es necesario**. Esta fun se creo para abstraer completamente al usuario (se penso que el usuario no debería saber sobre los posibles valores de los IDs).

## Sobre pingpong.c
Éste módulo fue implementado entre los 4 integrantes del grupo en una videollamada.

### Sobre la implementación
- Se asume que los caracteres ingresados son siempre numéricos. Esto puede dar un comportamiento raro, ya que por la forma en la que se encuentra implementada la fun `int atoi(const char *s)`, si se pasa un cadena no numérica, este retorna 0 (pingpong da error), si se le pasa una cadena que comienza con números (ejemplo: "24abc") retorna los números con el que empieza (siguiendo el ejemplo, retorna el entero "24") por lo que el programa se ejecuta con normalidad siempre que el numero sea valido para el programa.
- Se realiza las validaciones sobre los argumentos de la func `int main(void)` y se realiza la ejecución del programa en la fun `static void ping_pong(int n)`.

### Algunas consideraciones
El programa pingpong pasa todos los tests. Aun asi, se a notado que aveces se puede ejecutar el programa con argumentos validos, pero el SO tira error. Si se ejecuta 1 o 2 veces mas con otros valores validos, el programa se ejecuta de la forma esperada y se ejecuta bien incluso si se ejecuta con los valores que dieron error anteriormente.

El grupo no sabe a que se debe esta situación, se reviso el código y todo parece correcto, por lo que se asumió que puede ser por algún bug del SO.

<br/>

# Autores
### Creación, supervision y revision del proyecto/laboratorio
> #### Sistemas Operativos 2024 - FaMAF - UNC
> * Original 2014: Rafael Carrascosa
> * Versión 2017: Matías David Lee
> * Versión 2018: Ignacio Moretti
> * Versión 2022: Facundo Bustos
> * Versión 2023: Matias Cuenca


### Resulucion del proyecto/laboratorio
> #### GRUPO: Bucle Infinito
> * Canovas, José Lorenzo
> * Carrozzo Sarnago, Imanol
> * Pastore, Ezequiel
> * Robledo Godoy, Mauro Gabriel