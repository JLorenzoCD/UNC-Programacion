/*
Listar aquellos países junto a sus idiomas no oficiales, que superen en
porcentaje de hablantes a cada uno de los idiomas oficiales del país.
*/

SELECT country.Name AS CountryName, country.Code,cl.Language
FROM country
INNER JOIN countrylanguage AS cl
ON cl.CountryCode = country.Code
WHERE cl.IsOfficial = 'F' AND cl.Percentage > ALL (SELECT Percentage FROM countrylanguage
WHERE countrylanguage.CountryCode = country.Code AND countrylanguage.IsOfficial = 'T');

