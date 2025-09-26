/*
Listar el nombre de cada país con la cantidad de habitantes de su ciudad más
poblada. (Hint: Hay dos maneras de llegar al mismo resultado. Usando consultas
escalares o usando agrupaciones, encontrar ambas).
*/

SELECT country.Name as CountryName, (
        SELECT max(city.Population)
        FROM city
        WHERE city.CountryCode = country.Code
    ) as PopulationForCityMorePopulate
FROM country;

SELECT country.Name as CountryName, (
        SELECT city.Population
        FROM city
        WHERE city.CountryCode = country.Code
        ORDER BY city.Population DESC
        LIMIT 1
    ) as PopulationForCityMorePopulate
FROM country;
