-- DELETE 주어진 조건의 행 삭제
DELETE FROM businesses
WHERE status = 'CLS';

-- DELETE 문으로 행 전체 삭제
DELETE FROM businesses;

INSERT INTO businesses (fk_section_id, business_name, status, can_takeout)
VALUES  (3, '화룡각', 'OPN', 1),
        (2, '철구분식', 'OPN', 1),
        (5, '얄코렐라', 'RMD', 1);

-- TRUNCATE 문으로 테이블 초기화
TRUNCATE businesses;

INSERT INTO businesses (fk_section_id, business_name, status, can_takeout)
VALUES  (3, '화룡각', 'OPN', 1),
        (2, '철구분식', 'OPN', 1),
        (5, '얄코렐라', 'RMD', 1);

-- UPDATE - 주어진 조건의 행 수정하기
UPDATE menus
SET menu_name = '삼선짜장'
WHERE menu_id = 12;

-- 여러 칼럼 수정하기
UPDATE menus
SET 
    menu_name = '열정떡볶이',
    kilocalories = 492.78,
    price = 5000
WHERE 
    fk_business_id = 4
    AND menu_name = '국물떡볶이';

-- 칼럼 데이터 활용하여 수정하기
UPDATE menus
SET price = price + 1000
WHERE fk_business_id = 8;

UPDATE menus
SET menu_name = CONCAT('전통 ', menu_name)
WHERE fk_business_id IN (
    SELECT business_id 
    FROM sections S
    LEFT JOIN businesses B
        ON S.section_id = B.fk_section_id 
    WHERE section_name = '한식'
);

-- 조건문 없이는 모든 행이 변경된다 (주의)
UPDATE menus
SET menu_name = '획일화';