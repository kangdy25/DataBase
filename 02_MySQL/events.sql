CREATE TABLE archived_movies LIKE movies;

TRUNCATE TABLE archived_movies

DROP EVENT archive_old_movies

-- 이벤트 등록
DELIMITER $$
CREATE EVENT archive_old_movies
ON SCHEDULE EVERY 2 MINUTE
STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO 
BEGIN
  INSERT INTO archived_movies
  SELECT * FROM movies
  WHERE release_date < YEAR(CURDATE()) - 20;

  DELETE FROM movies WHERE release_date < YEAR(CURDATE()) - 20;
END$$
DELIMITER ;