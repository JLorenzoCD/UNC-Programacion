/*
Listar aquellos países y sus lenguajes no oficiales cuyo porcentaje de hablantes
sea mayor al promedio de hablantes de los lenguajes oficiales.
*/

SELECT co.Name AS CountryName, co.Code, cl.Language
FROM countrylanguage AS cl
INNER JOIN country AS co
ON cl.CountryCode = co.Code
WHERE cl.IsOfficial = 'F' AND cl.Percentage > (
        SELECT avg(Percentage)
        FROM countrylanguage
        WHERE IsOfficial = 'T'
    );
