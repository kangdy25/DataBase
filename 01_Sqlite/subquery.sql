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