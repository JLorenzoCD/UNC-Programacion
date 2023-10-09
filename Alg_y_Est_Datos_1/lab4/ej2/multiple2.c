# include <stdio.h>
# include <assert.h>

#define X  7
#define Y  3
#define Z  5

int main(void) {
    int x = X;
    int y = Y;
    int z = Z;

    int aux1, aux2;

    assert(x == X && y == Y && z == Z);

    aux1 = x;
    aux2 = y;

    x = aux2;
    y = aux2 + aux1 + z;
    z = aux1 + aux2;

    assert(x == Y && z == Y + X && y == Y + X + Z);

    printf("X = %i,    Y = %i,    Z = %i\n", X, Y, Z);
    printf("x = %i,    y = %i,    z = %i\n", x, y, z);

    return 0;
}