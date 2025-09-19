--1. ¿Devuelven los mismos valores las siguientes consultas? ¿Por qué?

SELECT city.Name, country.Name
FROM city
INNER JOIN country
ON city.CountryCode = country.Code AND country.Name = 'Argentina';

SELECT city.Name, country.Name
FROM city
INNER JOIN country
ON city.CountryCode = country.Code
WHERE country.Name = 'Argentina';


/*
1. Si da lo mismo, ya que las condiciones en el ON o en WHERE del INNER JOIN
funcionan de forma idéntica.


2. ¿Y si en vez de INNER JOIN fuera un LEFT JOIN?

No da o mismo, ya que en la primera query estaría tomando todos las ciudades
y a los que sean de Argentina, les traería los datos del país Argentina. Pero
aquellas ciudades que no sean de Argentina, les traería NULL.

La segunda query funcionaria igual que el INNER JOIN, debido al WHERE.

*/
