-- Functions
CREATE OR REPLACE FUNCTION hello_world(user_name TEXT, TEXT)
RETURNS TEXT AS 
$$
	SELECT 'hello ' || $1 || ' ' || $2;
$$
LANGUAGE SQL 

DROP FUNCTION hello_world();

SELECT title, hello_world('ang', 'gimotti') FROM movies;

-- Return Types
CREATE OR REPLACE FUNCTION is_hit_or_flop(movie movies)
RETURNS TABLE (hit_or_flop TEXT, other_thing numeric) AS 
$$
	SELECT CASE
		WHEN movie.revenue >= movie.budget THEN 'Hit'
		WHEN movie.revenue < movie.budget THEN 'Flop'
		ELSE 'N/A'
	END, 1111
$$
LANGUAGE SQL 


SELECT
	title,
	(is_hit_or_flop(movies.*)).*
FROM movies
