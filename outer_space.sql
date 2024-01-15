-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL

);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars,
  galaxy INTEGER REFERENCES galaxies,
  moons INTEGER[]
);

INSERT INTO moons
  (name)
VALUES
  ('The Moon'), ('Phobos'), ('Deimos'), ('Naiad'), ('Thalassa'), ('Despina'), ('Galatea'), ('Larissa'), ('S/2004'), ('Proteus'), ('Triton'), ('Nereid'), ('Halimede'), ('Sao'), ('Laomedeia'), ('Psamathe'), ('Neso');
INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO stars
  (name)
VALUES
  ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 1, 1, '{1}'),
  ('Mars', 1.88, 1, 1, '{2,3}'),
  ('Venus', 0.62, 1, 1, '{}'),
  ('Neptune', 164.8, 1, 1, '{4,5,6,7,8,9,10,11,12,13,14,15,16,17}'),
  ('Proxima Centauri b', 0.03, 2, 1, '{}'),
  ('Gliese 876 b', 0.23, 3, 1, '{}');