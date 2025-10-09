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

----------------------
-- Role 
----------------------

-- 🧩 새 역할(role) 생성: 이름은 editor (로그인 불가 기본 설정)
CREATE ROLE editor;

-- 📚 public 스키마 내 모든 테이블에 대해
-- SELECT(조회), INSERT(삽입), UPDATE(수정) 권한 부여
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO editor;

-- 👤 실제 로그인 가능한 유저(editor_one) 생성
-- 비밀번호는 'words4ever'
CREATE USER editor_one WITH PASSWORD 'words4ever';

-- 🔗 editor 역할(role)을 editor_one 유저에게 부여
-- => editor_one은 editor가 가진 권한을 상속받음
GRANT editor TO editor_one;

-- ❌ editor 역할이 movies 테이블에서 가지는 모든 권한 제거
REVOKE ALL ON movies FROM editor;

-- 🎬 movies 테이블 중 title 컬럼만 조회(SELECT) 가능하도록 권한 부여
GRANT SELECT (title) ON movies TO editor;

-- 💰 movies 테이블 중 budget 컬럼만 수정(UPDATE) 가능하도록 권한 부여
GRANT UPDATE (budget) ON movies TO editor;

-- 🚪 editor_one 유저의 동시 접속 제한: 최대 1개의 세션만 허용
ALTER ROLE editor_one WITH CONNECTION LIMIT 1;
