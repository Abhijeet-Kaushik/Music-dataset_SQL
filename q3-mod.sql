--Return all track names that have a song length longer than the average song length.
--Return the Name and milliseconds for eack track. Order by the song length with the 
--longest song listed first.



SELECT name, milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds)
	FROM track
)
ORDER BY milliseconds
DESC
;
