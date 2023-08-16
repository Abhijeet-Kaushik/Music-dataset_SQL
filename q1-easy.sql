--Who is the senior most employee based on job title?



SELECT title, last_name, first_name 
FROM employee
ORDER BY levels DESC
LIMIT 1
