/*
Listar el nombre, continente y todos los lenguajes oficiales
de cada país. (Hint: habrá más de una fila por país si tiene
varios idiomas oficiales)
*/

SELECT c.Name, c.Continent, cl.Language
FROM country as c
LEFT JOIN countrylanguage as cl
ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T';
