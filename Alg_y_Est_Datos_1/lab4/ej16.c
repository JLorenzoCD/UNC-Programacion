# include <stdio.h>

typedef struct _persona {
    char *nombre;
    int edad;
    float altura;
    float peso;
} persona_t;

float peso_promedio(unsigned int longitud, persona_t arr[]);
persona_t persona_de_mayor_edad(unsigned int longitud, persona_t arr[]);
persona_t persona_de_menor_altura(unsigned int longitud, persona_t arr[]);

int main(void) {
    persona_t p1 = {.nombre="Paola", .edad=21, .altura=1.85, .peso=75};
    persona_t p2 = {.nombre="Luis", .edad=54, .altura=1.75, .peso=69};
    persona_t p3 = {.nombre="Julio", .edad=40, .altura=1.70, .peso=80};

    unsigned int longitud = 3;
    persona_t arr[] = {p1, p2, p3};

    printf("El peso promedio es %f\n", peso_promedio(longitud, arr));

    persona_t p = persona_de_mayor_edad(longitud, arr);
    printf("El nombre de la persona con mayor edad es %s\n", p.nombre);

    p = persona_de_menor_altura(longitud, arr);
    printf("El nombre de la persona con menor altura es %s\n", p.nombre);

    return 0;
}

float peso_promedio(unsigned int longitud, persona_t arr[]){
    float peso_total = 0;

    for(unsigned int i = 0; i < longitud; i++){
        peso_total += arr[i].peso;
    }

    return peso_total/longitud;
}

persona_t persona_de_mayor_edad(unsigned int longitud, persona_t arr[]){
    int mayor_edad = arr[0].edad;

    int aux = 0;

    for(unsigned int i = 0; i < longitud; i++){
        if(mayor_edad < arr[i].edad){
            mayor_edad = arr[i].edad;
            aux = i;
        }
    }

    return arr[aux];
}

persona_t persona_de_menor_altura(unsigned int longitud, persona_t arr[]){
    float menor_altura = arr[0].altura;

    int aux = 0;

    for(unsigned int i = 0; i < longitud; i++){
        if(arr[i].altura < menor_altura){
            menor_altura = arr[i].altura;
            aux = i;
        }
    }

    return arr[aux];
}