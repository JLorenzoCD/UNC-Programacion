/*
Listar el nombre de la ciudad y el nombre del país de todas las ciudades
que pertenezcan a países con una población menor a 10000 habitantes
*/

WITH
    country_poplation_less_10_000 AS (
        SELECT Code, Name FROM country
        WHERE Population < 10000
    )
SELECT city.Name as CtyName, country_poplation_less_10_000.Name AS CountryName
FROM city
JOIN country_poplation_less_10_000
ON city.CountryCode = country_poplation_less_10_000.Code;
