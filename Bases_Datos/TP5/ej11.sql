/*
11.​Cree una tabla `fines` que tenga dos campos: `rental_id` y `amount`. El
primero es una clave foránea a la tabla rental y el segundo es un valor numérico
con dos decimales.
*/

CREATE TABLE fines (
    rental_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (rental_id) REFERENCES rental (rental_id)
);
