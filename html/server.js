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
        context.team.forEach(function (element) {
            var id = element.id;
            var team_city = element.team_city;
            var name = element.name;
            var conference = element.conference;
            var division = element.division;
            var arena = element.arena;
            var coach = element.head_coach;
        });
        res.render('teams', context);
    });
});

app.get('/championships', function (req, res, next) {
    res.render('championships', {
        title: 'Championships'
    })
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