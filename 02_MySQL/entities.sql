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
