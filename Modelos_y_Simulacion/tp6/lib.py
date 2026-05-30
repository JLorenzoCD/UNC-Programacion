import math
from typing import Callable
from statistics import NormalDist
import numpy as np


def prom_update(prom_prev: float, x_new: float, n_curr: int):
    if n_curr < 1:
        raise Exception()
    elif n_curr == 1:
        return x_new
    else:
        return prom_prev + (x_new - prom_prev) / n_curr


def s_cuad_update(s_cuad_prev: float, prom_prev: float, prom_curr: float, n_curr: int):
    if n_curr < 1:
        raise Exception()
    elif n_curr == 1:
        return 0.0
    else:
        return (1 - (1/(n_curr - 1))) * s_cuad_prev + n_curr * ((prom_curr - prom_prev)**2)


def sim_std_muestral(fun: Callable[[float], float], d: float, n_min: int = 100):
    """
    fun = función a la cual se le pasa U para obtener un X_i
    d = cota de la desviación estándar muestral
    """

    promedio = fun(np.random.random())
    s_cuad, n = 0, 1

    while n <= n_min or math.sqrt(s_cuad / n) >= d:
        X = fun(np.random.random())
        n += 1

        promedio_prev = promedio
        promedio = prom_update(promedio, X, n)
        s_cuad = s_cuad_update(s_cuad, promedio_prev, promedio, n)

    print("Punto: ", fun.__name__)
    print(f"Cantidad de datos generados: ", n)
    print(f"Media muestral ~ {promedio:.4f}")
    print(f"Desviación estándar muestral = {math.sqrt(s_cuad / n):.4f} ")


def calculo_z_standard(alpha: float):
    return NormalDist().inv_cdf(1 - alpha / 2)


def intervalo(prom: float, s_cuad: float, n: int, alpha: float):
    z_alpha_2 = calculo_z_standard(alpha)

    std = math.sqrt(s_cuad/n)
    izq = prom - z_alpha_2 * std
    der = prom + z_alpha_2 * std

    return izq, der


def sim_intervalo_conf(fun: Callable[[float], float], l: float, alpha: float, n_min: int = 100):
    """
    fun = función a la cual se le pasa U para obtener un X_i
    l = semi-ancho = L / 2
    """

    z_alpha_2 = calculo_z_standard(alpha)
    cota = l / z_alpha_2

    promedio = fun(np.random.random())
    s_cuad, n = 0, 1

    while n <= n_min or math.sqrt(s_cuad / n) >= cota:
        X = fun(np.random.random())
        n += 1

        promedio_prev = promedio
        promedio = prom_update(promedio, X, n)
        s_cuad = s_cuad_update(s_cuad, promedio_prev, promedio, n)

    i_d, i_i = intervalo(promedio, s_cuad, n, alpha)

    print(f"{"Punto":>9} | {"N° Sim":>9} | {"Intervalo obtenido":>18} | {"S_Cuadrado":>10} | {"Media":>10}")
    print(
        f"{fun.__name__:>9} | {n:9d} | {f"[{i_d:.4f}, {i_i:.4f}]":>18} | {s_cuad:10.4f} | {promedio:10.4f}")
