/*
2.​ Cantidad de estados con al menos dos cines (theaters) registrados.
*/

use("mflix")

db.theaters.aggregate([
    {
        $group: {
            _id: "$location.address.state",
            total_theaters: {
                $sum: 1
            }
        }
    },
    {
        $match: {
            total_theaters: {
                $gte: 2
            },
        }
    },
    {
        $group: {
            _id: null,
            number_states_with_at_least_2_theaters: { $sum: 1 }
        }
    },
    {
        $project: {
            _id: 0,
            number_states_with_at_least_2_theaters: 1
        }
    }
])
