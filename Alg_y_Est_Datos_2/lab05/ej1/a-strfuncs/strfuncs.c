#include <assert.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#include "strfuncs.h"

size_t string_length(const char *str) {
    size_t len = 0u;

    while (str[len] != '\0') {
        len++;
    }

    return len;
}

char *string_filter(const char *str, char c) {
    size_t len = string_length(str);

    size_t len_filter = len;
    for (size_t i = 0; i < len; i++) {
        if (str[i] == c) {
            len_filter--;
        }
    }

    char *filter = NULL;
    filter = (char*)malloc(sizeof(char) * len_filter);
    if (filter == NULL) {
        printf("Not enough memory\n");
        exit(EXIT_FAILURE);
    }

    size_t i, j;
    i = 0u;
    j = 0u;
    while (i < len) {
        if (str[i] != c) {
            filter[j] = str[i];

            j++;
        }

        i++;
    }

    assert(i == len && j == len_filter);

    return filter;
}

bool string_is_symmetric(const char *str) {
    bool is_symetric = true;
    size_t len = string_length(str);

    if (len != 0u) {
        for (size_t i = 0u; i < (len / 2) && is_symetric; i++) {
            if (str[i] != str[len - 1u - i]) {
                is_symetric = false;
            }
        }
    }

    return is_symetric;
}