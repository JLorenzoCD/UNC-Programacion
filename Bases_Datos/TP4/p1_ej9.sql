/*
Listar el promedio de esperanza de vida (LifeExpectancy) por continente con una
esperanza de vida entre 40 y 70 años.
*/

SELECT Continent, avg(LifeExpectancy) AS ContinentLifeExpectancy
FROM country
GROUP BY Continent
HAVING avg(LifeExpectancy) >= 40 AND avg(LifeExpectancy) <= 70
ORDER BY ContinentLifeExpectancy DESC;
