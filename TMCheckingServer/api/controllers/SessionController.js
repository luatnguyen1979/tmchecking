var express = require('express');
var sendMail = require('../utils/SendMail');
var mailOptions = require('../utils/MailOption');
var router = express.Router();
var bodyParser = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }));
var Session = require('../models/Session');
var User = require('../models/User');
const createSessionTitle = 'A TM Checking session was create for you!';
const notifiedTitle = 'A scheduled TM Checking was booked!';
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
            status : 'Not Schedule Yet',
            isNotified : false,
            counselorId : req.body.counselorId,
            userId : null,
        },
        function (err, session) {
            if (err) return res.status(500).send("There was a problem adding the information to the database."+ req.body.date) ;
                User.findById(session.counselorId, function (err, user) {
                    if (err) return res.status(500).send("There was a problem finding the user.");
                    if (!user) return res.status(404).send("No user found.");
                    mailOptions.subject = createSessionTitle;
                    mailOptions.to = user.email;
                    mailOptions.html = '<b>There is a TM Checking session at ' + session.timeframe + 'on' + session.date +' was created for you.</b>';
                    sendMail(mailOptions, function(error, response){
                        if(error){
                            console.log(error);
                        }else{
                            console.log("Message sent: " + response.message);
                        }
                    });
                });



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

router.get('/:id/:isCounselor', function (req, res) {
        let condition = {};
        let isCounselor = req.params.isCounselor === "true" ? true:false;
        let id = req.params.id;
        if (isCounselor) {
            if (id) {
                condition.counselorId = id;
            }
        } else {
            if (id) {
                condition.userId = id;
            }
        }
        Session.find(condition, function (err, sessions) {
            if (err) return res.status(500).send("There was a problem finding the sessions.");
            res.status(200).send(sessions);
        });
    });

router.get('/availablesessions/:id/:isCounselor', function (req, res) {
    let condition = {};
    let role = req.params.isCounselor === "true" ? true:false;
    let id = req.params.id;
    if (req.query.date) {
        condition.date = req.query.date;
    }

    if (role) {
        if (id) {
            condition.counselorId = id;
        }
    } else {
        condition.status = 'Not Schedule Yet';
    }

    Session.find(condition, function (err, sessions) {
        if (err) return res.status(500).send("There was a problem finding the sessions.");
        res.status(200).send(sessions);
    });
});

//Get all TM Checking session that belongs to current counselor
router.get('/currentsessions/:id/:isCounselor', function (req, res) {
    let condition = {};
    let isCounselor = req.params.isCounselor === "true" ? true:false;
    let id = req.params.id;

    if (isCounselor) {
        if (id) {
            condition.counselorId = id;
        }
    } else {
        if (id) {
            condition.userId = id;
        }
    }

    Session.find(condition, function (err, sessions) {
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
    Session.findByIdAndUpdate(req.params.id, {status: 'Booked'}, {new: false}, function (err, session) {
        if (err) return res.status(500).send("There was a problem updating the session.");
        User.findById(session.userId, function (err, user) {
            if (err) return res.status(500).send("There was a problem finding the user.");
            if (!user) return res.status(404).send("No user found.");
            mailOptions.subject = 'Your session was acknowledged!';
            mailOptions.to = user.email;
            mailOptions.html = '<b>Your TM Checking session at ' + session.timeframe + ' on '
                + session.date.toString().substr(0,16) +' was acknowledged.</b>';
            sendMail(mailOptions, function(error, response){
                if(error){
                    console.log(error);
                }else{
                    console.log("Message sent: " + response.message);
                }
            });
        });

        session.status = 'Booked';
        res.status(200).send(session);
    });

});

/*router.put('/reject/:id', function (req, res) {
    updateSession(req.params.id, 'Rejected', res);
});*/

router.put('/reject/:id', function (req, res) {
    //updateSession(req.params.id, 'Canceled', res);

    Session.findByIdAndUpdate(req.params.id, {status: 'Rejected'}, function (err, session) {
        if (err) return res.status(500).send("There was a problem updating the session.");
        User.findById(session.userId, function (err, user) {
            if (err) return res.status(500).send("There was a problem finding the user.");
            if (!user) return res.status(404).send("No user found.");
            mailOptions.subject = 'Your session was rejected!';
            mailOptions.to = user.email;
            mailOptions.html = '<b>Your TM Checking session at ' + session.timeframe + ' on '
                + session.date.toString().substr(0,16) +' was rejected.</b>';
            sendMail(mailOptions, function(error, response){
                if(error){
                    console.log(error);
                }else{
                    console.log("Message sent: " + response.message);
                }
            });
        });

        Session.create({
                date: session.date,
                duration: session.duration,
                timeframe : session.timeframe,
                status : 'Not Schedule Yet',
                isNotified : false,
                counselorId : session.counselorId,
                userId : null,
            },
            function (err, newsession) {
                if (err) return console.log('error: 500 - "There was a problem adding the information to the database.');
                console.log('=========Clone new object after cancelling' + newsession);
                //res.status(200).send(session);
            });
        session.status = 'Canceled';
        res.status(200).send(session);
    });
});

router.put('/book/:id/:userid', function (req, res) {
    Session.findByIdAndUpdate(req.params.id, {status: "Booking", userId: req.params.userid}, {new: true}, function (err, session) {
        if (err) return res.status(500).send("There was a problem updating the session.");
        User.findById(session.counselorId, function (err, user) {
            if (err) return res.status(500).send("There was a problem finding the user.");
            if (!user) return res.status(404).send("No user found.");
            mailOptions.subject = 'Your session was booked!';
            mailOptions.to = user.email;
            mailOptions.html = '<b>Your TM Checking session at ' + session.timeframe + ' on '
                + session.date.toString().substr(0,16) +' was booked.</b>';
            sendMail(mailOptions, function(error, response){
                if(error){
                    console.log(error);
                }else{
                    console.log("Message sent: " + response.message);
                }
            });
        });
        res.status(200).send(session);
    });
    //updateSession(req.params.id, 'Scheduling', res);
});

router.put('/complete/:id', function (req, res) {
    updateSession(req.params.id, 'Completed', res);
});

router.put('/cancel/:id', function (req, res) {
    //updateSession(req.params.id, 'Canceled', res);

    Session.findByIdAndUpdate(req.params.id, {status: 'Canceled'}, function (err, session) {
        if (err) return res.status(500).send("There was a problem updating the session.");

        Session.find({date: session.date,
            duration: session.duration,
            timeframe : session.timeframe,
            status : 'Not Schedule Yet',
            counselorId : session.counselorId}, function (err, newsessions) {
            if (err) return res.status(500).send("There was a problem finding the sessions.");
            User.findById(session.counselorId, function (err, user) {
                if (err) return res.status(500).send("There was a problem finding the user.");
                if (!user) return res.status(404).send("No user found.");
                mailOptions.subject = 'Your session was canceled!';
                mailOptions.to = user.email;
                mailOptions.html = '<b>Your TM Checking session at ' + session.timeframe + ' on '
                    + session.date.toString().substr(0,16) +' was canceled.</b>';
                sendMail(mailOptions, function(error, response){
                    if(error){
                        console.log(error);
                    }else{
                        console.log("Message sent: " + response.message);
                    }
                });
            });

            if (newsessions.length == 0) {
                Session.create({
                        date: session.date,
                        duration: session.duration,
                        timeframe : session.timeframe,
                        status : 'Not Schedule Yet',
                        isNotified : false,
                        counselorId : session.counselorId,
                        userId : null,
                    },
                    function (err, newsession) {
                        if (err) return console.log('error: 500 - "There was a problem adding the information to the database.');
                        console.log('=========Clone new object after cancelling' + newsession);
                        //res.status(200).send(session);
                    });
            }

        });
        session.status = 'Canceled';
        res.status(200).send(session);
    });
});

function updateSession(id, status, res) {
    Session.findByIdAndUpdate(id, {status: status}, {new: false}, function (err, session) {
        if (err) return res.status(500).send("There was a problem updating the session.");
        session.status = status;
        res.status(200).send(session);
    });
}

module.exports = router;