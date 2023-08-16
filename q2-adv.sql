--We want to find out the most popular music genre in the country as genre with highest 
--amount of purchases. Write a query that returns each country along with top genre. For
--countries where the Max number of purchases is shared return all genres.


WITH popular_genre AS
(
SELECT COUNT(invoice_line.quantity) AS purchases,customer.country,genre.name,genre.genre_id,
ROW_NUMBER () OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity)DESC) AS
RowNo
FROM invoice_line
JOIN invoice ON invoice_line.invoice_id=invoice.invoice_id
JOIN customer ON invoice.customer_id=customer.customer_id
JOIN track ON track.track_id=invoice_line.track_id
JOIN genre ON genre.genre_id=track.genre_id
GROUP BY 2,3,4
ORDER BY 2 ASC,1 DESC
)
SELECT * FROM popular_genre WHERE RowNo<=1