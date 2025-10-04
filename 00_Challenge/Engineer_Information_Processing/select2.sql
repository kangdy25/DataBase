-- Question 1
SELECT 
    학과,
    COUNT(*) AS 학과별튜플수
FROM 학생
GROUP BY 학과

-- Question 2
SELECT
    과목이름,
    MIN(점수) AS 최소점수,
    MAX(점수) AS 최대점수
FROM 성적
GROUP BY 과목이름
HAVING AVG(점수) > 90

-- Question 5
SELECT
    SUM(psale)
FROM Sale
WHERE pid IN (SELECT id FROM Product WHERE name LIKE 'USB%');