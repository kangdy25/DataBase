-- 13. Using a CTE, identify "prolific authors" (more than 20 books) and then find their highest-rated book
WITH prolific_authors AS (
  SELECT author
  FROM books
  GROUP BY author
  HAVING (COUNT(*) > 20)
)

SELECT 
  b1.author,
  b1.title,
  b1.average_rating
FROM books b1
WHERE b1.author IN (SELECT * FROM prolific_authors)
      AND b1.average_rating = (
        SELECT
          MAX(b2.average_rating)
        FROM books b2
        WHERE (b1.author = b2.author)
      )

-- 14. Create a CTE that categorizes books by length (Short: <200, Medium: 200-400, Long: >400 pages) and show the average rating for each category
WITH categorizes_books AS (
  SELECT 
    title,
    pages,
    average_rating,
    CASE
      WHEN pages < 200 THEN 'Short'
      WHEN pages BETWEEN 200 AND 400 THEN 'Medium'
      ELSE 'Long'
    END AS length_category
  FROM books
)

SELECT 
  length_category,
  AVG(average_rating) AS avg_rating
FROM categorizes_books
GROUP BY length_category

-- 15. Write a CTE to find the best book (highest rating) for each year from 2010-2023, 
-- excluding books with less than 10 pages
WITH highest_rating AS (
    SELECT 
        published_date,
        MAX(average_rating) AS max_rating
    FROM books
    WHERE published_date BETWEEN 2010 AND 2023
      AND pages >= 10
    GROUP BY published_date
)
  
SELECT 
    title,
    average_rating,
    published_date,
    pages
FROM books
WHERE (published_date BETWEEN 2010 AND 2023)
  AND (pages >= 10)
  AND average_rating IN (
      SELECT max_rating
      FROM highest_rating
      WHERE books.published_date = highest_rating.published_date
  );