'use strict';

var App = angular.module('App', ['ngRoute', 'ngResource', 'angularFileUpload']);

App.config(function($routeProvider, $logProvider) {
    $routeProvider
        .when('/users', {
            templateUrl: "users-page.html",
            controller: "UsersCtrl"
        })
        .when('/users/:id', {
            templateUrl: "user-page.html",
            controller: "UserCtrl"
        })
        .when('/edit', {
            templateUrl: "edit-user-page.html",
            controller: "EditUserCtrl"
        })

    $logProvider.debugEnabled(true);
});
