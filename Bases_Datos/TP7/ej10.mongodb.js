/*
10.​Listar el id del restaurante (restaurant_id) y las calificaciones de los
restaurantes donde al menos una de sus calificaciones haya sido realizada entre
2014 y 2015 inclusive, y que tenga una puntuación (score) mayor a 70 y menor o
igual a 90.
*/

use("restaurantdb")

const year2014 = new Date("2014-01-01T00:00:00Z")
const year2016 = new Date("2016-01-01T00:00:00Z")

db.restaurants.find(
    {
        grades: {
            $elemMatch: {
                date: {
                    $gte: year2014,
                    $lt: year2016
                },
                score: {
                    $gt: 70,
                    $lte: 90,
                },
            },
        },
    },
    {
        _id: 0,
        restaurant_id: 1,
        grades: 1,
    }
)
