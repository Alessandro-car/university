USE sakila;

/* List all actors with their first and last name */
SELECT first_name, last_name FROM actor;

/* Find all films with a rating of PG-13 */
SELECT * FROM film WHERE rating LIKE 'PG-13';

/* List all customers sorted by last name */
SELECT * FROM customer ORDER BY last_name;

/* Get all rental records from the rental table */
SELECT * FROM rental;

/* Find all actors whose first name is JOHN */
SELECT * FROM actor WHERE first_name LIKE 'JOHN';

/* Find all films realeased in 2006 */
SELECT * FROM film WHERE release_year = '2006';

/* Find all films in the Action category */
SELECT
	film.title,
	film.description,
	film.release_year,
	film.length,
	category.name
FROM
	film JOIN film_category ON film.film_id = film_category.film_id
	JOIN
		category ON category.category_id = film_category.category_id
	WHERE
		category.name = 'Action';

/* Find customers whose last name starts with 'S' */
SELECT * FROM customer WHERE last_name LIKE 'S%';

/* Find all film with replacement cost greater than $20 */
SELECT * FROM film WHERE replacement_cost > 20.00;

/* List all films with their category names */
SELECT
	film.title,
	film.description,
	film.release_year,
	film.length,
	category.name
FROM
	film JOIN film_category ON film.film_id = film_category.film_id
JOIN
	category ON category.category_id = film_category.category_id;

/* Show each actor's name alongside the films they've acted in */
SELECT
	actor.first_name,
	actor.last_name,
	film.title
FROM
	actor JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN
	film ON film.film_id = film_actor.film_id;


/* Display customer names with their rental dates and film titles */
SELECT
	CONCAT(customer.first_name, " ", customer.last_name) AS customer_name,
	rental.rental_date,
	film.title
FROM
	film JOIN inventory ON film.film_id = inventory.film_id
JOIN
	rental ON inventory.inventory_id = rental.inventory_id
JOIN
	customer ON rental.customer_id = customer.customer_id;

/* List all films avaiable at store_id 1 */
SELECT
	film.title,
	film.description,
	film.release_year,
	film.length
FROM
	film JOIN inventory ON film.film_id = inventory.film_id
WHERE
	inventory.store_id = 1;

/* Show staff names with the payments they've processed */
SELECT
	CONCAT(staff.first_name, " ", staff.last_name) AS staff_name,
	payment.payment_id,
	payment.amount,
	payment.payment_date
FROM
	staff JOIN payment ON staff.staff_id = payment.staff_id;

/* Count the total number of films in each category */

SELECT
	COUNT(film.film_id) as film_count,
	category.name
FROM
	film JOIN film_category ON film.film_id = film_category.film_id
JOIN
	category ON film_category.category_id = category.category_id
GROUP BY category.name;

/* Find the average length of films by rating */
SELECT
	AVG(film.length) AS average_length,
	film.rating
FROM
	film
GROUP BY film.rating;

/* Calculate the total revenue ( sum of payments ) by customer */
SELECT
	SUM(payment.amount) AS total_revenue,
	CONCAT(customer.first_name, " ", customer.last_name) AS customer_name
FROM
	payment JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer_name;

/* Count how many films each actor has appeared in */
SELECT
	COUNT(film_actor.film_id) as num_films,
	CONCAT(actor.first_name, " ", actor.last_name) AS actor_name
FROM
	actor JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor_name;


/* Find the total number of rentals per customer */


