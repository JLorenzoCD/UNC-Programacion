import requests

# Obtener todas las películas
response = requests.get('http://localhost:5000/peliculas')
peliculas = response.json()
print("Películas existentes:")
for pelicula in peliculas:
    print(f"ID: {pelicula['id']}, Título: {pelicula['titulo']}, Género: {pelicula['genero']}")
print()

# Agregar una nueva película
nueva_pelicula = {
    'titulo': 'Pelicula de prueba',
    'genero': 'Acción'
}
response = requests.post('http://localhost:5000/peliculas', json=nueva_pelicula)
if response.status_code == 201:
    pelicula_agregada = response.json()
    print("Película agregada:")
    print(f"ID: {pelicula_agregada['id']}, Título: {pelicula_agregada['titulo']}, Género: {pelicula_agregada['genero']}")
else:
    print("Error al agregar la película.")
print()

# Obtener detalles de una película específica
id_pelicula = 1  # ID de la película a obtener
response = requests.get(f'http://localhost:5000/peliculas/{id_pelicula}')
if response.status_code == 200:
    pelicula = response.json()
    print("Detalles de la película:")
    print(f"ID: {pelicula['id']}, Título: {pelicula['titulo']}, Género: {pelicula['genero']}")
else:
    print("Error al obtener los detalles de la película.")
print()

# Actualizar los detalles de una película
id_pelicula = 1  # ID de la película a actualizar
datos_actualizados = {
    'titulo': 'Nuevo título',
    'genero': 'Comedia'
}
response = requests.put(f'http://localhost:5000/peliculas/{id_pelicula}', json=datos_actualizados)
if response.status_code == 200:
    pelicula_actualizada = response.json()
    print("Película actualizada:")
    print(f"ID: {pelicula_actualizada['id']}, Título: {pelicula_actualizada['titulo']}, Género: {pelicula_actualizada['genero']}")
else:
    print("Error al actualizar la película.")
print()

# Eliminar una película
id_pelicula = 1  # ID de la película a eliminar
response = requests.delete(f'http://localhost:5000/peliculas/{id_pelicula}')
if response.status_code == 200:
    print("Película eliminada correctamente.")
else:
    print("Error al eliminar la película.")
print()

# ------------------------ Nuevas funcionalidades de endpoints ya creados ------------------------
# Obtener todas las películas según genero
genero = 'drama'
response = requests.get(f"http://localhost:5000/peliculas?genero={genero}")
peliculas = response.json()
print(f"Películas existentes con el genero '{genero}':")
for pelicula in peliculas:
    print(f"ID: {pelicula['id']}, Título: {pelicula['titulo']}, Género: {pelicula['genero']}")
print()

# Obtener todas las películas que en el titulo contengan cierta palabra de búsqueda
search = 'in'
response = requests.get(f"http://localhost:5000/peliculas?search={search}")
peliculas = response.json()
print(f"Películas existentes con el titulo que contiene la palabra '{search}':")
for pelicula in peliculas:
    print(f"ID: {pelicula['id']}, Título: {pelicula['titulo']}, Género: {pelicula['genero']}")
print()

# Obtener todas las películas que en el titulo contengan cierta palabra de búsqueda y un genero en especifico
search = 'in'
genero = 'Ciencia ficción'
response = requests.get(f"http://localhost:5000/peliculas?search={search}&genero={genero}")
peliculas = response.json()
print(f"Películas existentes con el titulo que contiene la palabra '{search}' y tienen el genero '{genero}':")
for pelicula in peliculas:
    print(f"ID: {pelicula['id']}, Título: {pelicula['titulo']}, Género: {pelicula['genero']}")
print()

# ------------------------ Nuevos endpoints y sus funcionalidades ------------------------
# Obtener pelicula random
response = requests.get("http://localhost:5000/peliculas/random")
if response.status_code == 200:
    pelicula = response.json()
    print("Detalles de la película elegida de forma random:")
    print(f"ID: {pelicula['id']}, Título: {pelicula['titulo']}, Género: {pelicula['genero']}")
else:
    print("Error al obtener película random.")
print()

# Obtener pelicula random según un cierto genero
genero = "accion"
response = requests.get(f"http://localhost:5000/peliculas/random?genero={genero}")
if response.status_code == 200:
    pelicula = response.json()
    print(f"Detalles de la película elegida de forma random con el genero '{genero}':")
    print(f"ID: {pelicula['id']}, Título: {pelicula['titulo']}, Género: {pelicula['genero']}")
else:
    print("Error al obtener película random.")
print()

# Obtener pelicula recomendada para el proximo feriado según genero
genero = "Drama"
response = requests.get(f"http://localhost:5000/peliculas/sugerencia_feriado?genero={genero}")
if response.status_code == 200:
    data = response.json()
    pelicula = data['pelicula_recomendada']
    feriado = data['feriado']

    print(f"Detalles de la película recomendada para el proximo feriado con el genero '{genero}':")
    if pelicula is None:
        print(feriado)
    else:
        print(f"ID: {pelicula['id']}, Título: {pelicula['titulo']}, Género: {pelicula['genero']}")
        print()
        print(f"Próximo feriado: {feriado['motivo']}")
        print(f"Fecha: {feriado['dia']}/{feriado['mes'] + 1}/2025")
        print(f"Tipo: {feriado['tipo']}")
else:
    print("Error al obtener película random.")
print()

# Obtener pelicula recomendada para el proximo feriado según genero y tipo de feriado
genero = "Drama"
tipo_feriado = 'trasladable'
response = requests.get(f"http://localhost:5000/peliculas/sugerencia_feriado?genero={genero}&tipo={tipo_feriado}")
if response.status_code == 200:
    data = response.json()
    pelicula = data['pelicula_recomendada']
    feriado = data['feriado']

    print(f"Detalles de la película recomendada para el proximo feriado con el genero '{genero}':")
    if pelicula is None:
        print(feriado)
    else:
        print(f"ID: {pelicula['id']}, Título: {pelicula['titulo']}, Género: {pelicula['genero']}")
        print()
        print(f"Próximo feriado: {feriado['motivo']}")
        print(f"Fecha: {feriado['dia']}/{feriado['mes'] + 1}/2025")
        print(f"Tipo: {feriado['tipo']}")
else:
    print("Error al obtener película random.")
print()