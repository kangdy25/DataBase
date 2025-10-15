// ============================
// Drizzle Introspect
// ============================

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


// ============================
// Drizzle Migrate
// ============================

// import Database from "better-sqlite3";
// import { eq } from "drizzle-orm";
// import { drizzle } from "drizzle-orm/better-sqlite3";
// import { comments, users } from "./schema.js";

// const sqlite = new Database("users.db")

// const db = drizzle(sqlite, {logger: true})

// const resultInsert1 = await db.insert(users).values({
//     username: "dongyoon"
// }).returning()

// const resultInsert2 = await db.insert(comments).values({
//     userId: 1,
//     payload: "Hello Drizzle!!"
// }).returning()

// const resultSelect = await db.select().from(comments).where(eq(comments.userId, 1))

// const resultJoin = await db.select({
//     user: users.username,
//     comment: comments.payload
// }).from(comments).leftJoin(users, eq(comments.userId, users.userId))

// console.log(resultJoin)


// ============================
// Redis
// ============================
// import { createClient } from "redis";

// const client = createClient()

// await client.connect();

// await client.set("hello", "world")
// const r1 = await client.get("hello")

// await client.flushAll()

// await client.hSet("users:1", {
//     username: "dongyoon",
//     password: "123"
// })

// const r2 = await client.hGetAll("users:1")
// console.log(r2)

// await client.disconnect();


// ============================
// Mongoose
// ============================

import * as mongoose from "mongoose"

await mongoose.connect("mongodb://localhost:27017/movies")

const moviesSchema = new mongoose.Schema({
    title: { type: String, required: true },
    director: { type: String, required: true },
    rating: {
        type: Number,
        required: true,
        min: [1, "No movie deserves less than 1"],
        max: [10, "No movie is better than 10"],
    }
});

const Movie = mongoose.model("Movie", moviesSchema);

const movie = await Movie.create({
    title: "The mongoose",
    rating: 10
})

console.log(movie)

const movies = await Movie.find({rating: {$gte: 8.2}})
// const movies = await Movie.find({director: "Christopher Nolan"})
console.log(movies)

await mongoose.disconnect();