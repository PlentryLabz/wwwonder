'use strict'

App.service('Users', function ($resource) {
    var users = $resource('http://localhost:3000/api/v1/users/:id',
    {

    },
    {
        update: {
            method: "PUT",
            url: "http://localhost:3000/api/v1/profile"
        },
        current: {
            method: "GET",
            url: "http://localhost:3000/api/v1/profile"
        }
    });

    return users;
});
