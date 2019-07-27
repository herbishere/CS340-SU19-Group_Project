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
    CONSTRAINT `FK_champ_team1` FOREIGN KEY  (`west_teamID`) REFERENCES `nba_teams` (`id`),
    CONSTRAINT `FK_champ_team2` FOREIGN KEY  (`east_teamID`) REFERENCES `nba_teams` (`id`),
    CONSTRAINT `FK_champ_winner` FOREIGN KEY  (`winner`) REFERENCES `nba_teams` (`id`)
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