(function() {
    'use strict';

    angular.module('App')
        .config(function($routeProvider, $logProvider) {
            $routeProvider
                .when('/users', {
                    templateUrl: "/web/users_page",
                    controller: "UsersController",
                    controllerAs: 'vm'
                })
                .when('/users/:id', {
                    templateUrl: "/web/user_page",
                    controller: "UserController",
                    controllerAs: 'vm'
                })
                .when('/edit', {
                    templateUrl: "/web/edit_user_page",
                    controller: "EditUserController",
                    controllerAs: 'vm'
                })
                .when('/sign_up', {
                    templateUrl: "/web/sign_up",
                    controller: "SignupController",
                    controllerAs: 'vm'
                })

            $logProvider.debugEnabled(true);
        })
})();
