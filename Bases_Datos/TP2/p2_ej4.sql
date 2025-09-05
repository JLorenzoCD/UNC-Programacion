/*
Liste todos los países que no tienen independencia
(hint: ver que define la independencia de un país en la BD).
*/

SELECT * FROM country WHERE IndepYear is NULL;
