/*
7.​ Crear una nueva tabla "Product Refillment". Deberá tener una relación varios
a uno con "products" y los campos: `refillmentID`, `productCode`, `orderDate`,
`quantity`.
*/

CREATE TABLE productrefillment (
	refillmentID INT PRIMARY KEY AUTO_INCREMENT,
	productCode VARCHAR(15) NOT NULL,
	orderDate DATE NOT NULL,
	quantity INT(11) NOT NULL,
	FOREIGN KEY (productCode) REFERENCES products (productCode)
);
