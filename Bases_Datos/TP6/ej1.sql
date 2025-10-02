/*
1.​ Devuelva la oficina con mayor número de empleados.
*/

-- Si solo se pide el id
SELECT e.officeCode
FROM employees e
GROUP BY e.officeCode
ORDER BY COUNT(e.officeCode) DESC
LIMIT 1;

-- Si se pide toda la info de esta
SELECT o.*
FROM offices o
INNER JOIN (
	SELECT e.officeCode
	FROM employees e
	GROUP BY e.officeCode
	ORDER BY COUNT(e.officeCode) DESC
	LIMIT 1
) as office_more_employees
ON o.officeCode = office_more_employees.officeCode;
