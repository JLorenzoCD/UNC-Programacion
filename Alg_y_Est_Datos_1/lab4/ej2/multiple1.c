# include <stdio.h>
# include <assert.h>

#define X -500
#define Y 40

int main(void){
    int aux;

    int x = X;
    int y = Y;

    assert(x == X && y == Y);

    aux = x;
    x += 1;
    y += aux;

    assert(x == X + 1 && y == X + Y);

    printf("X = %i, \tY = %i\n", X, Y);
    printf("x = %i, \ty = %i\n", x, y);

    return 0;
}