-----------------------------
-- genres 정규화
-----------------------------
CREATE TABLE genres (
	genre_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(50) UNIQUE,
	created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL
)

INSERT INTO 
	genres (name) 
SELECT DISTINCT
	UNNEST(string_to_array(genres, ',')) 
FROM movies
GROUP BY genres 

CREATE TABLE movies_genres (
	movie_id BIGINT NOT NULL,
	genre_id BIGINT NOT NULL,
	created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	
	
	PRIMARY KEY (movie_id, genre_id),
	FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
	FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
)

INSERT INTO 
	movies_genres (movie_id, genre_id)
SELECT 
	movies.movie_id,
	genres.genre_id
FROM movies 
JOIN genres ON movies.genres LIKE '%' || genres.name ||  '%'

ALTER TABLE movies DROP COLUMN genres

-----------------------------
--  spoken_language 정규화
-----------------------------

-- langs 테이블의 특정 lang_id에 해당하는 name 값을 업데이트
-- (이미 존재하는 기본 데이터의 이름을 사람이 이해하기 좋은 언어명으로 정리하는 단계)
UPDATE langs SET name = 'Finnish' WHERE lang_id = 1;
UPDATE langs SET name = 'English' WHERE lang_id = 2;
UPDATE langs SET name = 'German' WHERE lang_id = 3;
UPDATE langs SET name = 'Hebrew' WHERE lang_id = 4;
UPDATE langs SET name = 'Spanish' WHERE lang_id = 5;
UPDATE langs SET name = 'Mandarin' WHERE lang_id = 6;
UPDATE langs SET name = 'Japanese' WHERE lang_id = 7;
UPDATE langs SET name = 'Danish' WHERE lang_id = 8;
UPDATE langs SET name = 'French' WHERE lang_id = 9;
UPDATE langs SET name = 'Korean' WHERE lang_id = 10;
UPDATE langs SET name = 'Polish' WHERE lang_id = 11;
UPDATE langs SET name = 'Swedish' WHERE lang_id = 12;
UPDATE langs SET name = 'Italian' WHERE lang_id = 13;
UPDATE langs SET name = 'Bosnian' WHERE lang_id = 14;
UPDATE langs SET name = 'Hindi' WHERE lang_id = 15;
UPDATE langs SET name = 'Russian' WHERE lang_id = 16;
UPDATE langs SET name = 'Norwegian' WHERE lang_id = 17;
UPDATE langs SET name = 'Portuguese' WHERE lang_id = 18;
UPDATE langs SET name = 'Dutch' WHERE lang_id = 19;
UPDATE langs SET name = 'Greek' WHERE lang_id = 20;
UPDATE langs SET name = 'Czech' WHERE lang_id = 21;
UPDATE langs SET name = 'Bengali' WHERE lang_id = 22;
UPDATE langs SET name = 'Cantonese' WHERE lang_id = 23;
UPDATE langs SET name = 'Tswana' WHERE lang_id = 24;
UPDATE langs SET name = 'Serbian' WHERE lang_id = 25;
UPDATE langs SET name = 'Mongolian' WHERE lang_id = 26;
UPDATE langs SET name = 'Estonian' WHERE lang_id = 27;
UPDATE langs SET name = 'Icelandic' WHERE lang_id = 28;
UPDATE langs SET name = 'Catalan' WHERE lang_id = 29;
UPDATE langs SET name = 'Romanian' WHERE lang_id = 30;
UPDATE langs SET name = 'Hungarian' WHERE lang_id = 31;
UPDATE langs SET name = 'Northern Sami' WHERE lang_id = 32;
UPDATE langs SET name = 'Pushto' WHERE lang_id = 33;
UPDATE langs SET name = 'Thai' WHERE lang_id = 34;
UPDATE langs SET name = 'No Language' WHERE lang_id = 35;
UPDATE langs SET name = 'Turkish' WHERE lang_id = 36;
UPDATE langs SET name = 'Serbo-Croatian' WHERE lang_id = 37;
UPDATE langs SET name = 'Persian' WHERE lang_id = 38;
UPDATE langs SET name = 'Haitian; Haitian Creole' WHERE lang_id = 39;
UPDATE langs SET name = 'Bulgarian' WHERE lang_id = 40;
UPDATE langs SET name = 'Zulu' WHERE lang_id = 41;
UPDATE langs SET name = 'Arabic' WHERE lang_id = 42;
UPDATE langs SET name = 'Kurdish' WHERE lang_id = 43;
UPDATE langs SET name = 'Tibetan' WHERE lang_id = 44;
UPDATE langs SET name = 'Tamil' WHERE lang_id = 45;
UPDATE langs SET name = 'Tagalog' WHERE lang_id = 46;
UPDATE langs SET name = 'Kazakh' WHERE lang_id = 47;
UPDATE langs SET name = 'Croatian' WHERE lang_id = 48;
UPDATE langs SET name = 'Indonesian' WHERE lang_id = 49;
UPDATE langs SET name = 'Amharic' WHERE lang_id = 50;
UPDATE langs SET name = 'Lithuanian' WHERE lang_id = 51;
UPDATE langs SET name = 'Inuktitut' WHERE lang_id = 52;
UPDATE langs SET name = 'Punjabi' WHERE lang_id = 53;
UPDATE langs SET name = 'Telugu' WHERE lang_id = 54;
UPDATE langs SET name = 'Slovenian' WHERE lang_id = 55;
UPDATE langs SET name = 'Vietnamese' WHERE lang_id = 56;
UPDATE langs SET name = 'Malayalam' WHERE lang_id = 57;
UPDATE langs SET name = 'Macedonian' WHERE lang_id = 58;
UPDATE langs SET name = 'Slovak' WHERE lang_id = 59;
UPDATE langs SET name = 'Afrikaans' WHERE lang_id = 60;
UPDATE langs SET name = 'Urdu' WHERE lang_id = 61;
UPDATE langs SET name = 'Khmer' WHERE lang_id = 62;
UPDATE langs SET name = 'Norwegian Bokmål' WHERE lang_id = 63;
UPDATE langs SET name = 'Marathi' WHERE lang_id = 64;
UPDATE langs SET name = 'Armenian' WHERE lang_id = 65;
UPDATE langs SET name = 'Ukrainian' WHERE lang_id = 66;
UPDATE langs SET name = 'Georgian' WHERE lang_id = 67;
UPDATE langs SET name = 'Malay' WHERE lang_id = 68;
UPDATE langs SET name = 'Latin' WHERE lang_id = 69;
UPDATE langs SET name = 'Kannada' WHERE lang_id = 70;
UPDATE langs SET name = 'Dzongkha' WHERE lang_id = 71;
UPDATE langs SET name = 'Irish' WHERE lang_id = 72;
UPDATE langs SET name = 'Basque' WHERE lang_id = 73;
UPDATE langs SET name = 'Bambara' WHERE lang_id = 74;
UPDATE langs SET name = 'Albanian' WHERE lang_id = 75;
UPDATE langs SET name = 'Abkhazian' WHERE lang_id = 76;
UPDATE langs SET name = 'Galician' WHERE lang_id = 77;
UPDATE langs SET name = 'Moldavian' WHERE lang_id = 78;
UPDATE langs SET name = 'Sinhalese' WHERE lang_id = 79;
UPDATE langs SET name = 'Kinyarwanda' WHERE lang_id = 80;
UPDATE langs SET name = 'Kirghiz' WHERE lang_id = 81;
UPDATE langs SET name = 'Esperanto' WHERE lang_id = 82;
UPDATE langs SET name = 'Xhosa' WHERE lang_id = 83;
UPDATE langs SET name = 'Belarusian' WHERE lang_id = 84;
UPDATE langs SET name = 'Javanese' WHERE lang_id = 85;
UPDATE langs SET name = 'Tajik' WHERE lang_id = 86;
UPDATE langs SET name = 'Fulah' WHERE lang_id = 87;
UPDATE langs SET name = 'Latvian' WHERE lang_id = 88;
UPDATE langs SET name = 'Wolof' WHERE lang_id = 89;
UPDATE langs SET name = 'Inupiaq' WHERE lang_id = 90;
UPDATE langs SET name = 'Uzbek' WHERE lang_id = 91;
UPDATE langs SET name = 'Lao' WHERE lang_id = 92;
UPDATE langs SET name = 'Kashmiri' WHERE lang_id = 93;
UPDATE langs SET name = 'Samoan' WHERE lang_id = 94;
UPDATE langs SET name = 'Gaelic' WHERE lang_id = 95;
UPDATE langs SET name = 'Welsh' WHERE lang_id = 96;
UPDATE langs SET name = 'Lingala' WHERE lang_id = 97;
UPDATE langs SET name = 'Shona' WHERE lang_id = 98;
UPDATE langs SET name = 'Yiddish' WHERE lang_id = 99;
UPDATE langs SET name = 'Turkmen' WHERE lang_id = 100;
UPDATE langs SET name = 'Swahili' WHERE lang_id = 101;
UPDATE langs SET name = 'Kalaallisut' WHERE lang_id = 102;
UPDATE langs SET name = 'Nepali' WHERE lang_id = 103;
UPDATE langs SET name = 'Faroese' WHERE lang_id = 104;
UPDATE langs SET name = 'Azerbaijani' WHERE lang_id = 105;
UPDATE langs SET name = 'Letzeburgesch' WHERE lang_id = 106;
UPDATE langs SET name = 'Corsican' WHERE lang_id = 107;
UPDATE langs SET name = 'Yoruba' WHERE lang_id = 108;
UPDATE langs SET name = 'Frisian' WHERE lang_id = 109;
UPDATE langs SET name = 'Gujarati' WHERE lang_id = 110;
UPDATE langs SET name = 'Sardinian' WHERE lang_id = 111;
UPDATE langs SET name = 'Igbo' WHERE lang_id = 112;
UPDATE langs SET name = 'Aymara' WHERE lang_id = 113;
UPDATE langs SET name = 'Malagasy' WHERE lang_id = 114;
UPDATE langs SET name = 'Somali' WHERE lang_id = 115;
UPDATE langs SET name = 'Guarani' WHERE lang_id = 116;
UPDATE langs SET name = 'Quechua' WHERE lang_id = 117;
UPDATE langs SET name = 'Cree' WHERE lang_id = 118;
UPDATE langs SET name = 'Marshall' WHERE lang_id = 119;
UPDATE langs SET name = 'Maori' WHERE lang_id = 120;
UPDATE langs SET name = 'Maltese' WHERE lang_id = 121;
UPDATE langs SET name = 'Sotho' WHERE lang_id = 122;
UPDATE langs SET name = 'Limburgish' WHERE lang_id = 123;
UPDATE langs SET name = 'Sanskrit' WHERE lang_id = 124;
UPDATE langs SET name = 'Assamese' WHERE lang_id = 125;
UPDATE langs SET name = 'Hausa' WHERE lang_id = 126;
UPDATE langs SET name = 'Norwegian Nynorsk' WHERE lang_id = 127;
UPDATE langs SET name = 'Divehi' WHERE lang_id = 128;
UPDATE langs SET name = 'Akan' WHERE lang_id = 129;
UPDATE langs SET name = 'Burmese' WHERE lang_id = 130;
UPDATE langs SET name = 'Oriya' WHERE lang_id = 131;

-- movies.spoken_languages 컬럼에 들어 있는 문자열 데이터를 ',' 기준으로 분리해서
-- distinct 값만 추출하는 CTE
WITH extracted_langs AS (
	SELECT DISTINCT 
		UNNEST(string_to_array(spoken_languages, ',')) AS lang_names
	FROM movies
)

-- 추출된 언어 중 langs 테이블에 아직 등록되지 않은 값 확인
SELECT 
	el.lang_names
FROM extracted_langs el
LEFT JOIN langs ON el.lang_names = langs.name
WHERE langs.name IS NULL

-- langs 테이블에 빠져 있는 언어들을 추가로 등록
INSERT INTO langs (name, code) 
VALUES ('Slavic', 'sx'),
('Twi', 'tw'),
('Avaric', 'av'),
('Venda', 've'),
('Sundanese', 'su'),
('Tatar', 'tt'),
('Ndebele', 'nd'),
('Kikuyu', 'ki'),
('Raeto-Romance', 'rm'),
('Fijian', 'fj'),
('Breton', 'br'),
('Ido', 'io'),
('Bislama', 'bi'),
('Uighur', 'ug'),
('Afar', 'aa'),
('Occitan', 'oc'),
('Ganda', 'lg'),
('Sango', 'sg'),
('Herero', 'hz'),
('Chechen', 'ce'),
('Nauru', 'na'),
('Chichewa; Nyanja', 'ny'),
('Tigrinya', 'ti'),
('Tahitian', 'ty'),
('Tonga', 'to'),
('Navajo', 'nv'),
('Ojibwa', 'oj'),
('Aragonese', 'an');

-- 영화와 언어 간 다대다 관계를 저장하는 중간 테이블 생성
-- 한 영화는 여러 언어를 가질 수 있고, 한 언어도 여러 영화에 쓰일 수 있기 때문
CREATE TABLE movies_langs (
	movie_id BIGINT NOT NULL,
	lang_id BIGINT NOT NULL,
	created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	
	PRIMARY KEY (movie_id, lang_id),
	FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
	FOREIGN KEY (lang_id) REFERENCES langs (lang_id)
)

-- spoken_languages 문자열에서 langs.name을 LIKE 검색으로 매칭해서
-- 다대다 관계 테이블(movies_langs)에 삽입
INSERT INTO movies_langs (movie_id, lang_id)
SELECT 
	movie_id,
	langs.lang_id 
FROM movies 
JOIN langs ON movies.spoken_languages LIKE '%' || langs.name  || '%'

-- 정규화가 끝났으므로 movies 테이블에서 기존 spoken_languages 컬럼 제거
ALTER TABLE movies DROP COLUMN spoken_languages
