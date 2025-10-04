-- Alumno: Josè Lorenzo Canovas

/*
EJercicio 1

Suponiendo que es una consulta real, seria de mi interes obtener el CustomerID,
CompanyName, ContactName, ContactTitle, TotalOrdersAmount. El primero para mi
sistema y los otros para poder pasar esa info a gente de otra area.
*/
WITH
	CustomerOrdersAmount AS (
        SELECT
            c.CustomerID,
            c.CompanyName,
            c.ContactName,
            c.ContactTitle,
            o.OrderID,
            od.UnitPrice * od.Quantity * (1 - od.Discount) AS OrderAmount
        FROM Customers c
        LEFT JOIN Orders o
            ON  c.CustomerID = o.CustomerID
        LEFT JOIN `Order Details` od
            ON o.OrderID = od.OrderID
	)
SELECT
    coa.CustomerID,
	coa.CompanyName,
    coa.ContactName,
    coa.ContactTitle,
    SUM(coa.OrderAmount) as TotalOrdersAmount
FROM CustomerOrdersAmount coa
GROUP BY coa.CustomerID
ORDER BY TotalOrdersAmount DESC
LIMIT 10;

-- EJercicio 2
WITH ProductAndSales AS (
    SELECT
        p.ProductID,
        p.ProductName,
        p.CategoryID,
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ProductTotalSale
    FROM Products p
    LEFT JOIN `Order Details` od
        ON p.ProductID = od.ProductID
    GROUP BY p.ProductID
    ORDER BY ProductTotalSale DESC
)
SELECT
    ps.ProductName,
    c.CategoryName,
    ps.ProductTotalSale
FROM ProductAndSales AS ps
INNER JOIN Categories c
	ON ps.CategoryID = c.CategoryID
ORDER BY ps.ProductTotalSale DESC;

-- EJercicio 3
WITH ProductAndSales AS (
    SELECT
        p.ProductID,
        p.ProductName,
        p.CategoryID,
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ProductTotalSale
    FROM Products p
    LEFT JOIN `Order Details` od
        ON p.ProductID = od.ProductID
    GROUP BY p.ProductID
    ORDER BY ProductTotalSale DESC
)
SELECT
    c.CategoryName,
    SUM(ps.ProductTotalSale) AS CategoryTotalSale
FROM ProductAndSales AS ps
INNER JOIN Categories c
	ON ps.CategoryID = c.CategoryID
GROUP BY c.CategoryID
ORDER BY CategoryTotalSale DESC;

-- Ejercicio 4
/*
Supuse que seria de interes ver el nombre completo del empleado con mas ventas
de cda año.
*/
CREATE VIEW EmployeeMoreSalesForYear AS (
    WITH
    EmployeeSales AS (
        SELECT
            e.EmployeeID,
            CONCAT(e.FirstName, " ", e.LastName) AS EmployeeFullName,
            o.OrderID,
            o.OrderDate,
            SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalOrderAmount
        FROM Employees e
        LEFT JOIN Orders o
            ON e.EmployeeID = o.EmployeeID
        LEFT JOIN `Order Details` od
            ON o.OrderID = od.OrderID
        GROUP BY e.EmployeeID, o.OrderID
        ORDER BY e.EmployeeID, TotalOrderAmount DESC
    ),
    EmployeeYearSale AS (
        SELECT
            es.EmployeeID,
            es.EmployeeFullName,
            YEAR(es.OrderDate) AS YearTotalSale,
            SUM(es.TotalOrderAmount) AS EmployeeTotalSale
        FROM EmployeeSales es
        GROUP BY es.EmployeeID, YearTotalSale
        ORDER BY es.EmployeeID, YearTotalSale DESC
    )
    SELECT
        eys.YearTotalSale,
        eys.EmployeeID,
        eys.EmployeeFullName,
        eys.EmployeeTotalSale
    FROM EmployeeYearSale AS eys
    WHERE eys.EmployeeID = (
        SELECT eys_2.EmployeeID
        FROM EmployeeYearSale AS eys_2
        WHERE eys_2.YearTotalSale = eys.YearTotalSale
        ORDER BY eys_2.EmployeeTotalSale DESC
        LIMIT 1
    )
    ORDER BY eys.YearTotalSale ASC
);

-- Ejercicio 5
DELIMITER $$
CREATE TRIGGER `Update Product Stock`
AFTER INSERT
ON `Order Details` FOR EACH ROW
BEGIN
	UPDATE Products p
	SET p.UnitsInStock = p.UnitsInStock - NEW.Quantity
	WHERE p.ProductID = NEW.ProductID;
END $$
DELIMITER ;

-- Ejercicio 6
CREATE ROLE admin;

GRANT INSERT
ON Customers
TO admin;

GRANT UPDATE(Phone)
ON Customers
TO admin;
