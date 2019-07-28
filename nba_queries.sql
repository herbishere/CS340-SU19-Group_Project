---
--- TEAM ENTITY DATABASE MANIPULATION QUERIES
---

-- get all Team IDs, City's, and Names to populate the Team dropdown
SELECT id, team_city, name FROM nba_teams

-- get all of a teams information based on team's id
SELECT * FROM nba_teams WHERE id = :team_id_from_dropdown

-- get teams based on conference
SELECT id, team_city, name FROM nba_teams WHERE conference = :conference_from_menu

---
--- CHAMPIONSHIP ENTITY DATA MANIPULATION QUERIES
---

--- get championship information with team names based on year
SELECT c.year,
CONCAT(t1.team_city, ' ', t1.name) AS West_Champ, c.west_record,
CONCAT(t2.team_city, ' ', t2.name) AS East_Champ, c.east_record,
CONCAT(t3.team_city, ' ', t3.name) AS Winner
FROM nba_championships AS c
INNER JOIN nba_teams AS t1 ON t1.id = c.west_teamID
INNER JOIN nba_teams AS t2 ON t2.id = c.east_teamID
INNER JOIN nba_teams AS t3 ON t3.id = c.winner
WHERE year = :year_from_input