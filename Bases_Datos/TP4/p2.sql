/*
1.​ Si en la consulta 6 se quisiera devolver, además de las columnas ya
solicitadas, el nombre de la ciudad más poblada. ¿Podría lograrse con
agrupaciones? ¿y con una subquery escalar?

Con una subquery escalar si se podría.
Con agrupaciones no, ya que la agrupación por la población tiene muchos
elementos y el motor no sabría cual nombre mostrar.

*/

SELECT
    country.Name AS CountryName,
    (
        SELECT max(city_1.Population)
        FROM city AS city_1
        WHERE city_1.CountryCode = country.Code
    ) AS MaxCityPopulation,
    (
        SELECT city_2.Name
        FROM city AS city_2
        WHERE city_2.CountryCode = country.Code
        ORDER BY city_2.Population DESC
        LIMIT 1
    ) AS MostPopulatedCityName
FROM country;
