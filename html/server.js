///////////
// SETUP //
///////////

var express = require('express');
var mysql = require('./dbcon.js');

var app = express();
var handlebars = require('express-handlebars').create({
    defaultLayout: 'main'
});
var bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({
    extended: false
}));
app.use(bodyParser.json());
app.use(express.static('public'));

app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', 7137); // SET SPECIFIC PORT - CHANGE IF UNAVAILABLE

///////////////////////
// SERVER  RESPONSES //
///////////////////////

app.get('/', function (req, res, next) {
    res.render('home', {
        title: 'Home'
    })
});

///////////////////////////
// PLAYERS PAGE REQUESTS //
///////////////////////////
/*TODO:

SELECT FUNCTIONALITY
*/
function getPlayerInfo(res, mysql, context, complete) {
    mysql.pool.query('SELECT id, first_name,last_name, team_ID, birthdate,points,school,position,player_year_start,last_year_active FROM nba_players', function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.player = results;
        complete();
    });
}



app.get('/players', function (req, res, next) {

    var callbackCount = 0;
    var context = {};
    context.title = 'Players'
    getPlayerInfo(res, mysql, context, complete);


    function complete() {
        callbackCount++;
        if (callbackCount >= 2) {
            res.render('teams', context);
        }
    }
});

//INSERT FUNCTIONALITY
app.post('/players', function (req, res) {
    var sql = "INSERT INTO `nba_players` (`first_name`, `last_name`, `team_ID`, `birthdate`, `points`, `school`,`position`,`player_year_start`,`last_year_active`) VALUES (?, ?, ?, ?, ?, ?,?,?,?)";

    var inserts = [req.body.first_name, req.body.last_name, req.body.team_ID, req.body.birthdate, req.body.points, req.body.school, req.body.position, req.body.player_year_start, req.body.last_year_active];
    sql = mysql.pool.query(sql, inserts, function (error, results, fields) {
        if (error) {
            console.log(JSON.stringify(error));
            res.write(JSON.stringify(error));
            res.end();
        } else {
            res.redirect('/players');
        }
    });
});


////////////////////////////////
// ENDORSEMENTS PAGE REQUESTS //
////////////////////////////////

function getEndorsementInfo(res, mysql, context, complete) {
    mysql.pool.query("SELECT e.contractual_id,e.player_id,p.first_name,p.last_name,e.company_name,e.years_signed,e.salary FROM nba_endorsements e INNER JOIN nba_players on e.player_id = p.id", function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.endorsements = results;
        complete();
    });
}

//loads data when page is loaded
app.get('/endorsements', function (req, res) {
    var callbackCount = 0;
    var context = {};
    context.title = 'Endorsements'
    getEndorsementInfo(res, mysql, context, complete);

    function complete() {
        callbackCount++;
        if (callbackCount >= 2) {
            res.render('endorsements', context);
        }
    }
});
/*TODO:
INSERT FUNCTIONALITY
SELECT FUNCTIONALITY
DELETE FUNCTIONALITY -- NOT NEEDED FOR MONDAY
*/

app.post('/endorsements', function (req, res) {
    var sql = "INSERT INTO `nba_endorsements` (`contractual_id`, `player_id`, `company_name`, `years_signed`, `salary`) VALUES (?, ?, ?, ?, ?)";
    var inserts = [req.body.contractual_id, req.body.player_id, req.body.company_name, req.body.years_signed, req.body.salary];
    sql = mysql.pool.query(sql, inserts, function (error, results, fields) {
        if (error) {
            console.log(JSON.stringify(error));
            res.write(JSON.stringify(error));
            res.end();
        } else {
            res.redirect('/endorsements');
        }
    });
});

/////////////////////////
// TEAMS PAGE REQUESTS //
/////////////////////////
/*TODO:
UPDATE FUNCTIONALITY
*/

// GET ALL THE TEAM INFORMATION
function getAllTeamsInfo(res, mysql, context, complete) {
    mysql.pool.query('SELECT id, team_city, name, conference, division, arena, head_coach FROM nba_teams', function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.team = results;
        complete();
    });
}

// GET SPECIFIC TEAM'S INFORMATION
function getTeamInfo(res, mysql, context, id, complete) {
    var sql = "SELECT id, team_city, name, conference, division, arena, head_coach FROM nba_teams WHERE id = ?";
    var inserts = [id];
    mysql.pool.query(sql, inserts, function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.team = results[0];
        complete();
    });
}

// GET ALL THE DIVISIONS
function getDivisionNames(res, mysql, context, complete) {
    mysql.pool.query('SELECT DISTINCT division as division_name FROM nba_teams', function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.division = results;
        complete();
    });
}

// SELECT FUNCTIONALITY
app.get('/teams', function (req, res, next) {

    var callbackCount = 0;
    var context = {};
    context.title = 'Teams'
    getAllTeamsInfo(res, mysql, context, complete);
    getDivisionNames(res, mysql, context, complete);

    function complete() {
        callbackCount++;
        if (callbackCount >= 2) {
            res.render('teams', context);
        }
    }
});

// GET CONFERENCE BASED ON DIVISION
function getConference(division) {
    if (division == "Atlantic" || division == "Central" || division == "Southeast") {
        return "Eastern";
    } else {
        return "Western";
    }
}

// INSERT FUNCTIONALITY
app.post('/teams', function (req, res) {
    var sql = "INSERT INTO `nba_teams` (`team_city`, `name`, `conference`, `division`, `arena`, `head_coach`) VALUES (?, ?, ?, ?, ?, ?)";
    var conference = getConference(req.body.division);
    var inserts = [req.body.team_city, req.body.name, conference, req.body.division, req.body.arena, req.body.head_coach];
    sql = mysql.pool.query(sql, inserts, function (error, results, fields) {
        if (error) {
            console.log(JSON.stringify(error));
            res.write(JSON.stringify(error));
            res.end();
        } else {
            res.redirect('/teams');
        }
    });
});

// UPDATE FUNCTIONALITY
// Load the Update Page
app.get('/teams/:id', function (req, res) {
    callbackCount = 0;
    var context = {};
    context.title = "UPDATING TEAMS";
    getDivisionNames(res, mysql, context, complete);
    getTeamInfo(res, mysql, context, req.params.id, complete);

    function complete() {
        callbackCount++;
        if (callbackCount >= 2) {
            res.render('teams_UPDATE', context);
        }
    }
});

// Update Values Based On Form
app.put('/teams/:id', function (req, res) {
    console.log(req.body);
    console.log(req.params.id);
    var sql = "UPDATE `nba_teams` SET `team_city`=?, `name`=?, `conference`=?, `division`=?, `arena`=?, `head_coach`=? WHERE `id`=?";
    var conference = getConference(req.body.division);
    var inserts = [req.body.team_city, req.body.name, conference, req.body.division, req.body.arena, req.body.head_coach, req.params.id];
    sql = mysql.pool.query(sql, inserts, function (error, results, fields) {
        if (error) {
            console.log(JSON.stringify(error));
            res.write(JSON.stringify(error));
            res.end();
        } else {
            res.status(200);
            res.end();
        }
    });
});

/////////////////////////////////
// CHAMPIONSHIPS PAGE REQUESTS //
/////////////////////////////////
// This function gets all the championship information
function getChampionshipInfo(res, mysql, context, complete) {
    mysql.pool.query("SELECT c.year, CONCAT(t1.team_city, ' ', t1.name) AS west_champ, c.west_record, CONCAT(t2.team_city, ' ', t2.name) AS east_champ, c.east_record, CONCAT(t3.team_city, ' ', t3.name) AS winner FROM nba_championships AS c INNER JOIN nba_teams AS t1 ON t1.id = c.west_teamID INNER JOIN nba_teams AS t2 ON t2.id = c.east_teamID INNER JOIN nba_teams AS t3 ON t3.id = c.winner", function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.series = results;
        complete();
    });
}

// This function gets all the teams in the western conference in the nba_teams table
function getWestTeams(res, mysql, context, complete) {
    mysql.pool.query("SELECT id AS west_id, CONCAT(team_city, ' ', name) AS west_team_name FROM nba_teams WHERE conference = 'Western'", function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.west_team = results;
        complete();
    });
}

// This function gets all the teams in the eastern conference in the nba_teams table
function getEastTeams(res, mysql, context, complete) {
    mysql.pool.query("SELECT id AS east_id, CONCAT(team_city, ' ', name) AS east_team_name FROM nba_teams WHERE conference = 'Eastern'", function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.east_team = results;
        complete();
    });
}

// This function gets all the teams in the nba_teams table
function getTeams(res, mysql, context, complete) {
    mysql.pool.query("SELECT id AS team_id, CONCAT(team_city, ' ', name) AS team_name FROM nba_teams", function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.team = results;
        complete();
    });
}

// Load Web Page
app.get('/championships', function (req, res) {
    var callbackCount = 0;
    var context = {};
    context.title = 'Championships'
    getChampionshipInfo(res, mysql, context, complete);
    getWestTeams(res, mysql, context, complete);
    getEastTeams(res, mysql, context, complete);
    getTeams(res, mysql, context, complete);

    function complete() {
        callbackCount++;
        if (callbackCount >= 4) {
            res.render('championships', context);
        }
    }
});

// Insert New Championship
app.post('/championships', function (req, res) {
    var sql = "INSERT INTO `nba_championships` (`year`, `west_teamID`, `west_record`, `east_teamID`, `east_record`, `winner`) VALUES (?, ?, ?, ?, ?, ?)";
    var inserts = [req.body.year, req.body.west_teamID, req.body.west_record, req.body.east_teamID, req.body.east_record, req.body.winner];
    sql = mysql.pool.query(sql, inserts, function (error, results, fields) {
        if (error) {
            console.log(JSON.stringify(error));
            res.write(JSON.stringify(error));
            res.end();
        } else {
            res.redirect('/championships');
        }
    });
});

////////////////////////////////////////
/* PLAYER_CHAMPIONSHIPS PAGE REQUESTS */
////////////////////////////////////////
/*TODO:
INSERT FUNCTIONALITY
*/

// get all the players who've attended championships, and the years of their championships
function getPlayerChampionships(res, mysql, context, complete) {
    mysql.pool.query("SELECT championship_ID as year, CONCAT(first_name, ' ', last_name) AS player_name FROM player_championships as pc INNER JOIN nba_players as p ON p.id = pc.player_ID ORDER BY year DESC", function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.player = results;
        complete();
    });
}

// get all the players who've atttended championships
function getPlayerNames(res, mysql, context, complete) {
    mysql.pool.query("SELECT id, CONCAT(first_name, ' ', last_name) as name FROM nba_players", function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.player_row = results;
        complete();
    });
}

app.get('/player_championships', function (req, res, next) {
    var callbackCount = 0;
    var context = {};
    context.title = 'Players/Championships';
    getPlayerChampionships(res, mysql, context, complete);
    getPlayerNames(res, mysql, context, complete)

    function complete() {
        callbackCount++;
        if (callbackCount >= 2) {
            res.render('players_championships', context);
        }
    }
});
/////////////////////////////////////////////////
/*player_endoresement
///////////////////////////////////////////////*/

function getPlayerEndorsements(res, mysql, context, complete) {
    mysql.pool.query("SELECT pe.player_ID as Player_ID, pe.endorsement_ID as Endorsement_ID,p.first_name as First_Name,p.last_name as Last_Name FROM player_endorsements as pe INNER JOIN nba_players as p ON p.id = pe.player_ID ", function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.playerEndorsements = results;
        complete();
    });
}


app.get('/player_endorsements', function (req, res, next) {
    var callbackCount = 0;
    var context = {};
    context.title = 'Players/Endorsements';
    getPlayerEndorsements(res, mysql, context, complete);

    function complete() {
        callbackCount++;
        if (callbackCount >= 1) {
            res.render('players_endorsements', context);
        }
    }
});


// Insert a Player and a Championship
app.post('/player_championships', function (req, res) {
    var sql = "INSERT INTO `player_championships` (`player_ID`, `championship_ID`) VALUES (?, ?)";
    var inserts = [req.body.player_ID, req.body.championship_ID];
    sql = mysql.pool.query(sql, inserts, function (error, results, fields) {
        if (error) {
            console.log(JSON.stringify(error));
            res.write(JSON.stringify(error));
            res.end();
        } else {
            res.redirect('/player_championships');
        }
    });
});

////////////////////
// ERROR HANDLING //
////////////////////

app.use(function (req, res) {
    res.status(404);
    res.render('404');
});

app.use(function (err, req, res, next) {
    console.error(err.stack);
    res.type('plain/text');
    res.status(500);
    res.render('500');
});

app.listen(app.get('port'), function () {
    console.log('Express started on http://flip2.engr.oregonstate.edu:' + app.get('port') + '; press Ctrl-C to terminate.');
});