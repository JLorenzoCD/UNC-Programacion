import numpy as np


def dado() -> int:
    return int(np.random.uniform(1, 7))


def experimento():
    s = set()
    n = 0

    while len(s) != 11:
        d1, d2 = dado(), dado()

        s.add(d1 + d2)
        n += 1

    return n


def simulaciones_i(N_sim: int = 100):
    muestras = []
    for _ in range(N_sim):
        muestras.append(experimento())

    esp = np.mean(muestras)
    des = np.std(muestras)
    print(f"{N_sim:15d} | {esp:9.6f} | {des:19.6f}")


# print(f"{"N° simulaciones":>15} | {"Esperanza":>9} | {"Desviación estándar":>19}")
# simulaciones_i()
# simulaciones_i(1_000)
# simulaciones_i(10_000)
# simulaciones_i(100_000)


def simulaciones_ii(p, N_sim: int):
    muestras = []
    for _ in range(N_sim):
        muestras.append(experimento())

    c = sum(p(np.array(muestras)))
    prob = c / N_sim

    print(f"{N_sim:15d} | p = {prob:9.4f}")


# print(f"{"N° simulaciones":>15} | {"P(X > 15)":>9}")
# simulaciones_ii(lambda x: x > 15, 100)
# simulaciones_ii(lambda x: x > 15, 1_000)
# simulaciones_ii(lambda x: x > 15, 10_000)
# simulaciones_ii(lambda x: x > 15, 100_000)

# print(f"{"N° simulaciones":>15} | {"P(X < 9)":>9}")
# simulaciones_ii(lambda x: x < 9, 100)
# simulaciones_ii(lambda x: x < 9, 1_000)
# simulaciones_ii(lambda x: x < 9, 10_000)
# simulaciones_ii(lambda x: x < 9, 100_000)
