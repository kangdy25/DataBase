CREATE TABLE users (
  user_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  username CHAR(15) NOT NULL UNIQUE, -- 'nico' -> 'nico      '
  email VARCHAR(50) NOT NULL, -- 'nico@nomad.co' ---> nico@nomad.co
  gender ENUM('Male', 'Female') NOT NULL,
  interests SET (
    'Art',
    'Sports',
    'Music',
    'Math',
    'Programming',
    'Travel',
    'Fashion',
    'Food'
  ) NOT NULL,
    -- TINYTEXT <= 255(B), TEXT <= 65,535(64KB), 
    -- MEDIUMTEXT <= 16,777,215 (16MB), LONGTEXT <= 4,294,967,295 (4GB)
  bio TEXT NOT NULL,
    -- TINYBLOB (255B), BLOB(64KB), MEDIUMBLOB(16MB), LONGBLOB(4GB)
  profile_picture TINYBLOB, 

    -- 1. TINYINT
    -- Signed:
    -- Range: -128 to 127
    -- Unsigned:
    -- Range: 0 to 255
    
    -- 2. SMALLINT
    -- Signed:
    -- Range: -32,768 to 32,767
    -- Unsigned:
    -- Range: 0 to 65,535
    
    -- 3. MEDIUMINT
    -- Signed:
    -- Range: -8,388,608 to 8,388,607
    -- Unsigned:
    -- Range: 0 to 16,777,215
    
    -- 4. INT (INTEGER)
    -- Signed:
    -- Range: -2,147,483,648 to 2,147,483,647
    -- Unsigned:
    -- Range: 0 to 4,294,967,295
    
    -- 5. BIGINT
    -- Signed:
    -- Range: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
    -- Unsigned:
    -- Range: 0 to 18,446,744,073,709,551,615
  age TINYINT UNSIGNED NOT NULL,

  is_admin BOOLEAN DEFAULT FALSE NOT NULL, -- TINYINT(1, 0),
  
  balance1 DECIMAL(5, 2) DEFAULT 0.0 NOT NULL, -- DECIMAL (presicion, scale) 999.23
  balance2 float DEFAULT 0.0 NOT NULL, -- FLOAT 1.40
  
  joined_at1 TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, -- DATETIME YYYY-MM-DD HH:MM:SS
  joined_at2 DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  birth_date DATE NOT NULL, -- 2001-05-25
  bed_time TIME NOT NULL, -- 23:59:59
  graduation_year YEAR NOT NULL,-- 1901 ~ 2155

  -- JSON, GEOMETRY, POINT, LINESTRING, POLYGON, MULTIPOINT, MULTILINESTRING, EMULTIPOLYGON & GEOMETRYCOLLECTION

  CONSTRAINT chk_age CHECK(age < 100),
  CONSTRAINT uq_email UNIQUE (email) 
)

INSERT INTO users (
  username,
  email,
  gender,
  interests,
  bio,
  age,
  is_admin,
  birth_date,
  bed_time,
  graduation_year
) VALUES (
  '동붕이',
  '동붕이@coding.com',
  'Male',
  'Programming,Art,Math',
  'I like Programming',
  25,
  TRUE,
  '2001-05-25',
  '23:59:59',
  '2026'
)

DROP TABLE users

  
-- ALTER TABLE

-- Drop Column
ALTER TABLE users DROP COLUMN profile_picture

-- Rename Column
ALTER TABLE users CHANGE COLUMN about_me about_me TINYTEXT

-- change the column type
ALTER TABLE users MODIFY COLUMN about_me TEXT

-- rename database
ALTER TABLE users RENAME TO customers
ALTER TABLE customers RENAME TO users

-- Drop Constraints
ALTER TABLE users DROP CONSTRAINT uq_email
  
ALTER TABLE users 
  DROP CONSTRAINT uq_email,
  DROP CONSTRAINT chk_age

-- Adding Constraints
ALTER TABLE users
  ADD CONSTRAINT uq_email UNIQUE (email),
  ADD CONSTRAINT uq_username UNIQUE (username)
  
ALTER TABLE users ADD CONSTRAINT chk_age CHECK (age < 100)

ALTER TABLE users MODIFY COLUMN bed_time TIME NULL
ALTER TABLE users MODIFY COLUMN bed_time TIME NOT NULL

-- DATA Conflict
ALTER TABLE users MODIFY COLUMN graduation_year DATE -- X

SELECT graduation_year, MAKEDATE(graduation_year, 1) from users

-- How to solve the data conflict? 1
ALTER TABLE users ADD COLUMN graduation_date DATE -- Add Column
UPDATE users SET graduation_date = MAKEDATE(graduation_year, 1) -- Udpate New Column
ALTER TABLE users DROP COLUMN graduation_year -- Delete Legacy Column
ALTER TABLE users MODIFY COLUMN graduation_date DATE NOT NULL -- Add NOT NULL Constraint

-- How to solve the data conflict? 2
ALTER TABLE users ADD COLUMN graduation_date DATE NOT NULL DEFAULT MAKEDATE(graduation_year, 1)
ALTER TABLE users DROP COLUMN graduation_year -- Delete Legacy Column
  
SHOW CREATE TABLE users

-- Generated Columns
CREATE TABLE users_v2 (
  user_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  full_name VARCHAR(101) GENERATED ALWAYS AS (CONCAT(first_name, ' ', last_name)) STORED
)

INSERT INTO users_v2 (
  first_name, last_name, email
) VALUES ('DONGYOON', 'KANG', 'cnafrog@naver.com')

SELECT * FROM users_v2

-- string slicing
ALTER TABLE users_v2 ADD COLUMN email_domain VARCHAR(50) GENERATED ALWAYS AS 
  (SUBSTRING_INDEX('canfrog@naver.com', '@', -1))

SELECT * FROM users_v2

