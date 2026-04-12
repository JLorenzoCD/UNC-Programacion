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


punto_a(1_000)
punto_a(5_000)
punto_a(10_000)
print("\n")
