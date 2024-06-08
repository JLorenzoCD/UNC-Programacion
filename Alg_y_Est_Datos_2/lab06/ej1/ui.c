#include <assert.h>
#include <stdbool.h>
#include <stdio.h>

#include "ui.h"
#include "abb.h"


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

abb interfaz(abb tree) {
    option_t op;
    abb_elem elem;

    do {
        op = get_option();
        printf("\n");

        switch (op) {
        case mostrar:
            abb_dump(tree, ABB_IN_ORDER);

            break;
        case agregar:
            elem = (abb_elem)get_int("Ingrese el entero a añadir en el árbol binario:\n");
            tree = abb_add(tree, elem);
            printf("Se a añadido %i al árbol binario.\n", elem);

            break;
        case eliminar:
            if (!abb_is_empty(tree)) {
                elem = (abb_elem)get_int("Ingrese el entero a eliminar del árbol binario:\n");
                tree = abb_remove(tree, elem);
                printf("Se a eliminado %i del árbol binario.\n", elem);
            }
            else {
                printf("\nÁrbol vacío\n");
            }

            break;
        case existencia:
            if (!abb_is_empty(tree)) {
                elem = (abb_elem)get_int("Ingrese el entero que desea chequear si existe en el árbol binario:\n");
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