USE sakila;

-- 1. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.
SELECT * FROM film_category;
SELECT * FROM category; 

SELECT c.name, count(fc.film_id) AS num_films
FROM film_category as fc
JOIN category as c 
ON c.category_id = fc.category_id
group by fc.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT staff_id, SUM(amount) 
FROM payment
WHERE payment_date LIKE '2005-08%'
GROUP BY staff_id;

 -- 3. Which actor has appeared in the most films?

SELECT a.first_name, a.last_name, count(fa.film_id) AS NumFilms
FROM actor AS a
JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY Numfilms DESC;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT * from sakila.rental;

SELECT customer_id, count(customer_id) as List FROM sakila.rental
GROUP BY customer_id
ORDER BY List DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.  

SELECT first_name, last_name, address 
FROM  staff AS s 
JOIN address AS a
ON a.address_id = s.address_id;

-- 6. List each film and the number of actors who are listed for that film.

SELECT f.title, f. film_id, count(actor_id) as NumActor	 
FROM sakila.film_actor AS fa
JOIN film AS f
ON fa.film_id=f.film_id
GROUP BY film_id;

-- 7. Using the tables payment and customer and the JOIN command, 
-- list the total paid by each customer. 
-- List the customers alphabetically by last name

SELECT c.last_name, count(amount) as Total	 
FROM sakila.customer AS c
JOIN sakila.payment AS p
ON c.customer_id=p.customer_id
GROUP BY last_name;

-- 8. List number of films per category. =task 1
SELECT c.name, count(fc.film_id) AS num_films
FROM film_category as fc
JOIN category as c 
ON c.category_id = fc.category_id
group by fc.category_id;

