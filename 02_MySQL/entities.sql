CREATE TABLE dogs (
  dog_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE,
  weight DECIMAL(5, 2),
  owner_id BIGINT UNSIGNED,
  breed_id BIGINT UNSIGNED
)

CREATE TABLE owners (
  owner_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20),
  address TINYTEXT
)

CREATE TABLE breeds (
  breed_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  size_category ENUM('small', 'medium', 'big') DEFAULT 'small',
  typical_lifespan TINYINT
)

CREATE TABLE pet_passports (
    pet_passports_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    blood_type VARCHAR(10),
    allergies TEXT,
    last_checkup_date DATE,
    dog_id BIGINT UNSIGNED UNIQUE,
    FOREIGN KEY (dog_id) REFERENCES dogs (dog_id) ON DELETE CASCADE;
)

CREATE TABLE dog_tricks (
  dog_id BIGINT UNSIGNED,
  trick_id BIGINT UNSIGNED,
  proficiency ENUM("beginner", "intermediate", "expert") NOT NULL DEFAULT "beginner",
  date_learned TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (dog_id, trick_id),
  FOREIGN KEY (dog_id) REFERENCES dogs (dog_id) ON DELETE CASCADE,
  FOREIGN KEY (trick_id) REFERENCES tricks (trick_id) ON DELETE CASCADE
);

CREATE TABLE tricks (
  trick_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  difficult ENUM("easy", "medium", "hard")
)