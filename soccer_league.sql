--teams
--goals by every player for each game
--players and their teams
--referees ref game
--games
--start and end dates for season
--standings/rankings

DROP DATABASE IF EXISTS soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE games(
    id SERIAL PRIMARY KEY,
    home_team INTEGER REFERENCES teams ON DELETE SET NULL,
    away_team INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players ON DELETE SET NULL,
    game INTEGER REFERENCES games ON DELETE SET NULL
);

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE winners(
    id SERIAL PRIMARY KEY,
    game INTEGER REFERENCES games ON DELETE SET NULL,
    winner INTEGER REFERENCES teams ON DELETE SET NULL
);

--pull data from wins to show standings as # of wins

SELECT 
    teams.name AS team, 
    COUNT(*) AS wins   
FROM 
    winners 
JOIN 
    games ON winners.game=games.id 
JOIN 
    teams ON winners.winner=teams.id
GROUP BY
    teams.name
ORDER BY 
    COUNT(*) DESC;