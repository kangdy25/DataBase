-- Data Control Language

-- Question 4
GRANT ALL ON 학생 TO 김하늘;

-- Question 5
GRANT DELETE ON 강좌 TO 김하늘 WITH GRANT OPTION;

-- Question 6
REVOKE SELECT, INSERT, DELETE ON 교수 FROM 임꺽정;

-- Question 7
REVOKE GRANT OPTION FOR UPDATE ON 수강 FROM 임꺽정 CASCADE;

-- Question 8
ROLLBACK TO P1;