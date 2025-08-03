create table movies (
  movie_id integer primary key AUTOINCREMENT,
  title TEXT UNIQUE NOT NULL,
  released INTEGER NOT NULL check (released > 0),
  overview TEXT NOT NULL check (length(overview) < 100),
  rating REAL NOT NULL check (rating between 0 AND 10),
  director TEXT,
  for_kids INTEGER NOT NULL DEFAULT 0 check (for_kids = 0 or for_kids = 1)
) strict;

drop table movies

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
