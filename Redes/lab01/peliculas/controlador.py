import random

from flask import jsonify, request, abort

import peliculas.modelo as pelis_modelo
from peliculas.helpers import validar_req_pelicula, es_genero_valido
from proximo_feriado import NextHoliday, ErrorTipoInvalido
from utils import quitar_acentos

def obtener_peliculas():
    # Obtener el parámetro de búsqueda desde la URL (None si no se proporciona)
    search = request.args.get("search", None)
    genero = request.args.get("genero", None)

    if not (genero is None) and not es_genero_valido(genero):
        abort(400, f"El genero '{genero}' es invalido.")

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

    if not (genero is None) and not es_genero_valido(genero):
        abort(400, f"El genero '{genero}' es invalido.")

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

def obtener_pelicula_sugerida_feriado():
    # Obtener el parámetro de búsqueda desde la URL (None si no se proporciona)
    genero = request.args.get("genero", None)
    tipo = request.args.get("tipo", None)

    if genero is None:
        abort(400, "No se envió el genero de la película.")
    elif not es_genero_valido(genero):
        abort(400, f"El genero '{genero}' es invalido.")

    # Se busca el proximo feriado
    next_holiday = NextHoliday()
    try:
        next_holiday.fetch_holidays(tipo)
    except ErrorTipoInvalido:
        abort(400, "El tipo no es valido.")
    except Exception:
        abort(500, "Error en el servidor, intente de nuevo.")

    feriado = next_holiday.holiday
    if feriado is None:
        return jsonify({"feriado" : "No hay un proximo feriado.", "pelicula_recomendada" : None}), 200

    # Inicialmente, todas las películas son elegibles
    peliculas_a_elegir = pelis_modelo.obtener_todas()

    # Filtrar películas a elegir por genero
    peliculas_a_elegir = list(
        filter(
            lambda x : quitar_acentos(genero.lower()) == quitar_acentos(x["genero"].lower()),
            peliculas_a_elegir
        )
    )

    pelicula_elegida = random.choice(peliculas_a_elegir)

    data = {
        "feriado" : feriado,
        "pelicula_recomendada" : pelicula_elegida
    }

    # Retornar la película en formato JSON
    return jsonify(data)


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
