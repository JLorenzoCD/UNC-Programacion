import numpy as np
import random


def est_punto_a(N: int):
    cartas = [x for x in range(1, 101)]

    resultado = []
    for _ in range(N):
        exitos = 0

        random.shuffle(cartas)
        for i in range(10):
            if cartas[i] == (i + 1):
                exitos += 1

        resultado.append(exitos)

    est = np.mean(resultado)
    print(f"Estimación de P(X = r) = P(X = 10) = {est:.4f} - N = {N}")


def est_esperanza(N: int):
    cartas = [x for x in range(1, 101)]

    resultado = []
    for _ in range(N):
        exitos = 0

        random.shuffle(cartas)
        for i in range(len(cartas)):
            if cartas[i] == (i + 1):
                exitos += 1

        resultado.append(exitos)

    est = np.mean(resultado)
    print(f"Estimación de E[X] = {est:.4f} - N = {N}")


def est_varianza(N: int):
    pass


est_punto_a(100)
est_punto_a(1_000)
est_punto_a(10_000)
est_punto_a(100_000)

print()

est_esperanza(100)
est_esperanza(1_000)
est_esperanza(10_000)
est_esperanza(100_000)
