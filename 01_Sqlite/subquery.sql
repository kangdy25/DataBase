-- List movies with a (rating|revenue) higher than the average (rating|revenue) of all movies.
SELECT AVG(rating) FROM movies
  
SELECT COUNT(*) FROM movies WHERE rating > 5.734669125807575

-- SUBQUERY
SELECT 
  COUNT(*) 
FROM movies 
WHERE rating > (
  SELECT AVG(rating) FROM movies
)

-- CTE
WITH avg_revenue_cte AS (
  SELECT AVG(revenue) FROM movies
), avg_rating_cte AS (
  SELECT AVG(rating) FROM movies
)
  
SELECT 
  title, 
  director,
  revenue,
  rating,
  ROUND((SELECT * FROM avg_revenue_cte), 0) AS avg_revenue,
  (SELECT * FROM avg_rating_cte) AS avg_rating
from movies 
where revenue > (SELECT * FROM avg_revenue_cte)
      AND rating > (SELECT * FROM avg_rating_cte)