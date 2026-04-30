import math
import numpy as np


def punto_a(p: float):
    U = np.random.random()
    return int(math.log(1 - U) / math.log(1 - p)) + 1


def punto_b(p: float):
    i = 1
    U = np.random.random()
    while p < U:
        U = np.random.random()
        i += 1

    return i


def simulaciones(p: float, N_SIM: int = 10_000):
    muestras_a = [punto_a(p) for _ in range(N_SIM)]
    muestras_b = [punto_b(p) for _ in range(N_SIM)]

    est_a = np.mean(muestras_a)
    est_b = np.mean(muestras_b)

    print(f"Geom(p={p}) - E[X] = {1/p}")
    print(f"a) E[X] = {est_a:.6f}")
    print(f"b) E[X] = {est_b:.6f}")


simulaciones(0.8)
print()
simulaciones(0.2)
