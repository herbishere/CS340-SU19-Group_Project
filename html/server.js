// SETUP //

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


// WEBSITE RESPONSES
app.get('/', function (req, res, next) {
    res.render('home', {
        title: 'Home'
    })
});

/* PLAYERS PAGE REQUESTS
TODO:
INSERT FUNCTIONALITY
SELECT FUNCTIONALITY
*/

app.get('/players', function (req, res, next) {
    res.render('players', {
        title: 'Players'
    })
});

/* ENDORSEMENTS PAGE REQUESTS 
TODO:
INSERT FUNCTIONALITY
SELECT FUNCTIONALITY
DELETE FUNCTIONALITY
*/

app.get('/endorsements', function (req, res, next) {
    res.render('endorsements', {
        title: 'Endorsements'
    })
});

/* TEAMS PAGE REQUESTS
TODO:
INSERT FUNCTIONALITY

FINISHED:
SELECT FUNCTIONALITY
*/
app.get('/teams', function (req, res, next) {
    var context = {};
    mysql.pool.query('SELECT id, team_city, name, conference, division, arena, head_coach FROM nba_teams', function (err, rows, fields) {
        if (err) {
            next(err);
            return;
        }
        context.team = rows;
        context.title = 'Teams'
        res.render('teams', context);
    });
});

/* CHAMPIONSHIPS PAGE REQUESTS 
TODO:
INSERT FUNCTIONALITY
UPDATE FUNCTIONALITY

FINISHED:
SELECT FUNCTIONALITY
*/

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

// ERROR HANDLING //

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