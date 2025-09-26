/*
2.​ El top 5 de actrices y actores de la tabla `actors` que tienen la mayor
experiencia (i.e. el mayor número de películas filmadas) son también directores
de las películas en las que participaron. Basados en esta información, inserten,
utilizando una subquery los valores correspondientes en la tabla `directors`.
*/

INSERT INTO directors (director_id, first_name, last_name, number_of_films)
SELECT actor_id as director_id, first_name, last_name,
    (
        SELECT COUNT(*)
        FROM film_actor
        WHERE film_actor.actor_id = actor.actor_id
    ) as number_of_films
FROM actor
ORDER BY number_of_films DESC
LIMIT 5;
