-- What is the average rating of each director?
SELECT
    director,
    AVG(rating) AS avg_rating
FROM
    movies
WHERE
    (
        director IS NOT NULL
        AND rating IS NOT NULL
    )
GROUP BY
    director
ORDER BY
    avg_rating DESC 
    
-- * that has more than 5 movies
SELECT
    director,
    round(AVG(rating), 3) AS avg_rating,
    COUNT(*) AS total_movies
FROM
    movies
WHERE
    (
        director IS NOT NULL
        AND rating IS NOT NULL
    )
GROUP BY
    director
HAVING
    (total_movies >= 5)
ORDER BY
    avg_rating DESC 
    
-- How many movies are in each genre?
SELECT
    genres,
    COUNT(*) AS count_genres
FROM
    movies
WHERE
    (genres IS NOT NULL)
GROUP BY
    genres
ORDER BY
    count_genres DESC 
    
-- How many movies have a rating greater than 6? 
-- What rating is the most common?
SELECT
    rating,
    COUNT(*) AS total_good_movies
FROM
    movies
WHERE
    (rating > 6)
GROUP BY
    rating
ORDER BY
    total_good_movies DESC;