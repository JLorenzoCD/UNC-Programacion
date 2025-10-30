/*
1.​ Cantidad de cines (theaters) por estado.
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
        $project: {
            _id: 0,
            state: "$_id",
            total_theaters: 1,
        }
    }
])
