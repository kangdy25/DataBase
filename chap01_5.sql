-- GROUP BY - 조건에 따라 집계된 값을 가져옵니다.
SELECT Country FROM Customers
GROUP BY Country;

SELECT 
    Country, City,
    CONCAT_WS(', ', City, Country)
FROM Customers
GROUP BY Country, City;

-- 그룹 함수 활용하기
SELECT
    ProductID,
    SUM(Quantity) AS QuantitySum
FROM OrderDetails
GROUP BY ProductID
ORDER BY QuantitySum DESC;

SELECT
    CategoryID,
    MAX(Price) AS MaxPrice, 
    MIN(Price) AS MinPrice,
    TRUNCATE((MAX(Price) + MIN(Price)) / 2, 2) AS MedianPrice,
    TRUNCATE(AVG(Price), 2) AS AveragePrice
FROM Products
GROUP BY CategoryID;

SELECT 
    CONCAT_WS(', ', City, Country) AS Location,
    COUNT(CustomerID)
FROM Customers
GROUP BY Country, City;

-- WITH ROLLUP - 전체의 집계값
SELECT
    Country, COUNT(*)
FROM Suppliers
GROUP BY Country
WITH ROLLUP;

-- HAVING - 그룹화된 데이터 걸러내기
SELECT
    Country, COUNT(*) AS Count
FROM Suppliers
GROUP BY Country
HAVING Count >= 3;

-- WHERE는 그룹하기 전 데이터, HAVING은 그룹 후 집계에 사용합니다.
SELECT
    CategoryID,
    MAX(Price) AS MaxPrice, 
    MIN(Price) AS MinPrice,
    TRUNCATE((MAX(Price) + MIN(Price)) / 2, 2) AS MedianPrice,
    TRUNCATE(AVG(Price), 2) AS AveragePrice
FROM Products
WHERE CategoryID > 2
GROUP BY CategoryID
HAVING
    AveragePrice BETWEEN 20 AND 30
    AND MedianPrice < 40;

-- DISTINCT - 중복된 값들을 제거합니다.
SELECT DISTINCT CategoryID
FROM Products;

SELECT DISTINCT Country
FROM Customers
ORDER BY Country;

SELECT
    Country,
    COUNT(DISTINCT CITY)
FROM Customers
GROUP BY Country;