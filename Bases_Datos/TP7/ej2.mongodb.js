/*
2.​ Listar el título, año, actores (cast), directores y rating de las 10
películas con mayor rating (“imdb.rating”) de la década del 90. ¿Cuál es el
valor del rating de la película que tiene mayor rating? (Hint: Chequear que el
valor de “imdb.rating” sea de tipo “double”).
*/

use("mflix")

db.movies.find(
    {
        year: { $gte: 1990, $lt: 2000 },
        "imdb.rating": { $type: "double" }
    },
    {
        _id: 0,
        title: 1,
        year: 1,
        cast: 1,
        directors: 1,
        rating: "$imdb.rating"
    },
).sort(
    {
        "imdb.rating": -1,
        title: 1,
    }
).limit(10)
