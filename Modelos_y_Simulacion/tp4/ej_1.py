import numpy as np


def simular_experimento(n_iteraciones, n_cartas=100, r_objetivo=10):
    exitos_totales = []
    cumple_ai = 0
    cumple_aii = 0

    # Mazo ordenado[1, 2, ..., 100]
    mazo_referencia = np.arange(1, n_cartas + 1)

    for _ in range(n_iteraciones):
        mazo_barajado = np.random.permutation(mazo_referencia)

        coincidencias = (mazo_barajado == mazo_referencia)
        num_exitos = np.sum(coincidencias)
        exitos_totales.append(num_exitos)

        # Punto a(i): ¿Las primeras r son éxitos? (No importa el resto)
        if np.all(coincidencias[:r_objetivo]):
            cumple_ai += 1

        # Punto a(ii): Exactamente r éxitos Y que sean los primeros r
        if np.all(coincidencias[:r_objetivo]) and num_exitos == r_objetivo:
            cumple_aii += 1

    esperanza = np.mean(exitos_totales)
    varianza = np.var(exitos_totales)

    prob_ai = cumple_ai / n_iteraciones
    prob_aii = cumple_aii / n_iteraciones

    print(f"{n_iteraciones:12d} | {esperanza:8.4f} | {varianza:8.4f} | {prob_ai:10.8f} | {prob_aii:10.8f}")


print(f"{'Iteraciones':>12} | {'E(X)':>8} | {'Var(X)':>8} | {'P(a-i)':>10} | {'P(a-ii)':>10}")
print("-" * 60)
iteraciones = [100, 1_000, 10_000, 100_000]
for it in iteraciones:
    simular_experimento(it)
