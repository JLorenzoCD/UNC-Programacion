/*
10.​Listar los actores (cast) que trabajaron en 2 o más películas dirigidas por
"Jules Bass".

Devolver el nombre de estos actores junto con la lista de películas (solo título
y año) dirigidas por “Jules Bass” en las que trabajaron.
    a.​ Hint1: addToSet
    b.​ Hint2: {'name.2': {$exists: true}} permite filtrar arrays con al menos 2
        elementos, entender por qué.
    c.​ Hint3: Puede que tu solución no use Hint1 ni Hint2 e igualmente sea
        correcta
*/

use("mflix")

db.movies.aggregate([
    {
        $match: {
            directors: {
                $elemMatch: { $eq: "Jules Bass" }
            }
        }
    },
    {
        $unwind: "$cast"
    },
    {
        $group: {
            _id: "$cast",
            movies: {
                $addToSet: {
                    title: "$title",
                    year: "$year",
                }
            }
        }
    },
    {
        $match: {
            "movies.1": {
                $exists: true
            }
        }
    },
    {
        $project: {
            _id: 0,
            actor: "$_id",
            movies: 1,
        }
    }
])
