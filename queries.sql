-- Query all of the entries in the Genre table -- 

  SELECT * FROM Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table. --

  INSERT INTO Artist
  SELECT null, "Radiohead", 1985

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table. --

  INSERT INTO Album
  SELECT null, "Pablo Honey", 1995, 4211, "Capitol", ar.ArtistId, g.GenreId
  FROM Artist ar, Genre g
  WHERE ar.ArtistName = "Radiohead"
  and g.label = "Rock"
  
-- Using the INSERT statement, add some songs that are on that album to the Song table. --

  INSERT INTO Song
  SELECT null, "Creep", 356, 1993, g.GenreId, ar.ArtistId, al.AlbumId
  FROM Artist ar, Genre g, Album al
  WHERE ar.ArtistName = "Radiohead"
  and g.label = "Rock"
  and al.Title = "Pablo Honey"

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. --
-- Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. --

  SELECT Song.Title "Song", Album.Title "Album", Artist.ArtistName "Artist"
  FROM Song
  JOIN Album ON Album.ArtistId = Song.ArtistId
  JOIN Artist ON Artist.ArtistId = Song.ArtistId
  WHERE Artist.ArtistName = "Radiohead"

-- Write a SELECT statement to display how many songs exist for each album. --
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence. --

  SELECT COUNT(Song.SongId) "Song Count", Album.Title "Album"
  FROM Song
  JOIN Album 
  WHERE Album.AlbumId = Song.AlbumId
  GROUP BY Album.Title

-- Write a SELECT statement to display how many songs exist for each artist. --
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence. --

  SELECT COUNT(Song.SongId) "Song Count", Artist.ArtistName "Artist"
  FROM Song
  JOIN Artist 
  WHERE Song.ArtistId = Artist.ArtistId
  GROUP BY Artist.ArtistName

-- Write a SELECT statement to display how many songs exist for each genre. --
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence. --

  SELECT COUNT(Song.SongId) "Song Count", Genre.Label
  FROM Song
  JOIN Genre
  WHERE Song.GenreId = Genre.GenreId
  GROUP BY Genre.Label

-- Using MAX() function, write a select statement to find the album with the longest duration. --
-- The result should display the album title and the duration. --

  SELECT MAX(Album.AlbumLength) "Longest Album Duration", Album.title "Album"
  FROM Album

-- Using MAX() function, write a select statement to find the song with the longest duration. --
-- The result should display the song title and the duration. --

  SELECT MAX(Song.SongLength) "Longest Song Duration", Song.title "Song"
  FROM Song

-- Modify the previous query to also display the title of the album. --

  SELECT MAX(Song.SongLength) "Longest Song Duration", Song.title "Song", Album.Title "Album"
  FROM Song
  JOIN Album 
  WHERE Album.AlbumId = Song.AlbumId





