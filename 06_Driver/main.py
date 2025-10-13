# ===================================
#  기본 SQLite Driver 세팅
# ===================================

import sqlite3  # SQLite 내장 모듈

# 'users.db' 파일에 연결 (없으면 새로 생성)
conn = sqlite3.connect("users.db")

# SQL 실행용 커서 생성
cur = conn.cursor()


# users 테이블 생성 및 초기 데이터 삽입 함수
def init_table():
    cur.execute("""
        CREATE TABLE users(
            user_id INTEGER PRIMARY KEY AUTOINCREMENT,  -- 자동 증가 기본키
            user_name TEXT NOT NULL,                    -- 사용자 이름
            password TEXT NOT NULL                      -- 비밀번호
        )
    """)
    # 예시 데이터 삽입
    cur.execute("""
        INSERT INTO users (user_name, password) 
        VALUES ('dongyoon', 123), ('jihun', 321);
    """)


# 모든 사용자 조회 및 출력
def print_all_users():
    res = cur.execute("SELECT * FROM users")  # 모든 행 조회
    data = res.fetchall()                     # 결과를 리스트로 반환
    print(data)                               # 콘솔 출력


# ===================================
#  SQL Injection 예시
# ===================================

# 취약한 방식: 문자열 포매팅으로 SQL 직접 조합 → 인젝션 위험
def i_change_password(user_name, new_password):
    cur.execute(f"UPDATE users SET password = '{new_password}' WHERE user_name = '{user_name}'")


# (예시 호출 — 주석 처리)
# i_change_password("jihun", "I dont know anything")
# i_change_password("dongyoon", "hacked' --")  # 악의적 입력 예시


# 안전한 방식: 파라미터 바인딩 사용 (SQL 인젝션 방지)
def s_change_password(user_name, new_password):
    # ? 플레이스홀더와 튜플 전달 (권장)
    cur.execute("UPDATE users SET password = ? WHERE user_name = ?", (new_password, user_name))


# 안전한 호출 예시 (주석 처리)
# s_change_password("dongyoon", "hacked agaaaaain!!!' --")


# ===================================
#  배치 삽입 예제 (executemany)
# ===================================

# 튜플 리스트를 사용한 파라미터 방식
data = [
    ('lannna', 567),
    ('bora', 123),
    ('max', 123),
    ('jja', 898),
]
# ? 플레이스홀더와 튜플 시퀀스로 여러 행 삽입
cur.executemany("INSERT INTO users (user_name, password) VALUES (?, ?)", data)

# 딕셔너리(명명된 플레이스홀더)를 사용한 방식
data = [
    {"name": 'lannna', "password": 567},
    {"name": 'bora',   "password": 123},
    {"name": 'max',    "password": 123},
    {"name": 'jja',    "password": 898},
]
# :name, :password 와 같은 명명된 플레이스홀더 사용
cur.executemany("INSERT INTO users (user_name, password) VALUES (:name, :password)", data)


# 실행: 테이블 초기화가 이미 되어 있다면 init_table() 주석 유지
# init_table()
print_all_users()  # 현재 테이블 상태 출력


# 변경사항 저장 및 연결 종료
conn.commit()
conn.close()