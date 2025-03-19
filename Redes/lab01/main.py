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

def find(func, l):
    """
    find toma como argumento una función y una lista.

    func es una función que recibe como argumento a un elemento
    de la lista l y retorna un booleano
    """
    elem = None

    for  e in l:
        if(func(e)):
            elem = e
            break

    return elem

def revisar_req_pelicula():
    titulo = request.json['titulo']
    genero = request.json['genero'] #! No se si hay una lista de géneros permitidos

    if(not titulo or not genero):
        raise Exception("Request de película invalido")

    return (titulo, genero)


def obtener_peliculas():
    return jsonify(peliculas)


def obtener_pelicula(id):
    pelicula_encontrada = find(lambda x : x['id'] == id, peliculas)

    if(pelicula_encontrada == None):
        abort(404)

    return jsonify(pelicula_encontrada)


def agregar_pelicula():
    try:
        titulo, genero = revisar_req_pelicula()
    except:
        abort(400) # Datos inválidos

    nueva_pelicula = {
        'id': obtener_nuevo_id(),
        'titulo': titulo,
        'genero': genero
    }
    peliculas.append(nueva_pelicula)

    return jsonify(nueva_pelicula), 201


def actualizar_pelicula(id):
    try:
        titulo, genero = revisar_req_pelicula()
    except:
        abort(400) # Datos inválidos

    pelicula_actualizada = find(lambda x : x['id'] == id, peliculas)

    if(pelicula_actualizada == None):
        abort(404)

    pelicula_actualizada['titulo'] = titulo
    pelicula_actualizada['genero'] = genero

    return jsonify(pelicula_actualizada)


def eliminar_pelicula(id):
    pelicula_a_eliminar = find(lambda x : x['id'] == id, peliculas)

    if(pelicula_a_eliminar == None):
        abort(404)
    
    try:
        peliculas.remove(pelicula_a_eliminar)
    except:
        abort(500)

    return jsonify({'mensaje': 'Película eliminada correctamente'})


def obtener_nuevo_id():
    if len(peliculas) > 0:
        ultimo_id = peliculas[-1]['id']
        return ultimo_id + 1
    else:
        return 1


app.add_url_rule('/peliculas', 'obtener_peliculas', obtener_peliculas, methods=['GET'])
app.add_url_rule('/peliculas/<int:id>', 'obtener_pelicula', obtener_pelicula, methods=['GET'])
app.add_url_rule('/peliculas', 'agregar_pelicula', agregar_pelicula, methods=['POST'])
app.add_url_rule('/peliculas/<int:id>', 'actualizar_pelicula', actualizar_pelicula, methods=['PUT'])
app.add_url_rule('/peliculas/<int:id>', 'eliminar_pelicula', eliminar_pelicula, methods=['DELETE'])

if __name__ == '__main__':
    app.run(port=5000)
