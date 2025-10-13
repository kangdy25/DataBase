from pymongo import MongoClient  # MongoDB 파이썬 드라이버

# ===============================
#  MongoDB 연결
# ===============================
client = MongoClient("mongodb://localhost:27017")  # 로컬 MongoDB 서버 연결

# ===============================
#  데이터베이스 및 컬렉션 선택
# ===============================
database = client.get_database("movies")          # movies 데이터베이스 선택
movies = database.get_collection("movies")       # movies 컬렉션 선택

# ===============================
#  쿼리 작성
# ===============================
query = {"director": "Christopher Nolan"}        # 감독이 Christopher Nolan인 영화
query2 = {"rating": {"$gte": 8}}                 # 평점이 8 이상인 영화

# ===============================
#  조회 실행
# ===============================
result = movies.find(query)                       # 조건에 맞는 문서 조회

# 조회 결과 출력
for movie in result:
    print(movie)

# ===============================
#  새 영화 문서 삽입
# ===============================
new_movie = {
    "title": "New Movie",
    "Director": "Anonymous"
}

new_result = movies.insert_one(new_movie)        # insert_one으로 단일 문서 추가
print(new_result)                                # 삽입 결과 출력 (InsertOneResult 객체)

# ===============================
#  연결 종료
# ===============================
client.close()                                   # MongoDB 연결 종료
