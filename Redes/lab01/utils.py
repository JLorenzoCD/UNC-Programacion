""" Archivo 'utils.py'
El archivo contiene funciones utilizadas en la API que son muy generales
"""

from urllib.parse import unquote

# Alvaro :D


def normalizar_str(string: str) -> str:
    """
    Normaliza un string ingresado por el usuario, eliminando tildes,
    convirtiendo a minúsculas y manejando caracteres especiales (como espacios
    o caracteres URL).

    :param str string: String ingresado por el usuario. Este puede incluir
    caracteres especiales o acentos.

    :returns str string_normalizado: El string normalizado en minúsculas sin
    tildes.
    """
    # Mapa de caracteres con tilde a sin tilde
    tildes = str.maketrans("áéíóúÁÉÍÓÚ", "aeiouAEIOU")

    string_normalizado = unquote(string).translate(tildes).lower()

    return string_normalizado
