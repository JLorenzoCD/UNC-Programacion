import random

from flask import jsonify, request, abort

import peliculas.modelo as pelis_modelo
from peliculas.helpers import validar_req_pelicula
from utils import quitar_acentos

def obtener_peliculas():
    # Obtener el parámetro de búsqueda desde la URL (None si no se proporciona)
    search = request.args.get("search", None)
    genero = request.args.get("genero", None)

    # Inicialmente, enviar todas las películas
    peliculas_enviar = pelis_modelo.obtener_todas()

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
    pelicula_encontrada = pelis_modelo.obtener_por_id(id)

    if(pelicula_encontrada == None):
        abort(404)

    return jsonify(pelicula_encontrada), 200


def obtener_pelicula_random():
        # Obtener el parámetro de búsqueda desde la URL (None si no se proporciona)
    genero = request.args.get("genero", None)

    # Inicialmente, todas las películas son elegibles
    peliculas_a_elegir = pelis_modelo.obtener_todas()

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

    nueva_pelicula = pelis_modelo.crear(titulo, genero)

    return jsonify(nueva_pelicula), 201


def actualizar_pelicula(id : int):
    try:
        titulo, genero = validar_req_pelicula()
    except:
        abort(400) # Datos inválidos

    try:
        pelicula_actualizada = pelis_modelo.actualizar_segun_id(id, titulo, genero)
    except:
        abort(404) # Película no encontrada

    return jsonify(pelicula_actualizada), 200


def eliminar_pelicula(id : int):
    try:
        pelis_modelo.eliminar_segun_id(id)
    except:
        abort(404)

    return jsonify({'mensaje': 'Película eliminada correctamente'}), 200
