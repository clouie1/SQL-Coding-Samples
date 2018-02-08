SELECT payment_id AS my_payment_column
FROM payment;

SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id;

--------------------
--- Inner Join ---
--------------------

SELECT customer.customer_id, 
	first_name,
	last_name,
	email,
	amount,
	payment_date
FROM customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
WHERE customer.first_name LIKE 'A%';

-- EXAMPLES ---
SELECT payment_id, amount, first_name, last_name
FROM payment
INNER JOIN staff ON payment.staff_id = staff.staff_id;


SELECT title, COUNT(title) FROM inventory
INNER JOIN film ON inventory.film_id = film.film_id
WHERE store_id = 1
GROUP BY title
ORDER BY title;


SELECT title, name AS movie_language
FROM film
JOIN language AS lan ON lan.language_id = film.language_id;

-- inner join and join are the same 


---------------------------------
-- OUTER JOINS ---------------
---------------------------------

-- LEFT OUTER JOIN

SELECT film.film_id, film.title, inventory_id
FROM film
LEFT OUTER JOIN inventory ON inventory.film_id = film.film_id;

-- FILMS THAT ARE NOT IN THE INVENTORY but are in Film
SELECT film.film_id, film.title, inventory_id
FROM film
LEFT OUTER JOIN inventory ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL
ORDER BY film.film_id;

SELECT film.film_id, film.title, inventory_id
FROM film
LEFT OUTER JOIN inventory ON inventory.film_id = film.film_id
WHERE inventory_id IS NULL;


SELECT film.film_id, film.title, inventory_id
FROM film
RIGHT OUTER JOIN inventory ON inventory.film_id = film.film_id
WHERE film.film_id IS NULL;


--------------------------------------
-- TIMESTAMPS -----------
------------------------------------

SELECT customer_id, extract(day from payment_date) AS day
FROM payment;

SELECT SUM(amount), extract(month from payment_date) AS month
FROM payment
GROUP BY month
ORDER BY SUM(amount) DESC
LIMIT 1;

----------------------------------
------- MATHEMATICAL FUNCTION -----
-------------------------------------
SELECT rental_id/customer_id AS new_id
FROM payment;

SELECT round(AVG(amount),2)
FROM payment;


----------------------------------
------- STRING FUNCTION -----
-------------------------------------
SELECT first_name || ' ' || last_name AS full_name
FROM customer;

SELECT first_name, char_length(first_name)
FROM customer;

SELECT lower(first_name)
FROM customer;

SELECT upper(first_name)
FROM customer;

---------------------------
---- SUBQUERY ------------
---------------------------
SELECT AVG(rental_rate) FROM film;

SELECT title, rental_rate
FROM film
WHERE rental_rate > 2.98;
-- AS YOU CAN SEE....IT TAKES TWO STEPS

-- here goes subquery
SELECT film_id, title, rental_rate 
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

SELECT * FROM inventory
LIMIT 1;


SELECT film_id, title
FROM film
WHERE film_id IN 
(SELECT inventory.film_id
	FROM rental
	INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
	WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');


--------------------------
------ SELF JOIN ---------
--------------------------
SELECT a.customer_id, a.first_name, a.last_name, 
		b.customer_id, b.first_name, b.last_name
FROM customer AS a, customer AS b
WHERE a.first_name = b.last_name;

-- sample results but using the word 'join'
SELECT a.customer_id, a.first_name, a.last_name, 
		b.customer_id, b.first_name, b.last_name
FROM customer AS a
LEFT OUTER JOIN customer AS b
ON a.first_name = b.last_name
ORDER BY a.customer_id;





