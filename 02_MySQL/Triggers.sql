-- TRIGER

-- BEFORE: INSERT, UPDATE, DELETE
CREATE TABLE records (
  record_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  changes TINYTEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)

CREATE TRIGGER before_movie_insert
BEFORE INSERT
ON movies
FOR EACH ROW
INSERT INTO records (changes) VALUES (CONCAT('Will Insert: ', NEW.title))

INSERT INTO movies SELECT * FROM archived_movies WHERE movie_id = 1;

CREATE TRIGGER before_movie_update
  BEFORE UPDATE ON movies
  FOR EACH ROW INSERT INTO records (changes) 
    VALUES (CONCAT('Will Update Title: ', OLD.title, ' -> ', NEW.title))

CREATE TRIGGER before_movie_delete
  BEFORE DELETE ON movies
  FOR EACH ROW INSERT INTO records (changes) 
    VALUES (CONCAT('Will Delete: ', OLD.title))

-- AFTER: INSERT, UPDATE, DELETE
CREATE TRIGGER after_movie_insert
  AFTER INSERT ON movies
  FOR EACH ROW INSERT INTO records (changes) 
    VALUES (CONCAT('Insert Completed: ', NEW.title))

INSERT INTO movies SELECT * FROM archived_movies WHERE movie_id = 2;

CREATE TRIGGER after_movie_update
  AFTER UPDATE ON movies
  FOR EACH ROW INSERT INTO records (changes) 
    VALUES (CONCAT('Update Completed: ', OLD.title, ' -> ', NEW.title))

CREATE TRIGGER after_movie_delete
  BEFORE DELETE ON movies
  FOR EACH ROW INSERT INTO records (changes) 
    VALUES (CONCAT('Bye Bye ', OLD.title))

-- Overpowered Trigger
DELIMITER $$
CREATE TRIGGER after_movie_update
AFTER UPDATE ON movies
FOR EACH ROW 
BEGIN
  DECLARE changes TINYTEXT DEFAULT '';

  IF NEW.title <> OLD.title THEN 
    SET changes = CONCAT('title changed ', old.title, ' -> ', new.title, '\n');
  END IF;

  IF NEW.budget <> OLD.budget THEN 
    SET changes = CONCAT(changes, 'budget changed ', old.budget, ' -> ', new.budget);
  END IF;

  INSERT INTO records (changes) VALUES (changes);
  
END$$
DELIMITER ;