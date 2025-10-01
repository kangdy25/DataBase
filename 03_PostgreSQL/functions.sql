-- Functions
CREATE OR REPLACE FUNCTION hello_world(user_name TEXT, TEXT)
RETURNS TEXT AS 
$$
	SELECT 'hello ' || $1 || ' ' || $2;
$$
LANGUAGE SQL 

DROP FUNCTION hello_world();

SELECT title, hello_world('ang', 'gimotti') FROM movies;