var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }));
var Location = require('../models/Location');

router.use(function (req, res, next) {
    console.log('Request URL:', req.originalUrl)
    next()
}, function (req, res, next) {
    console.log('Request Type:', req.method)
    next()
});

// CREATES A NEW LOCATION
router.post('/', function (req, res) {
    Location.create({
            building: req.body.building,
            room: req.body.room
        },
        function (err, location) {
            if (err) return res.status(500).send("There was a problem adding the location to the database.");
            res.status(200).send(location);
        });
});

// RETURNS ALL THE LOCATIONS IN THE DATABASE
router.get('/', function (req, res) {
    Location.find({}, function (err, locations) {
        if (err) return res.status(500).send("There was a problem finding the locations.");
        res.status(200).send(locations);
    });
});

router.get('/:id', function (req, res) {
    Location.findById(req.params.id, function (err, location) {
        if (err) return res.status(500).send("There was a problem finding the location.");
        if (!location) return res.status(404).send("No location found.");
        res.status(200).send(location);
    });
});

router.get('/room/:building', function (req, res) {
    Location.find({building: req.params.building}, function (err, location) {
        if (err) return res.status(500).send("There was a problem finding the location.");
        if (!location) return res.status(404).send("No location found.");
        res.status(200).send(location);
    });
});

router.delete('/:id', function (req, res) {
    Location.findByIdAndRemove(req.params.id, function (err, location) {
        if (err) return res.status(500).send("There was a problem deleting the location.");
        res.status(200).send("Location "+ location.building + '-' + location.room +" was deleted.");
    });
});

router.put('/:id', function (req, res) {
    User.findByIdAndUpdate(req.params.id, req.body, {new: true}, function (err, location) {
        if (err) return res.status(500).send("There was a problem updating the location.");
        res.status(200).send(location);
    });
});

module.exports = router;