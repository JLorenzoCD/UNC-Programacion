import requests

URL_API = 'http://localhost:5000/peliculas'

# Obtener todas las películas
response = requests.get(URL_API)
if response.status_code == 200:
    peliculas = response.json()
    print("Películas existentes:")
    for pelicula in peliculas:
        print(
            f"ID: {pelicula['id']}, Título: {pelicula['titulo']},"
            f"Género: {pelicula['genero']}"
        )
else:
    print("Error al obtener todas las películas.")
print()

# Agregar una nueva película
nueva_pelicula = {
    'titulo': 'Pelicula de prueba',
    'genero': 'Acción'
}
response = requests.post(URL_API, json=nueva_pelicula)
if response.status_code == 201:
    pelicula_agregada = response.json()
    print("Película agregada:")
    print(
        f"ID: {pelicula_agregada['id']}, Título: {pelicula_agregada['titulo']},"
        f" Género: {pelicula_agregada['genero']}"
    )
else:
    print("Error al agregar la película.")
print()

# Obtener detalles de una película específica
id_pelicula = 1  # ID de la película a obtener
response = requests.get(f'{URL_API}/{id_pelicula}')
if response.status_code == 200:
    pelicula = response.json()
    print("Detalles de la película:")
    print(
        f"ID: {pelicula['id']}, Título: {pelicula['titulo']},"
        f" Género: {pelicula['genero']}"
    )
else:
    print("Error al obtener los detalles de la película.")
print()

# Actualizar los detalles de una película
id_pelicula = 1  # ID de la película a actualizar
datos_actualizados = {
    'titulo': 'Nuevo título',
    'genero': 'Comedia'
}
response = requests.put(f'{URL_API}/{id_pelicula}', json=datos_actualizados)
if response.status_code == 200:
    pelicula_actualizada = response.json()
    print("Película actualizada:")
    print(
        f"ID: {pelicula_actualizada['id']},"
        f"Título: {pelicula_actualizada['titulo']},"
        f"Género: {pelicula_actualizada['genero']}"
    )
else:
    print("Error al actualizar la película.")
print()

# Eliminar una película
id_pelicula = 1  # ID de la película a eliminar
response = requests.delete(f'{URL_API}/{id_pelicula}')
if response.status_code == 200:
    print("Película eliminada correctamente.")
else:
    print("Error al eliminar la película.")
print()


# --------------- Nuevas funcionalidades de endpoints ya creados----------------
# Obtener todas las películas que en el titulo contengan cierta palabra de
# búsqueda
search = 'in'
response = requests.get(f"{URL_API}?search={search}")
peliculas = response.json()
if response.status_code == 200:
    print(
        "Películas existentes con el titulo que contiene la"
        f"palabra '{search}':"
    )
    for pelicula in peliculas:
        print(
            f"ID: {pelicula['id']}, Título: {pelicula['titulo']},"
            "Género: {pelicula['genero']}"
        )
else:
    print(
        "Error al obtener las películas cuyos títulos contienen"
        f"el string '{search}'."
    )
print()


# ------------------- Nuevos endpoints y sus funcionalidades -------------------
# Obtener todas las películas según genero
genero = 'drama'
response = requests.get(f"{URL_API}/{genero}")
if response.status_code == 200:
    peliculas = response.json()
    print(f"Películas existentes con el genero '{genero}':")
    for pelicula in peliculas:
        print(
            f"ID: {pelicula['id']}, Título: {pelicula['titulo']},"
            f"Género: {pelicula['genero']}"
        )
else:
    print(f"Error al obtener las películas con el genero '{genero}'.")
print()

# Obtener pelicula random
response = requests.get(f"{URL_API}/sugerencia")
if response.status_code == 200:
    pelicula = response.json()
    print("Detalles de la película elegida de forma random:")
    print(
        f"ID: {pelicula['id']}, Título: {pelicula['titulo']},"
        f" Género: {pelicula['genero']}"
    )
else:
    print("Error al obtener película random.")
print()

# Obtener pelicula random según un cierto genero
genero = "accion"
response = requests.get(
    f"{URL_API}/random/{genero}")
if response.status_code == 200:
    pelicula = response.json()
    print(
        "Detalles de la película elegida de forma random con el"
        f"genero '{genero}':"
    )
    print(
        f"ID: {pelicula['id']}, Título: {pelicula['titulo']},"
        f"Género: {pelicula['genero']}"
    )
else:
    print("Error al obtener película random.")
print()

# Obtener pelicula recomendada para el proximo feriado según genero
genero = "Drama"
response = requests.get(
    f"{URL_API}/sugerencia_feriado?genero={genero}")
if response.status_code == 200:
    data = response.json()
    pelicula = data['pelicula']
    feriado = data['feriado']

    print(
        "Detalles de la película recomendada para el proximo feriado con"
        f"el genero '{genero}':"
    )
    if pelicula is None:
        print(feriado)
    else:
        print(
            f"ID: {pelicula['id']}, Título: {pelicula['titulo']},"
            f"Género: {pelicula['genero']}"
        )
        print()
        print(f"Próximo feriado: {feriado['motivo']}")
        print(f"Fecha: {feriado['dia']}/{feriado['mes'] + 1}/2025")
        print(f"Tipo: {feriado['tipo']}")
else:
    print("Error al obtener película random.")
print()

# Obtener pelicula recomendada para el proximo feriado según genero y tipo de
# feriado
genero = "Drama"
tipo_feriado = 'trasladable'
response = requests.get(
    f"{URL_API}/sugerencia_feriado?genero={genero}&tipo={tipo_feriado}")
if response.status_code == 200:
    data = response.json()
    pelicula = data['pelicula']
    feriado = data['feriado']

    print(
        "Detalles de la película recomendada para el proximo feriado con el"
        f"genero '{genero}':"
    )
    if pelicula is None:
        print(feriado)
    else:
        print(
            f"ID: {pelicula['id']}, Título: {pelicula['titulo']},"
            f"Género: {pelicula['genero']}"
        )
        print()
        print(f"Próximo feriado: {feriado['motivo']}")
        print(f"Fecha: {feriado['dia']}/{feriado['mes'] + 1}/2025")
        print(f"Tipo: {feriado['tipo']}")
else:
    print("Error al obtener película random.")
print()
