// app.js
var express = require('express');
var app = express();
var db = require('./db');

const UserController = require('./api/controllers/UserController');
app.use('/users', UserController);

const LocationController = require('./api/controllers/LocationController');
app.use('/locations', LocationController);

module.exports = app;