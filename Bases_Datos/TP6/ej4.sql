/*
4.​ Crear un procedimiento "Update Credit" en donde se modifique el límite de
crédito de un cliente con un valor pasado por parámetro.
*/

DELIMITER $$
CREATE PROCEDURE UpdateCredit(IN customerNumber INT, IN newCreditLimit DECIMAL(10,2))
BEGIN
    IF EXISTS (SELECT 1 FROM customers c WHERE c.customerNumber = customerNumber) THEN
        UPDATE customers c
        SET c.creditLimit = newCreditLimit
        WHERE c.customerNumber = customerNumber;
    END IF;
END$$
DELIMITER ;

CALL UpdateCredit(103, 20.00)

-- Reset
CALL UpdateCredit(103, 21000.00);
