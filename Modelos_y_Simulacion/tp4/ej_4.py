import time
from typing import Callable

import numpy as np

# Probabilidades. P(X = i) = pi. Con i = indice de p
p = [0.11, 0.14, 0.09, 0.08, 0.12, 0.1, 0.09, 0.07, 0.11, 0.09]

# ? Asumo que esto puede estar afuera de la fun que genera la v.a. del PUNTO C
# Creo y relleno el arreglo A con 100 elementos, donde el valor i aparece
# (pi * 100) veces en A
A = []
p2 = np.array(p.copy())
p2 *= 100
p2 = p2.astype(int)

for i, v in enumerate(p2):
    k = i + 1

    for _ in range(v):
        A.append(k)
# ? Asumo que esto puede estar afuera de la fun que genera la v.a. del PUNTO C


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
    U = int(np.random.uniform(0, len(A)))
    return A[U]


def simulaciones(N_sim: int, met: str, generador: Callable[[], int]):
    start = time.time()
    muestras = [generador() for _ in range(N_sim)]
    # print(np.bincount(muestras))
    end = time.time()

    print(f"Generando 10.000 muestras con método {met}: {(end - start):.6f}")


# simulaciones(10_000, "A", punto_a)
# simulaciones(10_000, "B", punto_b)
# simulaciones(10_000, "C", punto_c)
# simulaciones(10_000, "D", punto_d)
