/*
Agregar las siguientes reglas de validación usando JSON Schema. Luego de cada
especificación testear que efectivamente las reglas de validación funcionen,
intentando insertar 5 documentos válidos y 5 inválidos (por distintos motivos).

4.​ Especificar en la colección movies las siguientes reglas de validación: El
campo title (requerido) es de tipo string, year (requerido) int con mínimo en
1900 y máximo en 3000, y que tanto cast, directors, countries, como genres sean
arrays de strings sin duplicados.
    a.​ Hint: Usar el constructor NumberInt() para especificar valores enteros a
    la hora de insertar documentos. Recordar que mongo shell es un intérprete
    javascript y en javascript los literales numéricos son de tipo Number
    (double).
*/

use("mflix")

db.movies.find().limit(5)

db.runCommand({
    collMod: "movies",
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["title", "year"],
            properties: {
                title: { bsonType: "string" },
                year: {
                    bsonType: "int",
                    minimum: 1900,
                    maximum: 3000,
                },
                cast: {
                    bsonType: "array",
                    items: { bsonType: "string" },
                    uniqueItems: true,
                },
                directors: {
                    bsonType: "array",
                    items: { bsonType: "string" },
                    uniqueItems: true,
                },
                countries: {
                    bsonType: "array",
                    items: { bsonType: "string" },
                    uniqueItems: true,
                },
                genres: {
                    bsonType: "array",
                    items: { bsonType: "string" },
                    uniqueItems: true,
                },
            }
        }
    }
})


const { invalidMovies, validMovies } = require("./utils.mongodb.js")

// db.movies.insertMany(invalidMovies)
db.movies.insertMany(validMovies)
