-- 16. Find authors who have written at least 10 books WHERE EVERY single book has a rating within 0.5 points of their average rating (meaning they're incredibly consistent).
-- Use CTEs and subqueries to solve this.
WITH consistent_author AS (
 SELECT
  author,
  AVG(average_rating) AS avg_rating,
  COUNT(*) AS book_count,
  MAX(average_rating) AS max_rating,
  MIN(average_rating) AS min_rating
 FROM books
 GROUP BY author
 HAVING COUNT(*) >= 10
    AND ABS(max_rating - avg_rating) <= 0.5
    AND ABS(avg_rating - min_rating) <= 0.5
)

SELECT
 author,
 avg_rating,
 max_rating,
 min_rating
FROM consistent_author;

-- 17. Using subqueries and CTEs, identify books that have:
 -- Below average page count for their year
 -- Above average rating for short books (under 300 pages)
 -- Written by authors who typically write long books (average > 400 pages)
-- This finds short books that are unusually good FROM authors who usually write long books. Show the book title, author, pages, and rating.
WITH year_avg_pages AS (
 SELECT
  published_date,
  AVG(pages) AS avg_pages_year
 FROM books
 GROUP BY published_date
),
avg_rating_short_books AS (
 SELECT
  AVG(average_rating) AS avg_short_rating
 FROM books
 WHERE (pages < 300)
),
author_write_long_books AS (
 SELECT
  author
 FROM books
 GROUP BY (author)
 HAVING (AVG(pages) > 400)
)

SELECT
 b.title,
 b.author,
 b.pages,
 b.average_rating
FROM books b
WHERE (
 b.pages < (SELECT
  avg_pages_year
  FROM year_avg_pages y
  WHERE (y.published_date = b.published_date)
 )
 AND b.pages < 300
 AND b.average_rating > (SELECT avg_short_rating FROM avg_rating_short_books)
 AND b.author IN (SELECT author FROM author_write_long_books)
);

-- 18. Using CTEs, find the single most dominant author of each decade (1950s, 1960s, 1970s, etc.).
-- "Dominant" means they had the most books WITH ratings above 4.0 IN that decade.
-- For ties, use total number of books AS tiebreaker. Show the decade, author, number of highly-rated books, and their average rating for that decade.
WITH author_decade_stats AS (
  SELECT
    author,
    (published_date / 10) * 10 AS decade,
    COUNT(CASE WHEN average_rating > 4.0 THEN 1 END) AS high_rating_count,
    COUNT(*) AS total_books,
    AVG(average_rating) AS avg_rating
  FROM books
  GROUP BY author, decade
),
top_contenders AS (
  SELECT
    author,
    decade,
    high_rating_count,
    total_books,
    avg_rating
  FROM author_decade_stats
  WHERE (decade, high_rating_count) IN (
    SELECT
      decade,
      MAX(high_rating_count)
    FROM author_decade_stats
    GROUP BY decade
  )
)
SELECT
  decade,
  author,
  high_rating_count,
  avg_rating
FROM top_contenders
WHERE (decade, total_books) IN (
  SELECT
    decade,
    MAX(total_books)
  FROM top_contenders
  GROUP BY decade
)
ORDER BY decade;