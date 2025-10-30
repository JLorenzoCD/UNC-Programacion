/*
6.​ Top 10 de usuarios con mayor cantidad de comentarios, mostrando Nombre, Email
y Cantidad de Comentarios.
*/

use("mflix")

db.comments.aggregate([
    {
        $group: {
            _id: {
                name: "$name",
                email: "$email"
            },
            comments_count: {
                $sum: 1
            },
        }
    },
    {
        $project: {
            _id: 0,
            name: "$_id.name",
            email: "$_id.email",
            comments_count: 1
        }
    },
    {
        $sort: {
            comments_count: -1
        }
    },
    {
        $limit: 10
    }
])
