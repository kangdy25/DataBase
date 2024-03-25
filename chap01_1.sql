-- 테이블의 모든 내용
SELECT * FROM Customers;

-- 원하는 column(열)만 골라서 보기
SELECT CustomerName, ContactName, Country
FROM Customers;

-- 원하는 조건의 row(행)만 걸러서 보기
SELECT * FROM Orders
WHERE EmployeeID = 3;

-- 원하는 순서로 데이터 가져오기 (Sorting)
SELECT * FROM OrderDetails
ORDER BY ProductID ASC, Quantity DESC;

-- 원하는 만큼만 데이터 가져오기
SELECT * FROM Customers
LIMIT 10;

-- 원하는 별명(alias)으로 데이터 가져오기
SELECT
    CustomerId AS ID,
    CustomerName AS NAME,
    Address AS ADDR
FROM Customers;

SELECT
    CustomerID AS '아이디',
    CustomerName AS '고객명',
    City AS '도시',
    Country AS '국가'
FROM Customers
WHERE
    City = 'London' OR Country = 'Mexico'
ORDER BY CustomerName
LIMIT 0, 5;