-- Part 2: Multiple JOINs

-- Find all tracks with their artist names AND album names in one query
SELECT 
  tracks.name AS track_name,
  artists.name AS artists_name,
  albums.name AS album_name
FROM tracks
JOIN r_track_artist ON (r_track_artist.track_id = tracks.id)
JOIN artists ON (r_track_artist.artist_id = artists.id)
JOIN r_albums_tracks ON (r_albums_tracks.track_id = tracks.id)
JOIN albums ON (r_albums_tracks.album_id = albums.id)

-- List albums with all their artists (some albums have multiple artists)
SELECT 
  albums.name AS album_name,
  artists.name AS artist_name
FROM albums
JOIN r_albums_artists ON (albums.id = r_albums_artists.album_id)
JOIN artists ON (artists.id = r_albums_artists.artist_id)

-- Show tracks with their audio features (danceability, energy, etc.)
SELECT 
  tracks.name,
  audio_features.*
FROM tracks
JOIN audio_features ON (audio_features.id = tracks.audio_feature_id)