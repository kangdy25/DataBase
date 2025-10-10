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