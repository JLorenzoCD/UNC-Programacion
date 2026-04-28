import numpy as np
import time

N = 10_000


def g(k: int):
    return np.exp(k / N)


def punto_ab(n_muestra=100):
    #  Estimamos E[g(X)] para X ∼ U[1, 10_000]
    start_time = time.time()
    s = 0

    for _ in range(n_muestra):
        ki = int(np.random.uniform(1, N + 1))
        s += g(ki)

    prom = s / n_muestra
    est = prom * N

    end_time = time.time()
    t_est = end_time - start_time
    print(f"Estimación: {est:.6f} - Tiempo: {t_est} - n: {n_muestra}")


def punto_c(n_suma=N):
    start_time = time.time()
    s = 0

    for k in range(1, n_suma + 1):
        s += g(k)

    end_time = time.time()
    t_exacto = end_time - start_time
    print(f"Valor exacto: {s:.6f} - Tiempo: {t_exacto} - N: {n_suma}")


punto_ab()
punto_c()
punto_c(100)
