// app.js
var express = require('express');
var app = express();
var db = require('./db');
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}) );

app.all("/*", function(req, res, next){
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With');
    next();
});

const UserController = require('./api/controllers/UserController');
app.use('/users', UserController);

const LocationController = require('./api/controllers/LocationController');
app.use('/locations', LocationController);

const SessionController = require('./api/controllers/SessionController');
app.use('/sessions', SessionController);

module.exports = app;