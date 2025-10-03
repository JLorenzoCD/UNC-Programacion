/*
5.​ Cree una vista "Premium Customers" que devuelva el top 10 de clientes que más
dinero han gastado en la plataforma. La vista deberá devolver el nombre del
cliente, la ciudad y el total gastado por ese cliente en la plataforma.
*/

CREATE VIEW PremiumCustomers AS (
	SELECT c.customerName, c.city, SUM(p.amount) as totalSpend
	FROM customers c
	LEFT JOIN payments p
		ON c.customerNumber = p.customerNumber
	GROUP BY c.customerNumber
	ORDER BY totalSpend DESC
	LIMIT 10
);

SELECT * FROM PremiumCustomers;
