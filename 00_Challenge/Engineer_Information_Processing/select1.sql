-- Question 6
SELECT 
    pid
FROM Sale
WHERE psale BETWEEN 10 AND 20;

-- Question 7
SELECT 
    신청정보.학번,
    이름,
    결제여부
FROM 결제, 학생정보, 신청정보
WHERE 학생정보.학번 = 신청정보.학번
    AND 신청정보.신청번호 = 결제.신청번호
    AND 신청과목 = 'OpenGL'

-- Question 8
SELECT 
    ID, NAME
FROM CUSTOMER;

SELECT DISTINCT GRADE
FROM CUSTOMER;

SELECT *
FROM CUSTOMER
ORDER BY ID DESC;

SELECT NAME
FROM CUSTOMER
WHERE AGE IS NULL;

SELECT NAME
FROM CUSTOMER
WHERE AGE IS NOT NULL