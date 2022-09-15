USE sakila;


--    Write a query to display for each store its store ID, city, and country.

SELECT store_id, 
       city, 
       country 
	FROM store s
JOIN address a 
	ON s.address_id = a.address_id
JOIN city ci
	ON a.city_id = ci.city_id
JOIN country co 
	ON ci.country_id = co.country_id;


--    Write a query to display how much business, in dollars, each store brought in.

SELECT s.store_id, 
	   SUM(amount) AS revenue
       FROM store s
JOIN customer c 
	ON s.store_id = c.store_id
JOIN payment p 
	ON c.customer_id = p.customer_id
GROUP BY store_id;



--    Which film categories are longest?
SELECT name, 
	   AVG(length) AS average_length
	FROM category c
JOIN film_category fc
	ON c.category_id = fc.category_id
JOIN film f
	ON f.film_id = fc.film_id
GROUP BY name
ORDER BY average_length DESC;


--    Display the most frequently rented movies in descending order.
SELECT  f.title, 
		SUM(rental_id) AS times_rented
	FROM film f
JOIN inventory i
	ON i.film_id = f.film_id
JOIN rental r
	ON r.inventory_id = i.inventory_id
GROUP BY f.title
ORDER BY times_rented DESC;



--    List the top five genres in gross revenue in descending order.
SELECT  name as genre, 
		SUM(amount) as gross_revenue 
	FROM category c
JOIN film_category fc
	ON c.category_id = fc.category_id
JOIN inventory i
	ON fc.film_id = i.film_id
JOIN rental r 
	ON r.inventory_id = i.inventory_id
JOIN payment p 
	ON r.rental_id = p.rental_id
GROUP BY genre
ORDER BY gross_revenue DESC
LIMIT 5;


--    Is "Academy Dinosaur" available for rent from Store 1?
SELECT title, s.store_id FROM film f
JOIN inventory i 
	ON f.film_id = i.film_id
JOIN store s 
	ON s.store_id = i.store_id
WHERE title = "Academy Dinosaur"
AND s.store_id = '1';


--    Get all pairs of actors that worked together.
SELECT  CONCAT(aa.first_name, ' ', aa.last_name) AS Actor1, 
		CONCAT(ab.first_name, ' ', ab.last_name) AS Actor2 FROM film_actor a
JOIN film_actor b
	ON a.actor_id <> b.actor_id 
    AND a.film_id = b.film_id
JOIN actor aa
	ON a.actor_id = aa.actor_id
JOIN actor ab
	ON b.actor_id = ab.actor_id
WHERE NOT EXISTS (SELECT * FROM table t2 WHERE t2.u = t1.v AND t2.v = t1.u AND t1.u > t2.u);
-- TODO: weed out the extra duplicates (for each duo a,b this code returns both a,b and b,a)
-- This feels like something that would require a     
    
--    Get all pairs of customers that have rented the same film more than 3 times.

SELECT
		a.customer_id AS customer1, 
		b.customer_id AS customer2, 
        count(a.inventory_id=b.inventory_id) as counter
	FROM rental a
JOIN rental b
	ON a.customer_id <> b.customer_id
	AND a.inventory_id = b.inventory_id
GROUP BY a.customer_id, b.customer_id
HAVING counter > 3;

-- TODO: weed out the duplicate duos (as above)
-- TODO: make this return the customer names rather than the customer ID.



--    For each film, list actor that has acted in more films.

SELECT DISTINCT 
	f.title, 
	CONCAT(a.first_name, ' ', a.last_name) AS actor_name FROM film f
JOIN film_actor fa1
	ON f.film_id = fa1.film_id
JOIN film_actor fa2 
	ON fa1.film_id <> fa2.film_id
    AND fa1.actor_id = fa2.actor_id
JOIN actor a
	ON fa1.actor_id = a.actor_id;


