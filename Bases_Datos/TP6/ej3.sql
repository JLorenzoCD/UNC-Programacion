/*
3.​ Devolver el valor promedio, máximo y mínimo de pagos que se hacen por mes.
*/

SELECT
	YEAR(p.paymentDate) AS year,
	MONTH(p.paymentDate) AS month,
	AVG(p.amount) AS prom,
	MAX(p.amount) AS max,
	MIN(p.amount) AS min
FROM payments p
GROUP BY year, month
ORDER BY year, month;
