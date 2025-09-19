/*
Listar (sin duplicados) aquellas regiones que tengan países con una superficie
menor a 1000 km2 y exista (en el país) al menos una ciudad con más de 100000
habitantes. (Hint: Esto puede resolverse con o sin una subquery, intenten
encontrar ambas respuestas).
*/

SELECT DISTINCT country.Region as CountryRegion, country.CODE as CountryCode, city.Name as CityName
FROM country
INNER JOIN city
ON country.Code = city.CountryCode  AND country.SurfaceArea < 1000 AND city.Population > 100000;
