--=========================================--
--TEAM ENTITY DATABASE MANIPULATION QUERIES--
--=========================================--

-------------------
--SELECT FUNCTION--
-------------------

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

-- get specific teams information
SELECT id, team_city, name, conference, division, arena, head_coach FROM nba_teams WHERE id = ?

-- get team information based on division
SELECT team_city, name, conference, division, arena, head_coach FROM nba_teams WHERE division = ?

-------------------
--INSERT FUNCTION--
-------------------

-- add a new team
INSERT INTO `nba_teams` (`team_city`, `name`, `conference`, `division`, `arena`, `head_coach`) VALUES (?, ?, ?, ?, ?, ?)

-------------------
--UPDATE FUNCTION--
-------------------

-- update a team's data based on submission
UPDATE `nba_teams` SET `team_city`=?, `name`=?, `conference`=?, `division`=?, `arena`=?, `head_coach`=? WHERE `id`=?

-------------------------------------------------------------------------------------------------------------------------------

--=============================================--
--CHAMPIONSHIP ENTITY DATA MANIPULATION QUERIES--
--=============================================--

--
--SELECT FUNCTION--
--

--- get championship information with team names
SELECT c.year,
CONCAT(t1.team_city, ' ', t1.name) AS west_champ, c.west_record,
CONCAT(t2.team_city, ' ', t2.name) AS east_champ, c.east_record,
CONCAT(t3.team_city, ' ', t3.name) AS winner
FROM nba_championships AS c
INNER JOIN nba_teams AS t1 ON t1.id = c.west_teamID
INNER JOIN nba_teams AS t2 ON t2.id = c.east_teamID
INNER JOIN nba_teams AS t3 ON t3.id = c.winner

-- get all the years for available championships
SELECT DISTINCT year AS championship_ID FROM nba_championships ORDER BY year DESC

--
--INSERT FUNCTION--
--

--- add a new championship
INSERT INTO `nba_championships` (`year`, `west_teamID`, `west_record`, `east_teamID`, `east_record`, `winner`) VALUES (?, ?, ?, ?, ?, ?)




-------------------------------------------------------------------------------------------------------------------------------------------
---get all of the the player data
SELECT np.id,first_name,last_name, CONCAT(team_city, ' ', name) as team_name, birthdate,points,school,position,player_year_start,last_year_active FROM nba_players as np LEFT JOIN nba_teams as nt ON nt.id = np.team_id

select p.first_name,p.last_name,t.name 
from players p inner join nab_teams t on t.id = p.team_ID 
where t.name = :teamNameInput;

-- get id and player's full name
SELECT id, CONCAT(first_name, ' ', last_name) as name FROM nba_players

-- add a player

insert into players (id,first_name,last_name,team_ID,birthdate,points,school,position,player_year_start,last_year_active)
values (:IdInput,:firstNameInput,:lastNameInput,:teamIDInput,:birthdateInput,:pointsInput,:schoolInput,:positionInput,:playerYearStartInput,:lastYearActiveInput);


-- FILTER PLAYER QUERIES
-- sHOW teams in the dropdown

SELECT t.id as team_ID, t.team_city as team_city,t.name as team_name from nba_teams as t

-- show players in filtered page
SELECT np.id,first_name,last_name, CONCAT(team_city, ' ', name) as team_name, birthdate,points,school,position,player_year_start,last_year_active FROM nba_players as np LEFT JOIN nba_teams as nt ON nt.id = np.team_id

-- show filtered players results
SELECT np.id,first_name,last_name, CONCAT(team_city, ' ', name) as team_name, birthdate,points,school,position,player_year_start,last_year_active FROM nba_players as np LEFT JOIN nba_teams as nt ON nt.id = np.team_id WHERE nt.id =:teamID ;

---------------------------------------------------------------------------------------------------------------------------------------
--get all of the endorsements info

SELECT e.contractual_id,e.player_id,p.first_name,p.last_name,e.company_name,e.years_signed,e.salary FROM nba_endorsements  as e INNER JOIN nba_players as p on e.player_id = p.id

-- getting player name for insert endorsements
SELECT p.id,concat(p.first_name," ",p.last_name) as player_name FROM nba_players as p;

-- insert into endorsements
INSERT INTO `nba_endorsements` (`contractual_id`, `player_id`, `company_name`, `years_signed`, `salary`) VALUES (?, ?, ?, ?, ?);


-------------------------------------------------------------------------

--====================================================--
--PLAYER/CHAMPIONSHIP ENTITY DATA MANIPULATION QUERIES--
--====================================================--

-------------------
--SELECT FUNCTION--
-------------------

-- get all the years, player ID's, and players' names from the players_championships table
SELECT championship_ID as year, player_ID, CONCAT(first_name, ' ', last_name) AS player_name FROM player_championships as pc INNER JOIN nba_players as p ON p.id = pc.player_ID ORDER BY year DESC

-------------------
--INSERT FUNCTION--
-------------------

-- add a player and their championship year they attended
INSERT INTO `player_championships` (`player_ID`, `championship_ID`) VALUES (?, ?)

-------------------
--DELETE FUNCTION--
-------------------

-- delete player championship relationship
DELETE FROM `player_championships` WHERE `player_ID`=? AND `championship_ID`=?

--------------------------------------------------------------------------------
-- select function
SELECT e.player_ID as Player_ID, pe.endorsement_ID as Endorsement_ID,p.first_name as First_Name,p.last_name as Last_Name,e.salary,e.years_signed,e.company_name FROM player_endorsements as pe INNER JOIN nba_players as p ON p.id = pe.player_ID INNER JOIN nba_endorsements as e ON e.contractual_ID = pe.endorsement_ID;

-- show contracts from endorsements table to add into player/endorsements table
SELECT e.contractual_id, e.player_id,e.company_name,concat(p.first_name," ",p.last_name) as player_name,e.salary FROM nba_endorsements as e INNER JOIN nba_players as p on p.id = e.player_id;

-- insert into player_endorsements
INSERT INTO `player_endorsements` ( `endorsement_ID`,`player_ID`) VALUES (?,?)


-------------------
--FILTER FUNCTION--
-------------------


