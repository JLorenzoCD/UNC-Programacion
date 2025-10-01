/*
12.​Cree un procedimiento `check_date_and_fine` que revise la tabla `rental` y
cree un registro en la tabla `fines` por cada `rental` cuya devolución
(return_date) haya tardado más de 3 días (comparación con rental_date). El valor
de la multa será el número de días de retraso multiplicado por 1.5.
*/

DELIMITER $$
CREATE PROCEDURE check_date_and_fine()
	BEGIN
		INSERT INTO fines (rental_id, amount)
		(
			SELECT
				r.rental_id,
				(DATEDIFF(r.return_date, r.rental_date) * 1.5) as amount
			FROM rental r
			WHERE
				r.return_date IS NOT NULL
				AND DATEDIFF(r.return_date, r.rental_date) > 3
			    AND r.rental_id NOT IN (SELECT rental_id FROM fines)
		);
	END$$
DELIMITER ;

CALL check_date_and_fine();
