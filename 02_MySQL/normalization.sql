---------------------------------
-- Normalizing Status
---------------------------------

-- 1. 영화 상태를 별도 테이블로 분리 (정규화 대상)
CREATE TABLE statuses (
  status_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  status_name ENUM (
    'Canceled',
    'In Production',
    'Planned',
    'Post Production',
    'Released',
    'Rumored'
  ) NOT NULL,
  explanation TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
)

-- 2. movies 테이블에서 사용 중인 status 값들을 status 테이블로 이관
INSERT INTO statuses (status_name) SELECT status FROM movies GROUP BY status

-- 3. movies 테이블에 새로운 외래 키 컬럼 추가
ALTER TABLE movies ADD COLUMN status_id BIGINT UNSIGNED 

-- 4. movies.status_id → statuses.status_id 참조 관계 생성
--    상태가 삭제되면 movies.status_id 는 NULL 처리
ALTER TABLE movies ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES statuses (status_id) ON DELETE SET NULL

-- 5. 기존 movies.status 값을 기반으로 새 status_id 채우기
UPDATE movies SET status_id = (SELECT status_id FROM statuses WHERE status_name = movies.status)

-- 6. movies 테이블에서 기존의 status 컬럼 제거
ALTER TABLE movies DROP COLUMN status

---------------------------------
-- Normalizing Directors
---------------------------------


-- 1. 감독 정보를 별도로 저장할 테이블 생성 (정규화 대상)
CREATE TABLE directors (
  director_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(120),
  explanation TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
)

-- 2. movies 테이블에서 감독 이름을 뽑아서 directors 테이블에 삽입 (중복 제거 + 공백 값은 제외)
INSERT INTO directors (name)
SELECT 
  director 
FROM movies 
  GROUP BY director 
  HAVING director <> ''

-- 3. movies 테이블에 새로운 외래 키 컬럼 추가
ALTER TABLE movies ADD COLUMN director_id BIGINT UNSIGNED 

-- 4. 외래 키 제약 추가: movies.director_id → directors.director_id
--    감독이 삭제되면 movies.director_id 는 NULL 처리
ALTER TABLE movies ADD CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES directors (director_id) ON DELETE SET NULL

-- 5. directors 테이블에서 name 컬럼에 인덱스 생성 (검색 성능 향상)
CREATE INDEX idx_director_name ON directors (name)

-- 6. 기존 movies 테이블의 director 컬럼 값을 기반으로 director_id 업데이트
UPDATE movies SET director_id = (SELECT director_id FROM directors WHERE name = movies.director)

-- 7. 기존 director 컬럼 제거
ALTER TABLE movies DROP COLUMN director

---------------------------------
-- Normalizing Original Language
---------------------------------

-- 1. 언어 정보를 별도로 저장할 langs 테이블 생성 (정규화)
CREATE TABLE langs (
  lang_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(120),
  code CHAR(2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
)

-- 2. movies 테이블의 original_language 값을 langs.code 로 삽입
--    (중복 제거하여 고유 코드만 저장)
INSERT INTO langs (code)
SELECT 
  original_language 
FROM movies 
  GROUP BY original_language 

-- 3. movies 테이블에 새로운 외래 키 컬럼 추가
ALTER TABLE movies ADD COLUMN original_lang_id BIGINT UNSIGNED 

-- 4. 외래 키 제약 추가: movies.original_lang_id → langs.lang_id
--    언어가 삭제되면 movies.original_lang_id 는 NULL 처리
ALTER TABLE movies ADD CONSTRAINT fk_org_lang FOREIGN KEY (original_lang_id) REFERENCES langs (lang_id) ON DELETE SET NULL

-- 5. 기존 movies.original_language 값을 이용해 original_lang_id 업데이트
UPDATE movies SET original_lang_id = (SELECT lang_id FROM langs WHERE code = movies.original_language)

-- 6. 기존 original_language 컬럼 제거
ALTER TABLE movies DROP COLUMN original_language
