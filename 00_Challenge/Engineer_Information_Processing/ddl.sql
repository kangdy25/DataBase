-- Data Define Language

-- Question 3
CREATE TABLE patient (
    id CHAR(5) PRIMARY KEY,
    name CHAR(10),
    sex CHAR(1),
    phone CHAR(20),

    constraint sex_ck CHECK(sex='f' OR sex='m'),
    constraint id_fk FOREIGN KEY(id) REFERENCES doctor(doc_id)
);

-- Question 4
CREATE TABLE instructor (
    id CHAR(5) PRIMARY KEY,
    name CHAR(15) NOT NULL,
    dept CHAR(15),

    FOREIGN KEY(dept) REFERENCES Department(dept) 
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Question 5
ALTER TABLE patient ADD job CHAR(20);

-- Question 6
CREATE VIEW CC (ccid, ccname, instname)
AS SELECT 
    Course.id, Course.name, Instructor.name 
FROM Course, Instructor
WHERE Course.instructor = Instructor.id;

-- Question 8
CREATE UNIQUE INDEX Stud_idx ON Student(ssn ASC);

-- Question 9 
CREATE DOMAIN tier VARCHAR2(10)
DEFAULT '사원'
CONSTRAINT VALID-tier CHECK(VALUE IN('사원', '대리', '과장', '부장', '이사', '사장'));

-- Question 10
CREATE INDEX 직원_name ON 직원(이름);