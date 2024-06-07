#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "abb.h"

struct _s_abb {
    abb_elem elem;
    struct _s_abb *left;        // Menor estricto
    struct _s_abb *right;       // Mayor estricto
};

static bool elem_eq(abb_elem a, abb_elem b) {
    return a == b;
}

static bool elem_less(abb_elem a, abb_elem b) {
    return a < b;
}

static bool invrep(abb tree) {
    if (tree != NULL) {
        if (tree->left != NULL && !elem_less(tree->left->elem, tree->elem)) {
            return false;
        }

        if (tree->right != NULL && !elem_less(tree->elem, tree->right->elem)) {
            return false;
        }

        return invrep(tree->left) && invrep(tree->right);
    }

    return true;
}

static abb abb_merge(abb tree_dest, abb tree) {
    if (abb_is_empty(tree_dest)) {
        tree_dest = tree;
    }
    else if (abb_is_empty(tree)) {
        // skip
    }
    else {
        tree_dest = abb_add(tree_dest, tree->elem);

        tree_dest = abb_merge(tree_dest, tree->left);
        tree_dest = abb_merge(tree_dest, tree->right);

        free(tree);
        tree = NULL;
    }

    return tree_dest;
}

abb abb_empty(void) {
    abb tree;

    tree = NULL;

    assert(invrep(tree) && abb_is_empty(tree));
    return tree;
}

abb abb_add(abb tree, abb_elem e) {
    assert(invrep(tree));

    if (abb_is_empty(tree)) {
        tree = (abb)malloc(sizeof(struct _s_abb));
        assert(!abb_is_empty(tree));

        tree->left = NULL;
        tree->elem = e;
        tree->right = NULL;
    }
    else {
        if (elem_less(e, tree->elem)) {
            tree->left = abb_add(tree->left, e);
        }
        else if (elem_less(tree->elem, e)) {
            tree->right = abb_add(tree->right, e);
        }
        else {
            // elem_eq(tree->elem, e);
            // skip
        }
    }

    assert(invrep(tree) && abb_exists(tree, e));
    return tree;
}

bool abb_is_empty(abb tree) {
    bool is_empty = false;
    assert(invrep(tree));

    is_empty = tree == NULL;

    return is_empty;
}

bool abb_exists(abb tree, abb_elem e) {
    bool exists = false;
    assert(invrep(tree));

    if (!abb_is_empty(tree)) {
        if (elem_eq(tree->elem, e)) {
            exists = true;
        }
        else if (elem_less(e, tree->elem)) {
            exists = abb_exists(tree->left, e);
        }
        else {
            exists = abb_exists(tree->right, e);
        }
    }

    assert(abb_length(tree) != 0 || !exists);
    return exists;
}

unsigned int abb_length(abb tree) {
    unsigned int length = 0;
    assert(invrep(tree));

    if (!abb_is_empty(tree)) {
        length = 1u + abb_length(tree->left) + abb_length(tree->right);
    }

    assert(invrep(tree) && (abb_is_empty(tree) || length > 0));
    return length;
}

abb abb_remove(abb tree, abb_elem e) {
    assert(invrep(tree));
    abb temp = NULL;

    if (!abb_is_empty(tree)) {
        if (elem_eq(tree->elem, e)) {
            if (abb_is_empty(tree->left) && abb_is_empty(tree->right)) {
                free(tree);
                tree = NULL;
            }
            else if (abb_is_empty(tree->left)) {
                tree->elem = tree->right->elem;
                tree->left = tree->right->left;

                temp = tree->right->right;
                free(tree->right);
                tree->right = temp;
            }
            else if (abb_is_empty(tree->right)) {
                tree->elem = tree->left->elem;
                tree->right = tree->left->right;

                temp = tree->left->left;
                free(tree->left);

                tree->left = temp;
            }
            else {
                temp = tree->left;
                tree->elem = temp->elem;
                tree->left = temp->left;

                tree->right = abb_merge(tree->right, temp->right);

                free(temp);
            }
        }
        else if (elem_less(e, tree->elem)) {
            tree = abb_remove(tree->left, e);
        }
        else {
            tree = abb_remove(tree->right, e);
        }
    }

    assert(invrep(tree) && !abb_exists(tree, e));
    return tree;
}

abb_elem abb_root(abb tree) {
    abb_elem root;
    assert(invrep(tree) && !abb_is_empty(tree));

    root = tree->elem;

    assert(abb_exists(tree, root));
    return root;
}

abb_elem abb_max(abb tree) {
    abb_elem max_e;
    assert(invrep(tree) && !abb_is_empty(tree));

    if (!abb_is_empty(tree) && abb_is_empty(tree->right)) {
        max_e = tree->elem;
    }
    else {
        max_e = abb_max(tree->right);
    }

    assert(invrep(tree) && abb_exists(tree, max_e));
    return max_e;
}

abb_elem abb_min(abb tree) {
    abb_elem min_e;
    assert(invrep(tree) && !abb_is_empty(tree));

    if (!abb_is_empty(tree) && abb_is_empty(tree->left)) {
        min_e = tree->elem;
    }
    else {
        min_e = abb_min(tree->left);
    }

    assert(invrep(tree) && abb_exists(tree, min_e));
    return min_e;
}

void abb_dump(abb tree, abb_ordtype ord) {
    assert(invrep(tree) && (ord == ABB_IN_ORDER || ord == ABB_PRE_ORDER || ord == ABB_POST_ORDER));
    /*
     * c) Needs implementation: use the dump order indicated by `ord`
     *
     */

     // Implementing in-order as default
    if (tree != NULL) {
        abb_dump(tree->left, ord);
        printf("%d ", tree->elem);
        abb_dump(tree->right, ord);
    }
}

abb abb_destroy(abb tree) {
    assert(invrep(tree));

    if (!abb_is_empty(tree)) {
        tree->left = abb_destroy(tree->left);
        tree->right = abb_destroy(tree->right);

        free(tree);
        tree = NULL;
    }

    assert(tree == NULL);
    return tree;
}

