--Lets invite the artists who have written the most rock music in our dataset. Write a query
--that returns the Artist name and total track count of the top 10 rock bands.


SELECT a.artist_id,a.name,COUNT(a.artist_id)AS number_of_songs
FROM artist AS a
JOIN album ON a.artist_id=album.artist_id
JOIN track ON track.album_id=album.album_id
JOIN genre ON track.genre_id=genre.genre_id
WHERE genre.name = 'Rock'
GROUP BY a.artist_id
ORDER BY number_of_songs DESC
LIMIT 10
;