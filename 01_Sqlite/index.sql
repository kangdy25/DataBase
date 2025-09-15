-- Query Plan
EXPLAIN QUERY plan WITH director_stats AS (
  SELECT 
    director, 
    COUNT(*) AS total_movies,
    AVG(rating) AS avg_rating,
    MAX(rating) AS best_rating,
    MIN(rating) AS worst_rating,
    MAX(budget) AS highest_budget,
    MIN(budget) AS lowest_budget
  FROM movies 
  WHERE director IS NOT NULL 
        AND budget IS NOT NULL 
        AND rating IS NOT NULL
  GROUP BY director
)


SELECT director, 
  total_movies,
  avg_rating,
  best_rating,
  worst_rating,
  highest_budget,
  lowest_budget,
  (
  SELECT 
    title
  FROM movies 
  WHERE rating IS NOT NULL
        AND budget IS NOT NULL
        AND director = ds.director
  ORDER BY rating DESC 
  LIMIT 1
) AS best_rated_movie, (
  SELECT 
    title
  FROM movies 
  WHERE rating IS NOT NULL
        AND budget IS NOT NULL
        AND director = ds.director
  ORDER BY rating ASC 
  LIMIT 1
) AS worst_rated_movie,(
  SELECT 
    title
  FROM movies 
  WHERE rating IS NOT NULL
        AND budget IS NOT NULL
        AND director = ds.director
  ORDER BY budget DESC 
  LIMIT 1
) AS highest_budget_movie,(
  SELECT 
    title
  FROM movies 
  WHERE rating IS NOT NULL
        AND budget IS NOT NULL
        AND director = ds.director
  ORDER BY budget ASC 
  LIMIT 1
) AS lowest_budget_movie
FROM director_stats AS ds

CREATE INDEX idx_director ON movies (director)

DROP INDEX idx_director;

-- Primary Key & Index
CREATE TABLE X (name TEXT);

INSERT INTO X VALUES ('Hello');

SELECT name, rowid FROM X;

-- Multi Column Indexes
EXPLAIN QUERY plan SELECT 
  title
FROM movies
WHERE 
  release_date = 2022
  AND rating > 7;

CREATE INDEX idx on movies (release_date, rating);