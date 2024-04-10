-- 데이터베이스 생성
CREATE SCHEMA `mydatabase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;

-- 테이블 생성
CREATE TABLE people (
    person_id INT,
    person_name VARCHAR(10),
    age TINYINT,
    birthday DATE
);

-- 테이블명 변경
ALTER TABLE people RENAME TO  friends,
-- 컬럼 자료형 변경
CHANGE COLUMN person_id person_id TINYINT,
-- 컬럼명 변경
CHANGE COLUMN person_name person_nickname VARCHAR(10), 
-- 컬럼 삭제
DROP COLUMN birthday,
-- 컬럼 추가
ADD COLUMN is_married TINYINT AFTER age;
-- 테이블 삭제
DROP TABLE friends;

-- 데이터 삽입
INSERT INTO people
    (person_id, person_name, age, birthday)
    VALUES (1, '홍길동', 21, '2000-01-31');

-- 모든 컬럼에 값 넣을 때는 컬럼명들 생략 가능
INSERT INTO people
    VALUES (2, '전우치', 18, '2003-05-12');

-- 일부 컬럼에만 값 넣기 가능 (NOT NULL은 생략 불가)
INSERT INTO people
    (person_id, person_name, birthday)
    VALUES (3, '임꺽정', '1995-11-04');

-- 여러 행을 한 번에 입력 가능
INSERT INTO people
    (person_id, person_name, age, birthday)
    VALUES 
        (4, '존 스미스', 30, '1991-03-01'),
        (5, '루피 D. 몽키', 15, '2006-12-07'),
        (6, '황비홍', 24, '1997-10-30');

-- 테이블 생성 시 제약조건 넣기
CREATE TABLE people (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    person_name VARCHAR(10) NOT NULL,
    nickname VARCHAR(10) UNIQUE NOT NULL,
    age TINYINT UNSIGNED,
    is_married TINYINT DEFAULT 0
);