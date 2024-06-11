#include <assert.h>
#include <stdlib.h>

#include "dict.h"
#include "key_value.h"

struct _node_t {
    dict_t left;
    dict_t right;
    key_t key;
    value_t value;
};

static bool invrep(dict_t d) {
    if (d != NULL) {
        if (d->left != NULL && !key_less(d->left->key, d->key)) {
            return false;
        }

        if (d->right != NULL && !key_less(d->key, d->right->key)) {
            return false;
        }

        return invrep(d->left) && invrep(d->right);
    }

    return true;
}

static bool dict_is_empty(dict_t dict) {
    bool is_empty = false;

    is_empty = dict == NULL;

    return is_empty;
}

static dict_t dict_merge(dict_t dict_dest, dict_t dict) {
    if (dict_is_empty(dict_dest)) {
        dict_dest = dict;
    }
    else if (dict_is_empty(dict)) {
        // skip
    }
    else {
        dict_dest = dict_add(dict_dest, dict->key, dict->value);

        dict_dest = dict_merge(dict_dest, dict->left);
        dict_dest = dict_merge(dict_dest, dict->right);

        // No libero las keys ni los values ya que se lo paso al otro dict
        free(dict);
        dict = NULL;
    }

    return dict_dest;
}

dict_t dict_empty(void) {
    dict_t dict = NULL;

    assert(invrep(dict) && dict_is_empty(dict));
    return dict;
}

dict_t dict_add(dict_t dict, key_t word, value_t def) {
    assert(invrep(dict));

    if (dict_is_empty(dict)) {
        dict = (dict_t)malloc(sizeof(struct _node_t));
        assert(dict != NULL);

        dict->left = NULL;
        dict->key = word;
        dict->value = def;
        dict->right = NULL;
    }
    else {
        if (key_less(word, dict->key)) {
            dict->left = dict_add(dict->left, word, def);
        }
        else if (key_less(dict->key, word)) {
            dict->right = dict_add(dict->right, word, def);
        }
        else {
            // key_eq(dict->key, word);
            word = key_destroy(word);

            dict->value = value_destroy(dict->value);
            dict->value = def;
        }
    }

    assert(invrep(dict) && dict_exists(dict, word));
    return dict;
}

value_t dict_search(dict_t dict, key_t word) {
    key_t def = NULL;

    if (!dict_is_empty(dict)) {
        if (key_eq(dict->key, word)) {
            def = dict->key;
        }
        else if (key_less(word, dict->key)) {
            def = dict_search(dict->left, word);
        }
        else {
            // key_less(dict->key, word)
            def = dict_search(dict->right, word);
        }
    }

    assert((def != NULL) == dict_exists(dict, word));
    return NULL;
}

bool dict_exists(dict_t dict, key_t word) {
    bool exists = false;
    assert(invrep(dict));

    if (!dict_is_empty(dict)) {
        if (key_eq(dict->key, word)) {
            exists = true;
        }
        else if (key_less(word, dict->key)) {
            exists = dict_exists(dict->left, word);
        }
        else {
            exists = dict_exists(dict->right, word);
        }
    }

    return exists;
}

unsigned int dict_length(dict_t dict) {
    unsigned int length = 0u;
    assert(invrep(dict));

    if (!dict_is_empty(dict)) {
        length = 1u + dict_length(dict->left) + dict_length(dict->right);
    }

    assert(invrep(dict) && (dict_is_empty(dict) || length > 0u));
    return length;
}

dict_t dict_remove(dict_t dict, key_t word) {
    assert(invrep(dict));
    dict_t temp = NULL;

    if (!dict_is_empty(dict)) {
        if (key_eq(dict->key, word)) {
            if (dict_is_empty(dict->left) && dict_is_empty(dict->right)) {
                dict->key = key_destroy(dict->key);
                dict->value = value_destroy(dict->value);

                free(dict);
                dict = NULL;
            }
            else if (dict_is_empty(dict->left)) {
                // Paso el contenido del nodo derecho al nodo actual
                dict->key = key_destroy(dict->key);
                dict->value = value_destroy(dict->value);
                dict->key = dict->right->key;
                dict->value = dict->right->value;

                dict->left = dict->right->left;

                temp = dict->right->right;

                // No libero las keys ni los values ya que se lo paso al nodo actual
                dict->right->left = NULL;
                dict->right->right = NULL;
                free(dict->right);
                dict->right = NULL;

                dict->right = temp;
            }
            else if (dict_is_empty(dict->right)) {
                // Paso el contenido del nodo izquierdo al nodo actual
                dict->key = key_destroy(dict->key);
                dict->value = value_destroy(dict->value);
                dict->key = dict->left->key;
                dict->value = dict->left->value;

                dict->right = dict->left->right;

                temp = dict->left->left;

                // No libero las keys ni los values ya que se lo paso al nodo actual
                dict->left->left = NULL;
                dict->left->right = NULL;
                free(dict->left);
                dict->left = NULL;

                dict->left = temp;
            }
            else {
                temp = dict->left;

                dict->key = key_destroy(dict->key);
                dict->value = value_destroy(dict->value);
                dict->key = temp->key;
                dict->value = temp->value;

                dict->left = temp->left;

                dict->right = dict_merge(dict->right, temp->right);

                // No libero las keys ni los values ya que se lo paso al otro dict
                free(temp);
            }
        }
        else if (key_less(word, dict->key)) {
            dict->left = dict_remove(dict->left, word);
        }
        else {
            dict->right = dict_remove(dict->right, word);
        }
    }

    assert(invrep(dict) && !dict_exists(dict, word));
    return dict;
}

dict_t dict_remove_all(dict_t dict) {
    assert(invrep(dict));

    dict = dict_destroy(dict);

    assert(invrep(dict) && dict_is_empty(dict) && dict_length(dict) == 0u);
    return dict;
}

void dict_dump(dict_t dict, FILE *file) {
    assert(invrep(dict) && file != NULL);

    if (!dict_is_empty(dict)) {
        dict_dump(dict->left, file);

        key_dump(dict->key, file);
        fprintf(file, ": ");
        value_dump(dict->value, file);
        fprintf(file, "\n");

        dict_dump(dict->right, file);
    }
}

dict_t dict_destroy(dict_t dict) {
    assert(invrep(dict));

    if (!dict_is_empty(dict)) {
        dict->key = key_destroy(dict->key);
        dict->value = value_destroy(dict->value);

        dict->left = dict_destroy(dict->left);
        dict->right = dict_destroy(dict->right);

        free(dict);
        dict = NULL;
    }

    assert(dict == NULL);
    return dict;
}

