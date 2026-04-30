import math
import numpy as np


def punto_a_TI(k: int, lamda: float):
    # El e^(-λ) se cancela entre el numerador y el divisor (factor común de la suma)
    DIV = sum([(lamda**j) / math.factorial(j) for j in range(k + 1)])

    U = np.random.random()
    p = 1 / DIV
    i = 0
    F = p
    while U >= F:
        i += 1
        p *= lamda / i
        F = F + p

    return i


def punto_a_AyR(k: int, lamda: float):
    # El e^(-λ) se cancela entre el numerador y el divisor (factor común de la suma)
    DIV = sum([(lamda**j) / math.factorial(j) for j in range(k + 1)])

    def p(i: int):
        # i = 0, ..., k
        return ((lamda**i) / math.factorial(i)) / DIV

    # Si k es mas chico que lambda => el pmax es P(X = k)
    pmax = p(min(math.ceil(lamda), k))

    QI = 1 / (k + 1)  # Debido a que Y ~ U({ 0, 1, ... , k })
    C = pmax / QI

    while True:
        Y = int(np.random.uniform(0, k + 1))
        U = np.random.random()

        if U < p(Y) / C:
            return Y


def punto_b(N_sim: int = 1_000):
    k = 10
    lamda = 0.7
    muestras_I = [punto_a_TI(k, lamda) for _ in range(N_sim)]
    muestras_II = [punto_a_AyR(k, lamda) for _ in range(N_sim)]

    p2_I = sum(np.array(muestras_I) > 2) / N_sim
    p2_II = sum(np.array(muestras_II) > 2) / N_sim

    print(f"TI) P(X > 2) = {p2_I:.6f}")
    print(f"AR) P(X > 2) = {p2_II:.6f}")


punto_b()
