-- 비상관 서브쿼리
SELECT
    CategoryID, CategoryName, Description,
    (SELECT ProductName FROM Products WHERE ProductID = 1)
FROM Categories;

SELECT * FROM Products
WHERE Price < (
    SELECT AVG(Price) FROM Products
);

SELECT
    CategoryID, CategoryName, Description
FROM Categories
WHERE
    CategoryID =
    (SELECT CategoryID FROM Products
    WHERE ProductName = 'Chais');

-- All , Any
SELECT * FROM Products
WHERE Price > ALL (
    SELECT Price FROM Products
    WHERE CategoryID = 2
);

SELECT
    CategoryID, CategoryName, Description
FROM Categories
WHERE
    CategoryID = ANY
    (SELECT CategoryID FROM Products
    WHERE Price > 50);

-- 상관 서브쿼리
SELECT
    ProductID, ProductName,
    (
        SELECT CategoryName FROM Categories C
        WHERE C.CategoryID = P.CategoryID
    ) AS CategoryName
FROM Products P;

SELECT
    SupplierName, Country, City,
    (
        SELECT COUNT(*) FROM Customers C
        WHERE C.Country = S.Country
    ) AS CustomersInTheCountry,
    (
        SELECT COUNT(*) FROM Customers C
        WHERE C.Country = S.Country 
        AND C.City = S.City
    ) AS CustomersInTheCity
FROM Suppliers S;

SELECT
    ProductID, ProductName, CategoryID, Price
    -- ,(SELECT AVG(Price) FROM Products P2
    -- WHERE P2.CategoryID = P1.CategoryID)
FROM Products P1
WHERE Price < (
    SELECT AVG(Price) FROM Products P2
    WHERE P2.CategoryID = P1.CategoryID
);


-- EXISTS / NOT EXISTS
SELECT
    CategoryID, CategoryName
    -- ,(SELECT MAX(P.Price) FROM Products P
    -- WHERE P.CategoryID = C.CategoryID
    -- ) AS MaxPrice
FROM Categories C
WHERE EXISTS (
    SELECT * FROM Products P
    WHERE P.CategoryID = C.CategoryID
    AND P.Price > 80
);