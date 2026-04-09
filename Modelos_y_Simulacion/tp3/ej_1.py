import matplotlib.pyplot as plt
import numpy as np

# ---------------------------------- Punto b -----------------------------------


def generador_psda_x(x_seed=1):
    x = x_seed

    while True:
        # xi+1 = (axi) mód 31
        x = (3 * x) % 31
        yield x


def generador_psda_y(y_seed=1):
    y = y_seed

    while True:
        # yi+1 = (5yi + c) mód 32
        y = (5 * y + 5) % 32
        yield y


def generador_psda_z(x_seed=1, y_seed=1):
    gen_x = generador_psda_x(x_seed)
    gen_y = generador_psda_y(y_seed)

    while True:
        x = next(gen_x)
        y = next(gen_y)

        z = (y + x) % 32
        yield z


# generador = generador_psda_z()
# for _ in range(50):
#     z = next(generador)
#     print(z)

def obtener_pares(generador, n=100):
    secuencia = [next(generador) for _ in range(n + 1)]

    actuales = secuencia[:-1]  # Se elimina el ultimo
    siguientes = secuencia[1:]  # Se elimina el primero
    return actuales, siguientes


# Config de los gráficos
n_puntos = 500  # Cantidad de puntos a graficar
fig, axes = plt.subplots(1, 3, figsize=(18, 5))
fig.suptitle(
    f'Gráficos de Retardo ($i$ vs $i+1$) para n={n_puntos}', fontsize=16)

# Nombres y generadores para iterar
nombres = ['Generador X (Mod 31)', 'Generador Y (Mod 32)',
           'Generador Z (Combinado)']
generadores = [generador_psda_x(), generador_psda_y(), generador_psda_z()]
colores = ['blue', 'green', 'red']

for i, ax in enumerate(axes):
    x_coords, y_coords = obtener_pares(generadores[i], n_puntos)

    ax.scatter(x_coords, y_coords,
               color=colores[i], alpha=0.7, edgecolors='black')
    ax.set_title(nombres[i])
    ax.set_xlabel('$Valores_{i}$')
    ax.set_ylabel('$Valores_{i+1}$')
    ax.grid(True, linestyle='--', alpha=0.6)

plt.tight_layout(rect=[0, 0.03, 1, 0.95])
# plt.show()

# ---------------------------------- Punto c -----------------------------------


def generador_psda_u(u_seed=1, a=((2**16) + 3)):
    u = u_seed
    m = 2**31

    while True:
        # ui+1 = (a * ui) mód M
        u = (a * u) % m
        yield u


def obtener_3_upla(generador, n=100):
    secuencia = [next(generador) for _ in range(n + 1)]

    primero = secuencia[::3]  # u1, u4, u7, ..., u(n-2)
    segundo = secuencia[1::3]  # u2, u5, u8, ..., u(n-1)
    tercero = secuencia[2::3]  # u3, u6, u9, ..., un

    return primero, segundo, tercero


# p, s, t = obtener_3_upla(generador_psda_u(), 100)
# for a, b, c in zip(p, s, t):
#     print(f"({a}, {b}, {c})")

def grafico_3d_calcular_psj_esfera(M, gen, n_puntos=10000):
    puntos = []
    dentro_esfera = 0
    radio = M / 10
    centro = (M / 2, M / 2, M / 2)

    # Generar puntos y verificar si están en la esfera
    for _ in range(n_puntos):
        x, y, z = next(gen), next(gen), next(gen)
        puntos.append((x, y, z))

        # Distancia euclidiana al cuadrado
        dist_sq = (x - centro[0])**2 + (y - centro[1])**2 + (z - centro[2])**2
        if dist_sq <= radio**2:
            dentro_esfera += 1

    # Separar coordenadas para el gráfico
    puntos = np.array(puntos)
    x_coords = puntos[:, 0]
    y_coords = puntos[:, 1]
    z_coords = puntos[:, 2]

    # Graficar
    fig = plt.figure(figsize=(10, 7))
    ax = fig.add_subplot(111, projection='3d')

    # Graficar puntos
    ax.scatter(x_coords, y_coords, z_coords, c='blue', s=1, alpha=0.5)

    ax.set_title(f"Generador RANDU: {n_puntos} puntos en 3D - M = {M}")
    ax.set_xlabel('U_i')
    ax.set_ylabel('U_{i+1}')
    ax.set_zlabel('U_{i+2}')

    porcentaje = (dentro_esfera / n_puntos) * 100
    print(
        f"Porcentaje de puntos dentro de la esfera: {porcentaje:.2f}% - {dentro_esfera}/{n_puntos}")


M = 2**31
grafico_3d_calcular_psj_esfera(M=M, gen=generador_psda_u(a=((2**16) + 3)))

M = 2**31 - 1
grafico_3d_calcular_psj_esfera(M=M, gen=generador_psda_u(a=(7**5)))

plt.show()
