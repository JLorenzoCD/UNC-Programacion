#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

void absolute(int x, int *y) {
  if (0 <= x) {
    *y = x;
  }
  else {
    *y = -x;
  }
}

int main(void) {
  int a = 0, res = 0; // No modificar esta declaración
  // --- No se deben declarar variables nuevas ---

  a = -10;
  absolute(a, &res);

  printf("%d\n", res);

  assert(res >= 0 && (res == a || res == -a));

  return EXIT_SUCCESS;
}

/*
  --------- C
  ¿El parámetro int *y de absolute() es de tipo in, de tipo out o de tipo in/out?
  El parámetro int *y de absolute() es de tipo in/out, ya que puedo leer y modificarlo con el puntero aunque en el ejercicio se utiliza solo como tipo out

  ¿Qué tipo de parámetros tiene disponibles C para sus funciones?
  Tiene disponible los tipos in y in/out, aunque se puede decir que tambien tiene el out si el valor del puntero no se lee
*/