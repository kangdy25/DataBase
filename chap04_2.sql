-- 뷰 생성
CREATE VIEW section_view AS
SELECT section_id, section_name
FROM sections;

-- 뷰 조회
SELECT * FROM section_view;

-- 뷰 삭제
DROP VIEW section_view;

-- 뷰를 사용하는 이유 - 보안
CREATE VIEW menu_view AS
SELECT
    menu_id,
    menu_name,
    CONCAT(
        SUBSTRING(business_name, 1, 1),
        REPEAT('*', CHAR_LENGTH(business_name) - 1)
    ) AS business,
    price,
    likes AS evaluation
FROM businesses B
INNER JOIN menus M
    ON M.fk_business_id = B.business_id;

-- 뷰를 사용하는 이유 - 편의
CREATE VIEW business_view AS
SELECT
    section_name,
    business_name,
    (SELECT COUNT(*) FROM menus M
        WHERE M.fk_business_id = B.business_id
    ) AS menu_count,
    (SELECT AVG(likes) FROM menus M
        WHERE M.fk_business_id = B.business_id
    ) AS menu_avg_likes,
    (SELECT AVG(stars) FROM ratings R
        WHERE R.fk_business_id = B.business_id
    ) AS avg_stars,
    (SELECT comment FROM ratings R
        WHERE R.fk_business_id = B.business_id
    ORDER BY created DESC LIMIT 1
    ) AS recent_comment
FROM businesses B
INNER JOIN sections S
    ON S.section_id = B.fk_section_id;

-- 내용 수정이 가능한 뷰

-- 가능
UPDATE section_view
	SET section_name = '서양식'
WHERE section_id = 5;

-- 가능
UPDATE menu_view
    SET price = price + 1000
WHERE menu_name LIKE '%냉면';

-- 불가능
UPDATE business_view
    SET business_name = '화룡반점'
WHERE business_name = '화룡각';