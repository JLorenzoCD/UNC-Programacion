/*
7.​ Ratings de IMDB promedio, mínimo y máximo por año de las películas estrenadas
en los años 80 (desde 1980 hasta 1989), ordenados de mayor a menor por promedio
del año.
*/

use("mflix")

db.movies.aggregate([
    {
        $match: {
            year: {
                $gte: 1980,
                $lte: 1989,
            },
            "imdb.rating": {
                $type: "number"
            }
        }
    },
    {
        $group: {
            _id: "$year",
            avg_rating: { $avg: "$imdb.rating" },
            min_rating: { $min: "$imdb.rating" },
            max_rating: { $max: "$imdb.rating" },
        }
    },
    {
        $project: {
            _id: 0,
            year: "$_id",
            rating: {
                avg: "$avg_rating",
                min: "$min_rating",
                max: "$max_rating",
            }
        }
    },
    {
        $sort: {
            "rating.avg": -1
        }
    },
])

