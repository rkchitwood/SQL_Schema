-- from the terminal run:
-- psql < music.sql

--refactor this datastructure to have:
--artists table with id, name
--album table with id, name
--producers table with id, name

--make table reference new tables and update insert clause to include the references

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- Create artists table
CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create albums table
CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create producers table
CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create songs table
CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums,
  producer_id INTEGER REFERENCES producers,
  artists INTEGER[] NOT NULL
);

-- Insert data into the new tables
INSERT INTO artists (name) VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO albums (name) VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

INSERT INTO producers (name) VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

-- Update insert clause for songs to include references
INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id, producer_id, artists)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, '{1}'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, '{2}'),
  ('One Sweet Day', 282, '11-14-1995', 3, 3, '{3,4}'),
  ('Shallow', 216, '09-27-2018', 4, 4, '{5,6}'),
  ('How You Remind Me', 223, '08-21-2001', 5, 5, '{7}'),
  ('New York State of Mind', 276, '10-20-2009', 6, 6, '{8,9}'),
  ('Dark Horse', 215, '12-17-2013', 7, 7, '{10,11}'),
  ('Moves Like Jagger', 201, '06-21-2011', 8, 8, '{12,13}'),
  ('Complicated', 244, '05-14-2002', 9, 9, '{14}'),
  ('Say My Name', 240, '11-07-1999', 10, 10, '{15}');