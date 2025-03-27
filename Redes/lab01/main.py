import random

from flask import Flask, jsonify, request, abort, Response

from global_var import peliculas
from helpers import obtener_nuevo_id, buscar_peli, es_genero_valido, validar_req_pelicula, buscar_pelis_genero, imprimir_pelicula, imprimir_pelis
from utils import normalizar_str
from proximo_feriado import NextHoliday, TipoFeriadoInvalido

app = Flask(__name__)


def obtener_peliculas() -> Response:
    """
    Controlador para obtener la lista de películas, con opción de búsqueda por
    título.

    Este endpoint devuelve todas las películas almacenadas.
    Si se proporciona un parámetro de búsqueda, se filtrarán aquellas películas
    cuyo título contenga la palabra clave ingresada (sin distinción de
    mayúsculas o minúsculas).

    :params (str | None) search: Cadena de texto para filtrar películas por
            título. Si no se proporciona, se devuelven todas.

    :returns peliculas_enviar (Response): Un objeto JSON con la lista de
        películas filtradas por nombre completa.
    """
    # Obtener el parámetro de búsqueda desde la URL (None si no se proporciona)
    search = request.args.get("search", None)

    # Inicialmente, enviar todas las películas
    peliculas_enviar = peliculas

    # Filtrar películas si se proporciona un término de búsqueda
    if not (search is None):
        peliculas_enviar = list(
            filter(
                lambda x: search.lower() in x['titulo'].lower(),
                peliculas_enviar
            )
        )

    # Retornar la lista de películas en formato JSON
    return jsonify(peliculas_enviar)


def obtener_pelicula(id: int) -> Response:
    """
    Obtiene la película con el id dado.

    :param int id: Id de la pelicula.

    :returns tuple ((jasonify(pelicula_encontrada)), 200): Tupla con un objeto
        json con la pelicula encontrada y un codigo de solicitud de que está
        todo bien.

    :raises NotFound: En caso de que la pelicula no se encuentre.
    """
    # Lógica para buscar la película por su ID y devolver sus detalles
    try:
        pelicula_encontrada = buscar_peli(id)
    except Exception as e:
        abort(404, str(e))

    imprimir_pelicula(pelicula_encontrada)

    return jsonify(pelicula_encontrada), 200


def agregar_pelicula() -> Response:
    """
    Agrega una pelicula con su respectivo id, titulo y genero.

    :raises BadRequest: En caso de una solicitud de formato incorrecto.

    :returns tuple ((jsonify(nueva_pelicula)), 201): Tupla con un objeto json
        con la pelicula nueva y un codigo de solictud de que se creó con éxito.
    """
    try:
        titulo, genero = validar_req_pelicula()
    except Exception as e:
        abort(400, str(e))

    nueva_pelicula = {
        'id': obtener_nuevo_id(),
        'titulo': titulo,
        'genero': genero
    }

    peliculas.append(nueva_pelicula)
    imprimir_pelis(peliculas)

    return jsonify(nueva_pelicula), 201


def actualizar_pelicula(id: int) -> Response:
    """
    Busca la pelicula según el id dado y le actualiza su título y género.

    :param int id: Id de la pelicula.

    :returns Response act_peli: Un objeto json que contiene la película
        actualizada.

    :raises BadRequest: En caso de una solicitud con formato incorrecto.
    :raises NotFound: En caso de que la pelicula no se encuentre.
    """
    # Lógica para buscar la película por su ID y actualizar sus detalles
    try:
        (title, gender) = validar_req_pelicula()
    except Exception as e:
        abort(400, str(e))

    try:
        act_peli = buscar_peli(id)
    except Exception as e:
        abort(404, str(e))

    act_peli['titulo'] = title
    act_peli['genero'] = gender

    return jsonify(act_peli)


def eliminar_pelicula(id: int) -> Response:
    """
    Busca una película por su id y la elimina.

    :param int id: El id de la película a eliminar.

    :returns Response: Objeto JSON con un mensaje de éxito.
    """
    try:
        pelicula_elim = buscar_peli(id)
    except Exception as e:
        abort(404, str(e))

    peliculas.remove(pelicula_elim)
    return jsonify({'mensaje': 'Película eliminada correctamente'})


def obtener_peliculas_mismo_genero(genero: str) -> Response:
    """
    Obtiene una lista de películas que pertenecen al mismo género.

    :param str genero: Género de la película a buscar.

    :returns response peliculas_encontradas:
        Objeto json que contiene la lista de películas del género especificado.
    """
    peliculas_encontradas = []
    try:
        peliculas_encontradas = buscar_pelis_genero(genero or "")
        imprimir_pelis(peliculas_encontradas)
    except Exception as e:
        abort(400, str(e))

    return jsonify(peliculas_encontradas), 200


def obtener_pelicula_random_genero(genero: str) -> Response:
    """
    Obtiene una película random de un género determinado.

    :param str genero: El género de la película por recomendar.

    :returns response pelicula_random: En caso de exíto, retornaun objeto JSON
        que contiene la pelicula recomendada del género especificado.
        Si la entrada es vacía, obtenemos un mensaje y un error 404.
        En caso de que no haya peliculas para recomendar de dicho género,
        la petición tiene éxito y se retorna un objeto JSON vacio.
    """

    # Validar el género
    genero_norm = normalizar_str(genero)

    # Busco pelicula del género
    try:
        list_pelicula = buscar_pelis_genero(genero_norm)
    except Exception as e:
        abort(400, str(e))

    print(f"List Película ->{list_pelicula}")

    if list_pelicula == []:
        print(
            f"No existen películas del genero {genero_norm} "
            "entre las disponibles."
        )
        return jsonify(None), 200

    pelicula_random = random.choice(list_pelicula)

    # Return
    return jsonify(pelicula_random)


def dar_sugerencia() -> Response:
    """
    Sugiere una película de la lista películas de manera aleatoria.

    :returns tuple ((jsonify(suggested_movie)), 200): Un tupla con un objeto
    JSON que contiene la película recomendada y un codigo de solicitud.

    :raises OK: Salió todo bien.
    """
    # si peliculas esta vacia entonces devuelvo un error
    if not peliculas:
        return jsonify({"error": "No hay peliculas disponibles para sugerir"}
                       ), 404

    suggested_movie = random.choice(peliculas)

    # todo ok entonces retorno la pelicula aleatoria
    return jsonify(suggested_movie), 200


def obtener_pelicula_sugerida_feriado() -> Response:
    """
    Obtiene una película recomendada para ver en el próximo feriado según un
    género especificado.
    Este endpoint permite obtener el próximo feriado y, basado en un género de
    película proporcionado, recomienda una película para ver en dicho feriado.

    :params str genero: Género de la película a recomendar (obtenido de los
        parámetros de consulta en la URL).
    :params str tipo: Tipo de feriado a considerar (opcional, obtenido de los
        parámetros de consulta en la URL).

    :returns Response: Da un JSON el cual contiene un campo `feriado`
        (dict | str) y `pelicula` (dict | None). Si no hay prox feriado,
        entonces `pelicula` es None y `feriado` es un string que dice que no hay
        un prox feriado. En caso de que si haya prox feriado, ambos terminan
        siendo un dict.

        P.ej::

            feriado = {
                "dia": 2,
                "id": "veteranos-malvinas",
                "info": "https://es.wikipedia.org/wiki/D%C3%ADa_del_ ....",
                "mes": 4,
                "motivo": "Día del Veterano y de los Caídos ....",
                "tipo": "inamovible"
                }
            pelicula: {
                "genero": "Acción",
                "id": 2,
                "titulo": "Star Wars"
                }

    :raises BadRequest: Si no se envía el género o si este no es válido.
    :raises TipoFeriadoInvalido: Si el tipo de feriado especificado no es
        válido.
    :raises InternalServerError: Si ocurre un error inesperado al obtener los
        feriados.
    """
    # Obtener el parámetro de búsqueda desde la URL (None si no se proporciona)
    genero = request.args.get("genero", None)
    tipo = request.args.get("tipo", None)

    # El genero es obligatorio, por lo que si no se envía o no es valido se tira
    # error
    if genero is None:
        abort(400, "No se envió el genero de la película.")
    elif not es_genero_valido(genero):
        abort(400, f"El genero '{genero}' es invalido.")

    # Se busca el proximo feriado
    next_holiday = NextHoliday()
    try:
        next_holiday.fetch_holidays(tipo)
    except TipoFeriadoInvalido:
        abort(400, "El tipo no es valido.")
    except Exception:
        abort(500, "Error en el servidor, intente de nuevo.")

    # Se obtienen los datos del proximo feriado
    feriado = next_holiday.holiday

    # Puede ocurrir que no haya un proximo feriado (Ej: si se busca con
    # tipo=puente, puede no haber). En ese caso, no se recomienda una película
    # para ver, ya que la idea del endpoint es obtener una película para verla
    # un feriado.
    if feriado is None:
        return jsonify(
            {
                "feriado": "No hay un proximo feriado.",
                "pelicula": None
            }
        ), 200

    # Inicialmente, todas las películas son elegibles
    peliculas_a_elegir = peliculas

    # Filtrar películas a elegir por genero
    peliculas_a_elegir = list(
        filter(
            lambda x: normalizar_str(
                genero) == normalizar_str(x["genero"]),
            peliculas_a_elegir
        )
    )

    pelicula_elegida = random.choice(peliculas_a_elegir)

    # Retornar la película y el proximo feriado en formato JSON
    return jsonify({
        "feriado": feriado,
        "pelicula": pelicula_elegida
    })


app.add_url_rule('/peliculas', 'obtener_peliculas',
                 obtener_peliculas, methods=['GET'])
app.add_url_rule('/peliculas/<int:id>', 'obtener_pelicula',
                 obtener_pelicula, methods=['GET'])
app.add_url_rule(
    '/peliculas/sugerencia_feriado',
    'obtener_pelicula_sugerida_feriado',
    obtener_pelicula_sugerida_feriado,
    methods=['GET']
)
app.add_url_rule('/peliculas', 'agregar_pelicula',
                 agregar_pelicula, methods=['POST'])
app.add_url_rule('/peliculas/<int:id>', 'actualizar_pelicula',
                 actualizar_pelicula, methods=['PUT'])
app.add_url_rule('/peliculas/<int:id>', 'eliminar_pelicula',
                 eliminar_pelicula, methods=['DELETE'])
app.add_url_rule('/peliculas/<string:genero>', 'obtener_peliculas_mismo_genero',
                 obtener_peliculas_mismo_genero, methods=['GET'])
app.add_url_rule('/peliculas/random/<string:genero>',
                 'obtener_pelicula_random_genero',
                 obtener_pelicula_random_genero, methods=['GET'])
app.add_url_rule('/peliculas/sugerencia', 'dar_sugerencia',
                 dar_sugerencia, methods=['GET'])

if __name__ == '__main__':
    app.run(debug=True)
