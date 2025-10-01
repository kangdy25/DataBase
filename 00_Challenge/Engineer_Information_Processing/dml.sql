-- Data Manipulation Language

-- Question 1
DELETE FROM 학생 WHERE 이름 = '민수';

-- Question 2
INSERT INTO 학생
VALUES (9816021, '한국산', 3, '경영학개론', '050-1234-1234')

-- Question 5
INSERT INTO 기획부(성명, 경력, 주소, 기본급)
SELECT 성명, 경력, 주소, 기본급 FROM 사원 WHERE 부서 = '기획';