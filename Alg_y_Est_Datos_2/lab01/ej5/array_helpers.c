#include "array_helpers.h"

unsigned int array_from_file(int array[], unsigned int max_size, const char *filepath) {
    FILE *file = fopen(filepath, "r"); // Open mode READONLY
    if (file == NULL) {
        printf("File does not exist.\n");
        exit(EXIT_FAILURE);
    }

    unsigned int length = 0;
    int fscanf_res = 0;

    fscanf_res = fscanf(file, "%u", &length);
    if (fscanf_res != 1) {
        printf("Invalid array.\n");
        exit(EXIT_FAILURE);
    }

    if (max_size < length) {
        printf("Only arrays with a maximum length of '%u' are allowed", max_size);
        exit(EXIT_FAILURE);
    }

    int x;
    for (unsigned int i = 0; i < length; i++) {
        fscanf_res = fscanf(file, "%d", &x);
        if (fscanf_res != 1) {
            printf("Invalid array.\n");
            exit(EXIT_FAILURE);
        }

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
    mybool is_sorted = true;

    for (unsigned int i = 0; i < length - 1 && is_sorted; i++) {
        is_sorted = a[i] <= a[i + 1];
    }

    return is_sorted;
}