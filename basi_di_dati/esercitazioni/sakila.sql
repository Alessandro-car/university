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

SELECT
	COUNT(rental.rental_id) as num_rentals,
	CONCAT(customer.first_name, " ", customer.last_name) as customer_name
FROM
	rental JOIN customer ON rental.customer_id = customer.customer_id
GROUP BY customer_name;

/* Find the top 5 most rented films */
SELECT
	COUNT(rental.rental_id) as num_rented,
	film.title
FROM
	film JOIN inventory ON film.film_id = inventory.film_id
JOIN
	rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY num_rented DESC
LIMIT 5;

/* List customers who have spent more than $100 in total */
SELECT
	CONCAT(customer.first_name, " ", customer.last_name) as customer_name,
	SUM(payment.amount) as total_spent
FROM
	customer JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer_name
HAVING total_spent > 100.00;

/* Find actors who have appeared in more than 30 films */
SELECT
	CONCAT(actor.first_name, " ", actor.last_name) as actor_name,
	COUNT(film_actor.film_id) as num_appeared
FROM
	actor JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor_name
HAVING num_appeared > 30;


/* Show films that have never been rented */
SELECT
	film.title
FROM
	film LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN
	rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.rental_id IS NULL;


/* Find the most popular film category by rental count */
SELECT
	category.name,
	COUNT(rental.rental_id) as category_most_rented
FROM
	category JOIN film_category ON category.category_id = film_category.category_id
JOIN
	film ON film.film_id = film_category.film_id
JOIN
	inventory ON film.film_id = inventory.film_id
JOIN
	rental ON inventory.inventory_id = rental.inventory_id
GROUP BY category.name
ORDER BY category_most_rented DESC
LIMIT 1;


/* List customers who haven't returned their rentals */
SELECT
	CONCAT(customer.first_name, " ", customer.last_name) as customer_name
FROM
	customer JOIN rental ON customer.customer_id = rental.customer_id
WHERE return_date IS NULL;

/* Find the average rental duration by film rating */
SELECT
	AVG(DATEDIFF(rental.return_date, rental.rental_date)) as avg_rental_duration,
	film.rating
FROM
	film JOIN inventory ON film.film_id = inventory.inventory_id
JOIN
	rental ON rental.inventory_id = inventory.inventory_id
WHERE rental.return_date IS NOT NULL
GROUP BY film.rating;


/* Show the top 10 customers by total amount spent */
SELECT
	SUM(payment.amount) as total_amount,
	CONCAT(customer.first_name, " ", customer.last_name) as customer_name
FROM
	customer JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer_name
ORDER BY total_amount DESC
LIMIT 10;


/* List films with their total inventory count across all stores */
SELECT
	film.title,
	COUNT(inventory.inventory_id) as total_inventory_count
FROM
	film JOIN inventory ON film.film_id = inventory.film_id
GROUP BY film.title;

/* Find cities with more than 5 customers */
SELECT
	city.city,
	COUNT(customer.customer_id) as num_customers
FROM
	city JOIN address ON city.city_id = address.city_id
JOIN
	customer ON customer.address_id = address.address_id
GROUP BY city.city
HAVING num_customers > 5;

/* Find pairs of actors who have appeared together in at least 3 films */
SELECT
	CONCAT(a1.first_name, " ", a1.last_name) as first_actor,
	CONCAT(a2.first_name, " ", a2.last_name) as second_actor,
	COUNT(*) as film_together
FROM
	actor a1 JOIN actor a2 ON a1.actor_id < a2.actor_id
JOIN
	film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN
	film_actor fa2 ON a2.actor_id = fa2.actor_id AND fa1.film_id = fa2.film_id
GROUP BY first_actor, second_actor
HAVING film_together >= 3
ORDER BY film_together DESC;

/* Calculate monthly revenue for each store */
SELECT
	store.store_id,
	SUM(payment.amount) as revenue,
	MONTH(payment_date) as month,
	YEAR(payment_date) as year
FROM
	store JOIN staff ON store.store_id = staff.store_id
JOIN
	payment ON payment.staff_id = staff.staff_id
GROUP BY store.store_id, month, year
ORDER BY store.store_id, revenue DESC, year, month;

/* Find customers who have rented films from all categories */
SELECT
	CONCAT(customer.first_name, " ", customer.last_name) as customer_name
FROM
	customer
WHERE (
	SELECT COUNT(DISTINCT category.category_id)
	FROM
		rental JOIN inventory ON rental.inventory_id = inventory.inventory_id
	JOIN
		film_category ON film_category.film_id = inventory.film_id
	JOIN
		category ON category.category_id = film_category.category_id
	WHERE customer.customer_id = rental.customer_id
) = (SELECT COUNT(*) FROM category);


/* Show the most rented film in each category */
SELECT
	film.title,
	COUNT(rental.rental_id) as num_rented,
	category.name as name
FROM
	rental JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN
	film ON inventory.film_id = film.film_id
JOIN
	film_category ON film_category.film_id = film.film_id
JOIN
	category ON category.category_id = film_category.category_id
GROUP BY film.title, category.name
HAVING num_rented = (
	SELECT MAX(num) as max_num_rented
	FROM (
		SELECT
			COUNT(rental.rental_id) AS num,
			category.name as category_name
		FROM
			rental JOIN inventory ON rental.inventory_id = inventory.inventory_id
		JOIN
			film ON inventory.film_id = film.film_id
		JOIN
			film_category ON film_category.film_id = film.film_id
		JOIN
			category ON category.category_id = film_category.category_id
		GROUP BY film.title, category.name
	) as subquery
	WHERE subquery.category_name = name
)
ORDER BY num_rented DESC;

/* List staff members with their total number of rentals processed */
SELECT
	CONCAT(staff.first_name, " ", staff.last_name) as staff_name,
	COUNT(rental.rental_id) as rentals_processed
FROM
	staff JOIN rental ON staff.staff_id = rental.staff_id
GROUP BY staff_name
ORDER BY rentals_processed DESC;
