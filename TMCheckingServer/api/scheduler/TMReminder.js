var schedule = require('node-schedule');
var Session = require('../models/Session');

module.exports = function (){
    var startTime = new Date(Date.now() + 5000);
    var endTime = new Date(startTime.getTime() + 60*60*1000);
    var start = schedule.scheduleJob({ start: startTime, end: endTime, rule: '*/3 * * * * *' }, function(){
        console.log('Time for tea!');
        Session.find({}, function (err, sessions) {
            console.log('Session finding ...');
            if (err) {
                console.log("There was a problem finding the sessions.");
                return;
            }
            var oneDay = 48 * 60 * 60 * 1000;
            console.log('sessions:' + sessions);
            for (const session in sessions){
                if ((new Date() - session.getDate()) < oneDay){
                    console.log('Tick tack - sending email');
                }
            }
        });
    });
};