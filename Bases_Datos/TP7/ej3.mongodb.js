/*
3.​ Listar el nombre, email, texto y fecha de los comentarios que la película con
id (movie_id) ObjectId("573a1399f29313caabcee886") recibió entre los años 2014 y
2016 inclusive. Listar ordenados por fecha. Escribir una nueva consulta
(modificando la anterior) para responder ¿Cuántos comentarios recibió?
*/

use("mflix")

const year2014 = new Date("2014-01-01T00:00:00.000Z")
const year2017 = new Date("2017-01-01T00:00:00.000Z")

const comments = db.comments.find({
    movie_id: ObjectId('573a1399f29313caabcee886'),
    date: {
        $gte: year2014,
        $lt: year2017,
    }
},
    {
        _id: 0,
        name: 1,
        email: 1,
        text: 1,
        date: 1,
    }
).sort({
    date: 1,
}).toArray()

db.comments.find({
    movie_id: ObjectId('573a1399f29313caabcee886'),
    date: {
        $gte: year2014,
        $lt: year2017,
    }
}).count()
