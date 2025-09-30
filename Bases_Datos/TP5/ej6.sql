/*
6.​ ¿Cuáles fueron la primera y última fecha donde hubo pagos?
*/

SELECT
	MIN(p.payment_date) AS first_payment,
	MAX(p.payment_date ) AS last_payment
FROM payment p;
