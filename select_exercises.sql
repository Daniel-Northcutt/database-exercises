-- 31 rows in the album table

USE albums_db;

SELECT DISTINCT artist,
	artist
FROM albums;



-- 23 distinct artists

-- The primary key is 'id'

-- Oldest release date: 1967
-- Newest release date: 2011

-- Questions 4:
-- 4a
SELECT artist,
	name
FROM albums
WHERE artist = 'Pink Floyd';
-- The Dark Side of the Moon, The Wall

-- 4b 
SELECT release_date
FROM albums
WHERE name = 'Sgt. Pepper''s lonely Hearts Club Band';

-- 4c
SELECT genre
FROM albums
WHERE name = 'Nevermind';

-- 4d
SELECT artist,
	NAME
FROM albums
WHERE release_date >= '1990' and release_date <= '1999';

-- 4e
SELECT name
FROM albums
WHERE sales > 20;

-- 4f
SELECT name
FROM albums
WHERE genre = 'Rock';

-- we are only looking for the word 'Rock' and no other text within our search


