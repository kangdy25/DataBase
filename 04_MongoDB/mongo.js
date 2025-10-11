// ===================================
// 1️⃣ DB 및 컬렉션 생성 / 데이터 삽입
// ===================================
// use movies

db.createCollection("movies")

// 단일 문서 삽입
db.movies.insertOne({
  title: "The Godfather",
  year: 1999,
  director: { name: "F.F.C", alive: true },
  genres: ["Crime", "Drama"]
})

// 여러 문서 삽입
db.movies.insertMany([
  { title: "EEAAO" },
  { title: "The Godfather II" }
])

// ===================================
// 2️⃣ 조회 (Find)
// ===================================
db.movies.find()  // 전체 조회
db.movies.find({ director: "Christopher Nolan" })
db.movies.find({ rating: { $gte: 8 } })
db.movies.find({ year: { $gt: 2000, $lt: 2010 } })
db.movies.find({ $or: [{ rating: { $gt: 9 } }, { year: { $gte: 2020 } }] })
db.movies.find({ genres: { $in: ["Drama", "Crime"] } })
db.movies.find({ genres: { $all: ["Drama", "Crime"] } })
db.movies.find({ title: { $regex: /the/i } })
db.movies.find({ genres: { $size: 3 } })
db.movies.find({ director: { $exists: false } })
db.movies.find({ "cast.0": "Keanu Reeves" })
db.movies.find({ "director.alive": true })

// 페이징 / 정렬
db.movies.find().skip(10)
db.movies.find().limit(10)
db.movies.find().sort({ rating: -1 }).limit(10)

// ===================================
// 3️⃣ 업데이트 (Update)
// ===================================
// 단일 문서 업데이트
db.movies.updateOne(
  { _id: ObjectId('68ea3efec86a6be1a2f75414') },
  { 
    $set: { director: 'Francing Ford Coppola' },
    $currentDate: { updated_at: true }
  }
)

// findOneAndUpdate (업서트 + 수정 후 반환)
db.movies.findOneAndUpdate(
  { _id: ObjectId('68ea3efec86a6be1a2f75414') },
  { $set: { director: 'Francing Ford Coppola' }, $currentDate: { updated_at: true } },
  { returnNewDocument: true, upsert: true }
)

// 다중 문서 업데이트
db.movies.updateMany({ director: "Christopher Nolan" }, { $inc: { rating: 0.5 } })
db.movies.updateMany({ title: "Inception" }, { $push: { genres: "Mind-Control" } })
db.movies.updateMany({ title: "Inception" }, { $pull: { genres: "Mind-Control" } })
db.movies.updateMany({ title: "The Dark Knight" }, { $addToSet: { cast: "Michael Cane!" } })
db.movies.updateMany({}, { $rename: { runtime: "duration" } })
db.movies.updateOne(
  { title: "Inception" }, 
  { $set: { boxOffice: { domestic: 292526195, international: 535663842, worldwideTotal: 828239998 } } }
)
db.movies.updateOne({ title: "Inception" }, { $inc: { "boxOffice.domestic": 200 } })
db.movies.updateMany({}, { $unset: { plot: "" } })
db.movies.updateMany(
  { $expr: { $lt: [{ $size: "$genres" }, 3] } },
  { $addToSet: { genres: { $each: ["Other", "Happy"] } } }
)

// ===================================
// 4️⃣ 삭제 (Delete)
// ===================================
db.movies.deleteMany({})  // 전체 삭제
db.movies.deleteMany({ director: "Christopher Nolan" })
db.movies.deleteMany({ genres: "Horror" })
db.movies.deleteMany({ year: { $lt: 2000 } })
db.movies.deleteMany({ $or: [{ rating: { $lt: 5 } }, { year: { $gte: 2025 } }] })
db.movies.deleteOne({ title: "EEAAO" })
db.movies.deleteMany({ "director.alive": false })

// ===================================
// 5️⃣ 집계 (Aggregate)
// ===================================
// 전체 영화 수
db.movies.aggregate([{ $count: "total_movies" }])

// rating 평균
db.movies.aggregate([{ $group: { _id: null, avgRating: { $avg: "$rating" } } }])

// 장르별 영화 수
db.movies.aggregate([
  { $unwind: "$genres" },
  { $group: { _id: "$genres", count: { $sum: 1 } } },
  { $sort: { count: -1 } }
])

// 영화 연도 통계
db.movies.aggregate([
  { $group: { _id: null, oldestMovie: { $min: "$year" }, newestMovie: { $max: "$year" }, count: { $sum: 1 } } }
])

// 연도별 평균 상영 시간
db.movies.aggregate([
  { $group: { _id: "$year", avgDuration: { $avg: "$duration" } } },
  { $sort: { _id: -1 } }
])

// 감독별 영화 수
db.movies.aggregate([
  { $match: { director: { $exists: true } } },
  { $group: { _id: "$director", movieCount: { $sum: 1 } } },
  { $sort: { movieCount: -1 } }
])

// 배우별 영화 수
db.movies.aggregate([
  { $unwind: "$cast" },
  { $group: { _id: "$cast", movieCount: { $sum: 1 } } },
  { $sort: { movieCount: -1 } }
])
