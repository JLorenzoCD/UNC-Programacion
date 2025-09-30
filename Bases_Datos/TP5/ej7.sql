/*
7.​ Calcule, por cada mes, el promedio de pagos (Hint: vea la manera de extraer
el nombre del mes de una fecha).
*/

SELECT
	YEAR(p.payment_date) AS year,
	MONTH(p.payment_date) AS month,
	AVG(p.amount) as avg_amount
FROM payment p
GROUP BY year, month
ORDER BY year, month;

-- Pone el nombre del mes por escrito y no el numero
SELECT
    YEAR(p.payment_date) AS year,
    MONTHNAME(p.payment_date) AS month,
    AVG(p.amount) AS avg_amount
FROM
    payment p
GROUP BY
    year, MONTH(p.payment_date), month	-- month se incluye porque es una col seleccionada, no agregada (algo del estándar de SQL)
ORDER BY
    year, MONTH(p.payment_date);  -- Como month es un string, el ordenamiento sera alfabético, cosa qu eno se quiere
