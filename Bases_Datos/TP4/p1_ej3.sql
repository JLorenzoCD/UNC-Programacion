/*
Listar todas aquellas ciudades no asiáticas cuya población sea igual
o mayor a la población total de algún país de Asia
*/

SELECT city.Name, city.Population, country.Continent AS CountryContinent
FROM city
INNER JOIN country
ON city.CountryCode = country.Code
WHERE
    country.Continent != 'Asia'
    AND city.Population >= SOME (SELECT Population FROM country WHERE Continent = 'Asia');
