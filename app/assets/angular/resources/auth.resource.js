(function() {
    'use strict';

    angular.module('App')
        .service('AuthResource', AuthResource);

    AuthResource.$inject = ['$resource'];

    function AuthResource($resource) {
        var AuthResource = $resource('http://localhost:3000/users/', {}, {
            logout: {
                method: "DELETE",
                url: "http://localhost:3000/users/sign_out.json",
            }
        });

        return AuthResource;
    }
})();
