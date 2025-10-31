/*
Agregar las siguientes reglas de validación usando JSON Schema. Luego de cada
especificación testear que efectivamente las reglas de validación funcionen,
intentando insertar 5 documentos válidos y 5 inválidos (por distintos motivos).

2.​ Obtener metadata de la colección users que garantice que las reglas de
validación fueron correctamente aplicadas.
*/

use("mflix")

db.getCollectionInfos({ name: "users" })
