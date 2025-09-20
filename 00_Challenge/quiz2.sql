-- 4. Calculate the average number of pages for all books
select 
  avg(pages) AS average_pages
from books
  
-- 5. Find the total number of books published each year from 2015 to 2023
select 
  published_date,
  count(*) AS total_books
from books
where (published_date between 2015 AND 2023)
group by published_date

-- 6. What is the average rating of books with more than 500 pages?
select 
  avg(average_rating) AS avg_rating_500
from books
where (pages > 500)