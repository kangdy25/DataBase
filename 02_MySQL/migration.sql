use movies;

CREATE TABLE movies (
	movie_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(300) NOT NULL,
    original_title VARCHAR(300) NOT NULL,
    original_language CHAR(2) NOT NULL, 
    overview TEXT,
    release_date SMALLINT,
    revenue BIGINT,
    budget BIGINT,
    homepage TEXT, 
    runtime SMALLINT UNSIGNED,
    rating TINYINT UNSIGNED check(rating BETWEEN 1 AND 10),
    status ENUM('Canceled', 'In Production', 'Planned', 'Post Production', 'Released', 'Rumored') NOT NULL, 
    country TINYTEXT, 
    genres TINYTEXT,
    director TINYTEXT,
    spoken_languages TINYTEXT
);