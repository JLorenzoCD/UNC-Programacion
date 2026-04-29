import time
from typing import Callable

import numpy as np


def binomial_i(n: int, p: float) -> int:
    C = p / (1 - p)
    prob = (1 - p) ** n
    F = prob
    i = 0
    U = np.random.random()
    while U >= F:
        prob *= C * (n - i) / (i + 1)
        F += prob
        i += 1

    return i


def binomial_ii(n: int, p: float) -> int:
    c = 0
    for _ in range(n):
        U = np.random.random()
        if U < p:
            c += 1

    return c


def simulaciones(
    generador: Callable[[int, float], int],
    metodo: str,
    n: int = 10,
    p: float = 0.3,
    N_sim: int = 10_000
):
    start = time.time()
    muestras = [generador(n, p) for _ in range(N_sim)]
    end = time.time()

    t = end - start
    print(
        f"Ejecución del método '{metodo}' al generar '{N_sim}' simulaciones. Tiempo: {t:.4f}")

    conteo = np.bincount(muestras)
    if len(conteo) == 9:
        conteo = np.append(conteo, 0)

    x_max = conteo.argmax() + 1
    pmax = conteo.max() / N_sim

    p0 = conteo[0] / N_sim
    p10 = conteo[9] / N_sim

    # print(conteo)
    print(f"P(X = {x_max}) = {pmax} (Mayor ocurrencia)")
    print(f"P(X = 0) = {p0:.4f}; P(X = 10) = {p10:.4f}")


simulaciones(binomial_i, "I")
print()
simulaciones(binomial_ii, "II")
