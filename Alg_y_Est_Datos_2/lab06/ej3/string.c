#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "string.h"

struct _s_string {
    char *content;
    unsigned int length;
};

string string_create(const char *word) {
    string str = NULL;

    str = calloc(1u, sizeof(struct _s_string));
    assert(str != NULL);

    str->length = strlen(word);
    str->content = calloc(str->length + 1u, sizeof(char));

    str->content = strncpy(str->content, word, str->length + 1u);

    return (str);
}

unsigned int string_length(string str) {
    return (str->length);
}

bool string_less(const string str1, const string str2) {
    /*
    "man strcmp"
    Return:
    • 0, if the s1 and s2 are equal;
    • a negative value if s1 is less than s2;
    • a positive value if s1 is greater than s2.
     */

    int cmp = strcmp(str1->content, str2->content);
    return (cmp < 0);
}

bool string_eq(const string str1, const string str2) {
    int cmp = strcmp(str1->content, str2->content);
    return (cmp == 0);
}

string string_clone(const string str) {
    return (string_create(str->content));
}

string string_destroy(string str) {
    free(str->content);
    str->content = NULL;

    free(str);
    str = NULL;

    return str;
}

void string_dump(string str, FILE *file) {
    fprintf(file, "%s", str->content);
}

const char *string_ref(string str) {
    return (str->content);
}
