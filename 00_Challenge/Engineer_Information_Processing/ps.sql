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
WHERE 강좌.교수번호 = 교수.교수번호;

-- Problem 9
COMMIT
ROLLBACK
GRANT
REVOKE
CASCADE

-- Problem 10
GRANT SELECT ON 강좌 TO 홍길동;

-- Problem 11
GRANT ALL ON 학생 TO 홍길동 WITH GRANT OPTION;

-- Problem 12
REVOKE INSERT ON 교수 FROM 박문수;

-- Problem 13
REVOKE SELECT ON 수강 FROM 박문수 CASCADE;

-- Problem 14
DELETE FROM 상품
WHERE 제품코드 = 'P-20';

INSERT INTO 상품 VALUES(
    'P-20',
    'PLAYER',
    8800,
    6600
);

-- Problem 15
SELECT
    상호, 총액
FROM 거래내역
WHERE 총액 IN (SELECT MAX(총액) FROM 거래내역)

-- Problem 16
450
3
1

-- Problem 17
송윤아
24
사원

-- Problem 18
학번이 S로 시작하는 3문자를 표시한다.

-- Problem 19
2
2
4

-- Problem 20
장학내역
학과
AVG(장학금)

-- Problem 21
59
지원학과 ASC, 점수 DESC

-- Problem 22
ALTER TABLE
ADD

-- Problem 23
%신%

-- Problem 24
15000

-- Problem 25
UPDATE
SELECT
WHERE

-- Problem 26
4

-- Problem 27
1