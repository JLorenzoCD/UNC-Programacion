import random
import numpy as np


def punto_a(n: int):
    def g(u: int):
        return (1 - (u**2))**(3/2)

    puntos = [random.random() for _ in range(n)]
    integrales = [g(u) for u in puntos]

    est = np.mean(integrales)

    v_real = np.pi * (3/16)
    print(f"Punto a - nro iteraciones ({n})")
    print("Estimación \t|\t Valor real")
    print(f"{est:.4f} \t | \t {v_real:.4f}")


def punto_b(n: int):
    def g(u: int):
        return u/((u**2) - 1)

    puntos = [random.random() for _ in range(n)]
    integrales = [g(u + 2) for u in puntos]

    est = np.mean(integrales)

    v_real = 0.4904
    print(f"Punto b - nro iteraciones ({n})")
    print("Estimación \t|\t Valor real")
    print(f"{est:.4f} \t | \t {v_real:.4f}")


def punto_c(n: int):
    def g(x: int):
        return x / ((1 + (x**2))**2)

    def h(u: int):
        return g(1/u - 1) / (u**2)

    # Se hace el 1 - random(), ya que random esta entre [0, 1) y no podemos
    # dividir por 0 en h(x), por lo que al restar queda entre (0, 1]
    puntos = [1 - random.random() for _ in range(n)]
    integrales = [h(u) for u in puntos]

    est = np.mean(integrales)

    v_real = 1/2
    print(f"Punto c - nro iteraciones ({n})")
    print("Estimación \t|\t Valor real")
    print(f"{est:.4f} \t | \t {v_real:.4f}")


def punto_d(n: int):
    def g(x: int):
        return np.exp(-(x**2))

    def h(u: int):
        return g(1/u - 1) / (u**2)

    # Se hace el 1 - random(), ya que random esta entre [0, 1) y no podemos
    # dividir por 0 en h(x), por lo que al restar queda entre (0, 1]
    puntos = [1 - random.random() for _ in range(n)]
    integrales = [h(u) for u in puntos]

    # Se multiplica por dos debido a la simetría
    est = np.mean(integrales) * 2

    v_real = np.sqrt(np.pi)
    print(f"Punto d - nro iteraciones ({n})")
    print("Estimación \t|\t Valor real")
    print(f"{est:.4f} \t | \t {v_real:.4f}")


punto_a(1_000)
punto_a(5_000)
punto_a(10_000)
print("\n")

punto_b(1_000)
punto_b(5_000)
punto_b(10_000)
print("\n")

punto_c(1_000)
punto_c(5_000)
punto_c(10_000)
print("\n")

punto_d(1_000)
punto_d(5_000)
punto_d(10_000)
