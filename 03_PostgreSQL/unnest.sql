CREATE TABLE genres (
	genre_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(50) UNIQUE,
	created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL
)

INSERT INTO 
	genres (name) 
SELECT DISTINCT
	UNNEST(string_to_array(genres, ',')) 
FROM movies
GROUP BY genres 

CREATE TABLE movies_genres (
	movie_id BIGINT NOT NULL,
	genre_id BIGINT NOT NULL,
	created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	
	
	PRIMARY KEY (movie_id, genre_id),
	FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
	FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
)

INSERT INTO 
	movies_genres (movie_id, genre_id)
SELECT 
	movies.movie_id,
	genres.genre_id
FROM movies 
JOIN genres ON movies.genres LIKE '%' || genres.name ||  '%'

ALTER TABLE movies DROP COLUMN genres