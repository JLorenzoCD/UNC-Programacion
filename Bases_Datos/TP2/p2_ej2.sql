/*
Liste el nombre y la población de las 10 ciudades más pobladas del mundo.
*/

SELECT Name, Population from country
ORDER BY Population DESC LIMIT 10;
