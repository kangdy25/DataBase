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

-- Trigger Functions
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS 
$$
	BEGIN
		NEW.updated_at = CURRENT_TIMESTAMP;
		RETURN NEW;
	END;
$$
LANGUAGE plpgsql


CREATE TRIGGER updated_at
BEFORE UPDATE 
ON movies
FOR EACH ROW EXECUTE PROCEDURE set_updated_at();

-- PostgreSQL Function with Python 

-- print hello
CREATE OR REPLACE FUNCTION hello_world_py(name text)
RETURNS TEXT AS 
$$
	def hello(name):
		return f'hello {name}'
	output = hello(name)
	return output
$$
LANGUAGE plpython3u

SELECT hello_world_py('Dongyoon')

-- request server
CREATE OR REPLACE FUNCTION log_updated_at_py()
RETURNS TRIGGER AS 
$$
	import json, requests

	requests.post('http://localhost:3000', data=json.dumps({td: TD})
$$
LANGUAGE plpython3u

SELECT TRIGGER updated_at_py()
BEFORE UPDATE
ON movies
FOR EACH ROW EXECUTE PROCEDURE  log_updated_at_py();;


