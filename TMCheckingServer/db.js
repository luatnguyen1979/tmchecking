// db.js
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/tm-checking', function(err) {
    if (err) throw err;
    console.log('Successfully connected to MongoDB');
});