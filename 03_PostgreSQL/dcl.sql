----------------------
-- Root User 
----------------------

-- 🎯 새로운 역할(사용자) 생성: 이름은 marketer, 로그인 가능, 비밀번호는 'marketing4ever'
CREATE ROLE marketer WITH LOGIN PASSWORD 'marketing4ever';

-- 🎥 movies 테이블에 대한 SELECT(조회) 권한 부여
GRANT SELECT ON movies TO marketer;

-- 📊 statuses, directors 테이블에 대해 SELECT, INSERT(조회 및 삽입) 권한 부여
GRANT SELECT, INSERT ON statuses, directors TO marketer;

-- ❌ 방금 준 INSERT 권한을 다시 회수 (statuses, directors 테이블에 대해)
REVOKE INSERT ON statuses, directors FROM marketer;

-- ⚙️ public 스키마에 있는 모든 테이블에 SELECT, INSERT 권한 부여
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO marketer;

-- ❌ public 스키마의 모든 테이블에 대한 SELECT, INSERT 권한을 다시 회수
REVOKE SELECT, INSERT ON ALL TABLES IN SCHEMA public FROM marketer;

-- 👤 현재 로그인된 유저 확인
SELECT current_user;

----------------------
-- General User 
----------------------

-- 👤 현재 로그인된 유저 확인 (현재 세션이 누구인지 확인)
SELECT current_user;

-- 🎞 movies 테이블의 상위 10개 행만 조회
SELECT * FROM movies LIMIT 10;

-- 🎬 movies 테이블과 statuses 테이블을 조인하여
-- 각 영화의 상태(status)를 함께 조회
SELECT * 
FROM movies 
JOIN statuses s ON movies.status_id = s.status_id;
