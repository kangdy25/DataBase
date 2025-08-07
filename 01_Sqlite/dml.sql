-- INSERT INTO VALUES
INSERT INTO movies 
  (title, rating, released, overview)
VALUES
  -- ('King of Kings', 10, 1, 'Jesus is only king'),
  ('Dune: Part One', 10, 1, 'Sand');

-- UPDATE
UPDATE movies SET rating = rating - 3 WHERE title = 'Dune: Part One';
UPDATE movies SET director = 'Unknown' WHERE director IS NULL;

-- DELETE
DELETE FROM movies WHERE movie_id = 3;

-- SELECT 
SELECT 
  REPLACE(title, ': Part One', ' I') AS title, 
  rating, 
  UPPER(overview) AS overview_upper 
FROM movies;

-- WHERE Clause
SELECT * FROM movies WHERE revenue is NULL;

SELECT * FROM movies 
  WHERE status = 'Planned' 
        AND  budget <> 0 ;

SELECT * FROM movies 
  WHERE rating > 9
        OR release_date > 2024;

-- WHERE Predicates
SELECT * FROM movies 
  WHERE release_date BETWEEN 2020 AND 2024;

-- WHERE Predicates
SELECT * FROM movies 
  WHERE genres IN ('Documentary', 'Comedy');

SELECT * FROM movies 
  WHERE original_language NOT IN ('en', 'es', 'de');

-- Pattern Matching (% is wildcard)
SELECT * FROM movies 
  -- WHERE title LIKE 'The%';
  -- WHERE title LIKE '%Love';
  -- WHERE overview LIKE '%kimchi%';
  -- WHERE title LIKE '______ing';
  WHERE title LIKE 'The ___';

-- SELECT CASE
SELECT 
  title, 
  CASE 
    WHEN rating >= 8 then
      '👍🏻'
    WHEN rating <= 6 THEN
      '👎🏻'
    ELSE
      '👀' 
    END AS good_or_not
  FROM movies;

-- ORDER BY
SELECT * FROM movies
ORDER BY 
  release_date ASC,
  revenue DESC

-- LIMIT
SELECT * FROM movies LIMIT 5;

-- OFFSET
SELECT * FROM movies LIMIT 50 OFFSET 2 * 50;

-- GROUP BY
-- ("감독 별", 총 수익)
SELECT 
  director, 
  SUM(revenue) AS total_revenue 
FROM 
  movies
WHERE director IS NOT NULL
      AND revenue IS NOT NULL
GROUP BY 
  director 
ORDER BY 
  total_revenue DESC;

-- ("개봉년도 별", 평점)
SELECT release_date, round(AVG(rating), 2) AS avg_rating FROM movies
  WHERE 
    rating IS NOT NULL 
    AND release_date IS NOT NULL
GROUP by
  release_date
ORDER BY
  avg_rating DESC