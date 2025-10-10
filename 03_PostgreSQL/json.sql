-- JSON and JSONB
CREATE TABLE users (
	user_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	profile JSONB 
)

INSERT INTO users (profile) VALUES
('{"name": "Taco", "age": 30, "city": "Budapest"}'),
('{"name": "Giga", "age": 25, "city": "Tbilisi", "hobbies": ["reading", "climbing"]}');

INSERT INTO users (profile) VALUES
(json_build_object('name', 'Taco', 'age', 30, 'city', 'Budapest')),
(json_build_object('name', 'Giga', 'age', 25, 'city', 'Tbilisi', 'hobbies', json_build_array('reading', 'climbing')));

SELECT * FROM users

-- Data Extraction
SELECT 
	profile ->> 'name' AS name,
	profile ->> 'city' AS city,
	profile -> 'age' AS age,
	profile -> 'hobbies' ->> 0 AS first_hobby
FROM users


-- Querying JSON
SELECT 
	profile ->> 'name' AS name,
	profile ->> 'city' AS city,
	jsonb_array_length(profile -> 'hobbies') AS total_hobbies
FROM users
WHERE profile ->> 'name' = 'Taco' AND 
	(profile ->> 'age')::integer <= 30 AND
	profile -> 'city' ? 'Budapest' AND
	profile ->> 'city' LIKE 'B%'