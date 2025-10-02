/*
2.​ ¿Cuál es el promedio de órdenes hechas por oficina?, ¿Qué oficina vendió la
mayor cantidad de productos?
*/


/*
¿Cuál es el promedio de órdenes hechas por oficina?
Para esto necesito saber cuantas ordenes realiza cada empleado y luego en base
a su officeCode saco el promedio.
*/
SELECT employeeOrders.officeCode, AVG(employeeOrders.total) as prom
FROM (
	SELECT e.officeCode, COUNT(o.orderNumber) AS total
	FROM employees e
	LEFT JOIN customers c
		ON e.employeeNumber = c.salesRepEmployeeNumber
	LEFT JOIN orders o
		ON c.customerNumber = o.customerNumber
	GROUP BY e.employeeNumber
) AS employeeOrders
GROUP BY employeeOrders.officeCode
ORDER BY employeeOrders.officeCode;

-- Con WITH
WITH employeeOrders AS (
	SELECT e.officeCode, COUNT(o.orderNumber) AS total
	FROM employees e
	LEFT JOIN customers c
		ON e.employeeNumber = c.salesRepEmployeeNumber
	LEFT JOIN orders o
		ON c.customerNumber = o.customerNumber
	GROUP BY e.employeeNumber
)
SELECT
    eo.officeCode,
    AVG(eo.total) AS prom
FROM employeeOrders eo
GROUP BY eo.officeCode;

/*
¿Qué oficina vendió la mayor cantidad de productos?
Para ello tengo que saber cuantos productos vendió cada empleado y luego agrupar
según el officeCode y hacer el SUM(productos_vendidos_empleado)
*/

SELECT
    e.officeCode,
    SUM(od.quantityOrdered) AS totalProductQuantitySale
FROM employees e
INNER JOIN customers c
    ON e.employeeNumber = c.salesRepEmployeeNumber
INNER JOIN orders o
    ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od
    ON o.orderNumber = od.orderNumber
GROUP BY e.officeCode
ORDER BY totalProductQuantitySale DESC
LIMIT 1;

-- Con WITH
WITH employeeSaleQuantity AS (
    SELECT e.officeCode, SUM(od.quantityOrdered) totalProductQuantitySale
    FROM employees e
    LEFT JOIN customers c
        ON e.employeeNumber = c.salesRepEmployeeNumber
    LEFT JOIN orders o
        ON c.customerNumber = o.customerNumber
    LEFT JOIN orderdetails od
        ON o.orderNumber = od.orderNumber
    GROUP BY e.officeCode
)
SELECT esq.officeCode
FROM employeeSaleQuantity AS esq
GROUP BY esq.officeCode
ORDER BY SUM(esq.totalProductQuantitySale) DESC
LIMIT 1;
