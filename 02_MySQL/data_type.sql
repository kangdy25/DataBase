CREATE TABLE users (
  username CHAR(10), -- 'nico' -> 'nico      '
  email VARCHAR(50), -- 'nico@nomad.co' ---> nico@nomad.co
  gender ENUM('MALE', 'FEMALE'),
  interests SET (
    'Art',
    'Sports',
    'Music',
    'Math',
    'Programming',
    'Travel',
    'Fashion',
    'Fodd'
  ),
    -- TINYTEXT <= 255(B), TEXT <= 65,535(64KB), 
    -- MEDIUMTEXT <= 16,777,215 (16MB), LONGTEXT <= 4,294,967,295 (4GB)
  bio TEXT,
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
  age TINYINT UNSIGNED,

  is_admin BOOLEAN -- TINYINT(1, 0)
)
