/*
Modelado de datos en MongoDB

7.​ Dado el diagrama de la base de datos shop junto con las queries más
importantes.

Queries
    I.​ Listar el id, titulo, y precio de los libros y sus categorías de un autor
    en particular
    II.​ Cantidad de libros por categorías
    III.​ Listar el nombre y dirección entrega y el monto total (quantity * price)
    de sus pedidos para un order_id dado.

Debe crear el modelo de datos en mongodb aplicando las estrategias “Modelo de
datos anidados” y Referencias. El modelo de datos debe permitir responder las
queries de manera eficiente.

Inserte algunos documentos para las colecciones del modelo de datos.
Opcionalmente puede especificar una regla de validación de esquemas para las
colecciones.

Se provee el archivo shop.tar.gz que contiene algunos datos que puede usar como
ejemplo para los inserts en mongodb.
*/

use("mflix")
