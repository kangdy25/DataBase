-- 시간/날짜 관련 함수들
SELECT CURDATE(), CURTIME(), NOW();

SELECT
    '2021-6-1' = '2021-06-01',
    DATE('2021-6-1') = DATE('2021-06-01'),
    '1:2:3' = '01:02:03',
    TIME('1:2:3') = TIME('01:02:03');

SELECT
    OrderDate,
    YEAR(OrderDate) AS YEAR,
    MONTHNAME(OrderDate) AS MONTHNAME,
    MONTH(OrderDate) AS MONTH,
    WEEKDAY(OrderDate) AS WEEKDAY,
    DAYNAME(OrderDate) AS DAYNAME,
    DAY(OrderDate) AS DAY
FROM Orders;

SELECT
    HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());

SELECT
    OrderDate,
    NOW(),
    DATEDIFF(OrderDate, NOW())
FROM Orders;

SELECT
    OrderDate,
    LAST_DAY(OrderDate),
    DAY(LAST_DAY(OrderDate)),
    DATEDIFF(LAST_DAY(OrderDate), OrderDate)
FROM Orders;

SELECT
    DATE_FORMAT(NOW(), '%M %D, %Y %T'),
    DATE_FORMAT(NOW(), '%y-%m-%d %h:%i:%s %p'),
    DATE_FORMAT(NOW(), '%Y년 %m월 %d일 %p %h시 %i분 %s초');

SELECT
    DATEDIFF(
        STR_TO_DATE('2021-06-04 07:48:52', '%Y-%m-%d %T'),
        STR_TO_DATE('2021-06-01 12:30:05', '%Y-%m-%d %T')
    ),
    TIMEDIFF(
        STR_TO_DATE('2021-06-04 07:48:52', '%Y-%m-%d %T'),
        STR_TO_DATE('2021-06-01 12:30:05', '%Y-%m-%d %T')
    );

-- 기타 함수들
SELECT IF (1 > 2, '1는 2보다 크다.', '1은 2보다 작다.');

SELECT
CASE
    WHEN -1 > 0 THEN '-1은 양수다.'
    WHEN -1 = 0 THEN '-1은 0이다.'
    ELSE '-1은 음수다.'
END;

SELECT
    IFNULL('A', 'B'),
    IFNULL(NULL, 'B');