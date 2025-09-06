/*
Listar aquellos países cuyos lenguajes oficiales son el
Inglés y el Francés (hint: no debería haber filas
duplicadas).
*/

SELECT DISTINCT country.Name
FROM country
INNER JOIN (
    (
        SELECT CountryCode FROM countrylanguage
        WHERE Language = "French" AND IsOfficial = 'T'
    )
    INTERSECT
    (
        SELECT CountryCode FROM countrylanguage
        WHERE Language = "English" AND IsOfficial = 'T'
    )
) as res
ON country.Code = res.CountryCode;

