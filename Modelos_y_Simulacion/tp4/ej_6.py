import time
from typing import Callable
import numpy as np

p = [0.15, 0.20, 0.10, 0.35, 0.20]
q = [0.0915, 0.2995, 0.3675, 0.2005, 0.0410]


def punto_i():
    U = np.random.random()

    if U < 0.35:
        return 3
    elif U < 0.55:
        return 1
    elif U < 0.75:
        return 4
    elif U < 0.9:
        return 0
    else:
        return 2


def punto_ii():
    C = 4.9

    while True:
        Y = np.random.binomial(4, 0.45)
        U = np.random.random()

        if U < p[Y] / (C * q[Y]):
            return Y


def simulaciones(
    generador: Callable[[], int],
    metodo: str,
    N_sim: int = 10_000
):
    start = time.time()
    muestras = [generador() for _ in range(N_sim)]
    end = time.time()

    t = end - start
    print(
        f"Ejecución del método '{metodo}' al generar '{N_sim}' simulaciones. Tiempo: {t:.4f}")


simulaciones(punto_i, "I")
simulaciones(punto_ii, "II")
