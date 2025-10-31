/*
Agregar las siguientes reglas de validación usando JSON Schema. Luego de cada
especificación testear que efectivamente las reglas de validación funcionen,
intentando insertar 5 documentos válidos y 5 inválidos (por distintos motivos).

3.​ Especificar en la colección theaters las siguientes reglas de validación: El
campo theaterId (requerido) debe ser un int y location (requerido) debe ser un
object con:
    a.​ un campo address (requerido) que sea un object con campos street1, city,
    state y zipcode todos de tipo string y requeridos.
    b.​ un campo geo (no requerido) que sea un object con un campo type, con
    valores posibles “Point” o null y coordinates que debe ser una lista de 2
    doubles.

Por último, estas reglas de validación no deben prohibir la inserción o
actualización de documentos que no las cumplan sino que solamente deben advertir.
*/

use("mflix")

db.runCommand({
    collMod: "theaters",
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["theaterId", "location"],
            properties: {
                theaterId: {
                    bsonType: "int",
                },
                location: {
                    bsonType: "object",
                    required: ["address"],
                    properties: {
                        address: {
                            bsonType: "object",
                            required: ["street1", "city", "state", "zipcode"],
                            properties: {
                                street1: {
                                    bsonType: "string",
                                },
                                city: {
                                    bsonType: "string",
                                },
                                state: {
                                    bsonType: "string",
                                },
                                zipcode: {
                                    bsonType: "string",
                                },
                            }
                        },
                        geo: {
                            bsonType: "object",
                            properties: {
                                type: {
                                    enum: ["Point", null]
                                },
                                coordinates: {
                                    bsonType: "array",
                                    items: { bsonType: "double" },
                                    maxItems: 2,
                                    minItems: 2,
                                }
                            }
                        },
                    },
                },
            }
        }
    },

    // Parámetros para solo advertir, no prohibir:
    validationAction: "warn", // Solo advierte (loggea), no previene la inserción
    validationLevel: "moderate" // Aplica reglas a inserciones y actualizaciones de docs existentes
})

const { invalidTheaters, validTheaters } = require("./utils.mongodb.js")

db.theaters.insertMany(invalidTheaters)
db.theaters.insertMany(validTheaters)
