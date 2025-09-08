-- What is the average rating of each director?
SELECT
    director,
    AVG(rating) AS avg_rating
FROM movies
WHERE
    (
        director IS NOT NULL
        AND rating IS NOT NULL
    )
GROUP BY director
ORDER BY avg_rating DESC;
    
-- * that has more than 5 movies
SELECT
    director,
    ROUND(AVG(rating), 3) AS avg_rating,
    COUNT(*) AS total_movies
FROM movies
WHERE
    (
        director IS NOT NULL
        AND rating IS NOT NULL
    )
GROUP BY director
HAVING total_movies >= 5
ORDER BY avg_rating DESC;
    
-- How many movies are in each genre?
SELECT
    genres,
    COUNT(*) AS count_genres
FROM movies
WHERE genres IS NOT NULL
GROUP BY genres
ORDER BY count_genres DESC;
    
-- How many movies have a rating greater than 6? 
-- What rating is the most common?
SELECT
    rating,
    COUNT(*) AS total_good_movies
FROM movies
WHERE rating > 6
GROUP BY rating
ORDER BY total_good_movies DESC;

-- 1. 각 년도에 개봉된 영화의 수
SELECT 
  release_date,
  COUNT(*) AS total_count
FROM movies 
WHERE 
    (release_date IS NOT NULL )
GROUP BY release_date
ORDER BY total_count DESC;

-- 2. 평균 영화 상영 시간이 가장 높은 최신 10년
SELECT 
  release_date,
  AVG(runtime) AS top_10 
FROM movies
WHERE runtime IS NOT NULL
GROUP BY release_date 
ORDER BY top_10 DESC
LIMIT 10;

-- 3. 21세기에 개봉한 영화의 평균 평점
SELECT 
    ROUND(AVG(rating), 2) 
FROM movies 
WHERE release_date > 2000;

-- 4. 평균 영화 상영 시간이 가장 긴 감독
SELECT 
  director,
  AVG(runtime) / 60 as avg_runtime,
  COUNT(*) as total_movies
FROM movies 
WHERE 
    (director IS NOT NULL AND runtime IS NOT NULL)
GROUP BY director
having total_movies > 2
ORDER BY avg_runtime DESC;

-- 5. 가장 많은 영화를 작업한 다작 감독 상위 5명
SELECT 
  director,
  count(*) AS total_movies
FROM movies 
WHERE (director IS NOT NULL)
GROUP BY director
ORDER BY total_movies desc
LIMIT 5;

-- 6. 각 감독의 최고 평점과 최저 평점
SELECT 
  director,
  MAX(rating) AS max_rating,
  MIN(rating) AS min_rating,
  COUNT(*) AS total_movies
FROM movies 
WHERE (director IS NOT NULL AND rating IS NOT NULL)
GROUP BY director
HAVING (total_movies > 5)
ORDER BY total_movies DESC;

-- 7. 돈을 가장 많이 번 감독 (수익에서 예산을 뺀 금액 계산)
SELECT 
  director,
  SUM(revenue) - SUM(budget) AS profit
FROM movies
WHERE 
  (director IS NOT NULL 
  AND revenue IS NOT NULL 
  AND budget IS NOT NULL)
GROUP BY director
ORDER BY profit DESC;

-- 8. 2시간 이상인 영화들의 평균 평점
SELECT 
  ROUND(AVG(rating), 3)
FROM movies 
WHERE (runtime > 120)

-- 9. 가장 많은 영화가 개봉된 년도
SELECT 
  release_date,
  COUNT(*) AS count_movies
FROM movies 
WHERE (release_date IS NOT NULL)
GROUP BY release_date
ORDER BY count_movies DESC
LIMIT 1;

-- 10. 각 10년동안 평균 영화 상영 시간 (ex: 1800, 1810, 1920, 2000)
SELECT 
  (release_date / 10) * 10 AS decade,
  AVG(runtime) AS avg_runtime
FROM movies 
WHERE (release_date IS NOT NULL 
      AND runtime IS NOT NULL)
GROUP BY decade
ORDER BY avg_runtime DESC;