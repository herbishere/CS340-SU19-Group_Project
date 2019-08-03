---
--- TEAM ENTITY DATABASE MANIPULATION QUERIES
---

-- get all Team IDs, City's, and Names to populate the Team dropdown
SELECT id, team_city, name FROM nba_teams

-- get all of a teams information based on team's id
SELECT * FROM nba_teams WHERE id = :team_id_from_dropdown

-- get teams based on conference
SELECT id, team_city, name FROM nba_teams WHERE conference = :conference_from_menu

-- add a new team
INSERT INTO nba_teams (team_city, name, conference, division, arena, head_coach) 
VALUES (:cityInput, :nameInput, :conferenceInput, :divisionInput, :arenaInput, :coachInput)

-- update a team's data based on submission
UPDATE nba_teams SET team_city = :cityInput, name = :nameInput, conference = :conferenceInput, division = :divisionInput, arena = :arenaInput, head_coach = :coachInput

---
--- CHAMPIONSHIP ENTITY DATA MANIPULATION QUERIES
---

--- get championship information with team names
SELECT c.year,
CONCAT(t1.team_city, ' ', t1.name) AS west_champ, c.west_record,
CONCAT(t2.team_city, ' ', t2.name) AS east_champ, c.east_record,
CONCAT(t3.team_city, ' ', t3.name) AS Winner
FROM nba_championships AS c
INNER JOIN nba_teams AS t1 ON t1.id = c.west_teamID
INNER JOIN nba_teams AS t2 ON t2.id = c.east_teamID
INNER JOIN nba_teams AS t3 ON t3.id = c.winner

--- add a new championship
INSERT INTO nba_championships (year, west_teamID, west_record, east_teamID, east_record, winner)
VALUES (:yearInput, :westInput, :westRecInput, :eastInput, :eastRecInput, :winnerInput)




-------------------------------------------------------------------------------------------------------------------------------------------
---get all of the the player data

select * from players;

select * from players where points <= :pointsInput;

select p.first_name,p.last_name,t.name 
from players p inner join nab_teams t on t.id = p.team_ID 
where t.name = :teamNameInput;

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

select * from player_championships where championship_ID = :yearUserInput;

insert into player_championships (player_ID, championship_ID) values (:playerID_Input, :championshipID_Input);

--------------------------------------------------------------------------------

select * from player_endorsements;

select * from player_endorsements where player_ID = :playerIDUserInput;

insert into player_endorsements (player_ID,endorsement_ID);




