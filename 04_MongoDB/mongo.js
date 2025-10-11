// 데이터베이스 목록 확인
// show dbs

// movies 데이터베이스 선택
// use movies

// movies 컬렉션 생성
db.createCollection("movies")

// 단일 문서 삽입
db.movies.insertOne({
  title: "The Godfather",
  year: 1999,
  director: { name: "F.F.C", alive: true },
  genres: ["Crime", "Drama"]
})

// 여러 문서 삽입
db.movies.insertMany([{title: "EEAAO"}, {title: "The Godfather II"}])

// 전체 조회
db.movies.find()

// 특정 조건 조회 예시
db.movies.find({director: "Christopher Nolan"})  // 감독 이름으로 조회
db.movies.find({rating: {$gte: 8}})             // rating >= 8
db.movies.find({year: {$gt: 2000, $lt: 2010}})  // 2000 < year < 2010
db.movies.find({$or: [{rating: {$gt: 9}}, {year: {$gte: 2020}}]}) // OR 조건
db.movies.find({genres: {$in: ["Drama", "Crime"]}}) // 배열에 특정 값 포함
db.movies.find({genres: {$all : ["Drama", "Crime"]}}) // 배열에 모든 값 포함
db.movies.find({ title: { $regex: /the/i}}) // 정규식 검색 (대소문자 무시)
db.movies.find({ genres: { $size: 3}})     // 배열 길이가 3인 문서
db.movies.find({ director: { $exists: false}}) // director 필드 없는 문서
db.movies.find({ "cast.0": "Keanu Reeves"}) // cast 배열 첫 번째가 Keanu Reeves
db.movies.find({ "director.alive": true})   // nested 필드 조회

// 페이징 및 정렬
db.movies.find().skip(10)                       // 10개 건너뛰기
db.movies.find().limit(10)                      // 10개만 조회
db.movies.find().sort({rating: -1}).limit(10)  // rating 내림차순 10개

// 단일 문서 업데이트
db.movies.updateOne(
  { _id: ObjectId('68ea3efec86a6be1a2f75414') }, 
  { 
    $set: { director: 'Francing Ford Coppola' },  // director 변경
    $currentDate: { updated_at: true }           // updated_at 현재 날짜로
  }
)

// findOneAndUpdate 사용 (업서트 포함, 수정 후 문서 반환)
db.movies.findOneAndUpdate(
  { _id: ObjectId('68ea3efec86a6be1a2f75414') },
  { 
    $set: { director: 'Francing Ford Coppola' },
    $currentDate: { updated_at: true }
  },
  { returnNewDocument: true, upsert: true }  // 새 문서 생성 가능, 수정 후 반환
)

// 다중 문서 업데이트: rating 증가
db.movies.updateMany(
  { director: "Christopher Nolan" },
  { $inc: { rating: 0.5 } }  // rating 0.5 증가
)

// 배열 필드에 값 추가
db.movies.updateMany(
  { title: "Inception" },
  { $push: { genres: "Mind-Control" } }  // 배열 끝에 추가
)

// 배열 필드에서 값 제거
db.movies.updateMany(
  { title: "Inception" },
  { $pull: { genres: "Mind-Control" } }  // 특정 값 제거
)

// 배열에 중복 없이 값 추가
db.movies.updateMany(
  { title: "The Dark Knight" },
  { $addToSet: { cast: "Michael Cane!" } }  // 중복 방지 추가
)

// 필드 이름 변경
db.movies.updateMany(
  {}, 
  { $rename: { runtime: "duration" } }  // runtime → duration
)

// 중첩 필드 추가/수정
db.movies.updateOne(
  { title: "Inception" }, 
  { $set: { boxOffice: { domestic: 292526195, international: 535663842, worldwideTotal: 828239998 } } }
)

// 중첩 숫자 필드 값 증가
db.movies.updateOne(
  { title: "Inception" }, 
  { $inc: { "boxOffice.domestic": 200 } }  // domestic 200 증가
)

// 특정 필드 삭제
db.movies.updateMany(
  {}, 
  { $unset: { plot: "" } }  // plot 필드 제거
)

// 조건 기반 배열 필드에 여러 값 추가
db.movies.updateMany(
  { $expr: { $lt: [{$size: "$genres"}, 3] } }, 
  { $addToSet: { genres: { $each: ["Other", "Happy"] } } } // genres 길이 < 3일 때 값 추가
)

// 모든 문서 삭제
db.movies.deleteMany({})

// 특정 조건 삭제
db.movies.deleteMany({ director: "Christopher Nolan" })
db.movies.deleteMany({ genres: "Horror" })
db.movies.deleteMany({ year: { $lt: 2000 } })
db.movies.deleteMany({ $or: [{ rating: { $lt: 5 } }, { year: { $gte: 2025 } }] })

// 단일 문서 삭제
db.movies.deleteOne({ title: "EEAAO" })

// 중첩 필드 기준 삭제
db.movies.deleteMany({ "director.alive": false })
