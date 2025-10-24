/*
1.​ Insertar 5 nuevos usuarios en la colección users. Para cada nuevo usuario creado,
insertar al menos un comentario realizado por el usuario en la colección comments.
*/

use("mflix")

/* db.users.insertMany(
    [
        {
            name: "Víctor Gago",
            email: 'víctor.gago@email.com',
            password: "123456789",
        },
        {
            name: "Guillem Hermida",
            email: 'guillem.hermida@email.com',
            password: "123456789",
        },
        {
            name: "María Fernanda Marques",
            email: 'maría.fernanda.marques@email.com',
            password: "123456789",
        },
        {
            name: "Sacramento Pino",
            email: 'sacramento.pino@email.com',
            password: "123456789",
        },
        {
            name: "Aina García",
            email: 'aina.garcía@email.com',
            password: "123456789",
        },
    ]
) */

const users = db.users.find(
    { name: { $in: ["Víctor Gago", "Guillem Hermida", "María Fernanda Marques", "Sacramento Pino", "Aina García"] } }
).toArray()

const movie = db.movies.findOne()

const commentsToInsert = []
for (const user of users) {
    const newComment = {
        name: user.name,
        email: user.email,
        movie_id: movie._id,
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        date: new Date(),
    }

    commentsToInsert.push(newComment)
}

// db.comments.insertMany(commentsToInsert)

