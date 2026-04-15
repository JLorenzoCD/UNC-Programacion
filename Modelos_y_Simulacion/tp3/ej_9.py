import random
import numpy as np


def tirar_dado():
    return int(random.uniform(1, 7))


def juego():
    dado = tirar_dado()
    puntos = 0

    if dado == 1 or dado == 6:
        puntos = tirar_dado() * 2
    else:
        puntos = tirar_dado() + tirar_dado()

    return puntos > 6


def estimar_prob_ganar(n=100_000):
    partidas = [juego() for _ in range(n)]
    est = np.mean(partidas)

    print(f"Valor real {5/9:4f}")
    print(f"Estimación: {est:.4f}")


estimar_prob_ganar()
