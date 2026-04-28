"""
d) Método de la urna: utilizar un arreglo A de tamaño 100 donde cada valor i está en exactamente pi * 100 posiciones. El método debe devolver A[k] con probabilidad 0,01. ¿Por qué funciona?
"""
import time
from typing import Callable

import numpy as np

p = [0.11, 0.14, 0.09, 0.08, 0.12, 0.1, 0.09, 0.07, 0.11, 0.09]


def punto_a():
    while True:
        Y = int(np.random.uniform(0, 10))
        U = np.random.random()

        if U < p[Y] / 0.14:  # C = 1.4; qi = 0.1
            return Y


def punto_b():
    while True:
        Y = int(np.random.uniform(0, 10))
        U = np.random.random()

        if U < p[Y] / 0.3:  # C = 3; qi = 0.1
            return Y


def punto_c():
    i = 0
    F = 0
    U = np.random.random()

    while U > F:
        F += p[i]
        i += 1

    return i


def punto_d():
    pass


def simulaciones(N_sim: int, met: str, generador: Callable[[], int]):
    start = time.time()
    muestras = [generador() for _ in range(N_sim)]
    # print(np.bincount(muestras))
    end = time.time()

    print(f"Generando 10.000 muestras con método {met}: {(end - start):.6f}")


simulaciones(10_000, "A", punto_a)
simulaciones(10_000, "B", punto_b)
simulaciones(10_000, "C", punto_c)
