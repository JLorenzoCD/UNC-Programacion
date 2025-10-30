/*
3.​ Cantidad de películas dirigidas por "Louis Lumière". Se puede responder sin
pipeline de agregación, realizar ambas queries.
*/

use("mflix")

db.movies.find({
    directors: {
        $elemMatch: { $eq: "Louis Lumière", },
    }
}).count()

db.movies.aggregate([
    {
        $match: {
            directors: {
                $elemMatch: { $eq: "Louis Lumière", },
            }
        }
    },
    {
        $count: "movies_count"
    }
])
