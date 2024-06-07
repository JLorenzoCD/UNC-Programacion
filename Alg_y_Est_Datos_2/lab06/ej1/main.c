/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "abb.h" /* TAD abb */

typedef enum { mostrar, agregar, eliminar, existencia, largo, info, salir } option_t;


static void clean_stdin() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
}

static void stop_terminal() {
    clean_stdin();

    printf(
        "\n\n"
        "Presiona Enter para continuar...\n"
    );
    while (getchar() != '\n');
}

static int get_int(const char text[]) {
    int abb_elem;

    int res = 0;
    do {
        printf("%s", text);
        res = scanf("%i", &abb_elem);

        if (res != 1) {
            printf(
                "\n"
                "Valor invalido.\n"
            );
        }
    } while (res != 1);

    return abb_elem;
}

static option_t uint_to_option(unsigned int option) {
    assert(option >= 1 && option <= 7);

    --option;
    return  (option_t)option;
}

static option_t get_option() {
    unsigned int op = 0;
    do {
        printf(
            "Selecciona una de las siguientes opciones:\n"
            "1 ........Mostrar árbol por pantalla.\n"
            "2 ........Agregar un elemento.\n"
            "3 ........Eliminar un elemento.\n"
            "4 ........Chequear existencia de elemento.\n"
            "5 ........Mostrar longitud del árbol.\n"
            "6 ........Mostrar raíz, máximo y mínimo del árbol.\n"
            "7 ........Salir.\n"
        );
        int res = scanf("%u", &op);

        if (res != 1 || !(op >= 1 && op <= 7)) {
            printf(
                "\n"
                "Opción invalida, la opción debe estar contenida entre 0 y 7.\n"
            );

            op = 0u;
        }
    } while (!(op >= 1 && op <= 7));

    return uint_to_option(op);
}

static abb interfaz(abb tree) {
    option_t op;
    int elem;

    do {
        op = get_option();
        printf("\n");

        switch (op) {
        case mostrar:
            abb_dump(tree, ABB_IN_ORDER);

            break;
        case agregar:
            elem = get_int("Ingrese el entero a añadir en el árbol binario:\n");
            tree = abb_add(tree, elem);
            printf("Se a añadido %i al árbol binario.\n", elem);

            break;
        case eliminar:
            if (!abb_is_empty(tree)) {
                elem = get_int("Ingrese el entero a eliminar del árbol binario:\n");
                tree = abb_remove(tree, elem);
                printf("Se a eliminado %i del árbol binario.\n", elem);
            }
            else {
                printf("\nÁrbol vacío\n");
            }

            break;
        case existencia:
            if (!abb_is_empty(tree)) {
                elem = get_int("Ingrese el entero que desea chequear si existe en el árbol binario:\n");
                bool exist = abb_exists(tree, elem);

                printf(
                    "El elemento '%i' %s en el árbol binario",
                    elem,
                    exist ? "EXISTE" : "NO EXISTE"
                );
            }
            else {
                printf("\nÁrbol vacío\n");
            }

            break;
        case largo:
            printf("El largo del árbol binario es de %u", abb_length(tree));
            break;

        case info:
            if (!abb_is_empty(tree)) {
                printf(
                    "Raíz: %d\n"
                    "Mínimo: %d\n"
                    "Máximo: %d\n",
                    abb_root(tree),
                    abb_min(tree),
                    abb_max(tree)
                );
            }
            else {
                printf("\nÁrbol vacío\n");
            }
            break;

        default:
            break;
        }

        if (op != salir) {
            stop_terminal();
        }
    } while (op != salir);

    return tree;
}

void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf(
        "Usage: %s <input file path>\n\n",
        program_name
    );
}

char *parse_filepath(int argc, char *argv[]) {
    /* Parse the filepath given by command line argument. */
    char *result = NULL;

    if (argc < 2) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return (result);
}

abb abb_from_file(const char *filepath) {
    FILE *file = NULL;
    abb read_tree;

    read_tree = abb_empty();
    file = fopen(filepath, "r");
    if (file == NULL) {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }

    unsigned int i = 0u;
    unsigned int size = 0u;

    int res = 0;
    res = fscanf(file, " %u ", &size);
    if (res != 1) {
        fprintf(stderr, "Invalid format.\n");
        exit(EXIT_FAILURE);
    }

    while (i < size) {
        abb_elem elem;
        res = fscanf(file, " %d ", &(elem));
        if (res != 1) {
            fprintf(stderr, "Invalid array.\n");
            exit(EXIT_FAILURE);
        }

        read_tree = abb_add(read_tree, elem);

        ++i;
    }
    fclose(file);

    return read_tree;
}

int main(int argc, char *argv[]) {
    char *filepath = NULL;

    /* parse the filepath given in command line arguments */
    filepath = parse_filepath(argc, argv);

    /* parse the file to obtain an abb with the elements */
    abb tree = abb_from_file(filepath);

    /*dumping the tree*/
    abb_dump(tree, ABB_IN_ORDER);

    if (!abb_is_empty(tree)) {
        printf("\n");
        printf(
            "raiz: %d\n minimo: %d\n maximo: %d\n",
            abb_root(tree),
            abb_min(tree),
            abb_max(tree)
        );
    }
    else {
        printf("\nÁrbol vacío\n");
    }

    // tree = abb_destroy(tree);

    // Iniciando el programa de interfaz gráfica para que el usuario realice ciertas acciones con los arboles binarios.
    // tree = abb_empty();
    tree = interfaz(tree);

    tree = abb_destroy(tree);

    return (EXIT_SUCCESS);
}
