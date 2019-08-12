/*--------------------------------------------------

Description:
To generate this query I am using a sample database of movie rentals provided from the learning website 
Udemy (https://www.udemy.com/). The learning course is titled, "The Complete SQL Bootcamp" by Jose Portillo.

This query returns all actors and their average rentral rate for the most popular movies by release year.
I have utilized table aggregations, common table expressions (CTEs) and sub-querys to accomplish this.)

Author - Morgan Fuller 
Date - 08/11/2019

---------------------------------------------------*/

--Generate a CTE that returns the movie with the best rental rate per release year. 
WITH Best as 
(
	SELECT * 
		FROM 
		(
			SELECT title
			,film_id
			,description
			,last_update
			,rental_rate
			,release_year
			,language_id
			,length
			,replacement_cost
			,ROW_NUMBER() OVER( PARTITION BY release_year ORDER BY rental_rate DESC) as row_num
			from film
		) a
		WHERE a.row_num = 1 
)
SELECT a.actor_id
		,b.film_id
		,b.last_update
		,b.title
		,b.description
		,b.release_year
		,f.first_name
		,f.last_name
		,f.avg_rental_rate
FROM film_actor as a 
INNER JOIN Best as b 
ON a.film_id = b.film_id 
AND a.last_update BETWEEN '2006-01-01' AND '2006-06-01'
--left join a table that contains all actors by their average movie rental rate. 
LEFT JOIN 
(
	SELECT c.actor_id
		,e.first_name
		,e.last_name
		,ROUND(AVG(d.rental_rate),2) as avg_rental_rate
		FROM film_actor as c
		INNER JOIN film as d
		ON c.film_id = d.film_id
		INNER JOIN actor as e 
		ON c.actor_id = e.actor_id
		GROUP BY c.actor_id, e.first_name, e.last_name
)f
ON a.actor_id = f.actor_id
ORDER BY avg_rental_rate DESC
