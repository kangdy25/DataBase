// better-sqlite3 라이브러리 임포트 (Node.js에서 SQLite를 빠르게 사용할 수 있는 라이브러리)
import Database from "better-sqlite3"
// drizzle ORM에서 better-sqlite3용 드라이버 불러오기
import { drizzle } from "drizzle-orm/better-sqlite3"
// 데이터베이스 테이블 스키마 정의를 가져옴
import { movies } from "./drizzle/schema.js"

// SQLite 데이터베이스 파일(movies.db)에 연결 생성
const sqlite = new Database("movies.db")

// drizzle ORM을 통해 데이터베이스 객체 생성
const db = drizzle(sqlite)

// movies 테이블에서 특정 컬럼만 선택해서 50개 행 조회
const result = await db.select({
    id: movies.movieId,       
    title: movies.title,     
    overview: movies.overview
}).from(movies).limit(50)

console.log(result)
