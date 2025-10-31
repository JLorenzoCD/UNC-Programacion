/*
Agregar las siguientes reglas de validación usando JSON Schema. Luego de cada
especificación testear que efectivamente las reglas de validación funcionen,
intentando insertar 5 documentos válidos y 5 inválidos (por distintos motivos).

1.​ Especificar en la colección users las siguientes reglas de validación: El
campo name (requerido) debe ser un string con un máximo de 30 caracteres, email
(requerido) debe ser un string que matchee con la expresión regular:
"^(.*)@(.*)\\.(.{2,4})$", password (requerido) debe ser un string con al menos
50 caracteres.
*/

use("mflix")

db.runCommand({
    collMod: "users",
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["name", "email", "password"],
            properties: {
                name: {
                    bsonType: "string",
                    maxLength: 30,
                    description: "El nombre debe ser un string de como mucho 30 caracteres y es obligatorio.",
                },
                email: {
                    bsonType: "string",
                    pattern: "^(.*)@(.*)\\.(.{2,4})$",
                    description: "El email debe ser valido y es obligatorio.",
                },
                password: {
                    bsonType: "string",
                    minLength: 50,
                    description: "La contraseña debe ser un string de como mínimo 50 caracteres y es obligatorio.",
                },
            }
        }
    }
})


const { invalidUsers, validUsers } = require("./utils.js")

db.users.insertMany([
    ...invalidUsers,
    ...validUsers,
])
