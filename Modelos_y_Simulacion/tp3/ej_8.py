import random
import numpy as np


def estimar_esperanza_n(N: int):

    arr = []
    cota = np.exp(-3)

    for _ in range(N):
        mult = 1
        n = 0

        while mult >= cota:
            x = 1 - random.random()  # para dar valores entre (0, 1]
            mult *= x

            n += 1

        arr.append(n)

    est = np.mean(arr)

    print(f"Nro iteraciones ({N})")
    print(f"Estimación: {est}")


def fun_masa(i: int):
    N = 1_000_000
    arr = []
    cota = np.exp(-3)

    for _ in range(N):
        mult = 1
        n = 0

        while mult >= cota:
            x = 1 - random.random()  # para dar valores entre (0, 1]
            mult *= x

            n += 1

        arr.append(n)

    conteo = arr.count(i)
    est = conteo / N
    print(f"P(N = {i}) = {est}")


estimar_esperanza_n(100)
print()
estimar_esperanza_n(1_000)
print()
estimar_esperanza_n(10_000)
print()
estimar_esperanza_n(100_000)
print()
estimar_esperanza_n(1_000_000)

print()
fun_masa(0)
fun_masa(1)
fun_masa(2)
fun_masa(3)
fun_masa(4)
fun_masa(5)
fun_masa(6)
