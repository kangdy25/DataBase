-- Part 1: Basic JOINs
-- List all album names with their artist names (use appropriate through table)
SELECT
  albums.name,
  artists.name
FROM albums
JOIN r_albums_artists ON (albums.id = r_albums_artists.album_id)
JOIN artists ON (r_albums_artists.artist_id = artists.id)

-- Show all tracks with their album names
SELECT
  tracks.name AS track_name,
  albums.name AS album_name
FROM tracks 
JOIN r_albums_tracks ON (tracks.id = r_albums_tracks.track_id)
JOIN albums ON (r_albums_tracks.album_id = albums.id)

-- Display artists with their genres
SELECT
  artists.name AS artist_name,
  genres.id AS genre
FROM artists
JOIN r_artist_genre ON (artists.id = r_artist_genre.artist_id)
JOIN genres ON (r_artist_genre.genre_id = genres.id)