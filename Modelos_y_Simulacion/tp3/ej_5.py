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


punto_a(1_000)
punto_a(5_000)
punto_a(10_000)
print("\n")
punto_b(1_000)
punto_b(5_000)
punto_b(10_000)
print("\n")
