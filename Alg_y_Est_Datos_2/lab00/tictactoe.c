#include <stdlib.h>  /* exit() y EXIT_FAILURE */
#include <stdio.h>   /* printf(), scanf()     */
#include <stdbool.h> /* Tipo bool             */

#include <assert.h>  /* assert() */

#define BOARD_LEN 3
#define CELL_MAX (BOARD_LEN * BOARD_LEN - 1)

#define CELL_FREE '-'
#define PLAYER_1 'X'
#define PLAYER_2 'O'

void print_sep(int length) {
    printf("\t ");
    for (int i = 0; i < length;i++) printf("................");
    printf("\n");

}

void print_board(char board[BOARD_LEN][BOARD_LEN]) {
    int cell = 0;

    print_sep(BOARD_LEN);
    for (unsigned int row = 0; row < BOARD_LEN; ++row) {
        for (unsigned int column = 0; column < BOARD_LEN; ++column) {
            printf("\t | %d: %c ", cell, board[row][column]);
            ++cell;
        }

        printf("\t | \n");
        print_sep(BOARD_LEN);
    }
}

char get_winner(char board[BOARD_LEN][BOARD_LEN]) {
    char winner = CELL_FREE;

    for (unsigned int i = 0; i < BOARD_LEN && winner == CELL_FREE; i++) {
        // Revisando si se hizo tic-tac-toe en las filas
        if (board[i][0] == board[i][1] && board[i][0] == board[i][2]) {
            winner = board[i][0];
        }

        // Revisando si se hizo tic-tac-toe en las columnas
        if (board[0][i] == board[1][i] && board[0][i] == board[2][i]) {
            winner = board[0][i];
        }
    }

    // Revisando diagonales
    if (board[0][0] == board[1][1] && board[0][0] == board[2][2]) {
        winner = board[0][0];
    }
    if (board[0][2] == board[1][1] && board[0][2] == board[2][0]) {
        winner = board[0][2];
    }

    return winner;
}

bool has_free_cell(char board[BOARD_LEN][BOARD_LEN]) {
    bool free_cell = false;

    for (unsigned int row = 0; row < BOARD_LEN && !free_cell; row++) {
        for (unsigned int column = 0; column < BOARD_LEN && !free_cell; column++) {
            if (board[row][column] == CELL_FREE) {
                free_cell = true;
            }
        }
    }

    return free_cell;
}

int main(void) {
    printf("TicTacToe [COMPLETO]\n\n");

    char board[BOARD_LEN][BOARD_LEN] = {
        { CELL_FREE, CELL_FREE, CELL_FREE },
        { CELL_FREE, CELL_FREE, CELL_FREE },
        { CELL_FREE, CELL_FREE, CELL_FREE }
    };

    char turn = PLAYER_1;
    char winner = CELL_FREE;
    int cell = 0;

    while (winner == CELL_FREE && has_free_cell(board)) {
        print_board(board);
        printf("\nTurno %c - Elija posición (número del 0 al %d): ", turn, CELL_MAX);
        int scanf_result = scanf("%d", &cell);

        if (scanf_result <= 0) {
            printf("Error al leer un número desde teclado\n");
            exit(EXIT_FAILURE);
        }

        if (cell >= 0 && cell <= CELL_MAX) {
            int row = cell / BOARD_LEN;
            int colum = cell % BOARD_LEN;

            if (board[row][colum] == CELL_FREE) {
                board[row][colum] = turn;

                turn = turn == PLAYER_1 ? PLAYER_2 : PLAYER_1;
                winner = get_winner(board);
            }
            else {
                printf("\nCelda ocupada!\n");
            }
        }
        else {
            printf("\nCelda inválida!\n");
        }
    }
    print_board(board);

    if (winner == CELL_FREE) {
        printf("Empate!\n");
    }
    else {
        printf("Ganó %c\n", winner);
    }

    return 0;
}
