#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

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
void pintar_linea_recta_hor(uint x, uint y, uint xn, char color) {
    for (uint xi = xn; x <= xi; xi--) {
        pintar_pixel(xi, y, color);
    }
}

// ······················· Rectángulo ·······················
void pintar_rectangulo(uint x, uint y, uint xn, uint yn, char color) {
    uint yi = y;
    while (yi <= yn) {
        pintar_linea_recta_hor(x, yi, xn, color);
        yi++;
    }
}

// ······················· Cuadrado ·······················
void pintar_cuadrado(uint x, uint y, uint largo, char color) {
    pintar_rectangulo(x, y, x + largo, y + largo, color);
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
    // Parte de arriba
    uint xi = x + r;
    uint yi = y;
    uint ri = r;

    uint limite_superior = y - r;

    while (limite_superior <= yi) {
        calcular_nuevo_xi(x, y, &xi, yi, r);
        ri = xi - x;
        pintar_linea_recta_hor(x - ri, yi, xi, color);

        yi--;
    }

    // Parte de abajo
    xi = x + r;
    yi = y + 1u;
    ri = r;

    uint limite_inferior = y + r;

    while (yi <= limite_inferior) {
        calcular_nuevo_xi(x, y, &xi, yi, r);
        ri = xi - x;
        pintar_linea_recta_hor(x - ri, yi, xi, color);

        yi++;
    }
}

int main(void) {

    screen_init();

    pintar_linea_recta_hor(3, 2, 80, '-');

    pintar_rectangulo(5, 6, 15, 8, '#');
    pintar_cuadrado(20, 20, 10, '+');

    pintar_circulo(50, 30, 7, '@');

    screen_dump();

    return EXIT_SUCCESS;
}


/*
  ANSI_BRGOLD
        "         _______..___________.     ___      .______             \n"
        "        /       ||           |    /   \\     |   _  \\          \n"
        "       |   (----``---|  |----`   /  ^  \\    |  |_)  |          \n"
        "        \\   \\        |  |       /  /_\\  \\   |      /        \n"
        "    .----)   |       |  |      /  _____  \\  |  |\\  \\----.    \n"
        "    |_______/        |__|     /__/     \\__\\ | _| `._____|     \n"
        "                                                                \n"
        "____    __    ____      ___      .______           _______.     \n"
        "\\   \\  /  \\  /   /     /   \\     |   _  \\         /       |\n"
        " \\   \\/    \\/   /     /  ^  \\    |  |_)  |       |   (----` \n"
        "  \\            /     /  /_\\  \\   |      /         \\   \\    \n"
        "   \\    /\\    /     /  _____  \\  |  |\\  \\----..----)   |   \n"
        "    \\__/  \\__/     /__/     \\__\\ | _| `._____||_______/     \n"
        "\n\n\n"
        "                           Episode II \n\n"
        "                      ATTACK OF THE CLONES\n\n"
        "                There is  unrest in the Galactic\n"
        "                Senate. Several  thousand  solar\n"
        "                systems  have   declared   their\n"
        "                intentions to leave the Republic.\n\n"
        "                This      separatist     movement,\n"
        "                under  the   leadership   of  the\n"
        "                mysterious   Count   Dooku,   has\n"
        "                made it difficult for the limited\n"
        "                number   of   Jedi   Knights   to\n"
        "                maintain   peace   and  order  in\n"
        "                the galaxy.\n\n"
        "                Senator   Amidala,   the   former\n"
        "                Queen   of  Naboo,  is  returning\n"
        "                to  the  Galactic  Senate to vote\n"
        "                on the critical issue of creating\n"
        "                an    ARMY    OF   THE   REPUBLIC\n"
        "                to    assist    the   overwhelmed\n"
        "                Jedi....\n" ANSI_WHITE;
*/