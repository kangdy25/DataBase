import sqlite3

# movies.db에 연결 및 커서 생성
conn = sqlite3.connect("movies.db")
cur = conn.cursor()

# 쿼리 실행: movie_id 기준 정렬하여 movie_id, title 반환
res = cur.execute("SELECT movie_id, title FROM movies ORDER BY movie_id")

# fetchone(): 결과의 다음 한 행을 튜플로 반환 (호출할 때마다 커서가 다음으로 이동)
print(res.fetchone(), res.fetchone(), res.fetchone(), res.fetchone(), res.fetchone())

# fetchall(): 현재 커서 위치부터 남은 모든 행을 리스트로 반환 (→ 커서 소진)
all_movies = res.fetchall()

# 이미 fetchall()로 남은 모든 행을 읽었으므로 이후 fetchmany는 일반적으로 빈 리스트가 됨
first_20 = res.fetchmany(20)
next_20 = res.fetchmany(20)

# 커서는 순차 소진 방식이므로, 위에서 이미 결과를 다 읽었다면 이 반복은 출력할 것이 없음
for movie in res:
    print(movie)

# 변경사항 저장(없어도 무방) 및 연결 종료
conn.commit()
conn.close()
