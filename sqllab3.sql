USE sakila;

--    In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

SELECT last_name FROM actor a
WHERE NOT EXISTS (select 1 
         from actor b
         where b.last_name = a.last_name
         and b.first_name <> a.first_name);


--    Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

SELECT last_name FROM actor a
WHERE EXISTS (select 1 
         from actor b
         where b.last_name = a.last_name
         and b.first_name <> a.first_name);
         

--    Using the rental table, find out how many rentals were processed by each employee.


--    Using the film table, find out how many films were released each year.


--    Using the film table, find out for each rating how many films were there.


--    What is the mean length of the film for each rating type. Round off the average lengths to two decimal places


--    Which kind of movies (rating) have a mean duration of more than two hours?


--    Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
