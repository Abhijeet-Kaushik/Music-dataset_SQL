-- Who is the best customer? The customer who has spent the most money will be declared the
--best customer. Write a query that returns the person who has spent the most money.


SELECT customer.customer_id, first_name, last_name, SUM(total) AS total_spending
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total_spending DESC
LIMIT 1;
