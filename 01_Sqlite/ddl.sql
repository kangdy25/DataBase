create table movies (
  movie_id integer primary key AUTOINCREMENT,
  title TEXT UNIQUE NOT NULL,
  released INTEGER NOT NULL check (released > 0),
  overview TEXT NOT NULL check (length(overview) < 100),
  rating REAL NOT NULL check (rating between 0 AND 10),
  director TEXT,
  for_kids INTEGER NOT NULL DEFAULT 0 check (for_kids = 0 or for_kids = 1)
) strict;

drop table movies