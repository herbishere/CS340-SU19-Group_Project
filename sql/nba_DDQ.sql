---
--- Table structure for table `nba_teams`
---
DROP TABLE IF EXISTS `nba_teams`;

CREATE TABLE `nba_teams` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `team_city` varchar(100) NOT NULL,
    `name` varchar(100) NOT NULL,
    `conference` varchar(10) NOT NULL,
    `division` varchar(30) NOT NULL,
    `arena` varchar(100) NOT NULL,
    `head_coach` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
);

---
--- Dumping data for table `nba_teams`
---
INSERT INTO `nba_teams` VALUES (1, 'Boston', 'Celtics', 'Eastern', 'Atlantic', 'TD Garden', 'Brad Stevens'),
(2, 'New York City', 'Nets', 'Eastern', 'Atlantic', 'Barclays Center', 'Kenny Atkinson'),
(3, 'New York City', 'Knicks', 'Eastern', 'Atlantic', 'Madison Square Garden', 'David Fizdale'),
(4, 'Philadelphia', '76ers', 'Eastern', 'Atlantic', 'Wells Fargo Center', 'Brett Brown'),
(5, 'Toronto', 'Raptors', 'Eastern', 'Atlantic', 'Scotiabank Arena', 'Nick Nurse'),
(6, 'Chicago', 'Bulls', 'Eastern', 'Central', 'United Center', 'Jim Boylen'),
(7, 'Cleveland', 'Cavaliers', 'Eastern', 'Central', 'Rocket Mortgage FieldHouse', 'John Beilein'),
(8, 'Detroit', 'Pistons', 'Eastern', 'Central', 'Little Caesars Arena', 'Dwane Casey'),
(9, 'Indianapolis', 'Pacers', 'Eastern', 'Central', 'Bankers Life Fieldhouse', 'Nate McMillan'),
(10, 'Milwaukee', 'Bucks', 'Eastern', 'Central', 'Fiserv Forum', 'Mike Budenholzer'),
(11, 'Atlanta', 'Hawks', 'Eastern', 'Southeast', 'State Farm Arena', 'Lloyd Pierce'),
(12, 'Charlotte', 'Hornets', 'Eastern', 'Southeast', 'Spectrum Center', 'James Borrego'),
(13, 'Miami', 'Heat', 'Eastern', 'Southeast', 'American Airlines Arena', 'Erik Spoelstra'),
(14, 'Orlando', 'Magic', 'Eastern', 'Southeast', 'Amway Center', 'Steve Clifford'),
(15, 'Washington', 'Wizards', 'Eastern', 'Southeast', 'Capital One Arena', 'Scott Brooks'),
(16, 'Denver', 'Nuggets', 'Western', 'Northwest', 'Pepsi Center', 'Michael Malone'),
(17, 'Minneapolis', 'Timberwolves', 'Western', 'Northwest', 'Target Center', 'Ryan Saunders'),
(18, 'Oklahoma City', 'Thunder', 'Western', 'Northwest', 'Chesapeake Energy Arena', 'Billy Donovan'),
(19, 'Portland', 'Trail Blazers', 'Western', 'Northwest', 'Moda Center', 'Terry Stotts'),
(20, 'Salt Lake City', 'Jazz', 'Western', 'Northwest', 'Vivint Smart Home Arena', 'Quin Snyder'),
(21, 'San Francisco', 'Warriors', 'Western', 'Pacific', 'Chase Center', 'Steve Kerr'),
(22, 'Los Angeles', 'Clippers', 'Western', 'Pacific', 'Staples Center', 'Doc Rivers'),
(23, 'Los Angeles', 'Lakers', 'Western', 'Pacific', 'Staples Center', 'Frank Vogel'),
(24, 'Pheonix', 'Suns', 'Western', 'Pacific', 'Talking Stick Resort Arena', 'Monty Williams'),
(25, 'Sacramento', 'Kings', 'Western', 'Pacific', 'Golden 1 Center', 'Luke Walton'),
(26, 'Dallas', 'Mavericks', 'Western', 'Southwest', 'American Airlines Center', 'Rick Carlisle'),
(27, 'Houston', 'Rockets', 'Western', 'Southwest', 'Toyota Center', 'Mike D'' Antoni'),
(28, 'Memphis', 'Grizzlies', 'Western', 'Southwest', 'FedExForum', 'Taylor Jenkins'),
(29, 'New Orleans', 'Pelicans', 'Western', 'Southwest', 'Smoothie King Center', 'Alvin Gentry'),
(30, 'San Antonio', 'Spurs', 'Western', 'Southwest', 'AT&T Center', 'Gregg Popovich');

---
--- Table structure for table `nba_championships`
---
DROP TABLE IF EXISTS `nba_championships`;

CREATE TABLE `nba_championships` (
    `year` int(11) NOT NULL,
    `west_teamID` int(11) NOT NULL,
    `west_record` int(11) NOT NULL,
    `east_teamID` int(11) NOT NULL,
    `east_record` int(11) NOT NULL,
    `winner` int(11) NOT NULL,
    PRIMARY KEY (`year`),
    CONSTRAINT `FK_champ_team1` FOREIGN KEY  (`west_teamID`) REFERENCES `nba_teams` (`id`) on delete cascade,
    CONSTRAINT `FK_champ_team2` FOREIGN KEY  (`east_teamID`) REFERENCES `nba_teams` (`id`) on delete cascade,
    CONSTRAINT `FK_champ_winner` FOREIGN KEY  (`winner`) REFERENCES `nba_teams` (`id`) on delete cascade
);

---
--- Dumping data for table `nba_championships`
---

INSERT INTO `nba_championships` VALUES (1991, 23, 1, 6, 4, 6),
(1992, 19, 2, 6, 4, 6),
(1993, 24, 2, 6, 4, 6),
(1994, 27, 4, 3, 3, 27),
(1995, 27, 4, 14, 0, 27),
(1996, 18, 2, 6, 4, 6),
(1997, 20, 2, 6, 4, 6),
(1998, 20, 2, 6, 4, 6),
(1999, 30, 4, 3, 1, 30),
(2000, 23, 4, 9, 2, 23),
(2001, 23, 4, 4, 1, 23),
(2002, 23, 4, 2, 0, 23),
(2003, 30, 4, 2, 2, 30),
(2004, 23, 1, 8, 4, 8),
(2005, 30, 4, 8, 3, 30),
(2006, 26, 2, 13, 4, 13),
(2007, 30, 4, 7, 0, 30),
(2008, 23, 2, 1, 4, 1),
(2009, 23, 4, 14, 1, 23),
(2010, 23, 4, 1, 3, 23),
(2011, 26, 4, 13, 2, 26),
(2012, 18, 1, 13, 4, 13),
(2013, 30, 3, 13, 4, 13),
(2014, 30, 4, 13, 1, 30),
(2015, 21, 4, 7, 2, 21),
(2016, 21, 3, 7, 4, 7),
(2017, 21, 4, 7, 1, 21),
(2018, 21, 4, 7, 0, 21),
(2019, 21, 2, 5, 4, 5);


---------------------------------------------

CREATE table players(
    id int(11) not null AUTO_INCREMENT,
    first_name varchar (100) not null,
    last_name varchar (100) not null,
    team_ID int(11)not null,
    birthdate date not null,
    points int(11) not null,
    school varchar(100) not null,
    position varchar(100) not null,
    player_year_start int(11) not null,
    last_year_active int(11) ,
    PRIMARY KEY (id),
    CONSTRAINT FK_player_team FOREIGN KEY  (team_ID) REFERENCES nba_teams (id) on delete cascade
);

--------------------------------------------------

INSERT INTO players (id,first_name,last_name,team_ID,birthdate,points,school,position,player_year_start,last_year_active) VALUES
(020384,'KAWHI','LEONARD',22,'1991-06-29',25321,'SAN DIEGO STATE','SMALL FORWARD',2011,NULL),
(042842,'KEMBA','WALKER',12,'1990-05-08',10293,'UCONN','POINT GUARD',2011,NULL),
(093421,'KYRIE','IRVING',1,'1992-05-23',14592,'DUKE','POINT GUARD',2011,NULL),
(102425,'GIANNIS','ANTETOKOUNMPO',10,'1994-12-06',9348,'FILATHLITIKOS','POWER FORWARD',2013,NULL),
(203741,'JOEL','EMBID',4,'1994-03-16',7240,'KANSAS','CENTER',2014,NULL),
(023491,'KYLE','LOWRY',5,'1986-03-25',13023,'VILLANOVA','POINT GUARD',2006,NULL),
(034204,'BLAKE','GRIFFIN',8,'1989-03-16',11983,'OKLAHOMA','SMALL FORWARD',2009,NULL),
(139523,'BRADLEY','BEAL',15,'1993-06-28',7802,'FLORIDA','SHOOTING GUARD',2012,NULL),
(081435,'VICTOR','OLADIPO',9,'1992-05-04',10283,'INDIANA','SHOOTING GUARD',2013,NULL),
(093252,'DWAYNE','WADE',13,'1982-01-17',25023,'MARQUETTE','SHOOTING GUARD',2003,2019),
(123955,'STEPHEN','CURRY',21,'1988-03-14',15251,'DAVIDSON','POINT GUARD',2009,NULL),
(028132,'JAMES','HARDEN',27,'1989-08-26',18492,'ARIZONA STATE','SHOOTING GUARD',2009,NULL),
(193411,'KEVIN','DURANT',2,'1988-09-29',19024,'TEXAS','SMALL FORWARD',2007,NULL),
(093824,'LEBRON','JAMES',23,'1984-12-30',28391,'ST.MARY HS','SMALL FORWARD',2003,NULL),
(102934,'PAUL','GEORGE',22,'1990-05-02',17394,'FRESNO STATE','SMALL FORWARD',2010,NULL),
(120452,'RUSSELL','WESTBROOK',13,'1988-11-12',16924,'UCLA','POINT GUARD',2008,NULL),
(092321,'DAMIAN','LILLARD',19,'1990-07-15',13092,'WEBER STATE','POINT GUARD',2012,NULL),
(143923,'ANTHONY','DAVIS',23,'1993-03-11',14031,'KENTUCKY','POWER FORWARD',2012,NULL),
(091842,'LAMARCUS','ALDRIDGE',30,'1985-07-19',13902,'TEXAS','POWER FORWARD',2006,NULL),
(072935,'DIRK','NOWITZKI',26,'1978-06-19',27392,'DJK WURZBURG','POWER FORWARD',1994,2019),
(140924,'KARL-ANTHONY','TOWNS',17,'1995-11-15',7823,'KENTUCKY','CENTER',2015,NULL);


------------------------------------------------------------------------------------

CREATE table endorsements(
    contractual_id int(11) not null AUTO_INCREMENT,
    player_id int(11) not null,
    company_name varchar (100) not null,
    years_signed int(11)not null,
    salary int(15) not null,
    PRIMARY KEY (contractual_id),
    CONSTRAINT FK_player_endorsement FOREIGN KEY (player_id) REFERENCES players(id) on delete cascade
);

---------------------------------------------------------------------------------

insert into endorsements (contractual_id,player_id,company_name,years_signed,salary) 
VALUES (6283741,093824,'NIKE',50,1000000000),
(205826,093824,'COCA-COLA',10,20000000),
(610394,123955,'UNDER ARMOUR',10,285000000),
(024824,193411,'NIKE',12,72000000),
(402986,020384,'NEW BALANCE',5,80000000),
(729351,093252,'LI-NING',10,70000000),
(802475,028132,'ADIDAS',13,200000000),
(902419,120452,'NIKE',10,65000000),
(409275,091842,'NIKE',8,47000000),
(793842,092341,'NIKE',10,80000000),
(920462,034204,'KIA',5,75000000),
(704274,072935,'NIKE',10,50000000),
(943052,102934,'GATORADE',5,25000000),
(293852,093421,'FOOT LOCKER',5,30000000),
(824951,123955,'CHASE',45000000);


--------------------------------------------------
create table player_championships(
    player_ID int(11) not null,
    championship_ID int(11) not null,
    constraint FK_playerID_championshps foreign key (player_ID) references players(id) on delete cascade,
    constraint FK_championshipID_player foreign key (championship_ID) references nba_championships(year) on delete cascade );
    
---------------------------------------------
insert into player_championships (player_ID,champions) 
values (020384,2019),(020384,2014),(123955,2015),(123955,2016),(123955,2017),(123955,2018),(123955,2019),(093824,2007),(093824,2011),(093824,2011),(093824,2012),(093824,2013),(093824,2014),(093824,2015),(193411,2018),(193411,2019),(093421,2016),(093252,2006),(093252,2012),(093252,2013),(028132,2012),(120452,2012),(072935,2006)(072935,2011);
----------------------------------------------
create table player_endorsements(
    player_ID int(11) not null,
    endorsement_ID int(11) not null,
    constraint FK_playerID_endorsements foreign key (player_ID) references players(id) on delete cascade,
    constraint FK_endorsementID_player foreign key (endorsement_ID) references endorsements(contractual_ID) on delete cascade );
    
    --------------------------------------
insert into player_endorsements(endorsement_ID,player_ID)
values (6283741,093824),
(205826,093824),
(610394,123955),
(024824,193411),
(402986,020384),
(729351,093252),
(802475,028132),
(902419,120452),
(409275,091842),
(793842,092341),
(920462,034204),
(704274,072935),
(943052,102934),
(293852,093421),
(824951,123955);
    