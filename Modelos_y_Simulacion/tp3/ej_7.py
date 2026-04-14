import random
import numpy as np


def estimar_esperanza_n(N: int):

    arr = []
    for _ in range(N):
        suma = 0
        n = 0

        while suma < 1:
            x = random.random()
            suma += x

            n += 1

        arr.append(n)

    est = np.mean(arr)

    print(f"Nro iteraciones ({N})")
    print(f"Estimación: {est}")


estimar_esperanza_n(100)
print()
estimar_esperanza_n(1_000)
print()
estimar_esperanza_n(10_000)
print()
estimar_esperanza_n(100_000)
print()
estimar_esperanza_n(1_000_000)
