var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }));
var User = require('../models/User');

router.use(function (req, res, next) {
    console.log('Request URL:', req.originalUrl);
    next();
}, function (req, res, next) {
    console.log('Request Type:', req.method);
    next();
});

router.pre('save', function (req, res, next) {
    req.body.password =
})
userSchema.pre('save', function(next) { var currentDate = new Date();
});

// CREATES A NEW USER
router.post('/', function (req, res) {
    User.create({
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            username : req.body.username,
            password : req.body.password,
            email : req.body.email,
            role : req.body.role,
            telephone : req.body.telephone,
        },
        function (err, user) {
            if (err) return res.status(500).send("There was a problem adding the information to the database.");
            res.status(200).send(user);
        });
});

router.post('/authenticate', function (req, res) {
    User.create({
            username : req.body.username,
            password : req.body.password
        },
        function (err, user) {
            if (err) return res.status(500).send("There was a problem user authentication.");
            res.status(200).send(user);
        });
});

// RETURNS ALL THE USERS IN THE DATABASE
router.get('/', function (req, res) {
    User.find({}, function (err, users) {
        if (err) return res.status(500).send("There was a problem finding the users.");
        res.status(200).send(users);
    });
});

router.get('/counselor', function (req, res) {
    User.find({role: 'Counselor'}, function (err, users) {
        if (err) return res.status(500).send("There was a problem finding the users with role 'Counselor'.");
        res.status(200).send(users);
    });
});

router.get('/user', function (req, res) {
    User.find({role: 'User'}, function (err, users) {
        if (err) return res.status(500).send("There was a problem finding the users with role 'User'.");
        res.status(200).send(users);
    });
});

router.get('/:id', function (req, res) {
        User.findById(req.params.id, function (err, user) {
        if (err) return res.status(500).send("There was a problem finding the user.");
        if (!user) return res.status(404).send("No user found.");
        res.status(200).send(user);
    });
});

// DELETES A USER FROM THE DATABASE
router.delete('/:id', function (req, res) {
    User.findByIdAndRemove(req.params.id, function (err, user) {
        if (err) return res.status(500).send("There was a problem deleting the user.");
        res.status(200).send("User "+ user.name +" was deleted.");
    });
});

router.put('/:id', function (req, res) {
    User.findByIdAndUpdate(req.params.id, req.body, {new: true}, function (err, user) {
        if (err) return res.status(500).send("There was a problem updating the user.");
        res.status(200).send(user);
    });
});

module.exports = router;