from typing import Callable
from scipy.stats import chi2
import numpy as np

# ------------------------------ Discretas ------------------------------


def est_T(frecuencias: list[int], probabilidades: list[float], n: int, K: int):
    t = 0
    for k in range(K):
        t = t + (frecuencias[k] - n * probabilidades[k]
                 )**2 / (n * probabilidades[k])

    return t


def gen_frecuencias_binomial(probabilidades: list[float], n: int, K: int) -> list[int]:
    # Genera directamente las frecuencias para las variables discretas ya que
    # al no estimar ningún parámetro, no es necesario generar muestras

    n_res = n
    freq = []
    p = probabilidades[0]
    for i in range(K - 1):
        N_i = np.random.binomial(n_res, p)
        freq.append(N_i)

        n_res -= N_i
        p = probabilidades[i + 1] / (1 - sum(probabilidades[:(i + 1)]))

    freq.append(n_res)

    return freq


def estimar_p_valor_pearson(frecuencias: list[int], probabilidades: list[float]):
    K = len(frecuencias)
    n = sum(frecuencias)

    t_obs = est_T(frecuencias, probabilidades, n, K)
    p_valor = chi2.sf(t_obs, df=(K - 1))

    # print("p-valor: "", 1 - chi2.cdf(t_obs, df=(K - 1)))
    print("p-valor: ", p_valor)


def estimar_p_valor_simulaciones_discreta(
    frecuencias: list[int],
    probabilidades: list[float],
    gen_freq: Callable[[list[float]], list[float]],
    N_SIM: int = 10_000
):

    n = sum(frecuencias)
    K = len(frecuencias)
    t_obs = est_T(frecuencias, probabilidades, n, K)

    p_valor = 0
    for _ in range(N_SIM):
        # generar lista de frecuencias utilizando la lista de probabilidades
        freq = gen_freq(probabilidades, n, K)

        # calculo el estadístico para la muestra generada
        t = est_T(freq, probabilidades, n, K)

        if t_obs <= t:
            p_valor += 1

    p_valor = p_valor / N_SIM
    print("p-valor: ", p_valor)


# ------------------------------ Continuas ------------------------------

def est_D(probabilidades: list[float]):
    n = len(probabilidades)
    prob = sorted(probabilidades)

    D_p = [((i + 1)/n - prob[i]) for i in range(n)]  # Fe(Y) - F(Y)
    D_m = [(prob[i] - i/n) for i in range(n)]  # F(Y) - Fe(Y)

    d = max(max(D_p), max(D_m))

    return d


def estimar_p_valor_simulaciones_continua(
    d_obs: float,
    gen_prob: Callable[[], list[float]],
    N_SIM: int = 10_000
):
    # Se utiliza el estadístico de Kolmogorov-Smirnov

    p_valor = 0.0
    for _ in range(N_SIM):
        probabilidades = gen_prob()
        d_j = est_D(probabilidades)

        if d_j >= d_obs:
            p_valor += 1

    p_valor = p_valor / N_SIM
    return p_valor
