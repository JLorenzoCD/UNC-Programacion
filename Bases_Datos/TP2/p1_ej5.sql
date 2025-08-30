USE world;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ("McMurdo Station", "ATA", "McMurdo Station", 1258);

INSERT INTO continent
VALUES ("Africa", 30370000, 20.4, (SELECT ID FROM city WHERE Name = "Cairo")),
("Antarctica", 14000000, 9.2, (SELECT ID FROM city WHERE Name = "McMurdo Station")),
("Asia", 44579000, 29.5, (SELECT ID FROM city WHERE Name = "Mumbai (Bombay)")),
("Europe", 10180000, 6.8, (SELECT ID FROM city WHERE Name = "Istanbul")),
("North America", 24709000, 16.5, (SELECT ID FROM city WHERE Name = "Ciudad de México")),
("Oceania", 8600000, 5.9, (SELECT ID FROM city WHERE Name = "Sydney")),
("South America", 17840000, 12.0, (SELECT ID FROM city WHERE Name = "São Paulo"));
