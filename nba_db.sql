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