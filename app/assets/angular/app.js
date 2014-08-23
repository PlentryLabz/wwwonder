'use strict'

var App = angular.module('App', ['ngRoute', 'ngResource'])

App.config(function ($routeProvider) {
	$routeProvider
		.when('/users', {
			templateUrl : "users-page.html",
			controller : "UsersCtrl"
		})
		.when('/users/:id', {
			templateUrl : "user-page.html",
			controller : "UserCtrl"
		})
    .when('/edit', {
      templateUrl : "edit-user-page.html",
      controller : "EditUserCtrl"
    })
  })

