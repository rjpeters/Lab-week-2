USE sakila;

--    In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

-- This one was tricky for me. First I tried a somewhat convoluted method that I googled together (with a 'Self Join')
SELECT last_name FROM sakila.actor a
WHERE NOT EXISTS (select 1 
         from sakila.actor b
         where b.last_name = a.last_name
         and b.first_name <> a.first_name);

-- Then there's another, easier way, where the output is less clean (because you also get the stuff you don't want, albeit at the bottom of the list):
SELECT last_name, COUNT(first_name) as how_many FROM sakila.actor
GROUP BY last_name
ORDER BY how_many ASC;
-- And then copy-paste the names that have '1' in the how_many column - there's your answer



--    Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
-- I'm pretty sure it is possible to do this more simply than what I'm doing here, but can't figure out how right now.

-- Again, I have two different methods. The convoluted join method...
SELECT last_name FROM sakila.actor a
WHERE EXISTS (select 1 
         from sakila.actor b
         where b.last_name = a.last_name
         and b.first_name <> a.first_name);

-- And the dirty 'group by' method (but here with DESC, to give last names with higher frequencies than 1):
SELECT last_name, COUNT(first_name) as how_many FROM sakila.actor
GROUP BY last_name
ORDER BY how_many DESC;



--    Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(rental_id) FROM sakila.rental
GROUP BY staff_id;


--    Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(film_id) FROM sakila.film
GROUP BY release_year;


--    Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(film_id) FROM sakila.film
GROUP BY rating;


--    What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, ROUND(AVG(length),0) FROM sakila.film 
GROUP BY rating;


--    Which kind of movies (rating) have a mean duration of more than two hours?
SELECT DISTINCT rating FROM sakila.film
WHERE length > 120;


--    Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, 
       length, 
       DENSE_RANK() OVER (ORDER BY length DESC) ranking FROM sakila.film
WHERE length IS NOT NULL
AND length > 0;