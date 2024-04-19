#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

void absolute(int x, int *y) {
  if (0 <= x) {
    *y = x;
  } else {
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
