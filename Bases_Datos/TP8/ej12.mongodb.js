/*
12.​Listar el id y nombre de los restaurantes junto con su puntuación máxima,
mínima y la suma total. Se puede asumir que el restaurant_id es único.
    a.​ Resolver con $group y accumulators.
    b.​ Resolver con expresiones sobre arreglos (por ejemplo, $sum) pero sin
    $group.
    c.​ Resolver como en el punto b) pero usar $reduce para calcular la
    puntuación total.
    d.​ Resolver con find.
*/

use("restaurantdb")

// a
db.restaurants.aggregate([
    {
        $unwind: "$grades"
    },
    {
        $group: {
            _id: "$restaurant_id",
            name: { $first: "$name" },
            sum_grade: {
                $sum: "$grades.score"
            },
            max_grade: {
                $max: "$grades.score"
            },
            min_grade: {
                $min: "$grades.score"
            },
        }
    }
])

// b
db.restaurants.aggregate([
    {
        $match: {
            "grades.0": {
                $exists: true,
            }
        }
    },
    {
        $project: {
            _id: 0,
            name: 1,
            restaurant_id: 1,
            sum_grade: {
                $sum: "$grades.score"
            },
            max_grade: {
                $max: "$grades.score"
            },
            min_grade: {
                $min: "$grades.score"
            },
        }
    }
])

// c
db.restaurants.aggregate([
    {
        $match: {
            "grades.0": {
                $exists: true,
            }
        }
    },
    {
        $project: {
            _id: 0,
            name: 1,
            restaurant_id: 1,

            sum_grade: {
                $reduce: {
                    input: "$grades",
                    initialValue: 0,
                    in: { $add: ["$$value", "$$this.score"] },
                }
            },
            max_grade: {
                $max: "$grades.score"
            },
            min_grade: {
                $min: "$grades.score"
            },
        }
    }
])

// d
db.restaurants.find(
    {
        "grades.0": {
            $exists: true,
        }
    },
    {
        _id: 0,
        name: 1,
        restaurant_id: 1,
        sum_grade: {
            $sum: "$grades.score"
        },
        max_grade: {
            $max: "$grades.score"
        },
        min_grade: {
            $min: "$grades.score"
        },
    }
)
