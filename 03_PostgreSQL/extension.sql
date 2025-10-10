-- Extension List
SELECT * FROM pg_available_extensions

SELECT * FROM pg_extension

-- HSTORE
CREATE EXTENSION hstore

CREATE TABLE users(
	user_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	prefs HSTORE
	
)

INSERT INTO users (prefs) VALUES (
	'theme => dark, lang => kr, notifications => off'), 
	('theme => light, lang => es, notifications => on, 
	 push_notifications => on, email_notifications => off'), 
	('theme => dark, lang => it, start_page => dashboard, font_size => large');
	
SELECT * FROM users

SELECT 
	user_id, 
	prefs -> 'theme',
	prefs -> ARRAY['lang', 'notifications'],
	prefs ? 'font_size' AS has_font_size,
	prefs ?| ARRAY['push_notifications', 'start_page'],
	akeys(prefs),
	avals(prefs)
FROM users
	
UPDATE users SET prefs['theme'] = 'light'
WHERE user_id = 1

UPDATE users SET prefs = prefs || hstore(ARRAY['currency', 'cookies_ok'], ARRAY['krw', 'yes'])

UPDATE users SET prefs = DELETE(prefs, 'cookies_ok')

-- PGCrypto
CREATE EXTENSION pgcrypto

CREATE TABLE users(
	user_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	username VARCHAR(100),
	password VARCHAR(100)
)

INSERT INTO users (username, password)
VALUES ('nico', crypt('user_password', gen_salt('bf')))

SELECT username FROM users 
WHERE username = 'nico' AND password = crypt('user_password', password)

SELECT * FROM users