#ifndef ARRAY_HELPERS_MODULE
#define ARRAY_HELPERS_MODULE
#pragma once // En toeoria solo con esta linea al incicio bastaria, pero al aprecer no es standar a si que se utiliza el #ifndef ....

// Standard libs
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

// My modules
#include "mybool.h"

unsigned int array_from_file(int array[], unsigned int max_size, const char *filepath);
void array_dump(int a[], unsigned int length);

mybool array_is_sorted(int a[], unsigned int length);
#endif