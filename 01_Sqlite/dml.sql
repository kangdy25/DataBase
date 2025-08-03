
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