import matplotlib.pyplot as plt

# Generadores


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
plt.show()
