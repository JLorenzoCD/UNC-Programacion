import requests
import pytest
import requests_mock

URL_API = 'http://localhost:5000/peliculas'


@pytest.fixture
def mock_response():
    with requests_mock.Mocker() as m:
        # Simulamos la respuesta para obtener todas las películas
        m.get(f'{URL_API}', json=[
            {'id': 1, 'titulo': 'Indiana Jones', 'genero': 'Acción'},
            {'id': 2, 'titulo': 'Star Wars', 'genero': 'Acción'}
        ])

        # Simulamos la respuesta para agregar una nueva película
        m.post(f'{URL_API}', status_code=201, json={
               'id': 3, 'titulo': 'Pelicula de prueba', 'genero': 'Acción'})

        # Simulamos la respuesta para obtener detalles de una película
        # específica
        m.get(f'{URL_API}/1', json={'id': 1,
              'titulo': 'Indiana Jones', 'genero': 'Acción'})

        # Simulamos la respuesta para actualizar los detalles de una película
        m.put(f'{URL_API}/1', status_code=200, json={'id': 1,
              'titulo': 'Nuevo título', 'genero': 'Comedia'})

        # Simulamos la respuesta para eliminar una película
        m.delete(f'{URL_API}/1', status_code=200)

        # ########################## NUEVOS TESTS ##########################
        #! ----------------------- Validación de errores -----------------------
        #! Se coloca aca la verificacion de errores ya que si se coloca debajo
        #! de los tests nuevos, no me toma bien las urls y me tira error en los
        #! tests ya que no toma el mock adecuado

        # Simulamos la respuesta de error al obtener detalles de una película
        # que no esta en la base de datos
        m.get(f'{URL_API}/5555', status_code=404)

        # Simulamos la respuesta de error al querer editar una película
        # que no esta en la base de datos
        m.put(f'{URL_API}/5555', status_code=404)

        # Simulamos la respuesta de error al querer eliminar una película
        # que no esta en la base de datos
        m.delete(f'{URL_API}/5555', status_code=404)

        # Simulamos la respuesta para obtener todas las películas según el
        # genero inexistente 'acci'
        m.get(f'{URL_API}/acci', json=[])

        # Simulamos la respuesta para obtener una película random según el
        # genero inexistente 'acci'
        m.get(f'{URL_API}/random/acci', status_code=400)

        # Simula la respuesta de error al pedir una película recomendada para el
        # proximo feriado sin el genero
        m.get(f'{URL_API}/sugerencia_feriado', status_code=400)

        # * ---------------- Validación nuevas funcionalidades ----------------

        # Simulando la respuesta para obtener todas las películas cuyos títulos
        # contienen los caracteres 'In'
        m.get(f'{URL_API}?search=In', json=[
            {"id": 1, "genero": "Acción", "titulo": "Indiana Jones"},
            {"id": 3, "titulo": "Interstellar",
             "genero": "Ciencia ficción"},
            {"id": 7, "titulo": "The Lord of the Rings", "genero": "Fantasía"},
            {"id": 9, "titulo": "Inception", "genero": "Ciencia ficción"}
        ])

        # * ------------------- Validación nuevos endpoints -------------------
        # Simulamos la respuesta para obtener todas las películas según el
        # genero 'drama'
        m.get(f'{URL_API}/Drama', json=[
            {'id': 10, 'titulo': 'The Shawshank Redemption', 'genero': 'Drama'},
            {'id': 12, 'titulo': 'Fight Club', 'genero': 'Drama'}
        ])

        # Simulando la respuesta para obtener una película aleatoria
        m.get(f'{URL_API}/sugerencia',
              json={'id': 9, 'titulo': 'Inception',
                    'genero': 'Ciencia ficción'}
              )

        # Simulando la respuesta para obtener una película aleatoria según el
        # genero 'acción'
        m.get(
            f'{URL_API}/random/acción',
            json={'id': 5, 'titulo': 'The Avengers', 'genero': 'Acción'}
        )

        # Simula la respuesta para obtener una película recomendada del genero
        # 'ciencia ficción' para el proximo feriado
        m.get(
            f'{URL_API}/sugerencia_feriado?genero=ciencia%20ficcion',
            json={
                "feriado": {
                    "id": "memoria-verdad-justicia",
                    "dia": 24,
                    "mes": 3,
                    "motivo": "Día Nacional de la Memoria por la Verdad y la Justicia",
                    "tipo": "inamovible",
                    "info": "https://es.wikipedia.org/wiki/D%C3%ADa_Nacional_de_la_Memoria_por_la_Verdad_y_la_Justicia"
                },
                "pelicula": {
                    "genero": "Ciencia ficción",
                    "id": 9,
                    "titulo": "Inception"
                }
            }
        )

        # Simula la respuesta para obtener una película recomendada del genero
        # 'acción' para el proximo feriado de tipo 'trasladable'
        m.get(
            f'{URL_API}/sugerencia_feriado?genero=accion&tipo=trasladable',
            json={
                "feriado": {
                    "id": "martin-guemes",
                    "dia": 17,
                    "mes": 6,
                    "motivo": "Paso a la Inmortalidad del Gral. Don Martín Güemes",
                    "tipo": "trasladable",
                    "original": "17-06",
                    "info": "https://es.wikipedia.org/wiki/Mart%C3%ADn_Miguel_de_G%C3%BCemes"
                },
                "pelicula": {
                    "genero": "Acción",
                    "id": 5,
                    "titulo": "The Avengers"
                }
            }
        )

        yield m


def test_obtener_peliculas(mock_response):
    response = requests.get('http://localhost:5000/peliculas')
    assert response.status_code == 200
    assert len(response.json()) == 2


def test_agregar_pelicula(mock_response):
    nueva_pelicula = {'titulo': 'Pelicula de prueba', 'genero': 'Acción'}
    response = requests.post(
        'http://localhost:5000/peliculas', json=nueva_pelicula)
    assert response.status_code == 201
    assert response.json()['id'] == 3


def test_obtener_detalle_pelicula(mock_response):
    response = requests.get('http://localhost:5000/peliculas/1')
    assert response.status_code == 200
    assert response.json()['titulo'] == 'Indiana Jones'


def test_actualizar_detalle_pelicula(mock_response):
    datos_actualizados = {'titulo': 'Nuevo título', 'genero': 'Comedia'}
    response = requests.put(
        'http://localhost:5000/peliculas/1', json=datos_actualizados)
    assert response.status_code == 200
    assert response.json()['titulo'] == 'Nuevo título'


def test_eliminar_pelicula(mock_response):
    response = requests.delete('http://localhost:5000/peliculas/1')
    assert response.status_code == 200


# ############################# Nuevos tests #############################
# --------- Validación nueva funcionalidad en endpoint existente ---------
def test_obtener_peliculas_buscado_titulo(mock_response):
    search = 'In'

    response = requests.get(f'{URL_API}?search={search}')
    assert response.status_code == 200

    pelis = response.json()
    assert len(pelis) == 4

    for peli in pelis:
        assert search.lower() in peli['titulo'].lower()

# --------------------- Validación nuevos endpoints ---------------------


def test_obtener_peliculas_genero_drama(mock_response):
    genero = 'Drama'

    response = requests.get(f'{URL_API}/{genero}')
    assert response.status_code == 200

    pelis = response.json()
    assert len(pelis) == 2

    for peli in pelis:
        assert peli['genero'].lower() == genero.lower()


def test_obtener_pelicula_aleatoria(mock_response):
    response = requests.get(f'{URL_API}/sugerencia')
    assert response.status_code == 200

    peli = response.json()
    assert 'id' in peli
    assert 'titulo' in peli
    assert 'genero' in peli
    assert isinstance(peli['id'], int)


def test_obtener_pelicula_aleatoria_genero_accion(mock_response):
    response = requests.get(f'{URL_API}/random/acción')
    assert response.status_code == 200

    peli = response.json()
    assert 'id' in peli
    assert 'titulo' in peli
    assert 'genero' in peli
    assert isinstance(peli['id'], int)
    assert peli['genero'] == 'Acción'


def test_obtener_peli_recomendada_prox_feriado_genero_cf(mock_response):
    response = requests.get(
        f'{URL_API}/sugerencia_feriado?genero=ciencia%20ficcion')
    assert response.status_code == 200

    data = response.json()
    assert 'feriado' in data
    assert 'pelicula' in data

    pelicula_recomendada = data['pelicula']
    assert 'id' in pelicula_recomendada
    assert 'titulo' in pelicula_recomendada
    assert 'genero' in pelicula_recomendada
    assert isinstance(pelicula_recomendada['id'], int)
    assert pelicula_recomendada['genero'] == 'Ciencia ficción'

    prox_feriado = data['feriado']
    assert "id" in prox_feriado
    assert "dia" in prox_feriado
    assert "mes" in prox_feriado
    assert "motivo" in prox_feriado
    assert "tipo" in prox_feriado
    assert "info" in prox_feriado
    assert isinstance(prox_feriado['id'], str)
    assert isinstance(prox_feriado["motivo"], str)


def test_obtener_peli_recomendada_prox_feriado_tipo_trasladable_genero_acc(mock_response):
    response = requests.get(
        f'{URL_API}/sugerencia_feriado?genero=accion&tipo=trasladable')
    assert response.status_code == 200

    data = response.json()
    assert 'feriado' in data
    assert 'pelicula' in data

    pelicula_recomendada = data['pelicula']
    assert 'id' in pelicula_recomendada
    assert 'titulo' in pelicula_recomendada
    assert 'genero' in pelicula_recomendada
    assert isinstance(pelicula_recomendada['id'], int)
    assert pelicula_recomendada['genero'] == 'Acción'

    prox_feriado = data['feriado']
    assert "id" in prox_feriado
    assert "dia" in prox_feriado
    assert "mes" in prox_feriado
    assert "motivo" in prox_feriado
    assert "tipo" in prox_feriado
    assert "info" in prox_feriado
    assert isinstance(prox_feriado['id'], str)
    assert prox_feriado['tipo'] == 'trasladable'
    assert isinstance(prox_feriado["motivo"], str)


#! ----------------------- Validación de errores -----------------------
def test_error_obtener_detalle_pelicula_inexistente(mock_response):
    response = requests.get(f'{URL_API}/5555')
    assert response.status_code == 404


def test_error_actualizar_detalle_pelicula_inexistente(mock_response):
    response = requests.put(
        f'{URL_API}/5555', json={'titulo': 'Nuevo título', 'genero': 'Comedia'})
    assert response.status_code == 404


def test_error_eliminar_pelicula_inexistente(mock_response):
    response = requests.delete(f'{URL_API}/5555')
    assert response.status_code == 404


def test_error_obtener_peliculas_genero_invalido(mock_response):
    response = requests.get(f'{URL_API}/acci')
    assert response.status_code == 200
    assert len(response.json()) == 0


def test_error_obtener_peliculas_random_genero_invalido(mock_response):
    response = requests.get(f'{URL_API}/random/acci')
    assert response.status_code == 400


def test_error_obtener_peli_recomendada_prox_feriado_no_genero(mock_response):
    response = requests.get(f'{URL_API}/sugerencia_feriado')
    assert response.status_code == 400
