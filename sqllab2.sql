USE sakila

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
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM film;

--    What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME(ROUND(AVG(length),0)*60) FROM film;

-- 115 minutes, so that is one hour and 55 minutes.

--    How many distinct (different) actors' last names are there?
SELECT DISTINCT COUNT(last_name) FROM actor;

--    Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(Max(last_update), MIN(rental_date)) FROM rental;
-- This one took me AGES to get right - it turns out this is one of the places where mysql and other management systems do things differently (where you have to pass a unit of time as an argument to DATEDIFF).


--    Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, MONTHNAME(rental_date) as Month, WEEKDAY(rental_date) as Day FROM rental
LIMIT 20;

--    Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE 
WHEN WEEKDAY(rental_date) <5 THEN 'workday'
ELSE 'weekend'
END AS day_type
FROM rental;

--    Get release years.
SELECT release_year FROM film;

--    Get all films with ARMAGEDDON in the title.
SELECT title FROM film
WHERE title LIKE '%Armageddon%';
 
--    Get all films which title ends with APOLLO.
SELECT title FROM film
WHERE title LIKE '%Apollo';

--    Get 10 the longest films.
SELECT title FROM film
ORDER BY length DESC
LIMIT 10;

--    How many films include Behind the Scenes content?
SELECT title, special_features FROM film
WHERE special_features LIKE '%Behind the Scenes%';


