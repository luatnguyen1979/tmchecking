// function to send user email given template and subject
var mailSender = function (userEmail, subject, html) {
    // setup promises
    var deffered = Q.defer();
    // create new mailgun instance with credentials
    var mailgun = new Mailgun({
        apiKey: mailgun_api,
        domain: mailgun_domain
    });
    // setup the basic mail data
    var mailData = {
        from: 'vlgnguyen@mum.edu',
        to: userEmail,
        subject:  subject,
        html: html,
        // two other useful parameters
        // testmode lets you make API calls
        // without actually firing off any emails
        'o:testmode': true,
        // you can specify a delivery time
        // up to three days in advance for
        // your emails to send.
        'o:deliverytime': 'Thu, 13 Oct 2011 18:02:00 GMT'
    };
    // send your mailgun instance the mailData
    mailgun.messages().send(mailData, function (err, body) {
        // If err console.log so we can debug
        if (err) {
            deffered.reject(console.log('failed: ' + err));
        } else {
            deffered.resolve(body)
        }
    });

    return deffered.promise;
};