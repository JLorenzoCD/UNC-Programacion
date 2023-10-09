# include <stdio.h>
# include <stdbool.h>
# include <assert.h>

char pedir_caracter();
bool es_vocal(char letra);

int main(void) {
    int letra = pedir_caracter();

    bool v = es_vocal(letra);

    printf("La letra ingresada %c, %s UNA VOCAL \n", letra, v ? "ES" : "NO ES");

    return 0;
}

bool es_vocal(char letra){
    return letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u' || letra == 'A' || letra == 'E' || letra == 'I' || letra == 'O' || letra == 'U';
}

char pedir_caracter(){
    char x;

    printf("Ingrese un caracter: ");
    scanf("%c", &x);

    return x;
}