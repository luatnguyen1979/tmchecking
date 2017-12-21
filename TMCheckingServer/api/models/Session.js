// User.js
const mongoose = require('mongoose');
var SessionSchema = new mongoose.Schema({
    date: {type: Date, required: true},
    duration: {type: String, required: true},
    timeframe: {type: String, required: true},
    status: {type: String, required: true}, //completed, scheduling, not schedule, acknowledged, canceled
    isNotified: {type: Boolean, require: true}, // yes, no
    counselorId: {type: String, required:true},
    userId: {type: String}
});

//SessionSchema.index({date: 1, timeframe: 1, counselorId: 1, status: 1, userId: 1}, {unique: true});

const Session = mongoose.model('Session', SessionSchema);
module.exports = Session;