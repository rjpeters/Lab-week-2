USE sakila;

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

SELECT title FROM film;

SELECT DISTINCT name AS language FROM language;

SELECT COUNT(store_id) FROM store;

SELECT COUNT(staff_id) FROM staff;

SELECT first_name FROM staff;