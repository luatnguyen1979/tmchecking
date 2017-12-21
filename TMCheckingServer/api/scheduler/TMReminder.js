var schedule = require('node-schedule');
var Session = require('../models/Session');
var sendMail = require('../utils/SendMail');
var mailOptions = require('../utils/MailOption');
var User = require('../models/User')

module.exports = function (){
    var startTime = new Date(Date.now() + 5000);
    var endTime = new Date(startTime.getTime() + 60*60*1000);
    var start = schedule.scheduleJob({ start: startTime, end: endTime, rule: '*/3 * * * * *' }, function(){
        console.log('Time for tea!');
        Session.find({status: 'Booked', isNotified: false}, function (err, sessions) {
            console.log('Session finding ...');
            if (err) {
                console.log("There was a problem finding the sessions.");
                return;
            }
            var oneDay = 10* 24 * 60 * 60 * 1000;
            //console.log('sessions:' + sessions);
            for (const session of sessions){

                if ((new Date() - session.date) < oneDay){
                    console.log('session: ' + session.userId + "email: " + session.counselorId );
                    console.log("================session" + session.id);
                    Session.findByIdAndUpdate(session.id, {isNotified: true}, function (err, session) {
                        if (err) console.log("There was a problem updating the session.");
                        console.log("Updated notification");
                    });
                    User.findById(session.counselorId, function (err, user) {
                        if (err) return res.status(500).send("There was a problem finding the user.");
                        if (!user) return res.status(404).send("No user found.");
                        mailOptions.subject = 'Your TM Checking session reminder!';
                        mailOptions.to = user.email;
                        mailOptions.html = '<b>This is a Reminder! Your TM Checking session will be at ' + session.timeframe + ' on '
                            + session.date.toString().substr(0,16) + '.</b>';
                        sendMail(mailOptions, function(error, response){
                            if(error){
                                console.log(error);
                            }else{
                                console.log("Message sent: " + response.message);
                            }
                        });
                    });
                    User.findById(session.userId, function (err, user) {
                        if (err) return res.status(500).send("There was a problem finding the user.");
                        if (!user) return res.status(404).send("No user found.");
                        mailOptions.subject = 'Your TM Checking session reminder!';
                        mailOptions.to = user.email;
                        mailOptions.html = '<b>This is a Reminder! Your TM Checking session will be at ' + session.timeframe + ' on '
                            + session.date.toString().substr(0,16)+ '.</b>';
                        sendMail(mailOptions, function(error, response){
                            if(error){
                                console.log(error);
                            }else{
                                console.log("Message sent: " + response.message);
                            }

                        });
                    });
                }
            }
        });
    });
};