/*
Listar la cantidad de habitantes por continente ordenado en forma descendente.
*/

SELECT Continent, sum(Population) AS ContinentPopulation
FROM country
GROUP BY Continent
ORDER BY ContinentPopulation DESC;
