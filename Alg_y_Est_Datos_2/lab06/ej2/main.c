#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "string.h"

int main(void) {

    string str1 = string_create("String 1");
    string str2 = string_create("String 2");

    bool eq = string_eq(str1, str2);        // False
    bool less = string_less(str1, str2);    // True

    printf(
        "Los strings son:\n"
        "1: %s\n"
        "2: %s\n"
        "Estos son iguales? %s son iguales.\n"
        "El string 1 es menor al string 2? %s es menor.\n",
        string_ref(str1),
        string_ref(str2),
        eq ? "SI" : "NO",
        less ? "SI" : "NO"
    );

    return EXIT_SUCCESS;
}
