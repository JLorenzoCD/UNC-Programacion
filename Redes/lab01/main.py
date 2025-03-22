import random
import re

from flask import Flask, jsonify, request, abort

app = Flask(__name__)
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

def find(func, l):
    elem = None

    for  e in l:
        if(func(e)):
            elem = e
            break

    return elem

def validar_req_pelicula() -> tuple[str, str]:
    titulo = request.json['titulo']
    genero = request.json['genero']

    if(not titulo or not genero):
        raise Exception('Error: Los campos \'titulo\' y \'genero\'')

    if(not genero in generos):
        raise Exception(
                f"""Error: El genero '{genero}' no es un genero valido. Revisar
                los géneros validos en la documentación."""
            )
    return (titulo, genero)

def quitar_acentos(old : str) -> str:
    new = old.lower()

    new = re.sub(r'[àáâãäå]', 'a', new)
    new = re.sub(r'[èéêë]', 'e', new)
    new = re.sub(r'[ìíîï]', 'i', new)
    new = re.sub(r'[òóôõö]', 'o', new)
    new = re.sub(r'[ùúûü]', 'u', new)

    return new

def obtener_peliculas():
    # Obtener el parámetro de búsqueda desde la URL (None si no se proporciona)
    search = request.args.get("search", None)
    genero = request.args.get("genero", None)

    # Inicialmente, enviar todas las películas
    peliculas_enviar = peliculas

    # Filtrar películas por genero si se proporciona uno
    if not (genero is None):
        peliculas_enviar = list(
            filter(
                lambda x : quitar_acentos(genero.lower()) == quitar_acentos(x["genero"].lower()),
                peliculas_enviar
            )
        )
    # Filtrar películas si se proporciona un término de búsqueda
    if not (search is None):
        peliculas_enviar = list(
            filter(
                lambda x : search.lower() in x['titulo'].lower(),
                peliculas_enviar
                )
            )

    # Retornar la lista de películas en formato JSON
    return jsonify(peliculas_enviar)


def obtener_pelicula(id : int):
    pelicula_encontrada = find(lambda x : x['id'] == id, peliculas)

    if(pelicula_encontrada == None):
        abort(404)

    return jsonify(pelicula_encontrada), 200

def obtener_pelicula_random():
        # Obtener el parámetro de búsqueda desde la URL (None si no se proporciona)
    genero = request.args.get("genero", None)

    # Inicialmente, todas las películas son elegibles
    peliculas_a_elegir = peliculas

    # Filtrar películas a elegir por genero si se proporciona uno
    if not (genero is None):
        peliculas_a_elegir = list(
            filter(
                lambda x : quitar_acentos(genero.lower()) == quitar_acentos(x["genero"].lower()),
                peliculas_a_elegir
            )
        )

    pelicula_elegida = random.choice(peliculas_a_elegir)

    # Retornar la película en formato JSON
    return jsonify(pelicula_elegida)

def agregar_pelicula():
    try:
        titulo, genero = validar_req_pelicula()
    except:
        abort(400) # Datos inválidos

    nueva_pelicula = {
        'id': obtener_nuevo_id(),
        'titulo': titulo,
        'genero': genero
    }
    peliculas.append(nueva_pelicula)

    return jsonify(nueva_pelicula), 201


def actualizar_pelicula(id : int):
    try:
        titulo, genero = validar_req_pelicula()
    except:
        abort(400) # Datos inválidos

    pelicula_actualizada = find(lambda x : x['id'] == id, peliculas)

    if(pelicula_actualizada == None):
        abort(404)

    pelicula_actualizada['titulo'] = titulo
    pelicula_actualizada['genero'] = genero

    return jsonify(pelicula_actualizada), 200


def eliminar_pelicula(id : int):
    pelicula_a_eliminar = find(lambda x : x['id'] == id, peliculas)

    if(pelicula_a_eliminar == None):
        abort(404)

    peliculas.remove(pelicula_a_eliminar)

    return jsonify({'mensaje': 'Película eliminada correctamente'}), 200


def obtener_nuevo_id() -> int:
    if len(peliculas) > 0:
        ultimo_id = peliculas[-1]['id']
        return ultimo_id + 1
    else:
        return 1


app.add_url_rule('/peliculas', 'obtener_peliculas', obtener_peliculas, methods=['GET'])
app.add_url_rule('/peliculas/<int:id>', 'obtener_pelicula', obtener_pelicula, methods=['GET'])
app.add_url_rule('/peliculas/random', 'obtener_pelicula_random', obtener_pelicula_random, methods=['GET'])
app.add_url_rule('/peliculas', 'agregar_pelicula', agregar_pelicula, methods=['POST'])
app.add_url_rule('/peliculas/<int:id>', 'actualizar_pelicula', actualizar_pelicula, methods=['PUT'])
app.add_url_rule('/peliculas/<int:id>', 'eliminar_pelicula', eliminar_pelicula, methods=['DELETE'])

if __name__ == '__main__':
    app.run(port=5000, debug=True)
