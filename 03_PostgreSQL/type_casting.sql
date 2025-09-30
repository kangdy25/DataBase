create type gender_type as enum ('male', 'female');

-- Create Data
CREATE TABLE users (
	username CHAR(10) not null unique,
	email VARCHAR(50) not null unique,
	gender gender_type not null,
	interest TEXT[] not null,
	bio text,
	profile_photo BYTEA,
	
	age SMALLINT NOT NULL CHECK(age >= 0),
	is_admin BOOLEAN NOT NULL DEFAULT FALSE,
	joined_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	birth_date DATE NOT NULL,
	bed_time TIME NOT NULL,
	graduation_year INTEGER NOT NULL CHECK(graduation_year BETWEEN 1901 AND 2115),
	internship_period INTERVAL 
)

-- Insert Data
INSERT INTO users(
	username,
	email,
	gender,
	interest,
	bio,
	age,
	is_admin,
	birth_date,
	bed_time,
	graduation_year,
	internship_period
) VALUES (
	'dongyoon',
	'yeah@n.com',
	'male',
	ARRAY['tech', 'music', 'travel'],
	'I like eating and traveling',
	25,
	TRUE,
	'2001-05-25',
	'23:59:59',
	2026,
	'2 years 6 months'
)

-- Type Casting
SELECT joined_at::date FROM users 

SELECT joined_at::time FROM users 

SELECT 
	joined_at::date AS joined_date,
	EXTRACT(YEAR FROM joined_at) AS joined_year,
	joined_at - INTERVAL '1 day' AS day_before_joining,
	AGE(birth_date) AS age,
	justify_interval(INTERVAL '38493 hours')
FROM users

DROP TABLE users 
