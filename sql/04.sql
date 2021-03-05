/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT distinct(first_name || ' ' || last_name) AS "Actor Name"
FROM (
SELECT distinct(actor_id)
FROM film_actor
WHERE film_id IN (
    SELECT film_id
    FROM (
        SELECT film_id, unnest(special_features) AS special_feature
        FROM film
    ) AS t
    WHERE special_feature = 'Behind the Scenes'
)
) as k
INNER JOIN actor USING (actor_id)
ORDER BY "Actor Name";
