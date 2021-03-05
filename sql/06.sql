/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1;
 * That is, list all actors that have appeared in a film with 'RUSSEL BACALL'.
 * Do not list 'RUSSEL BACALL', since he has a Bacall Number of 0.
 */

SELECT first_name || ' ' || last_name AS "Actor Name"
FROM (
    SELECT distinct(actor_id)
    FROM film_actor
    WHERE film_id IN (
        SELECT film_id
        FROM film_actor
        WHERE actor_id = 112
    )
) AS t
INNER JOIN actor USING (actor_id)
WHERE actor_id != 112
ORDER BY "Actor Name";

