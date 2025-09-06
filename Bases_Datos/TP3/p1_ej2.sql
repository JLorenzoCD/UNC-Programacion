/*
Listar los 10 países con menor población del mundo, junto a
sus ciudades capitales (Hint: puede que uno de estos países
no tenga ciudad capital asignada, en este caso deberá
mostrar "NULL").
*/

SELECT country.Name as CountryName, city.Name as Capital
FROM country
LEFT JOIN city
ON country.Code = city.CountryCode AND country.Capital = city.ID
ORDER BY country.Population ASC LIMIT 10;
