import pandas as pd
import matplotlib.pyplot as plt

# Cargar los archivos CSV
df_p1_c1 = pd.read_csv('data/Carga/p1_c1.csv')
df_p1_c2 = pd.read_csv('data/Carga/p1_c2.csv')
df_p2_c1 = pd.read_csv('data/Carga/p2_c1.csv')
df_p2_c2 = pd.read_csv('data/Carga/p2_c2.csv')

# Crear figura con dos subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 7))

# Graficar cada archivo con su respectiva leyenda
ax1.plot(df_p1_c1['carga_ofrecida'], df_p1_c1['carga_util'],
         label='Parte 1 Caso 1', color='navy')
ax1.plot(df_p1_c2['carga_ofrecida'], df_p1_c2['carga_util'],
         label='Parte 1 Caso 2', color='orangered')

ax1.plot(df_p2_c1['carga_ofrecida'], df_p2_c1['carga_util'],
         label='Parte 2 Caso 1', color='gold')
ax1.plot(df_p2_c2['carga_ofrecida'], df_p2_c2['carga_util'],
         label='Parte 2 Caso 2', color='yellowgreen')


# Configurar gráfico de 'Carga Útil vs Carga Ofrecida'
ax1.set_xlim(0, 10.5)
ax1.set_ylim(0, 5.5)
ax1.set_xlabel("Carga Ofrecida")
ax1.set_ylabel("Carga Útil")
ax1.set_title("Carga Útil vs Carga Ofrecida")
ax1.grid(True)
ax1.legend()


# Configurar gráfico de 'Retardo vs Carga Ofrecida'
ax2.plot(df_p1_c1['carga_ofrecida'], df_p1_c1['delay_avg'],
         label='Parte 1 Caso 1', color='navy')
ax2.plot(df_p1_c2['carga_ofrecida'], df_p1_c2['delay_avg'],
         label='Parte 1 Caso 2', color='orangered')

ax2.plot(df_p2_c1['carga_ofrecida'], df_p2_c1['delay_avg'],
         label='Parte 2 Caso 1', color='gold')
ax2.plot(df_p2_c2['carga_ofrecida'], df_p2_c2['delay_avg'],
         label='Parte 2 Caso 2', color='yellowgreen')

ax2.set_xlim(0, 10.5)
ax2.set_ylim(0, 75)
ax2.set_xlabel("Carga Ofrecida")
ax2.set_ylabel("Retardo")
ax2.set_title("Retardo vs Carga Ofrecida")
ax2.grid(True)
ax2.legend()

plt.tight_layout()
# plt.savefig("data/Carga/Parte_1-Caso_1.png")
# plt.savefig("data/Carga/.png")
plt.show()
