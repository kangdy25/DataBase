-- 10. Find all books that have more pages than the average
select 
  title,
  pages,
  (select avg(pages) from books) as avg_pages
from books
where (pages > (select avg(pages) from books))

-- 11. List authors whose average rating is higher than the overall average rating
select
  author,
  avg(average_rating),
  (select avg(average_rating) from books) as overall_avg_rating
from books
group by author
having (avg(average_rating) > (select avg(average_rating) from books))

-- 12. Find books published in the same year as the highest-rated book
select
  published_date,
  title,
  average_rating,
  (select max(average_rating) from books) as highest_rated_book
from books
where published_date = (
  select 
    published_date
  from books
  WHERE average_rating = (SELECT MAX(average_rating) FROM books)
  LIMIT 1
)