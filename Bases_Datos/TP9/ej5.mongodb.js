/*
Agregar las siguientes reglas de validación usando JSON Schema. Luego de cada
especificación testear que efectivamente las reglas de validación funcionen,
intentando insertar 5 documentos válidos y 5 inválidos (por distintos motivos).

5.​ Crear una colección userProfiles con las siguientes reglas de validación:
Tenga un campo user_id (requerido) de tipo “objectId”, un campo language
(requerido) con alguno de los siguientes valores [ “English”, “Spanish”,
“Portuguese” ] y un campo favorite_genres (no requerido) que sea un array de
strings sin duplicados.
*/

use("mflix")
