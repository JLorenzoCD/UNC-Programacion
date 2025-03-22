from flask import Flask

import peliculas.controlador as pelis_controlador

app = Flask(__name__)

app.add_url_rule('/peliculas', 'obtener_peliculas',
        pelis_controlador.obtener_peliculas, methods=['GET']
    )
app.add_url_rule('/peliculas/<int:id>', 'obtener_pelicula',
        pelis_controlador.obtener_pelicula, methods=['GET']
    )
app.add_url_rule('/peliculas/random', 'obtener_pelicula_random',
        pelis_controlador.obtener_pelicula_random, methods=['GET']
    )
app.add_url_rule('/peliculas', 'agregar_pelicula',
        pelis_controlador.agregar_pelicula, methods=['POST']
    )
app.add_url_rule('/peliculas/<int:id>', 'actualizar_pelicula',
        pelis_controlador.actualizar_pelicula, methods=['PUT']
    )
app.add_url_rule('/peliculas/<int:id>', 'eliminar_pelicula',
        pelis_controlador.eliminar_pelicula, methods=['DELETE']
    )

if __name__ == '__main__':
    app.run(port=5000, debug=True)
