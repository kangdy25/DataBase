USE mysql;
SELECT * FROM user;

-- 사용자 생성

-- CREATE USER '사용자명'@'접속위치' IDENTIFIED BY '비밀번호';

-- CREATE USER 'user_1'@'localhost' IDENTIFIED BY 'abcdefg';
-- CREATE USER 'user_1'@'12.345.678.90' IDENTIFIED BY 'abcdefg';

CREATE USER 'user_1'@'%' IDENTIFIED BY 'abcdefg';

-- 사용자 삭제
DROP USER 'user_1'@'%';

-- 권한

-- 사용자에 권한 추가
GRANT SELECT ON mydatabase.businesses
TO 'user_1'@'%';

GRANT UPDATE, DELETE ON mydatabase.businesses
TO 'user_1'@'%';

-- 사용자 권한 조회
SHOW GRANTS FOR 'user_1'@'%';

-- 사용자 권한 박탈
REVOKE DELETE ON mydatabase.businesses
FROM 'user_1'@'%';

SHOW GRANTS FOR 'user_1'@'%';

-- 데이터베이스의 모든 권한 부여
GRANT ALL PRIVILEGES ON mydatabase.*
TO 'user_1'@'%';