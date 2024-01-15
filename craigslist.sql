-- region of post: city
-- users & preferred region
-- posts: title, text, posting user, posting location & region, post category

--region table: id, city w/ state
--user table: id, username, preferred region
--category table: id, category
--post table: id, text, ref user, ref region, ref category

DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL , --might be wrong syntax
    pref_region INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    author INTEGER REFERENCES users ON DELETE SET NULL,
    region INTEGER REFERENCES regions ON DELETE SET NULL,
    category INTEGER REFERENCES categories ON DELETE SET NULL
);