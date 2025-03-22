from utils import find

peliculas = [
    {'id': 1, 'titulo': 'Indiana Jones', 'genero': 'Acción'},
    {'id': 2, 'titulo': 'Star Wars', 'genero': 'Acción'},
    {'id': 3, 'titulo': 'Interstellar', 'genero': 'Ciencia ficción'},
    {'id': 4, 'titulo': 'Jurassic Park', 'genero': 'Aventura'},
    {'id': 5, 'titulo': 'The Avengers', 'genero': 'Acción'},
    {'id': 6, 'titulo': 'Back to the Future', 'genero': 'Ciencia ficción'},
    {'id': 7, 'titulo': 'The Lord of the Rings', 'genero': 'Fantasía'},
    {'id': 8, 'titulo': 'The Dark Knight', 'genero': 'Acción'},
    {'id': 9, 'titulo': 'Inception', 'genero': 'Ciencia ficción'},
    {'id': 10, 'titulo': 'The Shawshank Redemption', 'genero': 'Drama'},
    {'id': 11, 'titulo': 'Pulp Fiction', 'genero': 'Crimen'},
    {'id': 12, 'titulo': 'Fight Club', 'genero': 'Drama'}
]
generos = ["Acción", "Aventura", "Crimen", "Ciencia ficción", "Drama",
            "Fantasía"]

def obtener_nuevo_id() -> int:
    if len(peliculas) > 0:
        ultimo_id = peliculas[-1]['id']
        return ultimo_id + 1
    else:
        return 1

# Modelo de datos para las películas
def obtener_todas() -> list[dict[str, str | int]]:
    return peliculas

def obtener_por_id(id : int) -> dict[str, str | int] | None:
    pelicula_encontrada = find(lambda x : x['id'] == id, peliculas)

    return pelicula_encontrada

def crear(titulo: str, genero: str) -> dict[str, str | int]:
    nueva_pelicula = {
        'id': obtener_nuevo_id(),
        'titulo': titulo,
        'genero': genero
    }
    peliculas.append(nueva_pelicula)

    return nueva_pelicula

def actualizar_segun_id(id: int, titulo: str, genero: str) -> dict[str, str | int]:
    pelicula_a_actualizar = obtener_por_id(id)

    if(pelicula_a_actualizar == None):
        raise Exception("Error: Película con id '{id}' no encontrada.")

    pelicula_a_actualizar['titulo'] = titulo
    pelicula_a_actualizar['genero'] = genero

    return pelicula_a_actualizar

def eliminar_segun_id(id: int) -> dict[str, str | int]:
    pelicula_a_eliminar = obtener_por_id(id)

    if(pelicula_a_eliminar == None):
        raise Exception("Error: Película con id '{id}' no encontrada.")

    peliculas.remove(pelicula_a_eliminar)

    return pelicula_a_eliminar
