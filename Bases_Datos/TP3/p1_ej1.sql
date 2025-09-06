/*
Lista el nombre de la ciudad, nombre del país, región y
forma de gobierno de las 10 ciudades más pobladas del mundo
*/

SELECT city.Name, country.Name, country.Region
FROM city
INNER JOIN country
ON city.CountryCode = country.Code
ORDER BY city.Population DESC LIMIT 10;
