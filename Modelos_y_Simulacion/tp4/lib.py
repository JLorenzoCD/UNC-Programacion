import random
import math
from typing import Any


def permutacion(arr: list[Any]):
    """
    Permutación aleatoria equiprobable de la lista. La función muta la lista.
    """

    N = len(arr)
    for j in range(N-1):
        indice = int((N-j) * random.random()) + j
        arr[j], arr[indice] = arr[indice], arr[j]

    return arr


def subListaAleatorio(r, arr):
    """
    Devuelve una sub-lista aleatoria de arr de r elementos.
    """

    N = len(arr)
    copy = arr.copy()

    for j in range(N-1, N-1-r, -1):
        indice = int((j+1) * random.random())
        copy[j], copy[indice] = copy[indice], copy[j]

    return copy[N-r:]


def uniforme_dis_intervalo_ab(a: int, b: int):
    """ X ~ U[a, b]
    Generación de una v.a. discreta X Uniforme con valores enteros en el
    intervalo [a, b].
    """

    U = random.random()

    inicio = a
    ancho_intervalo = (b - a + 1)

    return int(U * ancho_intervalo) + inicio


def uniforme_dis_intervalo_1n(n: int):
    """ X ~ U[n]
    Generación de una v.a. discreta X Uniforme con valores enteros en el
    intervalo [1, n].
    """

    return uniforme_dis_intervalo_ab(1, n)


def geometrica(p: float):
    """ X ~ Geom(p)
    Generación de una v.a. discreta X Geométrica con valores enteros positivos.
    """

    U = random.random()
    return int(math.log(1 - U) / math.log(1 - p)) + 1


def bernoulli(p: float):
    """ X ~ B(p)
    Generación de una v.a. discreta X Bernoulli.
    """

    U = random.random()
    return U < p


def n_bernoullis(n: int, p: float):
    """ X1. ..., Xn ~ B(p)
    Generación de una lista de v.a. discreta de n Bernoullis.
    """

    arr_bernoullis = [0] * n
    # se resta 1 ya que la geométrica comienza en 1 y queremos que empiece en 0
    j = geometrica(p) - 1
    while j < n:
        arr_bernoullis[j] = 1
        j += geometrica(p)

    return arr_bernoullis


def poisson(lam: float):
    """ X ~ P(λ), λ > 0
    Generación de una v.a. discreta de Poisson.
    """

    U = random.random()

    p = math.exp(-lam)
    i = 0
    F = p
    while U >= F:
        i += 1
        p *= lam / i
        F = F + p

    return i


def binomial(n: int, p: float):
    """ X ~ B(n, p)
    Generación de una v.a. discreta de Binomial.
    """

    C = p / (1 - p)
    prob = (1 - p) ** n
    F = prob
    i = 0
    U = random.random()
    while U >= F:
        prob *= C * (n - i) / (i + 1)
        F += prob
        i += 1

    return i
