// in your source control or otherwise exposed.
// process.env is an easy way to access your env variables
var   mongoose = require('mongoose'),
    User = mongoose.model('User'),
    mailgun_api = process.env.MAILGUN_API_KEY,
    mailgun_domain = process.env.MAILGUN_DOMAIN,
    Mailgun = require('mailgun-js'),
    schedule = require('node-schedule'),
    Q = require('q'),
    moment = require('moment'),
    //use nunjucks to render html templates w/ variables
    nunjucks = require('nunjucks');