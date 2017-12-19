// User.js
const mongoose = require('mongoose');
const SessionSchema = new mongoose.Schema({
    date: {type: Date, required: true},
    duration: {type: String, required: true},
    time: {type: String, required: true},
    status: {type: String, required: true}, //completed, scheduling, not schedule
    isNotified: {type: Boolean, require: true}, // yes, no
    counselorId: {type: String, required:true},
    userId: {type: String, required: true}
});

const Session = mongoose.model('Session', SessionSchema);
module.exports = Session;