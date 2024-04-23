#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "data.h"

void print_data(data_t d) {
    printf(
        "NOMBRE: %s\n"
        "EDAD  : %d años\n"
        "ALTURA: %d cm\n\n",
        d.name, d.age, d.height
    );
}

int main(void) {

    data_t messi = { "Leo Messi", 36, 169 };
    print_data(messi);

    printf(
        "name-size  : %lu bytes\n"
        "age-size   : %lu bytes\n"
        "height-size: %lu bytes\n"
        "data_t-size: %lu bytes\n\n",
        sizeof(messi.name),
        sizeof(messi.age),
        sizeof(messi.height),
        sizeof(messi)
    );
    /*
    OUTPUT:
        name-size  : 30 bytes
        age-size   : 4 bytes
        height-size: 4 bytes
        data_t-size: 40 bytes

    La estructura tiene 2 bytes mas que la suma de sus elementos.
    El tamaño de name esta fijado por NAME_MAXSIZE, por lo que cualquier nombre va a ocupar lo mismo.
    */

    printf(
        "name-size  : %p memory address\n"
        "age-size   : %p memory address\n"
        "height-size: %p memory address\n"
        "data_t-size: %p memory address\n\n",
        &(messi.name[0]),
        (void *)&messi.age,
        (void *)&messi.height,
        (void *)&messi
    );
    /*
    OUTPUT
        name-size  : 0x7ffe392c7b10 memory address
        age-size   : 0x7ffe392c7b30 memory address
        height-size: 0x7ffe392c7b34 memory address
        data_t-size: 0x7ffe392c7b10 memory address
    */

    printf(
        "name-size  : %lu memory index\n"
        "age-size   : %lu memory index\n"
        "height-size: %lu memory index\n"
        "data_t-size: %lu memory index\n\n",
        (uintptr_t)&messi.name,
        (uintptr_t)&messi.age,
        (uintptr_t)&messi.height,
        (uintptr_t)&messi
    );
    /*
    OUTPUT
        name-size  : 140729857637136 memory index
        age-size   : 140729857637168 memory index
        height-size: 140729857637172 memory index
        data_t-size: 140729857637136 memory index

    Difieren los 2 ultimos digitos.
    La direccion de memoria del nombre es el mismo que el de la estructura, la edad esta a 32 bytes de el nombre y la altura a 4 bytes de la edad.

    Teniendo en cuenta que la estructura ocupa 40 bytes, si 140729857637136 es el inicio, entonce 140729857637176 es el final de la estructura, mostrando que la altura ocupa 4 bytes.

    En cuanto a los 2 bytes extra debe estar entre el nombre y la edad.
    */

    return EXIT_SUCCESS;
}

