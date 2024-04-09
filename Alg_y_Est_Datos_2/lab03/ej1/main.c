#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#define MAX_SIZE 1000

void print_help(char *program_name);
char *parse_filepath(int argc, char *argv[]);

unsigned int data_from_file(const char *path, unsigned int indexes[], char letters[], unsigned int max_size);
void sort_data_from_file(unsigned int length, unsigned int indexes[], char letters[], char sorted[]);

static void dump(char a[], unsigned int length) {
    printf("\"");
    for (unsigned int j = 0u; j < length; j++) {
        printf("%c", a[j]);
    }
    printf("\"");
    printf("\n\n");
}

int main(int argc, char *argv[]) {
    char *filepath = NULL;

    unsigned int indexes[MAX_SIZE];
    char letters[MAX_SIZE];
    char sorted[MAX_SIZE];

    filepath = parse_filepath(argc, argv);
    unsigned int length = data_from_file(filepath, indexes, letters, MAX_SIZE);

    sort_data_from_file(length, indexes, letters, sorted);

    dump(sorted, length);

    return EXIT_SUCCESS;
}

void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf(
        "Usage: %s <input file path>\n\n"
        "The program loads a data file from the hard drive in the following format:\n"
        "<int> -> *<char>*\n"
        "<int> -> *<char>*\n"
        "<int> -> *<char>*\n"
        "Where <int> is an integer belonging to the interval [0,1000) and <char> is a character, integers are not allowed to be repeated, the minimum must start at 0 and all integers must be up to the maximum integer found.\n"
        "\n\n"
        "Example:\n"
        "2 -> *l*\n"
        "0 -> *h*\n"
        "3 -> *a*\n"
        "4 -> *!*\n"
        "1 -> *o*\n",
        program_name
    );
}

char *parse_filepath(int argc, char *argv[]) {
    /* Parse the filepath given by command line argument. */
    char *result = NULL;
    // Program takes exactly two arguments
    // (the program's name itself and the input-filepath)
    bool valid_args_count = (argc == 2);

    if (!valid_args_count) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return result;
}

unsigned int data_from_file(const char *path, unsigned int indexes[], char letters[], unsigned int max_size) {
    FILE *file = fopen(path, "r");
    if (file == NULL) {
        printf("File does not exist.\n");
        exit(EXIT_FAILURE);
    }

    int fscanf_res;
    unsigned int index = 0;
    unsigned int max_index = 0;
    while (feof(file) == 0 && index < max_size) {
        fscanf_res = fscanf(file, "%u -> *%c*\n", &indexes[index], &letters[index]);
        if (fscanf_res != 2) {
            printf("Invalid format.\n");
            exit(EXIT_FAILURE);
        }

        if (max_index < indexes[index]) {
            max_index = indexes[index];
        }

        index += 1u;
    }

    if (max_index != (index - 1)) {
        printf("An index much larger than the number of elements was placed\n");
        exit(EXIT_FAILURE);
    }

    if (max_size <= index) {
        printf("The maximum number of elements that the file can contain is '%u'\n", max_size);
        exit(EXIT_FAILURE);
    }

    fclose(file);

    return index;
}

void sort_data_from_file(unsigned int length, unsigned int indexes[], char letters[], char sorted[]) {
    for (unsigned int i = 0; i < length; i++) {
        sorted[indexes[i]] = letters[i];
    }
}