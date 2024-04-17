-- 기본키 넣는 방법 1
CREATE TABLE people (
    first_name CHAR(2) PRIMARY KEY,
    last_name CHAR(3),
    nickname VARCHAR(10)
);

-- 기본키 넣는 방법 2
CREATE TABLE people (
    first_name CHAR(2),
    last_name CHAR(3),
    nickname VARCHAR(10),
    PRIMARY KEY (first_name)
);

-- 기본키 변경하기
ALTER TABLE people DROP PRIMARY KEY;

ALTER TABLE people ADD PRIMARY KEY (last_name);

-- 다중 기본키
CREATE TABLE people (
    first_name CHAR(2),
    last_name CHAR(3),
    nickname VARCHAR(10),
    PRIMARY KEY (first_name, last_name)
);

INSERT INTO PEOPLE VALUES('홍', '길동', '별명');
INSERT INTO PEOPLE VALUES('전', '우치', '별명');
INSERT INTO PEOPLE VALUES('전', '길동', '별명');

-- 고유키

-- 고유키 넣는 방법 1
CREATE TABLE people (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name CHAR(2) UNIQUE,
    last_name CHAR(3)
);

-- 고유키 넣는 방법 2
CREATE TABLE people (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name CHAR(2),
    last_name CHAR(3),
    UNIQUE (first_name)
);

-- 다중 고유키
CREATE TABLE people (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name CHAR(2),
    last_name CHAR(3),
    UNIQUE (first_name, last_name)
);

-- 외래 키

-- 외래키 추가하기
ALTER TABLE _자식테이블명
    ADD CONSTRAINT _제약명 
    FOREIGN KEY ( _자식테이블외래키 )
    REFERENCES 부모테이블명 ( _부모테이블기본키 )
    -- ON DELETE _삭제시제약 
    -- ON UPDATE _수정시제약 

-- 외래키 삭제하기
ALTER TABLE _자식테이블명 DROP FOREIGN KEY _자식테이블외래키