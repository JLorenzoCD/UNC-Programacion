import time
from typing import Callable
import numpy as np

LAMDA = 10


def poisson(lam: float):
    """ X ~ P(λ), λ > 0
    Generación de una v.a. discreta de Poisson.
    """

    U = np.random.random()

    p = np.exp(-lam)
    i = 0
    F = p
    while U >= F:
        i += 1
        p *= lam / i
        F = F + p

    return i


def gen_poisson(lamda: float):
    """ X ~ P(λ), λ > 0 ### Genera una fun optimizada para lamdas > 1
    Generación de una v.a. discreta de Poisson.
    """

    _p = np.exp(-lamda)
    _F = _p
    for j in range(1, int(lamda) + 1):
        _p *= lamda / j
        _F += _p

    def __poisson(_lamda: float):
        F = _F
        p = _p

        U = np.random.random()
        if U >= F:
            j = int(lamda) + 1
            while U >= F:
                p *= lamda / j
                F += p
                j += 1

            return j - 1
        else:
            j = int(lamda)
            while U < F:
                F -= p
                p *= j / lamda
                j -= 1

            return j + 1

    return __poisson


def simulaciones(generador: Callable[[float], int], metodo: str, N_sim: int = 1_000):
    start = time.time()
    muestras = [generador(LAMDA) for _ in range(N_sim)]
    end = time.time()

    t = end - start
    print(
        f"Ejecución del método '{metodo}' al generar '{N_sim}' muestras. Tiempo: {t:.4f}")

    est = sum((np.array(muestras) > 2).astype(int)) / N_sim
    print(f"P(Y > 2) ~ {est:.4f}")


simulaciones(poisson, "poisson")
print()
simulaciones(gen_poisson(LAMDA), "poisson mejorado")
