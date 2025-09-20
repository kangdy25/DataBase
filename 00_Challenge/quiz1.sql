-- 1. Find the 10 longest books (by pages) in the database
select 
  title,
  pages
from books 
order by pages DESC
limit 10

-- 2. List all books published in 2020
select 
  title,
  published_date
from books
where (published_date = 2020)

-- 3. Find books with ratings between 4.5 and 5.0
select 
  title,
  average_rating
from books
where (average_rating between 4.5 and 5.0)