/*
9.​ Crear una vista con los 5 géneros con mayor cantidad de comentarios, junto
con la cantidad de comentarios.
*/

use("mflix")

db.createView(
    "genresTop5MostCommented",
    "comments",
    [
        {
            $group: {
                _id: "$movie_id",
                comments_count: {
                    $sum: 1
                }
            }
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
                comments_count: 1,

                genres: { $arrayElemAt: ["$movie.genres", 0] }
            }
        },
        {
            $unwind: "$genres",
        },
        {
            $group: {
                _id: "$genres",
                comments_count_for_genre: {
                    $sum: "$comments_count"
                }
            }
        },
        {
            $sort: {
                comments_count_for_genre: -1
            }
        },
        {
            $project: {
                _id: 0,
                genre: "$_id",
                comments_count_for_genre: 1,
            }
        },
        {
            $limit: 5
        }
    ]
)

db.genresTop5MostCommented.find()
