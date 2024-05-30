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

// ······················· Rectángulo ·······················
void pintar_rectangulo(uint x, uint y, uint ancho, uint alto, char color) {
    uint yn = y + alto;

    for (uint yi = y; yi != yn; yi++) {
        pintar_linea_recta_hor(x, yi, ancho, color);
    }
}

// ······················· Cuadrado ·······················
void pintar_cuadrado(uint x, uint y, uint largo, char color) {
    pintar_rectangulo(x, y, largo, largo, color);
}

// ······················· Circulo ·······················
bool cumple_ecuacion(uint x, uint  y, uint xi, uint yi, uint r) {
    uint temp1 = (x - xi) * (x - xi);
    uint temp2 = (y - yi) * (y - yi);

    return ((temp1 + temp2) <= r * r);
}

void calcular_nuevo_xi(uint x, uint y, uint *xi, uint yi, uint r) {
    uint nuevo_xi = *xi;

    while (!cumple_ecuacion(x, y, nuevo_xi, yi, r)) {
        nuevo_xi--;
    }

    *xi = nuevo_xi;
}

void pintar_circulo(uint x, uint y, uint r, char color) {
    uint xi = x + r;
    uint ri = r;

    for (uint k = 0u; k < r; k++) {
        calcular_nuevo_xi(x, y, &xi, y + k, r);
        ri = xi - x;
        pintar_linea_recta_hor(x - ri, y + k, ri * 2, color); // Zona superior
        pintar_linea_recta_hor(x - ri, y - k, ri * 2, color); // Zona inferior
    }

}

int main(void) {

    screen_init();

    // pintar_linea_recta_hor(0, 2, 80, '-');

    // pintar_rectangulo(-2, 6, 15, 8, '#');
    // pintar_cuadrado(20, 20, 10, '+');

    pintar_circulo(4, 4, 4, '@');

    screen_dump();

    return EXIT_SUCCESS;
}
