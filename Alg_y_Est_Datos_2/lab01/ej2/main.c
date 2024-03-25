// $ gcc -Wall -Werror -Wextra -pedantic -std=c99 -o reader main.c && ./reader

/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

/* Maximum allowed length of the array */
#define MAX_SIZE 100000

unsigned int array_from_stdin(int array[], unsigned int max_size) {
    unsigned int length = 0;

    // Set length
    printf("Set the length of the array (MAX LENGTH=%u): ", max_size);
    if (scanf("%u", &length) != 1) {
        printf("Error reading array length\n");
        exit(EXIT_FAILURE);
    }

    if (max_size < length) {
        printf("Only arrays with a maximum length of '%u' are allowed\n", max_size);
        exit(EXIT_FAILURE);
    }

    printf("\n");
    int x;
    for (unsigned int i = 0; i < length; i++) { // Set items
        printf("arr[%u] = ", i);
        if (scanf("%d", &x) != 1) {
            printf("Invalid array.\n");
            exit(EXIT_FAILURE);
        }

        array[i] = x;
    }

    return length;
}

void array_dump(int a[], unsigned int length) {
    printf("\n[");
    for (unsigned int i = 0; i < length; i++) {
        printf("%d", a[i]);

        if (i + 1 < length) {
            printf(", ");
        }
    }
    printf("]\n\n");
}

int main() {
    /* create an array of MAX_SIZE elements */
    int array[MAX_SIZE];

    /* using stdin to fill array and get actual length */
    unsigned int length = array_from_stdin(array, MAX_SIZE);

    /*dumping the array*/
    array_dump(array, length);

    return EXIT_SUCCESS;
}
