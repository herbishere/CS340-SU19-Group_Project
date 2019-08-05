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
INSERT FUNCTIONALITY
SELECT FUNCTIONALITY
*/

app.get('/players', function (req, res, next) {
    var context = {}
    context.title = 'Players'
    res.render('players', context)
});

////////////////////////////////
// ENDORSEMENTS PAGE REQUESTS //
////////////////////////////////
/*TODO:
INSERT FUNCTIONALITY
SELECT FUNCTIONALITY
DELETE FUNCTIONALITY -- NOT NEEDED FOR MONDAY
*/

app.get('/endorsements', function (req, res, next) {
    var context = {}
    context.title = 'Endorsements'
    res.render('endorsements', context)
});

/////////////////////////
// TEAMS PAGE REQUESTS //
/////////////////////////
/*TODO:
UPDATE FUNCTIONALITY
*/

function getTeamInfo(res, mysql, context, complete) {
    mysql.pool.query('SELECT id, team_city, name, conference, division, arena, head_coach FROM nba_teams', function (error, results, fields) {
        if (error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.team = results;
        complete();
    });
}

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

app.get('/teams', function (req, res, next) {

    var callbackCount = 0;
    var context = {};
    context.title = 'Teams'
    getTeamInfo(res, mysql, context, complete);
    getDivisionNames(res, mysql, context, complete);

    function complete() {
        callbackCount++;
        if (callbackCount >= 2) {
            res.render('teams', context);
        }
    }
});

app.post('/teams', function (req, res) {
    var sql = "INSERT INTO `nba_teams` (`team_city`, `name`, `conference`, `division`, `arena`, `head_coach`) VALUES (?, ?, ?, ?, ?, ?)";
    // CHOOSE CONFERENCE BASED ON DIVISION
    var conference;
    if (req.body.division == "Atlantic" || req.body.division == "Central" || req.body.division == "Southeast") {
        conference = "Eastern"
    } else {
        conference = "Western"
    }
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