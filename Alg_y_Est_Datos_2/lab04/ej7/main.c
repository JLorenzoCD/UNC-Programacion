/* First, the standard lib includes, alphabetically ordered */
#include <stdio.h>
#include <stdlib.h>

/* Then, this project's includes, alphabetically ordered */
#include "array_helpers.h"
#include "list.h"

/* Maximum allowed length of the array */
static const unsigned int MAX_SIZE = 100000u;

void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf(
        "Usage: %s <input file path>\n\n"
        "Compute average for the list of numbers in file.\n"
        "\n",
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

/* float average_2(list l) {
    unsigned int length = length_list(l);
    int sum = 0u;

    for (unsigned int i = 0u; i < length; i++) {
        sum += index_list(l, i);
    }

    return (length == 0u ? 0u : (float)sum / length);
} */

float average(list l) {
    unsigned int length = length_list(l);
    list_elem sum = 0u;

    list temp = copy_list(l);
    while (!is_empty_list(temp)) {
        sum += head_list(temp);
        tail_list(&temp);
    }

    destroy_list(&temp);

    return (length == 0u ? 0u : (float)sum / length);
}

list array_to_list(int array[], unsigned int length) {
    list l = empty_list();

    for (unsigned int i = 0u; i < length; ++i) {
        addr_list(&l, array[i]);
    }

    return l;
}

int main(int argc, char *argv[]) {
    char *filepath = NULL;

    /* parse the filepath given in command line arguments */
    filepath = parse_filepath(argc, argv);

    /* create an array of MAX_SIZE elements */
    int array[MAX_SIZE];

    /* parse the file to fill the array and obtain the actual length */
    unsigned int length = array_from_file(array, MAX_SIZE, filepath);

    /* show the array in the screen */
    array_dump(array, length);

    /* transform from array to our list type */
    list l = array_to_list(array, length);

    /* call the average function */
    printf("The average is: %.2f \n", average(l));

    // printf("The average_1 is: %.2f \n", average_2(l));

    // Probando algunos procedimientos de la lista
    /*
    printf("\n");
    printf("\n");
    printf("\n");

    int xa[] = { 1,2,3,4,5 };
    int ya[] = { 6,7,8,9,10 };

    list x = array_to_list(xa, 5u);
    list y = array_to_list(ya, 5u);

    concat_list(&x, y);
    for (unsigned int i = 0; i < 10u; i++) {
        printf("%d, ", index_list(x, i));
    }
    printf("\n");

    take_list(&x, 8u);
    for (unsigned int i = 0; i < 8u; i++) {
        printf("%d, ", index_list(x, i));
    }
    printf("\n");

    drop_list(&x, 2u);
    for (unsigned int i = 0; i < 6u; i++) {
        printf("%d, ", index_list(x, i));
    }

    printf("\n");
    printf("\n");

    destroy_list(&x);
    destroy_list(&y);
    */

    destroy_list(&l);

    return (EXIT_SUCCESS);
}
