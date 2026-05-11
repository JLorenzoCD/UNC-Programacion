import math
import random


def exponencial(lamda: float):
    """ X ~ E(lamda)
    Generación de una v.a. continua X con distribución exponencial con
    lambda = lamda
    """

    U = 1 - random.random()
    return -math.log(U) / lamda


def poisson_Exp(lamda: float):
    """ X ~ P(lamda)
    Generación de una v.a. discreta X con distribución de Poisson y lambda = lamda.
    """

    Producto = 1 - random.random()
    cota = math.exp(-lamda)

    X = 0
    while Producto >= cota:
        Producto *= 1 - random.random()
        X += 1

    return X


def exponencial_2(lamda: float):
    """ X, Y ~ E(lamda)
    Generación de una v.a. continuas X e Y con distribución exponencial con
    lambda = lamda
    """

    V1, V2 = 1 - random.random(), 1 - random.random()
    t = -math.log(V1 * V2) / lamda
    U = random.random()

    X = t * U
    Y = t - X

    return X, Y


def Gamma(n: int, lamda: float):
    """ X ~ G(n, 1/lamda)
    Generación de una v.a. continua Xcon distribución gamma con alfa = n
    (Natural) y beta = 1/lamda.
    """

    U = 1
    for _ in range(n):
        U *= 1 - random.random()

    return -math.log(U) / lamda


def normal_MAyR(mu: float = 0.0, sigma: float = 1.0):
    """ X ~ N(mu, sigma^2)
    Generación de una v.a. continua X normal con media mu y desviación estándar
    sigma mediante el método de aceptación y rechazo.
    """

    while True:
        Y1 = -math.log(1 - random.random())
        Y2 = -math.log(1 - random.random())

        if Y2 >= (Y1 - 1) ** 2 / 2:
            if random.random() < 0.5:
                return Y1 * sigma + mu

            return -Y1 * sigma + mu


def normal_2MP(x_mu: float = 0.0, x_sigma: float = 1.0, y_mu: float = 0.0, y_sigma: float = 1.0):
    """ X, Y ~ N(mu, sigma^2)
    Generación de v.a. continuas X, Y normal con media mu (x e y) y desviación estándar
    sigma (x e y) mediante el método polar.
    """

    Rcuadrado = -2 * math.log(1 - random.random())
    Theta = 2 * math.pi * random.random()

    X = math.sqrt(Rcuadrado) * math.cos(Theta)
    Y = math.sqrt(Rcuadrado) * math.sin(Theta)

    return (X * x_sigma + x_mu, Y * y_sigma + y_mu)


NV_MAGICCONST = 4 * math.exp(-0.5) / math.sqrt(2.0)


def normal_MReU(mu: float = 0.0, sigma: float = 1.0):
    """ X ~ N(mu, sigma^2)
    Generación de una v.a. continua X normal con media mu y desviación estándar
    sigma mediante el método de razón entre uniformes.
    """

    while True:
        u1 = random.random()
        u2 = 1 - random.random()

        z = NV_MAGICCONST * (u1 - 0.5) / u2
        zz = z * z / 4
        if zz <= -math.log(u2):
            break

    return mu + z * sigma
