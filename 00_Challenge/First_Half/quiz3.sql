
-- 7. Find the top 10 most prolific authors (by number of books)
select 
  author,
  count(*) as number_of_books
from books
where (author IS NOT NULL)
group by author
order by number_of_books desc
limit 10

-- 8. List authors who have an average book rating above 4.0 (minimum 5 books)
select
  author,
  avg(average_rating) as avg_rating,
  count(*) as minimum_books
from books
group by author
having 
  avg(average_rating) > 4.0 
  and count(*) >= 5

-- 9. Show the average pages per book for each year, but only for years with more than 1000 books
select 
  published_date,
  avg(pages),
  count(*) as books_per_year
from books
group by published_date
having (count(*) > 1000)