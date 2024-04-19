#include <stdio.h>
#include <stdlib.h>

void swap(int *a, int *b) {
    int aux = *a;
    *a = *b;
    *b = aux;
}

int main(void) {
    int a = 6;
    int b = 4;

    printf("a = %d, b = %d\n", a, b);
    swap(&a, &b);
    printf("a = %d, b = %d\n", a, b);

    return EXIT_SUCCESS;
}