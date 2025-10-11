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
