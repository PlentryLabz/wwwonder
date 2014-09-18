(function() {
    'use strict';

    angular.module('App')
        .config(function($routeProvider, $logProvider) {
            $routeProvider
                .when('/users', {
                    templateUrl: "users-page.html",
                    controller: "UsersController",
                    controllerAs: 'vm'
                })
                .when('/users/:id', {
                    templateUrl: "user-page.html",
                    controller: "UserController",
                    controllerAs: 'vm'
                })
                .when('/edit', {
                    templateUrl: "edit-user-page.html",
                    controller: "EditUserController",
                    controllerAs: 'vm'
                })
                .when('/sign_up', {
                    templateUrl: "sign-up.html",
                    controller: "SignupController",
                    controllerAs: 'vm'
                })

            $logProvider.debugEnabled(true);
        })
})();
