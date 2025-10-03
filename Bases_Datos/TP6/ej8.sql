/*
8.​ Definir un trigger "Restock Product" que esté pendiente de los cambios
efectuados en `orderdetails` y cada vez que se agregue una nueva orden revise la
cantidad de productos pedidos (`quantityOrdered`) y compare con la cantidad en
stock (`quantityInStock`) y si es menor a 10 genere un pedido en la tabla
"Product Refillment" por 10 nuevos productos.
*/

DELIMITER $$
CREATE TRIGGER RestockProduct
AFTER INSERT
ON orderdetails FOR EACH ROW
BEGIN
    DECLARE stockRestante INT;

    SELECT (p.quantityInStock - NEW.quantityOrdered)
    INTO stockRestante
    FROM products p
    WHERE p.productCode = NEW.productCode;

    IF stockRestante < 10 THEN
        INSERT INTO productrefillment (productCode, orderDate, quantity)
        SELECT
            NEW.productCode,
            o.orderDate,
            10
        FROM orders o
        WHERE o.orderNumber = NEW.orderNumber;
    END IF;
END $$
DELIMITER ;
