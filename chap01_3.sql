-- 숫자 관련 함수
SELECT 
    ROUND(0.5),
    CEIL(0.4),
    FLOOR(0.6);

SELECT ABS(1), ABS(-1), ABS(3 - 10);

SELECT 
    GREATEST(1, 2, 3),
    LEAST(1, 2, 3, 4, 5);

SELECT
    MAX(Quantity),
    MIN(Quantity),
    COUNT(Quantity),
    SUM(Quantity),
    AVG(Quantity)
FROM OrderDetails
WHERE OrderDetailID BETWEEN 20 AND 30;

SELECT
    POW(2, 3),
    POWER(5, 2),
    SQRT(16);

SELECT
    TRUNCATE(1234.5678, 1),
    TRUNCATE(1234.5678, 2),
    TRUNCATE(1234.5678, 3),
    TRUNCATE(1234.5678, -1),
    TRUNCATE(1234.5678, -2),
    TRUNCATE(1234.5678, -3);

-- 문자열 관련 함수들
SELECT
    UPPER('abcDEF'),
    LOWER('abcDEF');

SELECT CONCAT('HELLO', ' ', 'THIS IS ', 2021)
SELECT CONCAT_WS('-', 2021, 8, 15, 'AM')

SELECT
    SUBSTR('ABCDEFG', 3),
    SUBSTR('ABCDEFG', 3, 2),
    SUBSTR('ABCDEFG', -4),
    SUBSTR('ABCDEFG', -4, 2);

SELECT
    LEFT('ABCDEFG', 3),
    RIGHT('ABCDEFG', 3);

SELECT
    OrderDate,
    LEFT(OrderDate, 4) AS Year,
    SUBSTR(OrderDate, 6, 2) AS Month,
    RIGHT(OrderDate, 2) AS Day
FROM Orders;

SELECT
    LENGTH('ABCDE'),
    CHAR_LENGTH('ABCDE'),
    CHARACTER_LENGTH('ABCDE'); 

SELECT
    CONCAT('|', ' HELLO ', '|'),
    CONCAT('|', LTRIM(' HELLO '), '|'),
    CONCAT('|', RTRIM(' HELLO '), '|'),
    CONCAT('|', TRIM(' HELLO '), '|');

SELECT
    LPAD('ABC', 5, '-'),
    RPAD('ABC', 5, '-');

SELECT
    REPLACE('맥도날드에서 맥도날드 햄버거를 먹었다.', '맥도날드', '버거킹');

SELECT
    INSTR('ABCDE', 'ABC'),
    INSTR('ABCDE', 'BCDE'),
    INSTR('ABCDE', 'C'),
    INSTR('ABCDE', 'DE'),
    INSTR('ABCDE', 'F');

SELECT
    '01' = '1',
    CAST('01' AS DECIMAL) = CAST('1' AS DECIMAL);

SELECT
    '01' = '1',
    CONVERT('01', DECIMAL) = CONVERT('1', DECIMAL);