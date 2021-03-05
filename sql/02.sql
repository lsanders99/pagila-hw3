/*
 * Count the number of movies that contain each type of special feature.
 */

SELECT special_features, count('Deleted Scenes')
FROM (
    SELECT film_id, unnest(special_features) AS special_features
    FROM film
) AS t
GROUP BY special_features
ORDER BY special_features;
