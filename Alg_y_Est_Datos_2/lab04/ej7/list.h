#ifndef _LIST_H
#define _LIST_H

#include <stdbool.h>

typedef struct _node *list;
typedef int list_elem;


/* Constructors */
list empty_list(void);
/*
    Create a new list.
    Being l the returned list, is_empty_list(l) should be true.
*/

list addl_list(list_elem e, list l);
/*
    Adds the element e to the beginning of the list l.
*/


/* Operations */
bool is_empty_list(list l);
/*
    Returns True if l is empty.
*/

list_elem head_list(list l);
/*
    PRE: !is_empty_list(l).
    Returns the first element of the list l.
*/

list tail_list(list l);
/*
    PRE: !is_empty_list(l).
    Delete the first element of the list l.
*/

list addr_list(list l, list_elem e);
/*
    Adds element e to the end of list l.
*/

unsigned int length_list(list l);
/*
    Returns the number of elements in the list l.
*/

list concat_list(list l1, list l2);
/*
    Add all the elements of l2 to the end of l1 in the same order.
*/

list_elem index_list(list l, unsigned int n);
/*
    Returns the n-th element of the list l.
    PRE: length_list(l) > n
*/

list take_list(list l, unsigned int n);
/*
    Leave only the first n elements in it, eliminating the rest.
    PRE: length_list(l) > n
*/

list drop_list(list l, unsigned int n);
/*
    Remove the first n elements from l.
    PRE: length_list(l) > n
*/

list copy_list(list l1);
/*
    Copy all elements from l1 to the new list l2.
*/


/* Destroy */
list destroy_list(list l);
/*
    Frees memory for l.
*/

#endif
