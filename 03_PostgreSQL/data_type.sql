-- Data Type in PostgreSQL
create type gender_type as enum ('male', 'female');

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

-- FULL OUTER JOIN
SELECT movies.title, directors.name
FROM movies
FULL OUTER JOIN directors USING (director_id)
WHERE movies.director_id IS NULL OR directors.director_id IS NULL
