#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

typedef unsigned int uint;

// ################################## PANTALLA ##################################
// Equivalente a 640x480
#define SCREEN_WIDTH 128
#define SCREEN_HEIGH 96

char SCREEN[SCREEN_HEIGH][SCREEN_WIDTH];

void screen_init() {
    for (uint y = 0; y < SCREEN_HEIGH; y++) {
        for (uint x = 0; x < SCREEN_WIDTH; x++) {
            SCREEN[y][x] = ' ';
        }
    }
}

void screen_dump() {
    for (uint y = 0; y < SCREEN_HEIGH; y++) {
        for (uint x = 0; x < SCREEN_WIDTH; x++) {
            printf("%c", SCREEN[y][x]);
        }
        printf("\n");
    }
}

// ################################## FUNCIONES ##################################
void pintar_pixel(uint x, uint y, char color) {
    // Si x o y se salen de la pantalla no se pinta
    if (SCREEN_WIDTH <= x || SCREEN_HEIGH <= y) return;

    char *pos_pixel = NULL;

    pos_pixel = &SCREEN[y][x];    // Esto es necesario realizarlo con fun calcular_pixel

    (*pos_pixel) = color;
}

// ······················· Linea recta ·······················
void pintar_linea_recta_hor(uint x, uint y, uint largo, char color) {
    uint xn = x + largo;

    for (uint xi = x; xi != xn; xi++) {
        pintar_pixel(xi, y, color);
    }
}

void pintar_linea_recta_ver(uint x, uint y, uint alto, char color) {
    uint yn = y + alto;

    for (uint yi = y; yi != yn; yi++) {
        pintar_pixel(x, yi, color);
    }
}

// ······················· Rectángulo ·······················
void pintar_rectangulo(uint x, uint y, uint ancho, uint alto, char color) {
    uint yn = y + alto;

    for (uint yi = y; yi != yn; yi++) {
        pintar_linea_recta_hor(x, yi, ancho, color);
    }
}

void pintar_borde_rectangulo(uint x, uint y, uint ancho, uint alto, char color) {
    pintar_linea_recta_hor(x, y, ancho, color);
    pintar_linea_recta_ver(x, y, alto, color);

    pintar_linea_recta_hor(x, y + alto - 1, ancho, color);
    pintar_linea_recta_ver(x + ancho - 1, y, alto, color);
}

void pintar_borde_grosor_rectangulo(uint x, uint y, uint ancho, uint alto, uint grosor, char color) {
    pintar_rectangulo(x, y, ancho, grosor, color);  // Rectángulo superior
    pintar_rectangulo(x, y + alto - grosor, ancho, grosor, color);  // Rectángulo Inferior


    pintar_rectangulo(x, y, grosor, alto, color);   // Rectángulo Derecho
    pintar_rectangulo(x + ancho - grosor, y, grosor, alto, color);  // Rectángulo Izquierdo
}


// ······················· Cuadrado ·······················
void pintar_cuadrado(uint x, uint y, uint largo, char color) {
    pintar_rectangulo(x, y, largo, largo, color);
}

// ······················· Circulo ·······················
bool cumple_ecuacion(uint x, uint y, uint radio) {
    uint temp1 = x * x;
    uint temp2 = y * y;

    return (temp1 + temp2) <= radio * radio;
}

void calcular_nuevo_di(uint *distancia_i, uint yi, uint radio) {
    uint di = *distancia_i;

    while (!cumple_ecuacion(di, yi, radio)) {
        di--;
    }

    *distancia_i = di;
}

void pintar_circulo(uint x, uint y, uint radio, char color) {
    uint di = radio;

    for (uint k = 0; k != radio; k++) {
        // calc di
        calcular_nuevo_di(&di, k, radio);

        pintar_linea_recta_hor(x - di, y + k, di * 2, color);
        pintar_linea_recta_hor(x - di, y - k, di * 2, color);
    }
}

void pintar_borde_circulo(uint x, uint y, uint radio, char color) {
    uint di = radio;

    for (uint k = 0; k != radio; k++) {
        // calc di
        calcular_nuevo_di(&di, k, radio);

        pintar_pixel(x - di, y - k, color);
        pintar_pixel(x + di, y - k, color);

        pintar_pixel(x - di, y + k, color);
        pintar_pixel(x + di, y + k, color);


        pintar_pixel(x - k, y - di, color);
        pintar_pixel(x - k, y + di, color);

        pintar_pixel(x + k, y - di, color);
        pintar_pixel(x + k, y + di, color);
    }
}

void pintar_borde_grosor_circulo(uint x, uint y, uint radio, uint grosor, char color) {
    for (uint i = 0; i != grosor; i++) {
        pintar_borde_circulo(x, y, radio - i, color);
    }
}

int main(void) {

    screen_init();

    // pintar_linea_recta_hor(30, 2, 80, '-');
    // pintar_linea_recta_ver(30, 2, 80, '-');

    // pintar_rectangulo(-2, 6, 15, 8, '#');
    // pintar_cuadrado(20, 20, 10, '+');

    // pintar_circulo(50, 50, 15, '@');
    // pintar_borde_circulo(20, 20, 20, '@');
    // pintar_borde_grosor_circulo(20, 20, 20, 5, '@');

    // pintar_borde_rectangulo(30, 20, 5, 5, '$');
    pintar_borde_grosor_rectangulo(30, 20, 5, 5, 2, '$');

    screen_dump();

    return EXIT_SUCCESS;
}
