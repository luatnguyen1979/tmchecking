// function to generate custom email
// for given users and return a mailing array
var mailCreator = function(users) {
    var mailing = [];

    for (var i = users.length - 1; i >= 0; i--) {
        // get an email template and pass in some variables
        var email = nunjucks.render('app/views/templates/email.inlined.template.html', {
            username: users[i].firstName
        });
        // add qualified users and their customized
        // email to the mailing
        mailing.push({
            user: users[i].email,
            email: email
        });
    }
    return mailing;
}