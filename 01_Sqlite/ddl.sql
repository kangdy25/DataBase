-- CREATE TABLE
create table movies (
  movie_id integer primary key AUTOINCREMENT,
  title TEXT UNIQUE NOT NULL,
  released INTEGER NOT NULL check (released > 0),
  overview TEXT NOT NULL check (length(overview) < 100),
  rating REAL NOT NULL check (rating between 0 AND 10),
  director TEXT,
  for_kids INTEGER NOT NULL DEFAULT 0 check (for_kids = 0 or for_kids = 1)
) strict;

-- DROP TABLE
drop table movies

-- CREATE VIEW
CREATE VIEW v_flop_or_not AS
SELECT 
  CASE WHEN revenue < budget THEN 'FLOP' ELSE 'SUCCESS' END AS is_success,
  count(*) AS total_movies
FROM movies 
WHERE budget IS NOT NULL
      AND revenue IS NOT NULL
GROUP BY is_success
ORDER BY total_movies DESC

SELECT * FROM v_flop_or_not;

-- DROP VIEW
DROP VIEW v_flop_or_not;