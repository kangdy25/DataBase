-- Normalizing Status

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
ALTER TABLE movies ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES statuses (status_id) ON DELETE SET NULL

-- 5. 기존 movies.status 값을 기반으로 새 status_id 채우기
UPDATE movies SET status_id = (SELECT status_id FROM statuses WHERE status_name = movies.status)

-- 6. movies 테이블에서 기존의 status 컬럼 제거
ALTER TABLE movies DROP COLUMN status
