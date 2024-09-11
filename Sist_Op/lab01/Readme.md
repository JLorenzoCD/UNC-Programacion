# MYBASH
El proyecto consiste en desarrollar un shell denominado mybash, inspirado en el comportamiento de Bash (Bourne Again SHell), utilizando el lenguaje de programación C. Este programa pretende emular un entorno de línea de comandos básico, permitiendo la interacción del usuario con el sistema mediante la ejecución de comandos. El desarrollo de mybash requiere implementar varias funcionalidades clave, orientadas a replicar algunas de las características principales de los shells tradicionales:

### Funcionalidades Principales:
- Ejecución de Comandos en Foreground y Background: mybash permitirá la ejecución de comandos tanto en primer plano (foreground) como en segundo plano (background), similar a cómo lo hace Bash, proporcionando flexibilidad en la gestión de procesos.

- Redirección de Entrada y Salida Estándar: El shell debe soportar la redirección de la entrada y salida estándar (stdin, stdout), permitiendo redirigir la salida de comandos a archivos o leer la entrada desde un archivo, emulando las operaciones > y < habituales.

- Pipes entre Comandos: Se implementará la funcionalidad de tuberías (pipes), que permiten encadenar comandos de forma que la salida de un comando se convierta en la entrada de otro, usando el operador |.

### Comandos Internos a Implementar:
- cd: Cambiar el directorio de trabajo actual.
- help: Mostrar información sobre el uso y funcionalidades de mybash.
- exit: Salir del shell.
- Salida con CTRL-D (EOT): Permitir que el usuario salga del shell presionando CTRL-D.

### Robustez del Programa:
El shell puede manejar entradas incompletas y/o inválidas de manera robusta, evitando cierres inesperados o comportamientos erróneos.

### Detalles de Implementación:
- TADs Opacos: Se emplearán Tipos Abstractos de Datos (TADs) opacos para modularizar y encapsular la lógica del programa, promoviendo un código organizado y mantenible.
- Gestión de Memoria: Se debe asegurar que no se produzcan pérdidas de memoria, utilizando buenas prácticas en la gestión de recursos dinámicos.
- Buenas Prácticas de Programación: El código debe seguir estándares de estilo, modularización, nomenclatura clara de variables y funciones, y contar con comentarios que faciliten la comprensión y mantenimiento.


<br/>

# La importancia de este proyecto para el grupo
Este proyecto proporciona una excelente oportunidad para aplicar conocimientos avanzados de programación en C, manejo de procesos, gestión de memoria y diseño modular, mientras se trabaja en un entorno colaborativo para crear una herramienta funcional y robusta similar a un shell clásico de Unix.


<br/>

# Dependencias

Para poder compilar y ejecutar el proyecto, es necesario tener instaladas las siguientes herramientas:

```bash
sudo apt install build-essential libglib2.0-dev
```

Para testing, es necesario instalar las siguientes herramientas:
```bash
sudo apt check
```

<br/>

# Compilación

Para compilar el proyecto, simplemente ejecutar:

```bash
make
```

Se generará un archivo ejecutable con el nombre del proyecto, el cual se puede ejecutar con:

```bash
./mybash
```

<br/>

# Testing
#### Pruebas de command.c (scommand y pipeline):
```bash
make test-command
```

#### Pruebas de parsing.c:
```bash
make test-parsing
```

#### Pruebas para todos los módulos juntos:
```bash
make test
```

#### Pruebas de manejo de memoria en los módulos:
```bash
make memtest
```


<br/>

# Información del proyecto

### Directorio del proyecto
```bash
MYBASH
├── objects-i386    // Objetos necesarios para parser.h
│   ├── lexer.o
│   └── parser.o
├── objects-x86_64  // Objetos necesarios para parser.h
│   ├── lexer.o
│   └── parser.o
├── tests
│   ├── Makefile
│   └── {... archivos de testing}
├── Readme.md
├── Makefile
├── mybash.c
├── command.c
├── command.h
├── builtin.c
├── builtin.h
├── parsing.h
├── parsing.c
├── execute.c
├── execute.h
├── obfuscated.c
├── obfuscated.h
├── parser.h
├── prompt.c
├── prompt.h
├── strextra.c
└── strextra.h
```


## Sobre execute.c

Es posible ejecutar un pipeline de más de dos comandos.

Por otro lado, se tomó la decisión redireccionar STDIN y STDOUT a los pipes correspondientes, y después, si hay archivos de redirección especificados en el comando (scommand), se vuelve a redireccionar. Entonces, si se ingresa un comando de la forma


```
comando1 >out | comando2
```

lo que sucede es que `comando1` va a tener por `STDOUT` al archivo `OUT`, y `comando2` va a tener por STDIN un buffer que  está vacío, ya que el pipe tiene cerrado "el lado" de `comando1`.
Una cosa parecida sucede si se redirecciona `STDIN` a un archivo en un pipeline de varios comandos. Se cierra el pipe "de lectura" y no se lee nada del buffer, sino del archivo.

También, se guardan los PID de hasta 500 comandos para que luego se pueda llamar `waitpid` en ellos. Es un valor fijo que indica el tamaño del arreglo usado. No es un arreglo dinámico, si se pasa de ese límite va a haber problemas.


## Sobre parsing.c

Se guarda cada single command en una lista que contiene tanto su nombre como los argumentos que se le pasan y las redirecciones.
Mientras que no se haya llegado al fin del archivo y aún haya pipelines para leer, se sigue llamando a la función que parsea single commands.
También se incluye la posibilidad de lanzar procesos en el background y seguir ejecutando comandos.

Un detalle a tener en cuenta es que parsing no dispone de todas las posibilidades que sí podemos encontrar, por ejemplo, en Bash.
En nuestro programa, no se espera la lectura de variables de entorno (ej: echo $HOME). Básicamente porque el módulo de Parsing no espera recibir como argumento a ciertos comandos que sí existen en Bash. Otro caso que no contempla nuestra implementación, es el uso de las comillas 


## Sobre builtin.c

Se puede ejecutar correctamente los tres comandos internos brindados por la cátedra.

El funcionamiento del comando `cd` es a traves de la llamada al sistema `chdir()`.

El comando `help` brinda una breve información acerca de cada comando interno, el grupo y los nombres de los integrantes.

Y por ultimo para el comando `exit`, el cual simplemente consta de un `exit(1)`que finaliza el programa. La implementación de este ultimo comando fue una decision tomada en grupo, ya que no sabíamos exactamente como finalizar de una manera limpia el proceso.

<br/>

# Autores
### Creación, supervision y revision del proyecto (laboratorio)
> * Revisión 2024, Javier Mansilla, Pablo Ventura
> * Revisión 2023, Pablo Ventura
> * Revisión 2022, Marco Rocchietti
> * Revisión 2021, Facundo Bustos
> * Revisión 2020, Marco Rocchietti, Facundo Bustos
> * Revisión 2019, Milagro Teruel, Marco Rocchietti, Ignacio Moretti
> * Revisión 2011, 2012, 2013, Carlos S. Bederián
> * Revisión 2009, 2010, Daniel F. Moisset
> * Original 2008, Nicolás Wolovick

### Resulucion del proyecto (laboratorio)
> ### GRUPO: Bucle Infinito
> * Canovas, José Lorenzo
> * Carrozzo Sarnago, Imanol
> * Pastore, Ezequiel
> * Robledo Godoy, Mauro Gabriel