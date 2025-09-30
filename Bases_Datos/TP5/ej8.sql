/*
8.​ Listar los 10 distritos que tuvieron mayor cantidad de alquileres (con la
cantidad total de alquileres).
*/

SELECT a.district, COUNT(r.rental_id) as total
FROM rental r
INNER JOIN
    inventory i ON r.inventory_id = i.inventory_id
INNER JOIN
    store s ON i.store_id = s.store_id
INNER JOIN
    address a ON s.address_id = a.address_id
GROUP BY a.district
ORDER BY total DESC
LIMIT 10;
