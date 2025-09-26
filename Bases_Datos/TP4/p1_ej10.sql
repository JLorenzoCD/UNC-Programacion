/*
​Listar la cantidad máxima, mínima, promedio y suma de habitantes por continente.
*/

SELECT
    Continent,
    min(Population) as MinPopulation,
    max(Population) as MaxPopulation,
    avg(Population) as MeanPopulation,
    sum(Population) as TotalPopulation
FROM country
GROUP BY Continent;
