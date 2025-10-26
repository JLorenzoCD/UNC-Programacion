/*
5.​ Listar el título, idiomas (languages), géneros, fecha de lanzamiento
(released) y número de votos (“imdb.votes”) de las películas de géneros Drama y
Action (la película puede tener otros géneros adicionales), que solo están
disponibles en un único idioma y por último tengan un rating (“imdb.rating”)
mayor a 9 o bien tengan una duración (runtime) de al menos 180 minutos. Listar
ordenados por fecha de lanzamiento y número de votos.
*/

use("mflix")

db.movies.find(
    {
        genres: {
            $all: ["Drama", "Action"],
        },
        $or: [
            {
                languages: {
                    $type: "array",
                    $size: 1,
                },
                "imdb.rating": {
                    $gt: 9,
                }
            },
            {
                runtime: {
                    $gte: 180
                }
            }
        ]
    },
    {
        _id: 0,
        title: 1,
        languages: 1,
        genres: 1,
        released: 1,
        votes: "$imdb.votes",
    }
).sort(
    {
        released: -1,
        "imdb.votes": 1,
    }
)
