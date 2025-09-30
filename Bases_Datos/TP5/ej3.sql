/*
3.​ Agregue una columna `premium_customer` que tendrá un valor 'T' o 'F' de
acuerdo a si el cliente es "premium" o no. Por defecto ningún cliente será
premium.
*/

ALTER TABLE customer
ADD premium_customer
    ENUM('T','F') NOT NULL DEFAULT 'F';
