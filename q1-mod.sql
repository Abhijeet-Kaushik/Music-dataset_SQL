-- Write a query to return the email,first name, last name, & Genre of all Rock Music
-- listeners. Return the list ordered alphabetically by email staring with 'A'

SELECT DISTINCT c.first_name,c.last_name,c.email
FROM customer AS c
JOIN invoice ON c.customer_id=invoice.customer_id
JOIN invoice_line ON invoice.invoice_id=invoice_line.invoice_id
WHERE invoice_line.track_id IN (
	  SELECT track_id
	  FROM track
	  JOIN genre ON track.genre_id=genre.genre_id
	  WHERE genre.name LIKE 'Rock'
	)
ORDER BY c.email;

/*SELECT DISTINCT c.first_name,c.last_name,c.email
FROM customer AS c
JOIN invoice ON c.customer_id=invoice.customer_id
JOIN invoice_line ON invoice.invoice_id=invoice_line.invoice_id
JOIN track ON track.track_id=invoice_line.track_id
JOIN genre ON track.genre_id=genre.genre_id
WHERE genre.name LIKE 'Rock'

ORDER BY c.email

;
*/