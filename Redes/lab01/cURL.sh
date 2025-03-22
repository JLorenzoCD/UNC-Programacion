# ==========================================================
# Script para interactuar con una API REST de películas
# Utiliza cURL para realizar peticiones HTTP a un servidor
# ==========================================================

# URL base de la API de películas
API_PELICULAS='http://127.0.0.1:5000/peliculas'

# ----------------------------------------------------------
# IMPORTANTE:
# Este script debe ejecutarse con el comando "source cURL.sh"
# o ". cURL.sh" en la terminal.
#
# No debe ejecutarse con "bash cURL.sh" ni como un script
# independiente, ya que esto abriría una nueva terminal en
# la que no podríamos interactuar con las funciones definidas.
# ----------------------------------------------------------

# Función para obtener la lista de todas las películas
obtener_peliculas() {
    curl $API_PELICULAS
}

# Función para obtener los detalles de una película específica
# Parámetros:
#   - $1: ID de la película (opcional, por defecto es 5)
obtener_pelicula() {
    id_pelicula=${1:-5}  # Si no se proporciona un ID, se usa el 5
    curl "$API_PELICULAS/$id_pelicula"
}

# Función para agregar una nueva película a la base de datos
# Parámetros:
#   - $1: Título de la película (opcional, por defecto 'Indiana Jones (Nuevo)')
#   - $2: Género de la película (opcional, por defecto 'Acción')
agregar_pelicula() {
    titulo=${1:-'Indiana Jones (Nuevo)'}
    genero=${2:-'Acción'}

    # Construcción del JSON con los datos de la nueva película
    data="{\"titulo\": \"$titulo\", \"genero\": \"$genero\"}"

    # Realiza una petición POST con los datos de la película
    curl -X POST -H "Content-Type: application/json" -d "$data" "$API_PELICULAS"
}

# Función para actualizar los datos de una película existente
# Parámetros:
#   - $1: ID de la película (opcional, por defecto es 5)
#   - $2: Nuevo título (opcional, por defecto 'Indiana Jones (EDIT)')
#   - $3: Nuevo género (opcional, por defecto 'Acción')
actualizar_pelicula() {
    id_pelicula=${1:-5}
    titulo=${2:-'Indiana Jones (EDIT)'}
    genero=${3:-'Acción'}

    # Construcción del JSON con los datos actualizados
    data="{\"titulo\": \"$titulo\", \"genero\": \"$genero\"}"

    # Realiza una petición PUT para actualizar la película
    curl -X PUT -H "Content-Type: application/json" -d "$data" "$API_PELICULAS/$id_pelicula"
}

# Función para eliminar una película de la base de datos
# Parámetros:
#   - $1: ID de la película a eliminar (opcional, por defecto es 5)
eliminar_pelicula() {
    id_pelicula=${1:-5}
    curl -X DELETE "$API_PELICULAS/$id_pelicula"
}
