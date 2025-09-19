/*
Listar todas aquellas ciudades cuya población sea mayor que la población
promedio entre todas las ciudades.
*/

WITH
    city_avg (promedio) AS (
        SELECT avg(Population) AS promedio
        FROM city
    )
SELECT Name
FROM city, city_avg
WHERE Population > city_avg.promedio;
