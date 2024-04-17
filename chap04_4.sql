-- 트랜잭션

START TRANSACTION; -- 트랜잭션 시작

DELETE FROM sections 
WHERE section_id > 0;

SELECT * FROM sections;


ROLLBACK; -- 롤백

SELECT * FROM sections;

-- COMMIT
START TRANSACTION;

INSERT INTO sections
(section_name, floor)
VALUES ('동남아', 2);

SELECT * FROM sections;

COMMIT;

ROLLBACK;

SELECT * FROM sections;

-- SAVEPOINT
START TRANSACTION;

INSERT INTO sections
(section_name, floor)
VALUES ('인도식', 2);

SAVEPOINT indian;

INSERT INTO sections
(section_name, floor)
VALUES ('남미식', 3);

SELECT * FROM sections;

ROLLBACK TO indian;

SELECT * FROM sections;

COMMIT;