/*
14.​Revocar el acceso de eliminación a `employee` y crear un rol `administrator`
que tenga todos los privilegios sobre la BD `sakila`.
*/

REVOKE DELETE
ON rental
FROM employee;

CREATE ROLE administrator;

GRANT ALL PRIVILEGES
ON sakila.*
TO administrator;
