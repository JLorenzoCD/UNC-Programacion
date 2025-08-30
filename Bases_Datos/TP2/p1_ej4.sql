USE world;

CREATE TABLE continent(
Name VARCHAR(50) PRIMARY KEY,
Area int DEFAULT NULL,
`Percent total mass` FLOAT DEFAULT NULL,
`Most populous city`  INT DEFAULT NULL,
FOREIGN KEY (`Most populous city`) REFERENCES city (ID)
);
