-- Natural Language Search
CREATE FULLTEXT INDEX idx_overview ON movies (overview)

SELECT 
  title, 
  overview,
  MATCH (overview) AGAINST ('The food and the drinks') AS score
FROM movies
WHERE MATCH (overview) AGAINST ('The food and the drinks')

-- Boolean Mode Search
SELECT 
  title, 
  overview,
  MATCH (overview) AGAINST ('psyco*' IN BOOLEAN MODE) AS score
FROM movies
WHERE MATCH (overview) AGAINST ('psyco*' IN BOOLEAN MODE)