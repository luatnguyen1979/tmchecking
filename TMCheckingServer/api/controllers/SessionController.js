var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }));
var Session = require('../models/Session');

router.use(function (req, res, next) {
    console.log('Request URL:', req.originalUrl)
    next()
}, function (req, res, next) {
    console.log('Request Type:', req.method)
    next()
});

// CREATES A NEW USER
router.post('/', function (req, res) {
    Session.create({
            date: req.body.date,
            duration: req.body.duration,
            timeframe : req.body.timeframe,
            status : req.body.status,
            isNotified : req.body.isNotified,
            counselorId : req.body.counselorId,
            userId : req.body.userId,
        },
        function (err, session) {
            if (err) return res.status(500).send("There was a problem adding the information to the database.");
            res.status(200).send(session);
        });
});
// RETURNS ALL THE USERS IN THE DATABASE
router.get('/', function (req, res) {
    Session.find({}, function (err, sessions) {
        if (err) return res.status(500).send("There was a problem finding the sessions.");
        res.status(200).send(sessions);
    });
});


router.get('/filter', function (req, res) {
    let condition = {};
    if (req.query.date) {
        condition.date = req.query.date;
    }
    if (req.query.counselorId) {
        condition.counselorId = req.query.counselorId;
    }
    condition.status = 'Not Schedule Yet';
    Session.find(condition, function (err, sessions) {
        if (err) return res.status(500).send("There was a problem finding the sessions.");
        res.status(200).send(sessions);
    });
});

//Get all TM Checking session that belongs to current counselor
router.get('/counselorsessions/:id', function (req, res) {
    Session.find({counselorId: req.params.id}, function (err, sessions) {
        if (err) return res.status(500).send("There was a problem finding the sessions.");
        res.status(200).send(sessions);
    });
});

//Get all TM checking sessions of current user
router.get('/usersessions/:id', function (req, res) {
    Session.find({userId: req.params.id}, function (err, sessions) {
        if (err) return res.status(500).send("There was a problem finding the sessions.");
        res.status(200).send(sessions);
    });
});

router.get('/:id', function (req, res) {
    Session.findById(req.params.id, function (err, session) {
        if (err) return res.status(500).send("There was a problem finding the session.");
        if (!session) return res.status(404).send("No user found.");
        res.status(200).send(session);
    });
});

// DELETES A USER FROM THE DATABASE
router.delete('/:id', function (req, res) {
    Session.findByIdAndRemove(req.params.id, function (err, session) {
        if (err) return res.status(500).send("There was a problem deleting the session.");
        res.status(200).send("Session "+ session.name +" was deleted.");
    });
});

router.put('/:id', function (req, res) {
    Session.findByIdAndUpdate(req.params.id, req.body, {new: true}, function (err, session) {
        if (err) return res.status(500).send("There was a problem updating the session.");
        res.status(200).send(session);
    });
});

router.put('/acknowledge/:id', function (req, res) {
    updateSession(req.params.id, 'Booked', res);
});

router.put('/schedule/:id', function (req, res) {
    updateSession(req.params.id, 'Scheduling', res);
});

router.put('/complete/:id', function (req, res) {
    /*Session.findByIdAndUpdate(req.params.id, {status: 'Completed'}, function (err, session) {
        if (err) return res.status(500).send("There was a problem updating the session.");
        res.status(200).send(session);
    });*/
    updateSession(req.params.id, 'Completed', res);
});

router.put('/cancel/:id', function (req, res) {
    updateSession(req.params.id, 'Canceled', res);
});

function updateSession(id, status, res) {
    Session.findByIdAndUpdate(id, {status: status}, {new: false}, function (err, session) {
        if (err) return res.status(500).send("There was a problem updating the session.");
        session.status = status;
        res.status(200).send(session);
    });
}

module.exports = router;