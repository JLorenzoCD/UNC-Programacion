# include <stdio.h>
# include <assert.h>

typedef struct{
    int cociente;
    int resto;
} div_t;

int pedir_entero(char name);
div_t division(int x, int y);


int main(void){
    int x = pedir_entero('x');
    int y = pedir_entero('y');

    if(y == 0){
        printf("Error: no se puede dividir por cero\n");
    }else{
        div_t d = division(x, y);
        printf("%d / %d = %d * %d + %d\n", x, y, y, d.cociente, d.resto);
    }

    return 0;
}

int pedir_entero(char name){
    int x;

    printf("Asignar valor de %c: ", name);
    scanf("%i", &x);

    return x;
}

div_t division(int x, int y){
    assert(0 <= x && 0 < y);
    div_t d;

    d.resto = x % y;
    d.cociente = (x - d.resto) / y;

    return d;
};