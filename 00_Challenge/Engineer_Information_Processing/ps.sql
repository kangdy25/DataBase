-- Problem 1
DROP TABLE 직원;

-- Problem 2
CREATE TABLE 직원
    (사번 CHAR(15) PRIMARY KEY,
    이름 CHAR(4) NOT NULL,
    전화번호 CHAR(20) UNIQUE,
    부서번호 CHAR(10),
    경력 INT,
    기본급 INT,

    CHECK(기본급 >= 1000000),
    FOREIGN KEY (부서번호) REFERENCES 부서(부서번호));

-- Problem 3
SELECT * FROM 사원;

-- Problem 4
SELECT DISTINCT 이름
FROM 자격증
WHERE 경력 >= 3;

-- Problem 5
SELECT 
    이름, 재직년도, 기본급
FROM 사원
WHERE 이름 NOT IN (SELECT 이름 FROM 자격증);

-- Problem 6
SELECT 이름 FROM 자격증
GROUP BY 이름
HAVING COUNT(*) >= 2;

-- Problem 7
CREATE VIEW 3학년학생
AS SELECT * FROM 학생
WHERE 학년 = 3
WITH CHECK OPTION;

-- Problem 8
CREATE VIEW 강좌교수(강좌명, 강의실, 수강제한인원, 교수이름)
AS SELECT 
    강좌명, 강의실, 수강인원, 이름
FROM 강좌, 교수
WHERE 강좌.교수번호 = 교수.교수번호

-- Problem 9
COMMIT
ROLLBACK
GRANT
REVOKE
CASCADE