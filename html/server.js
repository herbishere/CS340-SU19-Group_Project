// SETUP //

var express = require('express');
// var mysql = require('./dbcon.js');

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
    res.render('teams', {
        title: 'Teams'
    })
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