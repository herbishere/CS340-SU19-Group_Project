---
--- TEAM ENTITY DATABASE MANIPULATION QUERIES
---

-- get all the team's information in the table
SELECT id, team_city, name, conference, division, arena, head_coach FROM nba_teams

-- get all the western conference teams
SELECT id AS west_id, CONCAT(team_city, ' ', name) AS west_team_name FROM nba_teams WHERE conference = 'Western'

-- get all the eastern conference teams
SELECT id AS east_id, CONCAT(team_city, ' ', name) AS east_team_name FROM nba_teams WHERE conference = 'Eastern'

-- get all the teams
SELECT id AS team_id, CONCAT(team_city, ' ', name) AS team_name FROM nba_teams

-- get all the division names
SELECT DISTINCT division as division_name FROM nba_teams

-- add a new team
INSERT INTO `nba_teams` (`team_city`, `name`, `conference`, `division`, `arena`, `head_coach`) VALUES (?, ?, ?, ?, ?, ?)

-- update a team's data based on submission
UPDATE nba_teams SET team_city = :cityInput, name = :nameInput, conference = :conferenceInput, division = :divisionInput, arena = :arenaInput, head_coach = :coachInput

---
--- CHAMPIONSHIP ENTITY DATA MANIPULATION QUERIES
---

--- get championship information with team names
SELECT c.year,
CONCAT(t1.team_city, ' ', t1.name) AS west_champ, c.west_record,
CONCAT(t2.team_city, ' ', t2.name) AS east_champ, c.east_record,
CONCAT(t3.team_city, ' ', t3.name) AS winner
FROM nba_championships AS c
INNER JOIN nba_teams AS t1 ON t1.id = c.west_teamID
INNER JOIN nba_teams AS t2 ON t2.id = c.east_teamID
INNER JOIN nba_teams AS t3 ON t3.id = c.winner

--- add a new championship
INSERT INTO `nba_championships` (`year`, `west_teamID`, `west_record`, `east_teamID`, `east_record`, `winner`) VALUES (?, ?, ?, ?, ?, ?)




-------------------------------------------------------------------------------------------------------------------------------------------
---get all of the the player data

select * from players;

select * from players where points <= :pointsInput;

select p.first_name,p.last_name,t.name 
from players p inner join nab_teams t on t.id = p.team_ID 
where t.name = :teamNameInput;

-- get id and player's full name
SELECT id, CONCAT(first_name, ' ', last_name) as name FROM nba_players

---add a player

insert into players (id,first_name,last_name,team_ID,birthdate,points,school,position,player_year_start,last_year_active)
values (:IdInput,:firstNameInput,:lastNameInput,:teamIDInput,:birthdateInput,:pointsInput,:schoolInput,:positionInput,:playerYearStartInput,:lastYearActiveInput);


---------------------------------------------------------------------------------------------------------------------------------------
--get all of the endorsements info

select * from endorsements;

select e.company_name,p.first_name,e.salary 
from endorsements e inner join players p on p.id = e.player_ID
where company_name = :companyNameInput;

delete from endorsements where contractual_id = :contractualIDInput;

-------------------------------------------------------------------------

select * from player_championships;

-- get all the years and players from the players_championships table
SELECT championship_ID as year, CONCAT(first_name, ' ', last_name) AS player_name FROM player_championships as pc INNER JOIN nba_players as p ON p.id = pc.player_ID ORDER BY year DESC

select * from player_championships where championship_ID = :yearUserInput;

-- add a player and their championship year they attended
INSERT INTO `player_championships` (`player_ID`, `championship_ID`) VALUES (?, ?)

--------------------------------------------------------------------------------

select * from player_endorsements;

select * from player_endorsements where player_ID = :playerIDUserInput;

insert into player_endorsements (player_ID,endorsement_ID);





