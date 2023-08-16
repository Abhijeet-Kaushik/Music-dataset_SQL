--Find how much amount spent by each customer on artists? Write a query to return customer 
--name and total spent.

WITH best_selling_artist AS(
	SELECT artist.artist_id,artist.name,
	SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
	FROM invoice_line
	JOIN track ON track.track_id=invoice_line.track_id
	JOIN album ON track.album_id=album.album_id
	JOIN artist ON artist.artist_id=album.artist_id
	GROUP BY 1 
	ORDER BY 3 DESC
)

SELECT  customer.customer_id,customer.first_name, customer.last_name, bsa.name,
SUM(invoice_line.unit_price*invoice_line.quantity) AS amount_spent
FROM invoice
JOIN customer ON customer.customer_id=invoice.customer_id
JOIN invoice_line ON invoice_line.invoice_id=invoice.invoice_id
JOIN track ON track.track_id=invoice_line.track_id
JOIN album ON album.album_id=track.album_id
JOIN best_selling_artist AS bsa ON bsa.artist_id=album.artist_id
GROUP BY 1,2,3,4
ORDER BY 5
DESC;

/*SELECT  customer.customer_id,customer.first_name, customer.last_name, artist.name,
SUM(invoice_line.unit_price*invoice_line.quantity)
FROM artist,customer
JOIN invoice ON customer.customer_id=invoice.customer_id
JOIN invoice_line ON invoice_line.invoice_id=invoice.invoice_id
JOIN track ON track.track_id=invoice_line.track_id
WHERE track.album_id IN (
	SELECT album.album_id
	FROM album
	JOIN artist ON album.artist_id=artist.artist_id
)

GROUP BY 1,2,3,4
ORDER BY 5 DESC

;
*/

