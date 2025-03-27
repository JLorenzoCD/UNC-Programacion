""" Archivo 'helpers.py'
Contiene funciones muy utilizadas en la API y que son muy del ámbito (no son generales; muy orientadas a los objetos película)
"""

from flask import request, jsonify, Response

from global_var import peliculas, generos
from utils import normalizar_str


def obtener_nuevo_id() -> int:
    """
    Retorna un nuevo id.

    :returns int (ultimo_id + 1): Retorna el id siguiente del id de la ultima pelicula de la lista.
    :returns int 1: No hay peliculas en la lista por lo tanto se retorna el id 1. 
    """
    if len(peliculas) > 0:
        ultimo_id = peliculas[-1]['id']
        return ultimo_id + 1
    else:
        return 1


def buscar_peli(id: int) -> Response:
    """
    Devuelve la pelicula con dicho id.

    :param int id: Id de la pelicula a buscar.

    :returns Response pelicula_encontrada: Objeto json que contiene la pelicula encontrada.

    :raises Exception: Se lanza una excepción en caso de que id sea incorrecto o no exista.
    """
    pelicula_encontrada = None

    for pelicula in peliculas:
        if (pelicula['id'] == id):
            pelicula_encontrada = pelicula
            break

    if pelicula_encontrada is None:
        raise Exception(f"Error: no se encontró la película con id: '{id}'.")

    return pelicula_encontrada


# Lorenzo
def validar_req_pelicula() -> tuple:
    """
    Valida la estructura y el contenido de una solicitud JSON para agregar o actualizar una película.

    La función verifica que la solicitud contenga los campos 'titulo' y 'genero', y que estos no estén vacíos.
    Además, se asegura de que el género proporcionado sea válido según una lista predefinida de géneros.

    :raises Exception: Si falta alguno de los campos requeridos ('titulo' o 'genero').
    :raises Exception: Si el género proporcionado no es válido.

    :returns tuple (titulo, genero): Una tupla con el título y el género de la película.
    """
    titulo = request.json['titulo']
    genero = request.json['genero']

    if not titulo or not genero:
        raise Exception('Error: Los campos \'titulo\' y \'genero\'')

    if not es_genero_valido(genero):
        raise Exception(
            f"Error: El genero '{genero}' no es un genero valido. Revisar los generos validos en la documentacion.")

    return (titulo, genero)


def es_genero_valido(genero: str) -> bool:
    """
    Verifica si un género es válido.

    Comprueba si el género ingresado existe en la lista original 
    o si su versión normalizada está en la lista.

    :param str genero: Género a verificar.

    :returns bool: True si el género es válido, False en caso contrario.
    """
    return normalizar_str(genero) in generos


def buscar_pelis_genero(genero: str) -> list:
    """
    Devuelve una lista de películas que pertenecen al género especificado.

    :param str genero: El género de las películas a buscar.

    :returns list: Lista de películas que pertenecen al género dado. 
                   Devuelve una lista vacía si no hay coincidencias.
    """
    if not es_genero_valido(genero):
        raise Exception(
            f"Error: El genero '{genero}' no es un genero valido. Revisar los generos validos en la documentacion.")

    return [pelicula for pelicula in peliculas
            if normalizar_str(pelicula["genero"]) == normalizar_str(genero)]

# Alvaro :D
# Prints


def imprimir_pelicula(pelicula_encontrada: Response) -> None:
    """
    Imprime los detalles de la película encontrada de forma bonita.

    Lo realiza  de la siguiente manera, por ejemplo:
        ------------------------------
        * Id: <id>
        * Título: <titulo>
        * Género: <genero>
        ------------------------------

    """
    print(f"""\t{"-"*30}
        * Id: {pelicula_encontrada['id']}
        * Título: {pelicula_encontrada['titulo']}
        * Género: {pelicula_encontrada['genero']}""")


def imprimir_pelis(pelis: list) -> None:
    """
    Imprime una lista de películas invocando a la función `imprimir_pelicula()`
    """
    for pelicula in pelis:
        imprimir_pelicula(pelicula)
