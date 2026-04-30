import math
import numpy as np


def geometrica(p: float):
    """ X ~ Geom(p)
    Generación de una v.a. discreta X Geométrica con valores enteros positivos.
    """

    U = np.random.random()
    return int(math.log(1 - U) / math.log(1 - p)) + 1


def punto_a():
    """
    Generación de una v.a. discreta X con la siguiente función de masa:
        P(X = j) = [ P(Z = j) + P(M = j) ] / 2

    Z ~ Geom(p = 1/2); M ~ Geom(p = 1/3)
    """

    U = np.random.random()

    if U < 0.5:
        return geometrica(1/2)
    else:
        return geometrica(1/3)


def simulaciones(N_SIM: int = 1_000):
    muestras = [punto_a() for _ in range(N_SIM)]
    datos = np.array(muestras)

    print(
        f"E[X] = 2.5 ~ {datos.mean()} (estimación con '{N_SIM}' simulaciones)")


simulaciones()
