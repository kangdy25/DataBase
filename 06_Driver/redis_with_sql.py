import redis          # Redis 파이썬 클라이언트
import sqlite3        # SQLite 내장 모듈
import json           # JSON 직렬화/역직렬화

# ===============================
#  SQLite DB 연결
# ===============================
conn = sqlite3.connect("movies.db")  # movies.db 파일 연결 (없으면 생성)
cur = conn.cursor()                  # SQL 실행을 위한 커서 생성

# ===============================
#  Redis 연결
# ===============================
r = redis.Redis(
    host="localhost",    # Redis 서버 호스트
    port=6379,           # Redis 서버 포트
    decode_responses=True # 문자열로 응답 받도록 설정
)

# ===============================
#  SQL + Redis 캐시 함수
# ===============================
def make_expensive_query():
    redis_key = "director:movies"   # Redis에 저장할 키 이름
    cached_results = r.get(redis_key)  # Redis에서 캐시 조회

    if cached_results:
        # ✅ 캐시가 존재하면 바로 반환
        print("Cache hit")
        return json.loads(cached_results)  # 문자열(JSON) → 파이썬 객체
    else: 
        # ✅ 캐시가 없으면 DB 조회 후 캐시에 저장
        print("Cache miss")
        res = cur.execute(
            "SELECT COUNT(*), director FROM movies GROUP BY director"
        )  # 감독별 영화 수 조회
        all_rows = res.fetchall()                 # 결과 리스트로 변환
        r.set(redis_key, json.dumps(all_rows), ex=20)  # Redis에 20초 만료로 저장
        return all_rows

# ===============================
#  함수 실행
# ===============================
v = make_expensive_query()  # 캐시 확인 + SQL 조회

# ===============================
#  종료 처리
# ===============================
conn.commit()  # SQLite 변경사항 저장
conn.close()   # SQLite 연결 종료
r.close()      # Redis 연결 종료
