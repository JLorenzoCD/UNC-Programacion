import random
import numpy as np


def espera_cliente():
    u1 = random.random()

    caja, media = 0, 0
    if u1 < 0.4:
        caja, media = 1, 3
    elif u1 < 0.72:
        caja, media = 2, 4
    else:
        caja, media = 3, 5

    # random da valores entre [0, 1), por lo que la resta da valores entre (0, 1]
    u2 = 1 - random.random()
    t = - media * np.log(1 - u2)

    return caja, float(t)


def punto_a(n: int):
    clientes = [espera_cliente() for _ in range(n)]

    sum = 0
    for c in clientes:
        _, t = c

        if t < 4:
            sum += 1

    p = sum / len(clientes)

    print(f"Punto a - nro iteraciones ({n})")
    print("Estimación \t\t|\t Valor real")
    print(f"P(T < 4) = {p:.4f} \t | \t {0.651:.4f}")


def punto_b(n: int):
    contador = {1: 0, 2: 0, 3: 0}
    clientes = [espera_cliente() for _ in range(n)]

    sum = 0
    for c in clientes:
        caja, t = c

        if t >= 4:
            sum += 1
            contador[caja] += 1

    p_c1 = contador[1] / sum
    p_c2 = contador[2] / sum
    p_c3 = contador[3] / sum

    print(f"\nPunto b - nro iteraciones ({n})")
    print("Estimación \t\t|\t Valor real")
    print(f"P(C_1 | T > 4) = {p_c1:.4f} \t | \t {0.3021:.4f}")
    print(f"P(C_2 | T > 4) = {p_c2:.4f} \t | \t {0.3373:.4f}")
    print(f"P(C_3 | T > 4) = {p_c3:.4f} \t | \t {0.3605:.4f}")


n = 1_000
punto_a(n)
punto_b(n)
