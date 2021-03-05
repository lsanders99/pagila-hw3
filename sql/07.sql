/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */



SELECT first_name || ' ' || last_name AS "Actor Name"
FROM (
    SELECT distinct(actor_id)
    FROM film_actor
    WHERE film_id IN (
        SELECT film_id
        FROM film_actor
        WHERE actor_id IN (
            SELECT distinct(actor_id)
            FROM film_actor
            WHERE film_id IN (
                SELECT film_id
                FROM film_actor
                WHERE actor_id = 112 
            )
        )
    )   
) AS t
INNER JOIN actor USING (actor_id)
WHERE actor_id NOT IN (
    SELECT distinct(actor_id)
    FROM film_actor
    WHERE film_id IN (
        SELECT film_id
        FROM film_actor
        WHERE actor_id = 112
    )
)
ORDER BY "Actor Name";

