/*
5.​ Listar los 10 géneros con mayor cantidad de películas (tener en cuenta que
las películas pueden tener más de un género). Devolver el género y la cantidad
de películas. Hint: unwind puede ser de utilidad
*/

use("mflix")

db.movies.aggregate([
    {
        $unwind: "$genres"
    },
    {
        $group: {
            _id: "$genres",
            genre_count: {
                $sum: 1
            },
        }
    },
    {
        $project: {
            _id: 0,
            genre: "$_id",
            genre_count: 1
        }
    },
    {
        $sort: {
            genre_count: -1
        }
    },
    {
        $limit: 10
    }
])
