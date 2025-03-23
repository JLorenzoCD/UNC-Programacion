from flask import request

from peliculas.modelo import generos

def validar_req_pelicula() -> tuple[str, str]:
    titulo = request.json['titulo']
    genero = request.json['genero']

    if(not titulo or not genero):
        raise Exception('Error: Los campos \'titulo\' y \'genero\'')

    if(not es_genero_valido(genero)):
        raise Exception(
                f"""Error: El genero '{genero}' no es un genero valido. Revisar
                los géneros validos en la documentación."""
            )
    return (titulo, genero)

def es_genero_valido(genero: str) -> bool:
    return genero.lower() in generos
