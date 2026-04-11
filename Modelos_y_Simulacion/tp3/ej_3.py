import random
import numpy as np


def juego():
    u = random.random()

    s = 0
    if u < 1/3:
        s = random.random() + random.random()
    else:
        s = random.random() + random.random() + random.random()

    return s <= 2


def n_juegos(n: int):
    partidas = [juego() for _ in range(n)]
    prom = np.mean(partidas)

    return prom


tabla = [100, 1_000, 10_000, 100_000, 1_000_000]

for n in tabla:
    print(f"n: '{n}', estimación: '{n_juegos(n):.4f}'.")

print(f"Valor real: {8/9:.4f}.")
