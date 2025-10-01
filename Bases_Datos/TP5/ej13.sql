/*
13.​Crear un rol `employee` que tenga acceso de inserción, eliminación y
actualización a la tabla `rental`.
*/

CREATE ROLE employee;

GRANT INSERT, UPDATE, DELETE
ON rental
TO employee;
