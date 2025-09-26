/*
1.​ Cree una tabla de `directors` con las columnas: Nombre, Apellido, Número de
Películas.
*/

USE sakila;

CREATE TABLE directors (
    director_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL DEFAULT "",
    last_name VARCHAR(255) NOT NULL DEFAULT "",
    number_of_films INT NOT NULL DEFAULT 0
);
