# Ejecutar con comando "sourcec cURL.sh" o ". cURL.sh"

API_PELICULAS='http://127.0.0.1:5000/peliculas'

obtener_peliculas() {
    curl $API_PELICULAS
}

obtener_pelicula() {
    id_pelicula=${1:-5}
    curl "$API_PELICULAS/$id_pelicula"
}

agregar_pelicula() {
    titulo=${1:-'Indiana Jones'}
    genero=${2:-'Acción'}

    data="{\"titulo\": \"$titulo\", \"genero\": \"$genero\"}"

    curl -X POST -H "Content-Type: application/json" -d "$data" $API_PELICULAS
}

actualizar_pelicula() {
    id_pelicula=${1:-5}
    titulo=${2:-'Indiana Jones (EDIT)'}
    genero=${3:-'Acción'}

    data="{\"titulo\": \"$titulo\", \"genero\": \"$genero\"}"

    curl -X PUT -H "Content-Type: application/json" -d "$data" $API_PELICULAS/$id_pelicula
}

eliminar_pelicula() {
    id_pelicula=${1:-5}
    curl -X DELETE "$API_PELICULAS/$id_pelicula"
}
