// app.js
var express = require('express');
var app = express();
var db = require('./db');
/*const cors = require('cors')
app.use(cors);*/

const UserController = require('./api/controllers/UserController');
app.use('/users', UserController);

const LocationController = require('./api/controllers/LocationController');
app.use('/locations', LocationController);

const SessionController = require('./api/controllers/SessionController');
app.use('/sessions', SessionController);

module.exports = app;