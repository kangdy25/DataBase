import sqlite3  # ✅ SQLite 내장 모듈 불러오기 (외부 설치 필요 없음)

# ✅ 'users.db' 데이터베이스 파일에 연결 (없으면 자동 생성됨)
conn = sqlite3.connect("users.db")

# ✅ SQL 실행을 위한 커서(cursor) 객체 생성
cur = conn.cursor()


# ✅ users 테이블을 생성하고 초기 데이터를 넣는 함수
def init_table():
    cur.execute("""
        CREATE TABLE users(
            user_id INTEGER PRIMARY KEY AUTOINCREMENT,  -- 자동 증가 기본키
            user_name TEXT NOT NULL,                    -- 사용자 이름
            password TEXT NOT NULL                      -- 비밀번호
        )
    """)
    # ✅ 예시 데이터 삽입
    cur.execute("""
        INSERT INTO users (user_name, password) 
        VALUES ('dongyoon', 123), ('jihun', 321);
    """)


# ✅ 모든 사용자 정보를 조회하고 출력하는 함수
def print_all_users():
    res = cur.execute("SELECT * FROM users")  # 모든 데이터 조회
    data = res.fetchall()                      # 결과를 리스트 형태로 반환
    print(data)                                # 결과 출력


# 🚨 SQL Injection(인젝션) 취약한 방식의 예시 함수
def i_change_password(user_name, new_password):
    # ⚠ 문자열 포매팅(f-string)을 직접 SQL 문에 삽입 → 공격자가 SQL 조작 가능
    cur.execute(f"UPDATE users SET password = '{new_password}' WHERE user_name = '{user_name}'")


# ⚠ SQL 인젝션 공격 시나리오 예시
i_change_password("jihun", "I dont know anything")   # 정상적인 변경 시도
i_change_password("dongyoon", "hacked' --")          # 악의적인 입력 (뒤의 주석 처리로 SQL 조작 가능)


# ✅ 안전한 방식 (SQL 파라미터 바인딩 사용)
def s_change_password(user_name, new_password):
    # ✅ SQL 문에 직접 문자열 삽입하지 않고, ? 플레이스홀더 사용
    cur.execute("UPDATE users SET password = ? WHERE user_name = ?", (new_password, user_name))


# ✅ 안전한 비밀번호 변경 (SQL 인젝션 방지)
s_change_password("dongyoon", "hacked agaaaaain!!!' --")


# ✅ 실행 (테이블 초기화는 이미 되어 있다면 주석 유지)
# init_table()
print_all_users()  # 현재 테이블 상태 출력


# ✅ 변경사항 저장 및 연결 종료
conn.commit()
conn.close()
