// -------------------------
// Drizzle Introspect
// -------------------------
// import Database from "better-sqlite3"
// import { drizzle } from "drizzle-orm/better-sqlite3"
// import { movies } from "./drizzle/schema.js"

// SQLite 데이터베이스 파일(movies.db)에 연결 생성
// const sqlite = new Database("movies.db")

// drizzle ORM을 통해 데이터베이스 객체 생성
// const db = drizzle(sqlite)

// movies 테이블에서 특정 컬럼만 선택해서 50개 행 조회
// const result = await db.select({
//     id: movies.movieId,       
//     title: movies.title,     
//     overview: movies.overview
// }).from(movies).limit(50)

// console.log(result)

// -------------------------
// Drizzle Migrate
// -------------------------
import Database from "better-sqlite3";
import { eq } from "drizzle-orm";
import { drizzle } from "drizzle-orm/better-sqlite3";
import { comments, users } from "./schema.js";

const sqlite = new Database("users.db")

const db = drizzle(sqlite, {logger: true})

const resultInsert1 = await db.insert(users).values({
    username: "dongyoon"
}).returning()

const resultInsert2 = await db.insert(comments).values({
    userId: 1,
    payload: "Hello Drizzle!!"
}).returning()

const resultSelect = await db.select().from(comments).where(eq(comments.userId, 1))

const resultJoin = await db.select({
    user: users.username,
    comment: comments.payload
}).from(comments).leftJoin(users, eq(comments.userId, users.userId))

console.log(resultJoin)