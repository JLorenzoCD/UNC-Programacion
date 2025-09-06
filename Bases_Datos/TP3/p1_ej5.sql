/*
Listar las ciudades junto a sus idiomas oficiales (ordenado por la
población de la ciudad) y el porcentaje de hablantes del idioma
*/

SELECT city.Name, cl.Language, cl.Percentage
FROM city
INNER JOIN countrylanguage as cl
ON city.CountryCode = cl.CountryCode
WHERE cl.IsOfficial = 'T'
ORDER BY city.Population DESC;
