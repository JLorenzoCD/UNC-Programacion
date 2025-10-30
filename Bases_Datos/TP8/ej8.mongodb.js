/*
8.​ Título, año y cantidad de comentarios de las 10 películas con más comentarios.
*/

use("mflix")

db.comments.aggregate([
    {
        $group: {
            _id: "$movie_id",
            movie_comments_count: {
                $sum: 1
            }
        }
    },
    {
        $sort: {
            movie_comments_count: -1
        }
    },
    {
        $limit: 10
    },
    {
        $lookup: {
            from: "movies",
            localField: "_id",
            foreignField: "_id",
            as: "movie"
        }
    },
    {
        $project: {
            _id: 0,
            movie_comments_count: 1,

            // $arrayElemAt toma [array, índice]
            title: { $arrayElemAt: ["$movie.title", 0] },
            year: { $arrayElemAt: ["$movie.year", 0] },
        }
    }
])
