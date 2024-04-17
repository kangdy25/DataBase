-- 인덱스 생성
ALTER TABLE `mydatabase`.`businesses` 
ADD INDEX index_biz_name (business_name);

-- 다중 컬럼 인덱스
ALTER TABLE menus
ADD INDEX index_name_cal (menu_name, kilocalories);

-- 인덱스 조회
SHOW INDEX FROM businesses;

-- 인덱스 삭제
ALTER TABLE businesses
DROP INDEX index_biz_name;