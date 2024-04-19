#include <stdio.h>
#include <stdlib.h>

void absolute(int x, int y) {
  if (0 <= x) {
    y = x;
  } else {
    y = -x;
  }
}

int main(void) {
  int a = 0, res = 0;

  a = -10;
  absolute(a, res);

  printf("%d\n", res);

  return EXIT_SUCCESS;
}

/*
RTA: Se esperaba 10, se obtuvo 0
*/