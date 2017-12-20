var mailUsers = function (mailDay) {
    console.log('users fired');
    // setup promises
    var deffered = Q.defer();
    // find users with preferences.notificaitons that match today
    User.find().where('preferences.notifications.' + mailDay).equals(true).exec(
        function(err, user){
            var users = [];
            // handle error
            if (err) {
                deffered.reject(console.log('failed: ' + err));
            } else {
                // add all qualifying users to the users array
                for (var i = user.length - 1; i >= 0; i--) {
                    users.push(user[i]);
                }
                deffered.resolve(users);
            }
        });
    return deffered.promise;
};