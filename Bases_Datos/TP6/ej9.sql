/*
9.​ Crear un rol "Empleado" en la BD que establezca accesos de lectura a todas las
tablas y accesos de creación de vistas.
*/

CREATE ROLE Empleado;

GRANT SELECT
ON classicmodels.*
TO Empleado;

GRANT CREATE VIEW
ON classicmodels.*
TO Empleado;
