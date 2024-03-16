#include "array_helpers.h"

unsigned int array_from_file(int array[], unsigned int max_size, const char *filepath) {
    FILE *file = fopen(filepath, "r"); // Open mode READONLY

    unsigned int length;
    fscanf(file, "%u", &length);

    if (max_size < length) {
        printf("Only arrays with a maximum length of '%u' are allowed", max_size);
        exit(EXIT_FAILURE);
    }

    int x;
    for (unsigned int i = 0; i < length; i++) {
        fscanf(file, "%d", &x);
        array[i] = x;
    }

    fclose(file);

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

mybool array_is_sorted(int a[], unsigned int length) {
    if (length == 0 || length == 1) { return true; }

    for (unsigned int i = 0; i < length - 1; i++) {
        if (a[i + 1] < a[i]) { return false; }
    }

    return true;
}