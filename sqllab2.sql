
-- Instructions

--    Select all the actors with the first name ‘Scarlett’.
SELECT * 
  FROM actor 
  WHERE first_name = 'Scarlett'; 

--    How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(film_id)
  FROM film;
SELECT COUNT(rental_id)
  FROM rental;

--    What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS max_duration FROM film;
SELECT MIN(length) AS min_duration FROM film;

--    What's the average movie duration expressed in format (hours, minutes)?


--    How many distinct (different) actors' last names are there?
SELECT DISTINCT COUNT(last_name) FROM actor

--    Since how many days has the company been operating (check DATEDIFF() function)?
FROM rental
SELECT DATEDIFF(year, MIN(rental_date), MAX(last_update)

--    Show rental info with additional columns month and weekday. Get 20 results.
--    Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
--    Get release years.
SELECT release_year FROM film;

--    Get all films with ARMAGEDDON in the title.
SELECT title FROM film
WHERE title LIKE 'Armageddon';
 
--    Get all films which title ends with APOLLO.


--    Get 10 the longest films.
SELECT title FROM film
ORDER BY length DESC
LIMIT 10;

--    How many films include Behind the Scenes content?


