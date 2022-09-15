USE sakila;


   -- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT category.name, count(film_category.film_id) FROM category
JOIN film_category ON category.category_id=film_category.category_id
GROUP BY category.name;


SELECT payment_date FROM payment;

   -- Display the total amount rung up by each staff member in August of 2005.
SELECT CONCAT(staff.first_name, ' ', staff.last_name) as employee, sum(payment.amount) AS amount FROM payment
JOIN staff ON payment.staff_id=staff.staff_id
WHERE LEFT(payment.payment_date, 7) = '2005-08' 
GROUP BY employee;
   
   -- Which actor has appeared in the most films?
SELECT CONCAT(actor.first_name, ' ', actor.last_name) AS actorname, COUNT(film_actor.film_id) AS films FROM actor
JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY actorname
LIMIT 1;     
   
   -- Most active customer (the customer that has rented the most number of films)
SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customername, COUNT(rental.rental_id) AS rentals FROM customer
JOIN rental ON customer.customer_id=rental.customer_id
GROUP BY customername
LIMIT 1;  
   
   
   -- Display the first and last names, as well as the address, of each staff member.
SELECT CONCAT(staff.first_name, ' ', staff.last_name) AS name, address.address as staff_address FROM staff
JOIN address ON staff.address_id=address.address_id;  

   
   -- List each film and the number of actors who are listed for that film.
SELECT film.title, COUNT(film_actor.actor_id) AS actors FROM film
JOIN film_actor ON film.film_id=film_actor.film_id
GROUP BY film.title;
   
   
   -- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT CONCAT(customer.last_name, ', ', customer.first_name) as name, SUM(payment.amount) FROM payment
JOIN customer ON customer.customer_id=payment.customer_id
GROUP BY name 
ORDER BY name ASC;  
   
   
   -- List number of films per category.
SELECT category.name, COUNT(film_category.film_id) FROM category
JOIN film_category ON category.category_id=film_category.category_id
GROUP BY category.name;
