/*
4.​ Modifique la tabla customer. Marque con 'T' en la columna `premium_customer`
de los 10 clientes con mayor dinero gastado en la plataforma.
*/

UPDATE customer c
INNER JOIN (
        SELECT p.customer_id, SUM(p.amount) as total
        FROM payment p
        GROUP BY p.customer_id
        ORDER BY total DESC LIMIT 10
	) as top_10
ON c.customer_id = top_10.customer_id
SET c.premium_customer = 'T';
