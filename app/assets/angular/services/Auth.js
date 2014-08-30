'use strict';

App.service('Auth', function($resource) {
    var auth = $resource('http://localhost:3000/users/', {}, {
        logout: {
            method: "DELETE",
            url: "http://localhost:3000/users/sign_out.json",
        }
    });

    return auth;
});