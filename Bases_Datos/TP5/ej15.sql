/*
15.​Crear dos roles de empleado. A uno asignarle los permisos de `employee` y al
otro de `administrator`.
*/

CREATE ROLE empleado1;
GRANT employee TO empleado1;

CREATE ROLE empleado2;
GRANT administrator TO empleado2;
