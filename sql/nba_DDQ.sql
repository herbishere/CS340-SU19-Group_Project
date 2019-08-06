-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Aug 04, 2019 at 02:14 PM
-- Server version: 10.3.13-MariaDB-log
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_diazh`
--

-- --------------------------------------------------------

--
-- Table structure for table `nba_championships`
--

CREATE TABLE `nba_championships` (
  `year` int(11) NOT NULL,
  `west_teamID` int(11) NOT NULL,
  `west_record` int(11) NOT NULL,
  `east_teamID` int(11) NOT NULL,
  `east_record` int(11) NOT NULL,
  `winner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nba_championships`
--

INSERT INTO `nba_championships` (`year`, `west_teamID`, `west_record`, `east_teamID`, `east_record`, `winner`) VALUES
(1991, 23, 1, 6, 4, 6),
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

-- --------------------------------------------------------

--
-- Table structure for table `nba_endorsements`
--

CREATE TABLE `nba_endorsements` (
  `contractual_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `years_signed` int(11) NOT NULL,
  `salary` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nba_endorsements`
--

INSERT INTO `nba_endorsements` (`contractual_id`, `player_id`, `company_name`, `years_signed`, `salary`) VALUES
(24824, 193411, 'NIKE', 12, 72000000),
(205826, 93824, 'COCA-COLA', 10, 20000000),
(293852, 93421, 'FOOT LOCKER', 5, 30000000),
(402986, 20384, 'NEW BALANCE', 5, 80000000),
(409275, 91842, 'NIKE', 8, 47000000),
(610394, 123955, 'UNDER ARMOUR', 10, 285000000),
(704274, 72935, 'NIKE', 10, 50000000),
(729351, 93252, 'LI-NING', 10, 70000000),
(793842, 93421, 'NIKE', 10, 80000000),
(802475, 28132, 'ADIDAS', 13, 200000000),
(824951, 123955, 'CHASE', 5, 45000000),
(902419, 120452, 'NIKE', 10, 65000000),
(920462, 34204, 'KIA', 5, 75000000),
(943052, 102934, 'GATORADE', 5, 25000000),
(6283741, 93824, 'NIKE', 50, 1000000000);

-- --------------------------------------------------------

--
-- Table structure for table `nba_players`
--

CREATE TABLE `nba_players` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `team_ID` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  `points` int(11) NOT NULL,
  `school` varchar(255) NOT NULL,
  `position` varchar(30) NOT NULL,
  `player_year_start` int(11) NOT NULL,
  `last_year_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nba_players`
--

INSERT INTO `nba_players` (`id`, `first_name`, `last_name`, `team_ID`, `birthdate`, `points`, `school`, `position`, `player_year_start`, `last_year_active`) VALUES
(20384, 'KAWHI', 'LEONARD', 22, '1991-06-29', 25321, 'SAN DIEGO STATE', 'SMALL FORWARD', 2011, NULL),
(23491, 'KYLE', 'LOWRY', 5, '1986-03-25', 13023, 'VILLANOVA', 'POINT GUARD', 2006, NULL),
(28132, 'JAMES', 'HARDEN', 27, '1989-08-26', 18492, 'ARIZONA STATE', 'SHOOTING GUARD', 2009, NULL),
(34204, 'BLAKE', 'GRIFFIN', 8, '1989-03-16', 11983, 'OKLAHOMA', 'SMALL FORWARD', 2009, NULL),
(42842, 'KEMBA', 'WALKER', 12, '1990-05-08', 10293, 'UCONN', 'POINT GUARD', 2011, NULL),
(72935, 'DIRK', 'NOWITZKI', 26, '1978-06-19', 27392, 'DJK WURZBURG', 'POWER FORWARD', 1994, 2019),
(81435, 'VICTOR', 'OLADIPO', 9, '1992-05-04', 10283, 'INDIANA', 'SHOOTING GUARD', 2013, NULL),
(91842, 'LAMARCUS', 'ALDRIDGE', 30, '1985-07-19', 13902, 'TEXAS', 'POWER FORWARD', 2006, NULL),
(92321, 'DAMIAN', 'LILLARD', 19, '1990-07-15', 13092, 'WEBER STATE', 'POINT GUARD', 2012, NULL),
(93252, 'DWAYNE', 'WADE', 13, '1982-01-17', 25023, 'MARQUETTE', 'SHOOTING GUARD', 2003, 2019),
(93421, 'KYRIE', 'IRVING', 1, '1992-05-23', 14592, 'DUKE', 'POINT GUARD', 2011, NULL),
(93824, 'LEBRON', 'JAMES', 23, '1984-12-30', 28391, 'ST.MARY HS', 'SMALL FORWARD', 2003, NULL),
(102425, 'GIANNIS', 'ANTETOKOUNMPO', 10, '1994-12-06', 9348, 'FILATHLITIKOS', 'POWER FORWARD', 2013, NULL),
(102934, 'PAUL', 'GEORGE', 22, '1990-05-02', 17394, 'FRESNO STATE', 'SMALL FORWARD', 2010, NULL),
(120452, 'RUSSELL', 'WESTBROOK', 13, '1988-11-12', 16924, 'UCLA', 'POINT GUARD', 2008, NULL),
(123955, 'STEPHEN', 'CURRY', 21, '1988-03-14', 15251, 'DAVIDSON', 'POINT GUARD', 2009, NULL),
(139523, 'BRADLEY', 'BEAL', 15, '1993-06-28', 7802, 'FLORIDA', 'SHOOTING GUARD', 2012, NULL),
(140924, 'KARL-ANTHONY', 'TOWNS', 17, '1995-11-15', 7823, 'KENTUCKY', 'CENTER', 2015, NULL),
(143923, 'ANTHONY', 'DAVIS', 23, '1993-03-11', 14031, 'KENTUCKY', 'POWER FORWARD', 2012, NULL),
(193411, 'KEVIN', 'DURANT', 2, '1988-09-29', 19024, 'TEXAS', 'SMALL FORWARD', 2007, NULL),
(203741, 'JOEL', 'EMBID', 4, '1994-03-16', 7240, 'KANSAS', 'CENTER', 2014, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nba_teams`
--

CREATE TABLE `nba_teams` (
  `id` int(11) NOT NULL,
  `team_city` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `conference` varchar(10) NOT NULL,
  `division` varchar(30) NOT NULL,
  `arena` varchar(100) NOT NULL,
  `head_coach` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nba_teams`
--

INSERT INTO `nba_teams` (`id`, `team_city`, `name`, `conference`, `division`, `arena`, `head_coach`) VALUES
(1, 'Boston', 'Celtics', 'Eastern', 'Atlantic', 'TD Garden', 'Brad Stevens'),
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

-- --------------------------------------------------------

--
-- Table structure for table `player_championships`
--

CREATE TABLE `player_championships` (
  `player_ID` int(11) NOT NULL,
  `championship_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player_championships`
--

INSERT INTO `player_championships` (`player_ID`, `championship_ID`) VALUES
(20384, 2014),
(20384, 2019),
(28132, 2012),
(72935, 2006),
(72935, 2011),
(93252, 2006),
(93252, 2012),
(93252, 2013),
(93421, 2016),
(93824, 2007),
(93824, 2011),
(93824, 2012),
(93824, 2013),
(93824, 2014),
(93824, 2015),
(120452, 2012),
(123955, 2015),
(123955, 2016),
(123955, 2017),
(123955, 2018),
(123955, 2019),
(193411, 2018),
(193411, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `player_endorsements`
--

CREATE TABLE `player_endorsements` (
  `player_ID` int(11) NOT NULL,
  `endorsement_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player_endorsements`
--

INSERT INTO `player_endorsements` (`player_ID`, `endorsement_ID`) VALUES
(93824, 6283741),
(93824, 205826),
(123955, 610394),
(193411, 24824),
(20384, 402986),
(93252, 729351),
(28132, 802475),
(120452, 902419),
(91842, 409275),
(93421, 793842),
(34204, 920462),
(72935, 704274),
(102934, 943052),
(93421, 293852),
(123955, 824951);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nba_championships`
--
ALTER TABLE `nba_championships`
  ADD PRIMARY KEY (`year`),
  ADD KEY `FK_champ_team1` (`east_teamID`),
  ADD KEY `FK_champ_team2` (`west_teamID`),
  ADD KEY `FK_champ_winner` (`winner`);

--
-- Indexes for table `nba_endorsements`
--
ALTER TABLE `nba_endorsements`
  ADD PRIMARY KEY (`contractual_id`),
  ADD KEY `FK_player_endorsement` (`player_id`);

--
-- Indexes for table `nba_players`
--
ALTER TABLE `nba_players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_player_team` (`team_ID`);

--
-- Indexes for table `nba_teams`
--
ALTER TABLE `nba_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_championships`
--
ALTER TABLE `player_championships`
  ADD PRIMARY KEY (`player_ID`,`championship_ID`),
  ADD KEY `FK_playerID_championshps` (`player_ID`),
  ADD KEY `FK_championshipID_player` (`championship_ID`);

--
-- Indexes for table `player_endorsements`
--
ALTER TABLE `player_endorsements`
  ADD KEY `FK_endorsementID_player` (`endorsement_ID`),
  ADD KEY `FK_playerID_endorsements` (`player_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nba_teams`
--
ALTER TABLE `nba_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nba_championships`
--
ALTER TABLE `nba_championships`
  ADD CONSTRAINT `FK_champ_team1` FOREIGN KEY (`east_teamID`) REFERENCES `nba_teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_champ_team2` FOREIGN KEY (`west_teamID`) REFERENCES `nba_teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_champ_winner` FOREIGN KEY (`winner`) REFERENCES `nba_teams` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `nba_endorsements`
--
ALTER TABLE `nba_endorsements`
  ADD CONSTRAINT `FK_player_endorsement` FOREIGN KEY (`player_id`) REFERENCES `nba_players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_championships`
--
ALTER TABLE `player_championships`
  ADD CONSTRAINT `FK_championshipID_player` FOREIGN KEY (`championship_ID`) REFERENCES `nba_championships` (`year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_playerID_championshps` FOREIGN KEY (`player_ID`) REFERENCES `nba_players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_endorsements`
--
ALTER TABLE `player_endorsements`
  ADD CONSTRAINT `FK_endorsementID_player` FOREIGN KEY (`endorsement_ID`) REFERENCES `nba_endorsements` (`contractual_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_playerID_endorsements` FOREIGN KEY (`player_ID`) REFERENCES `nba_players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
