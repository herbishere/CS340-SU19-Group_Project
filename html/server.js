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

app.get('/players', function (req, res, next) {
    res.render('players', {
        title: 'Players'
    })
});

app.get('/endorsements', function (req, res, next) {
    res.render('endorsements', {
        title: 'Endorsements'
    })
});

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

app.get('/championships', function (req, res, next) {
    var context = {};
    mysql.pool.query("SELECT c.year, CONCAT(t1.team_city, ' ', t1.name) AS west_champ, c.west_record, CONCAT(t2.team_city, ' ', t2.name) AS east_champ, c.east_record, CONCAT(t3.team_city, ' ', t3.name) AS Winner FROM nba_championships AS c INNER JOIN nba_teams AS t1 ON t1.id = c.west_teamID INNER JOIN nba_teams AS t2 ON t2.id = c.east_teamID INNER JOIN nba_teams AS t3 ON t3.id = c.winner", function (err, rows, fields) {
        if (err) {
            next(err);
            return;
        }
        context.series = rows;
        context.title = 'Championships'
        res.render('championships', context);
    });
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
    console.log('Express started on http://flip3.engr.oregonstate.edu:' + app.get('port') + '; press Ctrl-C to terminate.');
});