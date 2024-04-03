-- 내부 조인 (Inner Join)
SELECT * FROM Categories C
JOIN Products P 
    ON C.CategoryID = P.CategoryID; 

SELECT
    CONCAT(
        P.ProductName, ' by ', S.SupplierName
    ) AS Product,
    S.Phone, P.Price
FROM Products P
JOIN Suppliers S
    ON P.SupplierID = S.SupplierID
WHERE Price > 50
ORDER BY ProductName;

SELECT 
    C.CategoryName,
    MIN(O.OrderDate) AS FirstOrder,
    MAX(O.OrderDate) AS LastOrder,
    SUM(D.Quantity) AS TotalQuantity
FROM Categories C
JOIN Products P 
    ON C.CategoryID = P.CategoryID
JOIN OrderDetails D
    ON P.ProductID = D.ProductID
JOIN Orders O
    ON O.OrderID = D.OrderID
GROUP BY C.CategoryID;

SELECT
    E1.EmployeeID, CONCAT_WS(' ', E1.FirstName, E1.LastName) AS Employee,
    E2.EmployeeID, CONCAT_WS(' ', E2.FirstName, E2.LastName) AS NextEmployee
FROM Employees E1 JOIN Employees E2
ON E1.EmployeeID + 1 = E2.EmployeeID;

-- 외부 조인 (Outer Join)
SELECT
    E1.EmployeeID, CONCAT_WS(' ', E1.FirstName, E1.LastName) AS Employee,
    E2.EmployeeID, CONCAT_WS(' ', E2.FirstName, E2.LastName) AS NextEmployee
FROM Employees E1
-- LEFT를 RIGHT로 바꿔서도 실행해 볼 것
LEFT JOIN Employees E2
ON E1.EmployeeID + 1 = E2.EmployeeID
ORDER BY E1.EmployeeID;

SELECT
    IFNULL(C.CustomerName, '-- NO CUSTOMER --'),
    IFNULL(S.SupplierName, '-- NO SUPPLIER --'),
    IFNULL(C.City, S.City),
    IFNULL(C.Country, S.Country)
FROM Customers C
-- LEFT를 RIGHT로 바꿔서도 실행해 볼 것
LEFT JOIN Suppliers S
ON C.City = S.City AND C.Country = S.Country;

-- 교차 조인 (Cross Join)
SELECT
    E1.LastName, E2.FirstName
FROM Employees E1
CROSS JOIN Employees E2
ORDER BY E1.EmployeeID;

-- Union
SELECT CustomerName AS Name, City, Country, 'CUSTOMER'
FROM Customers
UNION
SELECT SupplierName AS Name, City, Country, 'SUPPLIER'
FROM Suppliers
ORDER BY Name;

-- 합집합
SELECT CategoryID AS ID FROM Categories
WHERE CategoryID > 4
-- UNION ALL로도 바꿔볼 것
UNION
SELECT EmployeeID AS ID FROM Employees
WHERE EmployeeID % 2 = 0;

-- 교집합
SELECT CategoryID AS ID
FROM Categories C, Employees E
WHERE 
    C.CategoryID > 4
    AND E.EmployeeID % 2 = 0
    AND C.CategoryID = E.EmployeeID;

-- 차집합
SELECT CategoryID AS ID
FROM Categories
WHERE 
    CategoryID > 4
    AND CategoryID NOT IN (
        SELECT EmployeeID
        FROM Employees
        WHERE EmployeeID % 2 = 0
    );

-- 대칭차집합
SELECT ID FROM (
    SELECT CategoryID AS ID FROM Categories
    WHERE CategoryID > 4
    UNION ALL
    SELECT EmployeeID AS ID FROM Employees
    WHERE EmployeeID % 2 = 0
) AS Temp 
GROUP BY ID HAVING COUNT(*) = 1;