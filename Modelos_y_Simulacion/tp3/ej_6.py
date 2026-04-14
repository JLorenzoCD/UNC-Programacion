import random
import math


def estimar_pi(N: int):
    radio = 1
    dentro_esfera = 0

    for _ in range(N):
        x, y = random.uniform(-1, 0), random.uniform(-1, 0)

        # Distancia euclidiana al cuadrado
        dist_sq = x**2 + y**2
        if dist_sq <= radio**2:
            dentro_esfera += 1

    est = dentro_esfera * 4 / N

    print(f"Nro iteraciones ({N})")
    print(f"Estimación: {est}")
    print(f"Valor de pi (modulo math): {math.pi}")


estimar_pi(1_000)
print()
estimar_pi(10_000)
print()
estimar_pi(100_000)
