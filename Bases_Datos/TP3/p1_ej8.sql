/*
Listar aquellos países que tengan hablantes del Inglés pero
no del Español en su población
*/

SELECT country.Name FROM country
INNER JOIN ((
    SELECT CountryCode
    FROM countrylanguage
    WHERE Language = "English"
)
EXCEPT
(
    SELECT CountryCode
    FROM countrylanguage
    WHERE Language = "Spanish"
)) as t	
ON country.Code = t.CountryCode
ORDER BY country.Name ASC;
