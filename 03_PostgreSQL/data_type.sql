-- Data Type in PostgreSQL
create type gender_type as enum ('male', 'female');

CREATE TABLE users (
	username CHAR(10) not null unique,
	email VARCHAR(50) not null unique,
	gender gender_type not null,
	interest TEXT[] not null,
	bio text,
	profile_photo BYTEA
)
