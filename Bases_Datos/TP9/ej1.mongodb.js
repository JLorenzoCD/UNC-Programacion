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
