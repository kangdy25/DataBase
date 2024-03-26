-- 사칙연산
SELECT 1 + 2;
SELECT 5 - 2.5 AS DIFFERENCE;
SELECT 3 * (2 + 4) / 2, 'Hello';
SELECT 10 % 3;

-- 문자열에 사칙연산을 가하면 0으로 인식
SELECT 'ABC' + 3;
-- 숫자로 구성된 문자열은 숫자로 자동인식
SELECT '1' + '002' * 3;

SELECT
    ProductName,
    Price / 2 AS HalfPrice
FROM Products;

-- 불리언 연산자
SELECT TRUE, FALSE;
SELECT * FROM Customers WHERE TRUE;

SELECT TRUE IS TRUE;
SELECT TRUE IS NOT FALSE;

SELECT * FROM Orders
WHERE
    CustomerId = 15 AND EmployeeId = 4;

SELECT * FROM Products 
WHERE
    ProductName = 'Tofu' OR CategoryId = 8;

SELECT 1 = 1, !(1 <> 1), NOT (1 < 2), 1 > 0 IS NOT FALSE;
-- MySQL의 기본 사칙연산자는 대소구분을 하지 않는다.
SELECT 'A' = 'a';

SELECT 5 BETWEEN 1 AND 10;
SELECT 'banana' NOT BETWEEN 'Apple' AND 'camera';

SELECT 'Hello' IN (1, TRUE, 'hello') 
SELECT * FROM Customers
WHERE City IN ('Torino', 'Paris', 'Portland', 'Madrid') 

SELECT
    'HELLO' LIKE 'hel%',
    'HELLO' LIKE 'H%',
    'HELLO' LIKE 'H%O',
    'HELLO' LIKE '%O',
    'HELLO' LIKE '%HELLO%',
    'HELLO' LIKE '%H',
    'HELLO' LIKE 'L%'

SELECT
    'HELLO' LIKE 'HEL__',
    'HELLO' LIKE 'h___O',
    'HELLO' LIKE 'HE_LO',
    'HELLO' LIKE '_____',
    'HELLO' LIKE '_HELLO',
    'HELLO' LIKE 'HEL_',
    'HELLO' LIKE 'H_O'