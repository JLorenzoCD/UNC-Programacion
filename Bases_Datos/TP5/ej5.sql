/*
5.​ Listar, ordenados por cantidad de películas (de mayor a menor), los distintos
ratings de las películas existentes (Hint: rating se refiere en este caso a la
clasificación según edad: G, PG, R, etc).
*/

SELECT f.rating, COUNT(*) as films
FROM film f
GROUP BY f.rating
ORDER BY films DESC;
