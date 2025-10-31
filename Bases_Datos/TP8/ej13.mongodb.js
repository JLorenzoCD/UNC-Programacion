/*
13.​Actualizar los datos de los restaurantes añadiendo dos campos nuevos.
    a.​ "average_score": con la puntuación promedio
    b.​ "grade": con "A" si "average_score" está entre 0 y 13,
                con "B" si "average_score" está entre 14 y 27
                con "C" si "average_score" es mayor o igual a 28
    Se debe actualizar con una sola query.

    a.​ HINT1. Se puede usar pipeline de agregación con la operación update
    b.​ HINT2. El operador $switch o $cond pueden ser de ayuda.
*/

use("restaurantdb")

db.restaurants.updateMany(
    {   // Se modifican todos los elementos que tienen puntuación
        "grades.0": {
            $exists: true,
        }
    },
    [
        {
            $addFields: {
                average_score: {
                    $avg: "$grades.score"
                }
            }
        },
        {
            $addFields: {
                grade: {
                    $switch: {
                        branches: [
                            {
                                case: {
                                    $lte: ["$average_score", 13]
                                },
                                then: "A",
                            },
                            {
                                case: {
                                    $and: [
                                        { $gt: ["$average_score", 13] },
                                        { $lte: ["$average_score", 27] }
                                    ]
                                },
                                then: "B",
                            },
                            {
                                case: {
                                    $gt: ["$average_score", 27]
                                },
                                then: "C",
                            },
                        ],
                        default: "" // Posiblemente pueda haber score negativo o algo raro
                    }
                },
            }
        }
    ]
)
