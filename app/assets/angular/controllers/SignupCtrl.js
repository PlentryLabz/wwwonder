'use strict';

App.controller("SignupCtrl", function($log, $scope, $routeParams, Users, FileUploader) {
    var registrationModel = $scope.registrationModel = {
        email: "",
        password: "",
        city: ""
    };


    $scope.addEntry = function () {
    	$log.debug("Send.");
    }
});