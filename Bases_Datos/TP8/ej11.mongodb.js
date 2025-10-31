/*
11.​Listar los usuarios que realizaron comentarios durante el mismo mes de
lanzamiento de la película comentada, mostrando Nombre, Email, fecha del
comentario, título de la película, fecha de lanzamiento. HINT: usar $lookup con
multiple condiciones
*/

use("mflix")

db.comments.aggregate([
    {
        $lookup: {
            from: "movies",
            localField: "movie_id",
            foreignField: "_id",
            as: "movie"
        }
    },
    {
        $unwind: "$movie"
    },
    {
        $match: {
            "movie.released": { $exists: true, $ne: null },
            $expr: {
                $and: [
                    { $eq: [{ $year: "$date" }, { $year: "$movie.released" }] },
                    { $eq: [{ $month: "$date" }, { $month: "$movie.released" }] },
                ]
            }
        }
    },
    {
        $project: {
            _id: 0,
            nombre: "$name",
            email: "$email",
            fecha_comentario: "$date",
            titulo_pelicula: "$movie.title",
            fecha_lanzamiento: "$movie.released",
        }
    },
])


//? No se si esta bien esta otra version.
// db.movies.aggregate([
//     {
//         $match: {
//             released: {
//                 $exists: true,
//                 $ne: null,
//             }
//         }
//     },
//     {
//         $lookup: {
//             from: "comments",
//             let: {
//                 released: "$released",
//                 movie: "$_id"
//             },
//             pipeline: [
//                 {
//                     $match: {
//                         $expr: {
//                             $and: [
//                                 {
//                                     $eq: ["$movie_id", "$$movie"],
//                                 },
//                                 {
//                                     $eq: [
//                                         { $year: "$date" },
//                                         { $year: "$$released" },
//                                     ]
//                                 },
//                                 {
//                                     $eq: [
//                                         { $month: "$date" },
//                                         { $month: "$$released" },
//                                     ]
//                                 }
//                             ]
//                         }
//                     }
//                 },
//             ],
//             as: "comments",
//         }
//     },
//     {
//         $match: {
//             "comments.0": {
//                 $exists: true
//             }
//         }
//     },
//     {
//         $unwind: "$comments"
//     },
//     {
//         $project: {
//             _id: 0,
//             released: 1,
//             name: "$comments.name",
//             email: "$comments.email",
//             date: "$comments.date",
//         }
//     },
// ])
