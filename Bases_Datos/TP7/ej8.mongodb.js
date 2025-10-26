/*
8.​ Actualizar el valor de la contraseña del usuario cuyo email es
joel.macdonel@fakegmail.com a "some password". La misma consulta debe poder
insertar un nuevo usuario en caso que el usuario no exista. Ejecute la consulta
dos veces. ¿Qué operación se realiza en cada caso? (Hint: usar upserts).
*/

use("mflix")

db.users.updateOne(
    {
        email: "joel.macdonel@fakegmail.com"
    },
    {
        $set: {
            password: "some password"
        }
    },
    {
        upsert: true
    }
)

/*
En la primera ejecución, se inserta un nuevo usuario ya que el email no se encuentra.
En la segunda ejecución, se actualiza el usuario recién creado, aunque los valores
son los mismos, por lo que en realidad no hace nada.
*/
