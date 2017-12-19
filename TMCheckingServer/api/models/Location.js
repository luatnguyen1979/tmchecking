
const mongoose = require('mongoose');
var LocationSchema = new mongoose.Schema({
    building: {type: String, required: true},
    room: {type: String, required: true}
});
LocationSchema.index({building: 1, room: 1}, {unique: true});

const Location = mongoose.model('Location', LocationSchema);
module.exports = Location;