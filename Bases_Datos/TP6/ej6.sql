/*
6.​ Cree una función "employee of the month" que tome un mes y un año y devuelve
el empleado (nombre y apellido) cuyos clientes hayan efectuado la mayor cantidad
de órdenes en ese mes.
*/

DELIMITER $$
CREATE FUNCTION EmployeeOfTheMonth(p_month INT, p_year INT)
RETURNS VARCHAR(101)
DETERMINISTIC
BEGIN
	return (
        SELECT CONCAT(e.firstName, " ", e.lastName)
        FROM employees e
        INNER JOIN customers c
            ON e.employeeNumber = c.salesRepEmployeeNumber
        INNER JOIN orders o
            ON c.customerNumber = o.customerNumber
        WHERE
            MONTH(o.orderDate) = p_month
            AND YEAR(o.orderDate) = p_year
        GROUP BY e.employeeNumber
        ORDER BY COUNT(o.orderNumber) DESC
        LIMIT 1
    );
END $$
DELIMITER ;

SELECT EmployeeOfTheMonth(1, 2003);
