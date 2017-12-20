var mailScheduler = function (job) {
    // set rules for scheduler
    var rule = new schedule.RecurrenceRule();
    rule.dayOfWeek = [new schedule.Range(0, 6)];
    rule.hour = 16;
    rule.minute = 38;
    // scheduleJob take a rule and a function
    // you will need to pass a function object
    // into the mailScheduler function
    schedule.scheduleJob(rule, job);
};