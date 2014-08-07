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
})

App.service('Users', function ($resource) {
	var users = $resource('http://localhost:3000/api/v1/users/');

	return users;
})

App.factory('User', function () {
	return function (id) {
		var users = [
			{
				name : "Daniel",
				avatar : "avatarstorage/0",
				info : "front-end"
			},
			{
				name : "Shum",
				avatar : "avatarstorage/1",
				info : "backend"
			},
			{
				name : "Bob",
				avatar : "avatarstorage/2",
				info : "joomla"
			},
			{
				name : "Beach",
				avatar : "avatarstorage/3",
				info : "PM"
			}];

			return users[id];
	}
})

App.factory('Lists', function () {
	return function (id) {
		var lists = [
			[
				{
					name : "TOPFILMS",
					avatar : "avatarstorage/0",
					id : "1"
				},
				{
					name : "TOPBOOKS",
					avatar : "avatarstorage/1",
					id : "2"
				},
				{
					name : "TOPPLACES",
					avatar : "avatarstorage/2",
					id : "3"
				}
			],
			[
				{
					name : "Porn",
					avatar : "avatarstorage/0",
					id : "4"
				},
				{
					name : "LepraPosts",
					avatar : "avatarstorage/1",
					id : "5"
				}
			],
			[],
			[
				{
					name : "Guitars",
					avatar : "avatarstorage/0",
					id : "6"
				},
				{
					name : "Tasks",
					avatar : "avatarstorage/1",
					id : "7"
				},
				{
					name : "Clients",
					avatar : "avatarstorage/2",
					id : "8"
				},
				{
					name : "Engeniers",
					avatar : "avatarstorage/3",
					id : "9"
				}
			]
		];

		return lists[id];
	}
})

App.controller("UsersCtrl", function ($scope, Users) {

	console.log(Users.query());

	$scope.model = {
		users : Users.query()
	}

})

App.controller("UserCtrl", function($scope, $routeParams, User, Lists) {
	$scope.model = {
		user : User($routeParams.id),
		lists : Lists($routeParams.id)	
	}
})

App.directive("user", function() {
	return {
		scope: {},
		restrict: "E",
		templateUrl : "user.html",
		replace: true,
		link: function (scope, element, attrs) {
			scope.model = {
				name : attrs.name,
				link : "#/users/" + attrs.id,
				avatar : "avatarstorage/" + attrs.id
			};
		}
	}
})
 
App.directive("list", function() {
	return {
		scope: {
			list: '=',
		},
		restrict: "A",
		templateUrl : "list-mini.html",
		replace: true,
		link: function (scope, element, attrs) {
			scope.model = {
				name : scope.list.name,
				link : "#/lists/" + scope.list.id,
				avatar : scope.list.avatar
			};
		}
	}
})